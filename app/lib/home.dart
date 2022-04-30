import 'dart:convert';
import 'dart:math';

import 'package:dev_doctor/widgets/appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sections = [
      Column(children: [
        Text(
          "title".tr(),
          style: Theme.of(context).textTheme.headline2,
        ),
        Text("subtitle", style: Theme.of(context).textTheme.subtitle1).tr(),
        Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Wrap(alignment: WrapAlignment.center, children: [
                    ElevatedButton.icon(
                        onPressed: () => launchUrl(Uri.https(
                            "docs.dev-doctor.linwood.dev", "/backend/own")),
                        icon: Icon(PhosphorIcons.articleLight,
                            color: Theme.of(context).primaryIconTheme.color),
                        label: Text("docs".tr().toUpperCase(),
                            style: Theme.of(context).primaryTextTheme.button)),
                    OutlinedButton.icon(
                        onPressed: () =>
                            launchUrl(Uri.https("discord.linwood.dev", "/")),
                        icon: const Icon(PhosphorIcons.usersLight),
                        label: Text("discord".tr().toUpperCase()))
                  ])),
              if (kIsWeb)
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: RawMaterialButton(
                        onPressed: () => launchUrl(Uri.https("vercel.com", "",
                            {"utm_source": "Linwood", "utm_campaign": "oss"})),
                        child: SizedBox(
                            height: 50,
                            child: SvgPicture.asset(
                                "images/powered-by-vercel.svg",
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        padding: const EdgeInsets.all(30.0),
                                        child:
                                            const CircularProgressIndicator()),
                                semanticsLabel: 'Powered by Vercel'))))
            ]))
      ]),
      Column(children: [
        Text(
          "News",
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.https("linwood.dev", "/blog")),
              icon: const Icon(PhosphorIcons.arrowSquareOutLight),
              label: Text("browser".tr().toUpperCase()),
            )),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [])),
        FutureBuilder<http.Response>(
            future: http.get(Uri.https('www.linwood.dev', '/blog/atom.xml')),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text("Error: ${snapshot.error}");
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = utf8.decode(snapshot.data!.bodyBytes);
              var document = XmlDocument.parse(data);
              var feed = document.getElement("feed")!;
              var items = feed.findAllElements("entry").toList();
              return Column(
                children: List.generate(min(items.length, 10), (index) {
                  var entry = items[index];
                  return ListTile(
                    title: Text(entry.getElement("title")?.innerText ?? ''),
                    subtitle:
                        Text(entry.getElement("summary")?.innerText ?? ''),
                    onTap: () => launchUrl(Uri.parse(
                        entry.getElement("link")?.getAttribute("href") ?? '')),
                    isThreeLine: true,
                  );
                }),
              );
            })
      ])
    ];
    return Scaffold(
        appBar: MyAppBar(title: 'home'.tr()),
        body: Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            itemCount: sections.length,
            padding: const EdgeInsets.only(top: 100),
            itemBuilder: (context, index) => Material(
                elevation: 2,
                child: Container(
                    padding: const EdgeInsets.all(10), child: sections[index])),
          ),
        ));
  }
}

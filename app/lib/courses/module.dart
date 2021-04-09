import 'package:dev_doctor/courses/bloc.dart';
import 'package:dev_doctor/courses/course.dart';
import 'package:dev_doctor/courses/part/module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home.dart';

class CourseModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => CoursesPage()),
        ChildRoute('/details', child: (_, args) => CoursePage(model: args.data)),
        ModuleRoute('/start', module: CoursePartModule()),
      ];
  static Inject get to => Inject<CourseModule>();
  List<Bind<Object>> get binds => [Bind.singleton((i) => CourseBloc())];
}

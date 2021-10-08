; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Dev-Doctor"
#define MyAppVersion "1.6"
#define MyAppPublisher "LinwoodCloud"
#define MyAppURL "https://www.linwood.dev"
#define MyAppExeName "dev_doctor.exe" 
#define BaseDirRelease "build\windows\runner\Release"
#define RunnerSourceDir "windows\runner"


[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{966CE504-4AA5-49C7-A63B-74BD6C073E5B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}  
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\LICENSE
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=
OutputDir=build\windows
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-Setup
SetupIconFile={#RunnerSourceDir}\resources\app_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
Uninstallable=not IsTaskSelected('portablemode')

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]     
Name: "desktopicon"; Description: "Create a Desktop shortcut"; Components: full
Name: "startmenu"; Description: "Create a Start Menu entry"; Components: full


[Files]
Source: "{#BaseDirRelease}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDirRelease}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Types]
Name: "full"; Description: "Full installation"
Name: "portable"; Description: "Portable mode"

[Components]
Name: "full"; Description: "full"; Types: full

[Icons]
.
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

Name: "{group}\Visit Website"; Filename: "http://www.linwood.dev/"
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


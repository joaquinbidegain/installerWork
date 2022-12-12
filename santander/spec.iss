#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerSantander

[Files]
Source: "..\ext\lib\plugin.sign-p7.santander.isc"; DestName: "plugin.sign-p7.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.scardconnect.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerPKCS7

[Files]
Source: "..\ext\lib\plugin.sign-p7.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

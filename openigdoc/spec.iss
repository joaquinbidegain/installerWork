#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstalleriGDocOpen

[Files]
Source: "..\ext\lib\plugin.sign-p7.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.xml-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

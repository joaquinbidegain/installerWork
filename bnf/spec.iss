#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerBNF

[Files]
Source: "..\ext\lib\plugin.pdf-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.xml-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

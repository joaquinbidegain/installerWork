#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerAduana

[Files]
Source: "..\ext\lib\plugin.xml-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.pades.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
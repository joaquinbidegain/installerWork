#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerFull

[Files]
Source: "..\ext\lib\*"; DestDir: "{app}\lib\"; Flags: ignoreversion


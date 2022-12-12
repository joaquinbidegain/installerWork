#include "..\common\base.iss"
#include "..\common\cert\py.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerSIP

[Files]
Source: "..\ext\lib\plugin.wacom.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion  
Source: "..\ext\lib\plugin.xmlsign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.deviceinfo.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

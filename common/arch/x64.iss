[Files]
Source: "..\ext\system\x64\*.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist regserver 64bit noregerror; Check: Is64BitInstallMode
Source: "..\ext\jre\x64\jre\**"; DestDir: "{app}\jre\"; Flags: 64bit recursesubdirs; Check: Is64BitInstallMode

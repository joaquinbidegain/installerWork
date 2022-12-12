[Files]
Source: "..\ext\jre\x86\jre\**"; DestDir: "{app}\jre\"; Flags: 32bit recursesubdirs; Check: not Is64BitInstallMode
Source: "..\ext\system\x86\*.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist; Check: not Is64BitInstallMode

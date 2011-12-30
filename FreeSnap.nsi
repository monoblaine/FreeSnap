; Generated NSIS script file (generated by makensitemplate.phtml 0.21)
; by 12.87.80.125 on Apr 28 02 @ 08:58

; NOTE: this .NSI script is designed for NSIS v1.8+

Name 			"FreeSnap 1.2"
OutFile 		"FreeSnapInstall.exe"
BrandingText 		"Blue Onion Software"
LicenseText  		"End User License Agreement"
LicenseData  		"license.txt"
;Icon		 	"fs.ico"
InstProgressFlags 	"smooth"

; Some default compiler settings (uncomment and change at will):
; SetCompress auto ; (can be off or force)
; SetDatablockOptimize on ; (can be off)
; CRCCheck on ; (can be off)
  AutoCloseWindow true ; (can be true for the window go away automatically at end)
; ShowInstDetails  show ; (can be show to have them shown, or nevershow to disable)
; SetDateSave off ; (can be on to have files restored to their orginal date)

##############################################################

InstallDir "$PROGRAMFILES\FreeSnap"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\FreeSnap" ""
;DirShow show ; (make this hide to not let the user change it)
DirText "Select the directory to install FreeSnap in:"

Section "" ; (default section)

SetOutPath "$INSTDIR"
ExecWait '"$INSTDIR\FreeSnap.exe" -stop'
Sleep 2000 ; seems like ExecWait returns too soon

; add files / whatever that need to be installed here.

File "release\FreeSnap.exe"
File "release\FSnap.dll"
File "FreeSnap.hlp"

SetOutPath $WINDIR
File "C:\WINDOWS\system32\msvcr71.dll"

WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\FreeSnap" "" "$INSTDIR"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\FreeSnap" "DisplayName" "FreeSnap 1.2(remove only)"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\FreeSnap" "UninstallString" '"$INSTDIR\uninst.exe"'

CreateDirectory  "$SMPROGRAMS\FreeSnap"
CreateShortCut   "$SMPROGRAMS\FreeSnap\Start FreeSnap.lnk"  	"$INSTDIR\FreeSnap.exe"
CreateShortCut   "$SMPROGRAMS\FreeSnap\Stop FreeSnap.lnk"   	"$INSTDIR\FreeSnap.exe" -stop
CreateShortCut   "$SMPROGRAMS\FreeSnap\FreeSnap Help.lnk" 	  	"$INSTDIR\FreeSnap.hlp"
CreateShortCut   "$SMPROGRAMS\FreeSnap\Uninstall FreeSnap.lnk"  "$INSTDIR\uninst.exe"

CreateShortCut   "$SMSTARTUP\FreeSnap.lnk" "$INSTDIR\FreeSnap.exe"
WriteUninstaller "$INSTDIR\uninst.exe"

Exec  		  "$INSTDIR\FreeSnap.exe"
Exec     	  '"$WINDIR\WinHlp32.exe" "$INSTDIR\FreeSnap.hlp"'

SectionEnd ; end of default section


##############################################################

UninstallText "Uninstall FreeSnap"

Section Uninstall

; add delete commands to delete whatever files/registry keys/etc you installed here.

ExecWait '"$INSTDIR\FreeSnap.exe" -stop'
Sleep 2000 ; make sure it's done

Delete    "$INSTDIR\FreeSnap.exe"
Delete    "$INSTDIR\FSnap.dll"
Delete    "$INSTDIR\FreeSnap.hlp"
Delete    "$INSTDIR\uninst.exe"

Delete    "$SMPROGRAMS\FreeSnap\Start FreeSnap.lnk"
Delete    "$SMPROGRAMS\FreeSnap\Stop FreeSnap.lnk"
Delete    "$SMPROGRAMS\FreeSnap\FreeSnap Help.lnk"
Delete    "$SMPROGRAMS\FreeSnap\Uninstall FreeSnap.lnk"
RMDir     "$SMPROGRAMS\FreeSnap"

Delete	  "$SMSTARTUP\FreeSnap.lnk"

DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\FreeSnap"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FreeSnap"
RMDir "$INSTDIR"

SectionEnd ; end of uninstall section


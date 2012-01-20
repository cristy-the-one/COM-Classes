/*
Example: Demonstrates the usage of *TaskbarList3.ahk*
	* OverlayIcon over TaskBarEntry is drawn
	* Usage of ProgressBar on TaskBarEntry

Authors:
	- maul.esel (https://github.com/maul-esel)

License:
	- *LGPL* (http://www.gnu.org/licenses/lgpl-2.1.txt)

Requirements:
	AutoHotkey - AHK_L v1.1+
	OS - Windows 7, Windows Server 2008 R2 or higher
	Classes - CCF (see #include directives for mor detail)
*/

#SingleInstance
#include ..\..\_CCF_Error_Handler_\_CCF_Error_Handler_.ahk
#Include ..\..\Unknown\Unknown.ahk
#Include ..\..\TaskbarList\TaskbarList.ahk
#Include ..\..\TaskbarList2\TaskbarList2.ahk
#Include ..\TaskbarList3.ahk
#Include ..\..\Helper Classes\StructBase.ahk
#Include ..\..\Helper Classes\RECT.ahk
#Include ..\..\Helper Classes\TBPFLAG.ahk

tbl := new TaskbarList3() ; creating the instance
tbl.HrInit() ; initializing the instance

Gui +LastFound +OwnDialogs
hWin := WinExist()

Gui Add, Picture, Icon42 w50 h50 altsubmit, %A_WinDir%\system32\shell32.dll
Gui, Show, w150 h150

sleep 3000
MsgBox click OK to give the window an overlay icon
tbl.SetOverlayIcon(hWin, DllCall("LoadIcon", "UInt", 0, "UInt", 32516))

sleep 3000
MsgBox check the current taskbar thumbnail. Then click OK
tbl.SetThumbnailClip(hWin, new RECT(0, 0, 60, 60))
MsgBox recheck the taskbar thumbnail now

Loop 100
{
	tbl.SetProgressValue(hWin, A_Index)
	sleep 10
}
	
tbl.SetProgressState(hWin, TBPFLAG.PAUSED)
sleep 1000
tbl.SetProgressState(hWin, TBPFLAG.ERROR)

Loop 100
{
	tbl.SetProgressValue(hWin, 100 - A_Index)
	sleep 10
}
tbl.SetProgressState(hWin, TBPFLAG.NOPROGRESS)
	
sleep 3000

GuiClose:
ExitApp
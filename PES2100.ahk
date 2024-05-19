#NoEnv
#SingleInstance force

IfWinExist, Diablo III
WinActivate
else
{
MsgBox,,Error, Diablo III is not running.`n`PES2100 will now be terminated.
ExitApp
}

ChatActive=false

#IfWinActive ahk_class D3 Main Window Class
{
IfNotExist, changelog.txt
FileAppend,
(
..:: PES1500 (26/09/2018) ::..

Integration of automatic key pressing (1,2,3,4) every 1.5 seconds with the predefined activation/deactivation key "x".

..:: PES2018 (30/09/2018) ::..

Separation of the keys into (1,2,3) every 0.05 seconds and (4) every 1.5 seconds.
Change of the predefined activation/deactivation key from "x" to "mouse wheel click".
Integration of automatic right-click pressing 36 times in less than 1 second with the predefined key "." from the numpad.

..:: PES2019 (03/10/2018) ::..

Change the key pressing speed of keys (1,2,3) from 0.05 to 0.15 seconds.
Check if Diablo III is the active window when executing a key press.
Disable the "Win" key and the combinations "ALT+TAB", "Win+TAB" while PES2019 is running.
Integration of an ini file allowing the user to change the predefined keys and the key pressing speed of key (4).
Integration of program termination for PES2019 with the predefined key "End".

..:: PES2020 (08/10/2018) ::..

Integration of automatic starting of Rifts/GRifts (manual click on the obelisk is required) with predefined keys "5" (Rifts) and "6" (GRifts) from the left side of the keyboard.
Integration of automatic switching of Core Paragon Points with predefined keys "4" (Intelligence) and "5" (Vitality) from the numpad.

..:: PES2021 (09/10/2018) ::..

Check if Diablo III is running, if so, PES2021 executes normally, otherwise PES2021 terminates automatically with an appropriate error message.
Integration of a system to disable the keys for automatic starting of Rifts/GRifts and automatic switching of Core Paragon Points with the "off" command in the settings.
Integration of pressure check for the Enter key, in order to disable the predefined keys, allowing the user to use the game chat.

..:: PES2100 (10/10/2018) ::..

Fixed some bugs with the Enter key, related to pressure control and deactivation of predefined keys.
Made some changes to improve performance and the overall functionality of the program.
), changelog.txt, UTF-8

IfNotExist, Settings.ini
FileAppend,
(
[Cooldown]
;1500 msec = 1.5 sec
Sprint=1500
[Hotkeys]
Skills=MButton
Kadala=NumpadDot
[Obelisk]
Rifts=off
GRifts=off
[ParagonSwitch]
Ping=100
TotalPoints=2000
Attack=off
Defense=off
; 1 = on, 0 = off
Speed=1
Resource=1
), Settings.ini

IniRead, Sprint, Settings.ini, Cooldown, Sprint
IniRead, Skills, Settings.ini, Hotkeys, Skills
IniRead, Kadala, Settings.ini, Hotkeys, Kadala
IniRead, Rifts, Settings.ini, Obelisk, Rifts
IniRead, GRifts, Settings.ini, Obelisk, GRifts
IniRead, Ping, Settings.ini, ParagonSwitch, Ping
IniRead, TotalPoints, Settings.ini, ParagonSwitch, TotalPoints
IniRead, Attack, Settings.ini, ParagonSwitch, Attack
IniRead, Defense, Settings.ini, ParagonSwitch, Defense
IniRead, Speed, Settings.ini, ParagonSwitch, Speed
IniRead, Resource, Settings.ini, ParagonSwitch, Resource

Hotkey, %Skills%, Skills
Hotkey, %Kadala%, Kadala
if (Rifts != "off") {
Hotkey, %Rifts%, Rifts
}
if (GRifts != "off") {
Hotkey, %GRifts%, GRifts
}
if (Attack != "off") {
Hotkey, %Attack%, Attack
}
if (Defense != "off") {
Hotkey, %Defense%, Defense
}
Return

!Tab::
Return
LWin::
Return
RWin::
Return
#Tab::
Return

Skills:
If State=150
State=Off
else
State=150
SetTimer SendKey1, %State%
SetTimer SendKey2, %State%
Return

Kadala:
Send {RButton 36}
Return

SendKey1:
Send {1}
Send {2}
Send {3}
Return

SendKey2:
Send {4}
Sleep Sprint
Return

;SysGet, Mon1, Monitor, 1
;MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
;MouseGetPos, xpos, ypos 
;MsgBox, The cursor is at X%xpos% Y%ypos%.

Rifts:
MouseMove, 360, 400, 0
Send {LButton 1}
MouseMove, 350, 1125, 0
Send {LButton 1}
Return

GRifts:
MouseMove, 360, 632, 0
Send {LButton 1}
MouseMove, 350, 1125, 0
Send {LButton 1}
Return

Defense:
Send {p}
MouseMove, 1280, 980, 0
Send {LButton 1}
Send {LControl down}
if (Resource = 1) {
MouseMove, 1700, 815, 0
Sleep Ping
Send {LButton 1}
}
if (Speed = 1) {
MouseMove, 1700, 690, 0
Sleep Ping
Send {LButton 1}
}
MouseMove, 1700, 565, 0
Sleep Ping
TP:= (TotalPoints//100)+1
Send {LButton %TP%}
Send {LControl up}
MouseMove, 1105, 1090, 0
Send {LButton 1}
Return

Attack:
Send {p}
MouseMove, 1280, 980, 0
Send {LButton 1}
Send {LControl down}
if (Resource = 1) {
MouseMove, 1700, 815, 0
Sleep Ping
Send {LButton 1}
}
if (Speed = 1) {
MouseMove, 1700, 690, 0
Sleep Ping
Send {LButton 1}
}
MouseMove, 1700, 445, 0
Sleep Ping
TP:= (TotalPoints//100)+1
Send {LButton %TP%}
Send {LControl up}
MouseMove, 1105, 1090, 0
Send {LButton 1}
Return

Enter::
if (ChatActive = "true") {
gosub Skills
ChatActive=false
Hotkey, %Skills%, On
Send {Enter}
Return
}
Send {Enter}
if (State = 150) {
Hotkey, %Skills%, Off
gosub Skills
ChatActive=true
}
Return

NumpadEnter::
if (ChatActive = "true") {
gosub Skills
ChatActive=false
Hotkey, %Skills%, On
Send {NumpadEnter}
Return
}
Send {NumpadEnter}
if (State = 150) {
Hotkey, %Skills%, Off
gosub Skills
ChatActive=true
}
Return

End::
ExitApp
}
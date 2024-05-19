# D3_AHK_Automations

## Overview
* This repository contains a very simplistic AutoHotkey script, developed in 2018 for support Barbarian (zbarb) gameplay in Diablo III, mainly for group play with support and DPS Necromancers during speed runs of GRifts. Note that this script is by far outdated and may not be compatible with current game version or metas. Its main purpose was to automate various in-game actions to enhance the efficiency of XP farming, keystone farming, etc. It was created for personal use, so the supported resolution is only 2560x1440.

## Features
* Automatic Key Pressing (Skills)
  * Simulates pressing keys 1, 2, 3 every 0.15 seconds, and key 4 every 1.5 seconds.
* Automated Right-Click (Kadala - Shards)
  * Presses the right mouse button 36 times in less than a second.
* Automated Rift and GRift Starts (Obelisk)
  * Automatically starts regular Rifts and Greater Rifts.
* Paragon Points Switching (P)
  * Automatically reallocates Core Paragon Points.
* Customizable Hotkeys and Settings
  * Uses Settings.ini for user customization.
* Safety Features
  * Disables the Windows key and Alt+Tab combinations while the script is running.

## Usage
* Ensure Diablo III is running.
* Run the script and it will activate automatically.
  * If Diablo III is not running, the script will terminate with an error message.
* Use the following default hotkeys:
  * Middle Mouse Button: Toggles automatic key pressing.
  * Numpad .: Triggers automated right-clicking.
  * 5: Starts a regular Rift.
  * 6: Starts a Greater Rift.
  * Numpad 4: Switches Core Paragon Points to Intelligence.
  * Numpad 5: Switches Core Paragon Points to Vitality.
  * End: Terminates the script.

## Customization
The script can be customized using the Settings.ini file. Here are the available options:

```ini
[Cooldown]
; 1500 msec = 1.5 sec
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
```

Sprint: Cooldown in milliseconds for key 4.

Hotkeys: Customize the hotkeys for toggling skills and Kadala automation.

Obelisk: Customize the hotkeys for automatic Rift and Greater Rift starting.

ParagonSwitch: Customize the delay interval, total points to allocate, and toggle different categories of Paragon Points.

# DESKTOP, CONTEXT MENUS, SETTINGS AND SHORTCUTS

## NEXUS Desktop
- Premium desktop with bottom taskbar/panel, Start menu, pinned apps, running apps, system tray and clock.
- Universal search across apps, settings and user-authorized files.
- Quick Settings for Wi-Fi, Bluetooth, audio, brightness, battery/power and supported toggles.
- Notification center with notification history and per-app controls.
- Clock/calendar; weather only when configured and connected.
- CPU/RAM/network widgets using real system metrics.
- Virtual desktops, window overview, snapping, split screen and multi-monitor.
- Desktop icons, drag/drop, wallpaper and optional live wallpaper.
- Touchpad gestures where hardware supports them.
- Window blur/transparency only when GPU supports it; reduced-effects option.
- High contrast, scaling, screen reader labels, keyboard navigation and reduced motion.

## Context menus
Desktop menu:
- View: Large/Medium/Small icons, Auto Arrange, Align to Grid, Show/Hide Icons, Hidden Items, Grid Spacing.
- Sort By: Name, Size, Type, Date.
- Refresh: refresh the desktop/file view only.
- New: Folder, Text/Markdown, supported document, spreadsheet, presentation, shortcut, archive, supported custom file.
- Paste, Paste Shortcut, Undo/Redo where file operation history supports it.
- Display Settings, Personalize, Widgets, Desktop Settings, Terminal Here, Open Desktop Folder, NEXUS AI.

File/folder menu:
- Open, Open With, Copy, Cut, Paste, Rename, Delete, Properties, Compress, Extract, Share, Scan, Pin, Shortcut, Open in Terminal.
Drive menu:
- Open, mount/unmount, properties, health, safe eject, format only after explicit destructive confirmation.
App menu:
- Open, pin/unpin, launch options, app settings, uninstall, properties.
Taskbar menu:
- taskbar settings, pinned apps, window actions and system panel settings.
Unsupported actions must be disabled with explanation.

## Exactly 15 Settings categories
1. **Personalization:** themes, wallpaper, icons, fonts, taskbar, animations, window appearance, accent and accessibility appearance.
2. **System & Performance:** CPU/RAM/GPU status, power, startup, fan/sensors when exposed, performance profiles, background apps, low-RAM.
3. **NEXUS AI:** provider/model, voice, microphone, memory/preferences, permissions, local model status, repair confirmations.
4. **Network & Connectivity:** Wi-Fi, Bluetooth, Ethernet, VPN, DNS, proxy, hotspot and network diagnostics.
5. **Display & Graphics:** resolution, refresh rate, HDR where supported, brightness, scaling, GPU and multi-monitor.
6. **Sound & Audio:** volume, output/input devices, microphone, equalizer and audio diagnostics.
7. **Devices & Hardware:** keyboard, touchpad, mouse, USB, camera, printer, scanners and device diagnostics.
8. **Security & Privacy:** firewall, encryption, app permissions, login, sessions, privacy dashboard and audit log.
9. **Apps & Application Management:** install, uninstall, update, default apps, startup apps, file associations and compatibility.
10. **Gaming Center:** FPS, game profiles, recording, controllers, overlays and console mode.
11. **Updates & Recovery:** updates, rollback, backup, restore, recovery and boot repair.
12. **Developer Center:** terminal, SDK, API, debugging, logs, packaging and developer tools.
13. **Accessibility:** magnifier, screen reader, captions, voice access, contrast, scaling and reduced motion.
14. **Accounts & Cloud:** users, guest accounts, cloud sync, backup, sessions and parental controls.
15. **Advanced System Control:** kernel, services, scheduler, filesystem, boot configuration and advanced diagnostics; warn before risky changes.

Each category must have navigation, search, clear subpages, apply/save behavior, reset where safe, permissions and all relevant UI states.

## Task Manager
Tabs: Processes, Performance, Startup Apps, Services, Users, Details, App History, GPU Engine (if available), Network, Sensors/Temperature (if exposed), Resource Monitor.
Actions: End Task, Force Quit, Restart App, Search, Change Priority, Export Report, Refresh.
Protect critical system processes; require confirmation and explain consequences.

## Device Manager
- Enumerate actual devices and categories.
- Show vendor, model, hardware IDs, driver/module, firmware if available, status and logs.
- Scan hardware, update from trusted repositories, rollback, reinstall, enable/disable and diagnostics where supported.
- Never invent hardware or install an unverified driver.

## Run dialog
- Open with Win+R.
- Search/autocomplete, recent commands, history and permission prompt.
- Aliases: `taskmgr`, `devmgmt`, `settings`, `explorer`, `terminal`, `control`, `diskmgmt`, `services`, `msinfo`, `network`, `startup`, `recovery`, `security`, `updates`, `power`.
- Aliases open known NEXUS tools. Arbitrary text is not run as root.

## Keyboard shortcuts
- Win Start; Win+E File Manager; Win+I Settings; Win+R Run.
- Ctrl+Shift+Esc Task Manager; Win+X advanced menu.
- Win+D desktop; Win+L lock; Alt+Tab app switcher; Alt+F4 close.
- Win+Tab workspaces; Win+A Quick Settings; Win+N notifications; Win+S search; Win+V clipboard.
- Win+P display projection; Win+K wireless display/connect.
- Ctrl+Alt+Delete security menu; Win+Shift+S screenshot.
- Win+Ctrl+Left/Right switch virtual desktops.
- Custom shortcut editor with conflict detection and reset.

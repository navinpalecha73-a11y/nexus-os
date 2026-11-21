# HARDWARE, PERFORMANCE AND COMPATIBILITY SPECIFICATION

## Hardware inventory
Enumerate CPU, RAM, GPU, SSD/HDD/controllers, Wi-Fi/network, Bluetooth, audio, keyboard, mouse, touchpad, USB, battery, display, camera, printer, firmware, system devices, fan and temperature sensors when exposed. Show actual data source and timestamp. Unknown values must remain unknown, not guessed.

## Samsung RV411 compatibility profile
- Maintain test records for the physical Samsung RV411.
- Do not assume touchpad chipset; identify vendor, hardware ID, bus/interface and bound driver/module from actual machine.
- Test cold boot, warm reboot, repeated restart, suspend/resume and recovery after temporary detection failure.
- Validate pointer movement, left/right click, tap-to-click, scrolling, multi-touch gestures when hardware supports them.
- Capture kernel/input logs and driver binding state.
- Retry detection safely and only when needed; no blind driver replacement.
- Preserve known-good configuration across updates and provide rollback.
- Physical connector/cable, touchpad board or motherboard faults require hardware repair.

## Performance profiles
- Extreme Performance
- Balanced
- Power Saver
- Low-RAM

Low-RAM mode:
- Reduce/disable expensive blur, transparency, 3D effects and animations.
- Limit nonessential background services and startup applications.
- Use measured ZRAM/swap configuration appropriate to available memory.
- Avoid aggressive cache clearing or unsafe kernel tweaks.
- Prioritize foreground responsiveness and protect essential services.
- Provide clear explanation of which effects/services were reduced.

## Stability
- Memory pressure monitor and safe OOM behavior.
- Process/service watchdog with restart policy only for restart-safe services.
- App crash detection and recovery.
- GPU/driver error reporting.
- Disk I/O and thermal/power diagnostics.
- Freeze detection with logs and safe user actions.
- Update rollback and recovery boot.
- Never kill critical system processes automatically.

## Windows application compatibility
- Wine/Bottles for supported desktop applications.
- Proton for supported Steam games.
- `.exe`/`.msi` workflow, prefixes, dependencies, shortcuts, uninstall records and per-app profiles.
- 32-bit support only where required libraries are available.
- Sandbox and restrict file/system access.
- Explain that kernel drivers, anti-cheat, DRM, Microsoft Store apps, some launchers and Windows-specific services may not work.

## Performance acceptance
Measure boot time, login-to-ready time, idle RAM, app launch latency, CPU use, disk I/O, suspend/resume and responsiveness on documented hardware. Report test conditions and actual numbers. Targets are optimization goals, not guarantees.

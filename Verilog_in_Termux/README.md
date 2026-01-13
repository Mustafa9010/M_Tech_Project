Running GTKWave on Android using Termux + Termux-X11

This guide explains how to run GTKWave on Android using Termux with Termux-X11, so you can view Verilog VCD waveforms graphically.

⚠️ Termux alone cannot run GUI applications.
Termux-X11 is mandatory to display GTKWave.

📱 Requirements

Android phone (Android 9 or above recommended)

Stable internet connection

Basic Linux command knowledge

.vcd file generated from Verilog simulation

📦 Apps to Install (IMPORTANT)
1️⃣ Install Termux (F-Droid ONLY)

❌ Do NOT install from Play Store (unsupported)

👉 Download from F-Droid:
https://f-droid.org/packages/com.termux/

2️⃣ Install Termux-X11

👉 Download latest APK from GitHub:
https://github.com/termux/termux-x11/releases

Install termux-x11.apk

🧩 Step-by-Step Setup (Run ALL commands in Termux)
Step 1: Update Termux
pkg update && pkg upgrade

Step 2: Enable X11 Repository
pkg install x11-repo

Step 3: Install Required Packages
pkg install termux-x11-nightly gtkwave iverilog


Installed tools:

gtkwave → Waveform viewer

iverilog → Verilog simulator

termux-x11 → GUI display support

🖥️ Running GTKWave (IMPORTANT ORDER)
Step 4: Start Termux-X11 App

Open Termux-X11 app

Keep it running in background

Step 5: Start X11 Server in Termux
termux-x11 :1 &

Step 6: Set DISPLAY Variable

(This confirms Termux ↔ Termux-X11 connection)

export DISPLAY=:1


⚠️ You must run this every time you open a new Termux session

🔧 Verilog Simulation Example
Step 7: Create Verilog File
nvim comparator_1bit.v


Save and exit:

:wq

Step 8: Compile and Run Verilog
iverilog -o comparator comparator_1bit_tb.v comparator_1bit.v
vvp comparator


✔ This generates dump.vcd

📊 Open GTKWave
Step 9: Launch GTKWave
gtkwave dump.vcd


✅ GTKWave GUI will open in Termux-X11 window

❗ Common Fixes
GTKWave opens but shows blank screen
export DISPLAY=:1
termux-x11 :1 &


✔ Ensure Termux-X11 app is running in background

# 🕒 Timestamped Backup

A lightweight Windows batch script that creates timestamped backups using `robocopy`.

## 🚀 Features
- Creates a new backup folder with the current date and time.
- Copies only files modified in the last 24 hours.
- Excludes system folders and the script’s own directory.
- Accepts an optional source path argument (defaults to `C:\`).
- Fully self-contained — no external dependencies required.

## ⚙️ Usage
```bat
backup.bat [source_folder]
```

### Examples
Copy from `C:\` (default):
```bat
backup.bat
```

Copy from a specific folder:
```bat
backup.bat D:\Projects
```

### Example output
If run on November 5, 2025 at 13:42, it creates:
```
<repo-folder>\2025-11-05_13-42\
```

## 🧩 Requirements
- Windows 10 or later  
- PowerShell (for date formatting)  
- Robocopy (included with Windows)

## 🧠 How it works
1. Generates a timestamp using PowerShell.  
2. Creates a new folder next to the script named with that timestamp.  
3. Runs `robocopy` to copy files modified in the last 24 hours.  
4. Excludes the system folders and the script’s own directory.  

## 🪶 Example Output Log
```
-------------------------------------------------------------------------------
   ROBOCOPY     ::     Robust File Copy for Windows
-------------------------------------------------------------------------------

   Started : Wed Nov 05 13:42:00 2025
   Source : C:\Projects\
   Dest : D:\Backups\2025-11-05_13-42\

   Files : *.*

   Options : /S /MAXAGE:1 /XD C:\backup C:\$Recycle.Bin %~dp0 /MT:8
-------------------------------------------------------------------------------
```

## 📜 License
This project is released under the [MIT License](LICENSE).

---

🧰 *Perfect for quick daily backups or as part of automated Windows maintenance tasks.*

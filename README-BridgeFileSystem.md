# Bridge File System — Starter Pack (v1.0)

This starter pack complements your directory guide with ready‑to‑use templates and scripts.
It is platform‑agnostic and works on desktop and mobile (Termux/Android, iOS via Shortcuts + Files).

---
## Quick Start

### 1) Place this pack
Unzip anywhere (e.g., `~/Downloads/BridgeFiles-StarterPack/`). Then run an init script to scaffold your folders.

**Mac/Linux/Termux (Android)**
```bash
bash scripts/bridge-init.sh "$HOME/Notes/BridgeFiles"
```

**Windows (PowerShell)**
```powershell
.\scripts\bridge-init.ps1 -Root "$HOME\Notes\BridgeFiles"
```

> Tip: replace the path above to your preferred location. On Windows you can also use `C:\Users\<you>\Notes\BridgeFiles`.

### 2) (Optional) Initialize Git (+ LFS for media)
If Git is available, init happens automatically in the init scripts. Otherwise:
```bash
cd "$HOME/Notes/BridgeFiles"
git init
git lfs install
git add . && git commit -m "BridgeFiles: init"
```

### 3) Obsidian Vault Setup (optional but nice)
- Open Obsidian → **Open folder as vault** → choose your `BridgeFiles` folder.
- Settings → Files & Links:
  - Default location for new attachments: `Screenshots/`
  - New link format: `Relative path to file`
  - Use [[Wikilinks]]: enabled (your guide already uses these)
- Mobile: Obsidian Mobile + your cloud of choice (iCloud/Drive/Dropbox).

---
## Included

- `templates/Bridgefile-Session-Template.md` — Ready‑to‑fill session file (YAML + section scaffolding).
- `config/bridge.config.json` — Defaults for paths, naming, and activation phrase.
- `scripts/`
  - `bridge-init.sh` / `bridge-init.ps1` — Create folders, drop starter files, optional Git+LFS.
  - `backup.sh` / `backup.ps1` — Zip the folder with timestamp.
  - `hashdir.sh` / `hashdir.ps1` / `hashdir.py` — Deterministic run‑hash over files.
  - `normalize.py` — NFKC text normalize and LF line endings for Markdown files.
- `.gitignore`, `.gitattributes` — Sensible defaults (LFS for large media in `Screenshots/`).

---
## Common Paths by Platform (suggested)

- **Windows:** `C:\Users\<you>\Notes\BridgeFiles\`
- **Mac/Linux:** `~/Notes/BridgeFiles/`
- **Android (Termux):** `/data/data/com.termux/files/home/Notes/BridgeFiles/` (maps to `~/Notes/BridgeFiles` in Termux)
- **iOS:** Use the **Files** app (iCloud Drive or similar) and point Obsidian Mobile at that folder.

---
## Maintenance

- **Backup:**  
  Mac/Linux/Termux → `bash scripts/backup.sh "$HOME/Notes/BridgeFiles"`  
  Windows → `./scripts/backup.ps1 -Root "$HOME\Notes\BridgeFiles"`

- **Normalize Markdown (optional):**
  ```bash
  python3 scripts/normalize.py "$HOME/Notes/BridgeFiles"
  ```

- **Compute run‑hash (verifies content set):**
  ```bash
  bash scripts/hashdir.sh "$HOME/Notes/BridgeFiles"
  # or
  python3 scripts/hashdir.py "$HOME/Notes/BridgeFiles"
  ```

---
## Security & Privacy

- Store sensitive notes in encrypted storage (FileVault/BitLocker/Veracrypt, iOS encrypted containers).
- Review app permissions regularly on mobile.
- Share read‑only copies when collaborating outside your trusted circle.

---
## License
You may adapt and redistribute this starter pack within your projects.

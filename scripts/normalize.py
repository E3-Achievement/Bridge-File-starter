#!/usr/bin/env python3
import sys, os, io, unicodedata, pathlib

def normalize_text(s: str) -> str:
    s = unicodedata.normalize('NFKC', s)
    s = s.replace('\r\n', '\n').replace('\r', '\n')
    if not s.endswith('\n'):
        s += '\n'
    return s

def process_file(path: str):
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    new = normalize_text(content)
    if new != content:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(new)
        print(f"normalized: {path}")

def main(root: str):
    root = os.path.expanduser(root)
    for dirpath, dirnames, filenames in os.walk(root):
        # skip .git and Backups
        if '.git' in dirpath or os.path.sep + 'Backups' + os.path.sep in dirpath:
            continue
        for name in filenames:
            if name.lower().endswith(('.md', '.markdown', '.txt', '.yml', '.yaml')):
                process_file(os.path.join(dirpath, name))

if __name__ == "__main__":
    root = sys.argv[1] if len(sys.argv) > 1 else "~/Notes/BridgeFiles"
    main(root)

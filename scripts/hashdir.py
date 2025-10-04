#!/usr/bin/env python3
import sys, os, hashlib
from pathlib import Path

def file_hash(path):
  h = hashlib.sha256()
  with open(path, 'rb') as f:
    for chunk in iter(lambda: f.read(8192), b''):
      h.update(chunk)
  return h.hexdigest()

def run_hash(root):
  # stable ordering
  files = []
  root = Path(root).resolve()
  for p in root.rglob('*'):
    if p.is_file():
      # ignore backup zips and .git
      rel = p.relative_to(root)
      if str(rel).startswith('.git') or '/Backups/' in str(rel).replace('\\','/') or rel.name.endswith('.zip'):
        continue
      files.append(rel.as_posix())
  files.sort()
  h = hashlib.sha256()
  for rel in files:
    h.update(rel.encode('utf-8'))
    h.update(b'\n')
    h.update(file_hash(root / rel).encode('utf-8'))
    h.update(b'\n')
  return h.hexdigest()

if __name__ == "__main__":
  root = sys.argv[1] if len(sys.argv) > 1 else os.path.expanduser("~/Notes/BridgeFiles")
  print(run_hash(root))

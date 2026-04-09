#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /absolute/or/relative/path/to/file.pdf" >&2
  exit 1
fi

PDF_PATH="$1"
if [[ ! -f "$PDF_PATH" ]]; then
  echo "Error: PDF not found: $PDF_PATH" >&2
  exit 1
fi

if ! command -v mutool >/dev/null 2>&1; then
  echo "Error: mutool is required but not installed." >&2
  echo "Install it (mupdf-tools) and rerun." >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/imports/pdf_extract"
TEXT_DIR="$OUT_DIR/text"
ASSETS_DIR="$OUT_DIR/assets"

mkdir -p "$TEXT_DIR" "$ASSETS_DIR"

# Keep a canonical copy of the imported source file.
cp "$PDF_PATH" "$OUT_DIR/source.pdf"

# Export concatenated text from all pages.
mutool draw -F txt -o "$TEXT_DIR/pdf_text_raw.txt" "$PDF_PATH" >/dev/null

# Extract embedded images/fonts. We keep only images in repo assets.
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

(
  cd "$TMP_DIR"
  mutool extract "$PDF_PATH" >/dev/null 2>&1 || true
)

find "$TMP_DIR" -maxdepth 1 -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \) -print0 \
  | xargs -0 -I{} cp "{}" "$ASSETS_DIR/"

echo "Imported PDF into: $OUT_DIR"
echo "- source.pdf"
echo "- text/pdf_text_raw.txt"
echo "- assets/"

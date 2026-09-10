#!/usr/bin/env bash
# Renders a resume Markdown file to .docx (using the repo's reference.docx
# style template) and then to .pdf, and prints the resulting page count.
#
# Usage: scripts/render-resume.sh job-applications/<company>/resume.md
#
# Requires: pandoc, soffice (LibreOffice), pdfinfo (poppler)
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <path/to/resume.md>" >&2
  exit 1
fi

MD_PATH="$1"
DIR="$(dirname "$MD_PATH")"
BASE="$(basename "$MD_PATH" .md)"
DOCX_PATH="$DIR/$BASE.docx"
PDF_PATH="$DIR/$BASE.pdf"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

pandoc "$MD_PATH" --reference-doc="$REPO_ROOT/reference.docx" -o "$DOCX_PATH"
soffice --headless --convert-to pdf --outdir "$DIR" "$DOCX_PATH" >/dev/null 2>&1
PAGES="$(pdfinfo "$PDF_PATH" | awk '/^Pages:/{print $2}')"

echo "docx: $DOCX_PATH"
echo "pdf:  $PDF_PATH"
echo "pages: $PAGES"

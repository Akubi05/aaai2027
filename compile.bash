#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

pdflatex -interaction=nonstopmode -halt-on-error latentrisk_vlm.tex
if command -v bibtex >/dev/null 2>&1 && bibtex --version >/dev/null 2>&1; then
  bibtex latentrisk_vlm
elif command -v bibtex.original >/dev/null 2>&1; then
  bibtex.original latentrisk_vlm
elif [[ -x /usr/bin/bibtex.original ]]; then
  /usr/bin/bibtex.original latentrisk_vlm
else
  echo "ERROR: bibtex not found" >&2
  exit 1
fi
pdflatex -interaction=nonstopmode -halt-on-error latentrisk_vlm.tex
pdflatex -interaction=nonstopmode -halt-on-error latentrisk_vlm.tex

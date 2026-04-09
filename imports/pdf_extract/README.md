# PDF Import Bundle

This folder stores the raw materials imported from the uploaded event PDF.

## Files

- `source.pdf`: Original uploaded PDF file
- `text/pdf_text_raw.txt`: Raw text extracted from all pages
- `assets/`: Embedded images extracted from the PDF

## Why this exists

Keeping raw extraction artifacts in the repository makes it easy to:

- audit where writeup content came from,
- regenerate clean markdown files later,
- and preserve event history in one place.

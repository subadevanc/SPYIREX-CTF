# Contributing

Thanks for contributing to `SPYIREX-CTF`.

## Goals

- Keep writeups reproducible.
- Keep challenge metadata consistent.
- Preserve original source references.

## Repository Conventions

- Use one folder per challenge.
- Include `README.md` in each challenge folder with:
  - Category
  - Difficulty or points (if known)
  - Challenge summary
  - Reproducible solve steps
  - Final flag
- Prefer plain ASCII markdown unless source material requires otherwise.

## Writeup Quality Checklist

- Commands are copy-paste runnable.
- Any decoding/reversing script is included.
- External resources are linked clearly.
- Flag format is shown as `JCE{...}`.

## Importing New PDF Writeups

Use the helper script:

```bash
./tools/import_pdf.sh /path/to/file.pdf
```

This stores raw import artifacts under:

- `imports/pdf_extract/source.pdf`
- `imports/pdf_extract/text/pdf_text_raw.txt`
- `imports/pdf_extract/assets/`

## Commit Style

Use clear, scoped messages, for example:

- `docs: add web challenge writeup`
- `docs: normalize steganography challenge format`
- `chore: import event PDF artifacts`

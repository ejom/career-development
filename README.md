# career-development

Resume source files (Markdown) and generated Word docs.

## Setup

`scripts/render-resume.sh` (used to tailor and page-check job-specific
resumes — see `AGENTS.md`) needs three tools on your PATH:

```sh
brew install pandoc poppler
brew install --cask libreoffice
```

- [`pandoc`](https://pandoc.org/) — converts the Markdown resume to `.docx`.
- `soffice` (from `libreoffice`) — headlessly renders the `.docx` to `.pdf`
  using its actual styles/margins, so pagination matches what you'd see in
  Word.
- `pdfinfo` (from `poppler`) — reads the exact page count off the rendered
  PDF.

## Layout

- `master-software-resume.md` — source of truth for real experience, dates,
  and metrics.
- `reference.docx` — Pandoc style template (fonts, margins, heading styles)
  used to render `.docx` output.
- `job-applications/<company-slug>/` — one directory per tailored
  application, containing `job-description.txt`, `resume.md`, and the
  generated `resume.docx` / `resume.pdf`.
- `scripts/render-resume.sh` — renders a resume `.md` to `.docx` then `.pdf`
  and prints the page count.

## Scripts

### `render-resume.sh`

```sh
scripts/render-resume.sh job-applications/<company-slug>/resume.md
```

Converts the given Markdown resume to `.docx` (using `reference.docx` for
styling), renders that to `.pdf`, and prints the paths and page count.

## Tailoring a resume for a job

See `AGENTS.md` for the full workflow. In short: create
`job-applications/<slug>/`, save the job description, copy
`master-software-resume.md` into `resume.md`, tailor it to the job, then run
`render-resume.sh` and trim until it's 1-2 pages.

The generated `.docx`/`.pdf` files are build artifacts — always edit
`resume.md` and re-render rather than editing the Word doc directly.


# career-development

Resume source files (Markdown) and generated Word docs.

## Generating a .docx from a Markdown resume

This repo uses [Pandoc](https://pandoc.org/) with `reference.docx` as a style
template, so the generated Word file inherits its fonts, margins, and header
formatting instead of Pandoc's defaults.

Install Pandoc if needed:

```sh
brew install pandoc
```

Convert a resume, e.g. `master-software-resume.md`:

```sh
pandoc master-software-resume.md --reference-doc=reference.docx -o Main_Resume.docx
```

- `--reference-doc=reference.docx` tells Pandoc to copy styles (fonts,
  margins, header/footer, heading styles) from `reference.docx` into the
  output file.
- To tweak formatting, open `reference.docx` in Word, edit its styles
  directly (don't just reformat text — edit the underlying Style
  definitions), save, and re-run the conversion.

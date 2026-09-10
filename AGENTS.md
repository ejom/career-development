# AGENTS.md

## Repo layout

- `master-software-resume.md` — the master resume. Source of truth for real
  experience, dates, and metrics. Never invent content that isn't derivable
  from this file or from something the user tells you directly.
- `reference.docx` — Pandoc style template (fonts, margins, heading styles).
  Controls the rendered `.docx` layout. 
- `job-applications/<company-slug>/` — one directory per tailored application:
  - `job-description.txt` — the pasted job description.
  - `resume.md` — the tailored resume for that job.
  - `resume.docx` / `resume.pdf` — generated from resume.md.
- `scripts/render-resume.sh` — renders a resume `.md` to `.docx` then `.pdf`
  and prints the page count. 

## Workflow: "tailor my resume for X"

When the user asks to tailor a resume for a job (usually pasting a job
description), do the following:

1. Pick a short company slug and create
   `job-applications/<slug>/` if it doesn't exist.
2. Save the pasted job description to
   `job-applications/<slug>/job-description.txt`.
3. Copy `master-software-resume.md` to `job-applications/<slug>/resume.md`
   as the starting point.
4. Tailor `resume.md` to the job description:
   - Use the job description's keywords where the user's real experience genuinely matches.
   - If the job description implies load-bearing experience(s) that arent clearly supported by the master resume or prior conversation, ask the user if they have those experience(s). 
5. Run `scripts/render-resume.sh job-applications/<slug>/resume.md` to render and get the page count.
6. Target 1-2 pages. If it's over, trim and re-run step 5 until its 1-2 pages. 

## Notes

- The generated `.docx`/`.pdf` are build artifacts of `resume.md` — always
  edit the Markdown and regenerate, never edit the Word doc directly.

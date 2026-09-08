## Response Rules
- Always respond in Japanese unless the user explicitly specifies otherwise.

## Tooling rules for OpenCode
- Use OpenCode tools only: read, write, edit, list, glob, grep, webfetch, bash, task, todowrite, todoread.
- Do NOT call non-existent tools like Repo_browser.* .
- Prefer `edit` for modifying existing files; use `read` to inspect before editing.

## Code comments
- Do NOT write comments in code. This applies to every file: YAML, Jinja templates, config files, scripts.
- Explain non-obvious decisions in the commit message and the pull request description instead.
- Markdown headings are not comments.

## Privacy and placeholders
- Do NOT write real email addresses.
- Do NOT write real domains.
- If a domain or email address is absolutely necessary, use the `example.com` domain.

## Committing
- Do NOT commit untracked files. Anything `git status` shows as `??` stays out of the commit, even if you created it yourself, unless you are explicitly told to include it.
- Do NOT use `git add -A`, `git add .`, or `git add <directory>`. Name the changed paths explicitly; use `git add -A -- <explicit paths>` when the change includes deletions or renames.
- Run `git status --short` before committing and confirm the `??` entries are still listed.
- End the commit message with a co-author line, no email address:
  - `Co-Authored-By: {Model Name} with {tool}`
  - e.g. `Co-Authored-By: Qwen3.8-27B-UD-Q8_K_XL with OpenCode`
  - Exception: Claude Code and Codex ignore this rule and follow their own default co-author line convention.

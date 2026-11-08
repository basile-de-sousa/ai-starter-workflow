# ai-starter-workflow

A lean, spec-driven workflow for building software with Claude: design by talking naturally (web, mobile or Claude Code), implement in Claude Code, keep every decision traceable in the repo.

> Using this as a template? Replace this README with your project's own once it starts.

## The idea

- **The repo is the source of truth.** Decisions never live only in a chat: they land in `docs/`, so any session can pick up where another stopped.
- **You talk, Claude records.** No command for design: the `/spec` skill applies itself, and writes decisions in batches (a short recap, then one yes) when a subject closes, a step ends or decisions pile up.
- **Lean by default.** No required docs, no placeholders, no framework to install. Files appear only when they have content.

## What you type

| Command | What it does |
|---|---|
| `/spec` | Explains the workflow |
| `/spec ?` | Where the project stands and what to do next (or just ask in words) |
| `/spec run NNN` / `all` | Claude Code only: implements `ready` specs, test-first, on the current branch |

Everything else is automatic: setting up the current-truth docs on a new or existing repo, recording design decisions, reviewing drafts and proposed ADRs, reminding you of open questions when you come back.

## Feedback on what exists: four lanes

Bugs, playtest or usage feedback take the lightest lane that keeps docs and code true; Claude announces the lane in one line.

| Lane | When | What happens |
|---|---|---|
| Fix | The code breaks a rule, or is obviously wrong | Test + fix at once, `fix: …` commit |
| Tune | A value changes, not the mechanic | Doc and code in the same `tune: …` commit, no spec |
| Spec | New or changed behavior | Recorded as a spec, built by `/spec run` |
| Question | Intent unclear, or a risk to watch | `## Open questions` in the relevant doc, with what would settle it |

## Specs and runs

| Spec status | Meaning |
|---|---|
| `draft` | Being discussed, or sent back with an open question |
| `ready` | Approved by you (explicitly, or because you asked for it and Claude added nothing) |
| `in-progress` | Claimed by `/spec run` |
| `done` | Implemented, tests green, current-truth docs updated |

A run pulls the latest specs first (fast-forward only), writes failing acceptance tests before any code, and tags every commit `(SPEC-NNN)`: `git revert` undoes one spec, no pull request needed. On the default branch it asks once whether to push there or create `run/YYYY-MM-DD`; the choice can be remembered per clone (`git config --local spec.runOn`, never pushed).

Decisions a spec did not make are judged by the cost of being wrong: cheap → implementation notes; costly with a sensible default → ADR `proposed` for your review; depends on product intent → spec back to `draft` with a question.

## What's in the repo

| File | Role |
|---|---|
| `CLAUDE.md` | The only always-loaded context: project line, commands, a few non-negotiable rules |
| `.claude/hooks/board.sh` + `.claude/settings.json` | At session start, lists specs not done, ADRs `proposed` and open questions |
| `docs/README.md` + current-truth docs | What holds now; read by every implementer, updated by every change |
| `docs/specs/`, `docs/adr/` | Created on demand: change requests, and the why of costly decisions |

Formats and the full workflow live in the **`/spec` skill**, saved at account level on claude.ai (one copy for every project, synced to Claude Code). Acceptance criteria use [EARS](https://alistairmavin.com/ears/) notation; ADRs follow a light [MADR](https://adr.github.io/madr/).

## Getting started

1. Create a repo from this template.
2. Make sure the `/spec` skill is enabled on your Claude account and the GitHub connector can reach the repo. If your local Claude Code CLI does not see the skill, sign in with `/login`, or download it into `~/.claude/skills/spec/`.
3. Describe your project to Claude: it fills the project line in `CLAUDE.md` and sets up the current-truth docs.
4. Keep talking; when specs are `ready`, run `/spec run all` in Claude Code.

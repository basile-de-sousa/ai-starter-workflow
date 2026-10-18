# Project rules

Project: _not described yet — ask the user for one sentence and replace this line._

## Commands

_Not known yet — add test, lint, typecheck and build commands here once they exist._

## Rules

- All code, comments, commits and docs in English (user-facing copy follows the product's language).
- Work on the current branch. Before committing code on the default branch (or the branch named here), ask first; the safe answer is a new branch. No pull request is required: commits tagged `(SPEC-NNN)` are the review and rollback unit.
- Trivial change (typo, small obvious bug): no spec, just a `fix: …` commit.
- A request that is not a bug fix or a trivial change starts as `/spec new` (explore, then draft spec). No code until a spec is `ready`.
- Conventional Commits, with the spec reference when there is one: `feat(auth): lock account after 5 failures (SPEC-012)`.
- Run the commands above before each commit that touches code. Never weaken a test to make it pass unless the spec changed.
- The current-truth docs indexed in `docs/README.md` describe the system as it is. Keep them true: a change that alters a rule updates its doc in the same series of commits.
- If a spec, a current-truth doc, an accepted ADR and the code disagree, stop and report it. Do not resolve it silently. Existing code that does not yet follow an accepted ADR is work for a spec, not a disagreement.
- Specs, ADRs and current-truth docs live in `docs/` and follow the `/spec` skill (formats and workflow).
- If the session-start board lists drafts or proposed ADRs, mention them in one line in your first reply.

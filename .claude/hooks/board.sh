#!/bin/sh
# Session-start board: non-done specs, proposed ADRs and open questions. Silent when there is nothing to show.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
out=""
for f in docs/specs/*.md; do
  [ -f "$f" ] || continue
  s=$(sed -n 's/^status: *//p' "$f" | head -1)
  [ "$s" = done ] && continue
  out="$out
  [$s] $(sed -n 's/^# *//p' "$f" | head -1)"
done
for f in docs/adr/*.md; do
  [ -f "$f" ] || continue
  grep -qi '^Status: *proposed' "$f" || continue
  out="$out
  [proposed] $(sed -n 's/^# *//p' "$f" | head -1)"
done
for f in $(grep -rl '^## Open questions' docs 2>/dev/null); do
  case "$f" in docs/specs/*) grep -q '^status: *done' "$f" && continue ;; esac
  n=$(awk '/^## Open questions/{on=1;next} /^## /{on=0} on && /^[-*] /{c++} END{print c+0}' "$f")
  [ "$n" -gt 0 ] || continue
  out="$out
  [$n open question(s)] $f"
done
[ -n "$out" ] && printf 'Spec/ADR board:%s\n' "$out"
exit 0

# Voice and Navigation Overhaul Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite the 17-page reading path plus three meta pages and the project spec into a friendly-textbook voice, and add README-level + per-page navigation, per `docs/superpowers/specs/2026-05-10-voice-and-navigation-overhaul-design.md`.

**Architecture:** No code changes. The hub is a Markdown vault. Each task rewrites one page in place, applies a deterministic prev/up/next footer (when the page is in the linear path), and verifies the result against a banlist script and a word-count target. Four user-review checkpoints gate the work.

**Tech Stack:** Markdown, Obsidian wikilinks, `bash` for verification scripts, `git` for commits.

---

## File Structure

| File | Responsibility | Touched in tasks |
|---|---|---|
| `scripts/check-banlist.sh` (new) | One-line banlist grep helper. Reports any banned vocabulary in a Markdown file. | Task 1 |
| `how-not-to-produce-ai-slop.md` | Golden example of the new voice. Calibration target for the rest of the rewrite. | Task 2 |
| `1-what-llms-are-and-arent/*.md` (4 files) | Section 1 mental-model pages. | Tasks 3–6 |
| `2-how-to-talk-to-them/*.md` (4 files) | Section 2 prompting pages. | Tasks 7–10 |
| `3-context-engineering/*.md` (4 files) | Section 3 context pages. | Tasks 11–14 |
| `4-building-workflows/*.md` (4 files) | Section 4 tool/workflow pages. | Tasks 15–18 |
| `start-here.md` | Annotated guided path. Voice rewrite only — no nav footer (page is itself the path). | Task 19 |
| `curated-links.md` | External sources index. Voice rewrite only — not in linear path. | Task 20 |
| `README.md` | Project entry point. Voice rewrite + new Reading order section (the README-level TOC). | Task 21 |
| `spec-ai-literacy-hub.md` | Project spec. Update voice section (lines 43–53) and density section (lines 56–67) to match the overhaul spec. | Task 22 |

---

## Per-task pattern (read once, apply throughout)

Every page rewrite task follows the same six-step pattern:

1. **Read** the current page so the rewriter has its full content in working memory.
2. **Rewrite** the page applying the voice directive in `docs/superpowers/specs/2026-05-10-voice-and-navigation-overhaul-design.md` § "Voice directive". Specifically: friendly-textbook register, no banlist words (see banlist in spec), 14-year-old test, plain analogies welcome, introduce technical terms on first use. Preserve every heading, table, code block, blockquote, citation, and the existing `*Related:* …` line at the bottom. Aim for 800–1500 words.
3. **Add the prev/up/next footer** above the existing `*Related:*` line, in the exact form given in that task. The footer goes between `---` and `*Related:* …`.
4. **Run the banlist check.** Must report `OK`.
5. **Run the word-count check.** Must be between 800 and 1500.
6. **Commit** with the message given in the task.

Tasks at checkpoints A, B, C, D add a seventh step: **STOP and notify the user.** Do not proceed past the checkpoint without explicit user approval.

---

## Task 1: Banlist verification helper

**Files:**
- Create: `scripts/check-banlist.sh`

- [ ] **Step 1: Verify scripts directory does not yet exist**

```bash
ls /workspaces/web-dev-playground/ai-literacy-hub/scripts 2>/dev/null
```

Expected: empty output and non-zero exit (directory not found). If the directory exists, that is also fine — proceed.

- [ ] **Step 2: Create the banlist script**

Write `scripts/check-banlist.sh` with the following content:

```bash
#!/usr/bin/env bash
# Usage: bash scripts/check-banlist.sh <markdown-file>
# Reports any banned vocabulary from the voice directive.
# Exits 0 if clean, 1 if any matches found.

set -u

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <markdown-file>" >&2
  exit 2
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE" >&2
  exit 2
fi

# Banned tokens. Case-insensitive substring match.
# A few entries (register, roam, compounds) are word-boundary matched
# because they have legitimate uses in other senses.
BANNED_SUBSTR=(
  "load-bearing"
  "calibrate"
  "calibrates"
  "calibrated"
  "aggressively"
  "downstream of"
  "off-ramp"
  "the corrective"
  "category error"
  "category errors"
  "audit posture"
  "the spine of"
  "instantiated"
  "synthesize"
  "synthesizes"
  "synthesis"
  "lossy"
  "the giveaway"
  "pre-empt"
  "preempt"
  "essentially"
  "basically"
  "robust"
  "seamless"
)

# Word-boundary terms (need standalone match to avoid false positives).
BANNED_WORD=(
  "register"
  "roam"
  "compounds"
)

EXIT=0

for term in "${BANNED_SUBSTR[@]}"; do
  if grep -ni -- "$term" "$FILE" >/dev/null 2>&1; then
    echo "BANNED: \"$term\""
    grep -ni --color=never -- "$term" "$FILE" | sed 's/^/  /'
    EXIT=1
  fi
done

for term in "${BANNED_WORD[@]}"; do
  if grep -niE -- "\\b$term\\b" "$FILE" >/dev/null 2>&1; then
    echo "BANNED (word): \"$term\""
    grep -niE --color=never -- "\\b$term\\b" "$FILE" | sed 's/^/  /'
    EXIT=1
  fi
done

if [ $EXIT -eq 0 ]; then
  echo "OK"
fi

exit $EXIT
```

- [ ] **Step 3: Make it executable**

```bash
chmod +x /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh
```

- [ ] **Step 4: Smoke-test the script against a known offender**

Run:

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/README.md
```

Expected: at least one `BANNED:` line (the current README contains `aggressively`, `load-bearing`, `calibrates`). Exit code 1.

- [ ] **Step 5: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add scripts/check-banlist.sh
git commit -m "$(cat <<'EOF'
chore: add banlist verification script

Greps a Markdown file for the banned vocabulary defined in the
voice directive (docs/superpowers/specs/2026-05-10-voice-and-navigation-overhaul-design.md).
Exits 0 if clean, 1 with offending lines if not.
EOF
)"
```

---

## Task 2: Rewrite `how-not-to-produce-ai-slop.md` [CHECKPOINT A — STOP after this task]

**Files:**
- Modify: `how-not-to-produce-ai-slop.md`

This page is the calibrator. It defines what the new voice sounds like for the rest of the rewrite. After this task, no further pages may be rewritten until the user has read and approved this rewrite.

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/how-not-to-produce-ai-slop.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern (see top of plan). Preserve:
- Frontmatter (update `updated:` to today's date, status stays `golden-example`).
- The thesis (the slop-aversion claim).
- The four-test table for engagement (rewrite headings/cells if any use banned vocabulary; keep the four tests).
- The prompts-produce-slop pattern list (one-sentence prompt, vague-confident, dumping-ground).
- The "would the artifact still have value if it turned out the model wrote every word?" test.
- The MIT citation (with the same scoping).

Replace marketing-flavored phrases. Specific known offenders in the current page: *load-bearing example*, *the cost compounds*, *the corrective in all three*. Reword each in plain language. Add analogies only where they help — the page already has strong concrete examples and does not need new metaphors.

This page is **first** in the linear path (no Previous), so the footer takes the no-Previous form.

- [ ] **Step 3: Replace the footer**

The bottom of the file currently ends with:

```
---

*Related: [[what-llms-are]] · [[prompt-as-thinking]] · [[which-tool-when]]*
```

Replace that block with:

```
---

Up: [[start-here]] · Next: [[what-llms-are]] →

*Related: [[what-llms-are]] · [[prompt-as-thinking]] · [[which-tool-when]]*
```

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/how-not-to-produce-ai-slop.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/how-not-to-produce-ai-slop.md
```

Expected: a number between 800 and 1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add how-not-to-produce-ai-slop.md
git commit -m "$(cat <<'EOF'
docs: rewrite slop exemplar in friendly-textbook voice

Calibrator for the voice and navigation overhaul. Adds the
prev/up/next footer pattern and removes banned vocabulary
(load-bearing, the corrective, compounds).
EOF
)"
```

- [ ] **Step 7: STOP — Checkpoint A**

Notify the user:

> Checkpoint A reached. The slop exemplar has been rewritten. Please read `how-not-to-produce-ai-slop.md` and confirm the new voice lands before any further pages are rewritten.

Do not proceed to Task 3 until the user approves.

---

## Task 3: Rewrite `1-what-llms-are-and-arent/what-llms-are.md`

**Files:**
- Modify: `1-what-llms-are-and-arent/what-llms-are.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-are.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve:
- Frontmatter (update `updated:`).
- The "calculator for words" framing (Willison).
- The next-token probability-distribution code block.
- The "Fits the tool / Fights the tool" two-column table (rewrite cells only if they use banned vocabulary).
- The Willison weakness note about determinism.

The current page contains banned vocabulary including: *the same prompt … may not match*, *eloquence is not evidence* (this one is fine — keep it), *the giveaway* (none here, but check). Run the banlist check after rewriting to catch anything missed.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block at the bottom with:

```
---

← Previous: [[how-not-to-produce-ai-slop]] · Up: [[start-here]] · Next: [[what-llms-arent]] →

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*
```

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-are.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-are.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 1-what-llms-are-and-arent/what-llms-are.md
git commit -m "docs: rewrite what-llms-are in friendly-textbook voice"
```

---

## Task 4: Rewrite `1-what-llms-are-and-arent/what-llms-arent.md`

**Files:**
- Modify: `1-what-llms-are-and-arent/what-llms-arent.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-arent.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve:
- Frontmatter (update `updated:`).
- The three-row "Looks like / Actually / Failure mode" table — but rewrite the *Actually* and *Failure mode* cells, which currently contain banned vocabulary (*lossy patterns in weights*, *probability machine over text*, etc.). Keep the three categories (search engine, database, classical reasoner).
- The discount-arithmetic worked example for the reasoner section.
- The misuses-that-follow bullet list (rewrite to drop *category error*).

Specific known offenders: *lossy patterns*, *category error* (used three times in parentheticals), *the reader's giveaway*. Reword each.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[what-llms-are]] · Up: [[start-here]] · Next: [[why-they-hallucinate]] →

*Related: [[what-llms-are]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*
```

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-arent.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-llms-arent.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 1-what-llms-are-and-arent/what-llms-arent.md
git commit -m "docs: rewrite what-llms-arent in friendly-textbook voice"
```

---

## Task 5: Rewrite `1-what-llms-are-and-arent/why-they-hallucinate.md`

**Files:**
- Modify: `1-what-llms-are-and-arent/why-they-hallucinate.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/why-they-hallucinate.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve all factual claims about training, sampling, hallucination as a feature of the mechanism. Preserve any tables or structural visuals. Preserve citations.

Run the banlist check after rewriting to catch anything missed.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[what-llms-arent]] · Up: [[start-here]] · Next: [[what-theyre-good-and-bad-at]] →

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ; the line above shows the pattern.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/why-they-hallucinate.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/why-they-hallucinate.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 1-what-llms-are-and-arent/why-they-hallucinate.md
git commit -m "docs: rewrite why-they-hallucinate in friendly-textbook voice"
```

---

## Task 6: Rewrite `1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md` [CHECKPOINT B — STOP after this task]

**Files:**
- Modify: `1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the good-at / bad-at structure (likely tables or two-column lists). Preserve all concrete examples.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[why-they-hallucinate]] · Up: [[start-here]] · Next: [[prompt-as-thinking]] →

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md
git commit -m "docs: rewrite what-theyre-good-and-bad-at in friendly-textbook voice"
```

- [ ] **Step 7: STOP — Checkpoint B**

Notify the user:

> Checkpoint B reached. Section 1 is fully rewritten. Please read all four pages (`what-llms-are`, `what-llms-arent`, `why-they-hallucinate`, `what-theyre-good-and-bad-at`) and confirm the voice held up across the section before Section 2 begins.

Do not proceed to Task 7 until the user approves.

---

## Task 7: Rewrite `2-how-to-talk-to-them/prompt-as-thinking.md`

**Files:**
- Modify: `2-how-to-talk-to-them/prompt-as-thinking.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/prompt-as-thinking.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the central thesis (the prompt is a draft of the answer). Preserve all concrete prompt examples and structural visuals.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[what-theyre-good-and-bad-at]] · Up: [[start-here]] · Next: [[the-intern-frame]] →

*Related: [[the-intern-frame]] · [[iterating-on-prompts]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/prompt-as-thinking.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/prompt-as-thinking.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 2-how-to-talk-to-them/prompt-as-thinking.md
git commit -m "docs: rewrite prompt-as-thinking in friendly-textbook voice"
```

---

## Task 8: Rewrite `2-how-to-talk-to-them/the-intern-frame.md`

**Files:**
- Modify: `2-how-to-talk-to-them/the-intern-frame.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/the-intern-frame.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the intern analogy (this is itself a familiar analogy and is on-voice for the new register). Preserve Mollick attribution. Preserve any onboarding-pattern tables or lists.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[prompt-as-thinking]] · Up: [[start-here]] · Next: [[iterating-on-prompts]] →

*Related: [[prompt-as-thinking]] · [[reading-the-output]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/the-intern-frame.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/the-intern-frame.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 2-how-to-talk-to-them/the-intern-frame.md
git commit -m "docs: rewrite the-intern-frame in friendly-textbook voice"
```

---

## Task 9: Rewrite `2-how-to-talk-to-them/iterating-on-prompts.md`

**Files:**
- Modify: `2-how-to-talk-to-them/iterating-on-prompts.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/iterating-on-prompts.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the central claim (editing the prompt is editing your thinking). Preserve any before/after prompt examples.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[the-intern-frame]] · Up: [[start-here]] · Next: [[reading-the-output]] →

*Related: [[prompt-as-thinking]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/iterating-on-prompts.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/iterating-on-prompts.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 2-how-to-talk-to-them/iterating-on-prompts.md
git commit -m "docs: rewrite iterating-on-prompts in friendly-textbook voice"
```

---

## Task 10: Rewrite `2-how-to-talk-to-them/reading-the-output.md` [CHECKPOINT C — STOP after this task]

**Files:**
- Modify: `2-how-to-talk-to-them/reading-the-output.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the audit-the-output thesis. Replace any "audit posture" phrasing with plain language. Preserve all weak-spot examples.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[iterating-on-prompts]] · Up: [[start-here]] · Next: [[what-is-context]] →

*Related: [[iterating-on-prompts]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 2-how-to-talk-to-them/reading-the-output.md
git commit -m "docs: rewrite reading-the-output in friendly-textbook voice"
```

- [ ] **Step 7: STOP — Checkpoint C**

Notify the user:

> Checkpoint C reached. Section 2 is fully rewritten. Spot-check the four prompting pages and confirm the voice still holds before Sections 3 and 4 are rewritten.

Do not proceed to Task 11 until the user approves.

---

## Task 11: Rewrite `3-context-engineering/what-is-context.md`

**Files:**
- Modify: `3-context-engineering/what-is-context.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/what-is-context.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. The "context window as RAM" analogy is on-voice and may stay. Preserve Karpathy attribution if present. Preserve any window-size diagrams.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[reading-the-output]] · Up: [[start-here]] · Next: [[chats-vs-projects]] →

*Related: [[chats-vs-projects]] · [[feeding-the-model]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/what-is-context.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/what-is-context.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 3-context-engineering/what-is-context.md
git commit -m "docs: rewrite what-is-context in friendly-textbook voice"
```

---

## Task 12: Rewrite `3-context-engineering/chats-vs-projects.md`

**Files:**
- Modify: `3-context-engineering/chats-vs-projects.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/chats-vs-projects.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the chats-vs-projects state-model distinction. Preserve any concrete tool references (Claude Projects, custom GPTs).

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[what-is-context]] · Up: [[start-here]] · Next: [[feeding-the-model]] →

*Related: [[what-is-context]] · [[memory-and-state]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/chats-vs-projects.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/chats-vs-projects.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 3-context-engineering/chats-vs-projects.md
git commit -m "docs: rewrite chats-vs-projects in friendly-textbook voice"
```

---

## Task 13: Rewrite `3-context-engineering/feeding-the-model.md`

**Files:**
- Modify: `3-context-engineering/feeding-the-model.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/feeding-the-model.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve all concrete examples of what to paste vs. what to leave out. Preserve curation-discipline framing in plain words.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[chats-vs-projects]] · Up: [[start-here]] · Next: [[memory-and-state]] →

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/feeding-the-model.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/feeding-the-model.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 3-context-engineering/feeding-the-model.md
git commit -m "docs: rewrite feeding-the-model in friendly-textbook voice"
```

---

## Task 14: Rewrite `3-context-engineering/memory-and-state.md`

**Files:**
- Modify: `3-context-engineering/memory-and-state.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/memory-and-state.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve claims about how memory features actually work (and don't). Preserve any concrete UI references.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[feeding-the-model]] · Up: [[start-here]] · Next: [[which-tool-when]] →

*Related: [[chats-vs-projects]] · [[what-is-context]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/memory-and-state.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/3-context-engineering/memory-and-state.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 3-context-engineering/memory-and-state.md
git commit -m "docs: rewrite memory-and-state in friendly-textbook voice"
```

---

## Task 15: Rewrite `4-building-workflows/which-tool-when.md`

**Files:**
- Modify: `4-building-workflows/which-tool-when.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/which-tool-when.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the decision matrix structure. Preserve all tool names and capability comparisons.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[memory-and-state]] · Up: [[start-here]] · Next: [[chatbot-vs-agent]] →

*Related: [[chatbot-vs-agent]] · [[personal-workflows]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/which-tool-when.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/which-tool-when.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 4-building-workflows/which-tool-when.md
git commit -m "docs: rewrite which-tool-when in friendly-textbook voice"
```

---

## Task 16: Rewrite `4-building-workflows/chatbot-vs-agent.md`

**Files:**
- Modify: `4-building-workflows/chatbot-vs-agent.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/chatbot-vs-agent.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the chatbot-vs-agent distinction (Mitchell). Preserve the "does the model act between turns?" test.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[which-tool-when]] · Up: [[start-here]] · Next: [[personal-workflows]] →

*Related: [[which-tool-when]] · [[when-workflows-graduate]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/chatbot-vs-agent.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/chatbot-vs-agent.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 4-building-workflows/chatbot-vs-agent.md
git commit -m "docs: rewrite chatbot-vs-agent in friendly-textbook voice"
```

---

## Task 17: Rewrite `4-building-workflows/personal-workflows.md`

**Files:**
- Modify: `4-building-workflows/personal-workflows.md`

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/personal-workflows.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the four worked examples (research, writing, summarizing, planning). Preserve any prompt-context-output cycle visuals.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with:

```
---

← Previous: [[chatbot-vs-agent]] · Up: [[start-here]] · Next: [[when-workflows-graduate]] →

*Related: [[which-tool-when]] · [[chatbot-vs-agent]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/personal-workflows.md
```

Expected: `OK`.

- [ ] **Step 5: Run the word-count check**

```bash
wc -w /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/personal-workflows.md
```

Expected: 800–1500.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 4-building-workflows/personal-workflows.md
git commit -m "docs: rewrite personal-workflows in friendly-textbook voice"
```

---

## Task 18: Rewrite `4-building-workflows/when-workflows-graduate.md`

**Files:**
- Modify: `4-building-workflows/when-workflows-graduate.md`

This is the **last** page in the linear path (no Next). It is also short by spec design (one paragraph + external link). The 800–1500 word target does **not** apply to this page; the spec explicitly limits it. Skip step 5 (word count) for this page.

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/when-workflows-graduate.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the per-task pattern. Preserve the spec constraint: one paragraph plus one external link. Voice change only — do not expand. Drop any banned vocabulary.

- [ ] **Step 3: Replace the footer**

Replace the existing `*Related: …*` block with the no-Next form:

```
---

← Previous: [[personal-workflows]] · Up: [[start-here]]

*Related: [[chatbot-vs-agent]] · [[personal-workflows]] · [[how-not-to-produce-ai-slop]]*
```

(Keep the page's existing Related links if they differ.)

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/when-workflows-graduate.md
```

Expected: `OK`.

- [ ] **Step 5: Skipped (word-count target does not apply to this page)**

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add 4-building-workflows/when-workflows-graduate.md
git commit -m "docs: rewrite when-workflows-graduate in friendly-textbook voice"
```

---

## Task 19: Rewrite `start-here.md`

**Files:**
- Modify: `start-here.md`

This is a meta page. It is itself the linear path, so it does **not** get a prev/up/next footer. Voice rewrite only.

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/start-here.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the voice directive. Preserve:
- The 17-entry numbered reading order. The order itself does not change.
- The budget table (20 minutes / an hour / a weekend).
- The italicized rationale on each entry — but rewrite each rationale in plain language. The current rationales contain the heaviest concentration of banned vocabulary in the hub (load-bearing, calibrate, downstream, off-ramp, audit posture, instantiated). Rewrite each one as a plain-English sentence about why that page sits in that slot.

The final `*Related:* …` line stays as-is (graph navigation, not nav footer).

- [ ] **Step 3: Skipped (no prev/up/next footer on start-here)**

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/start-here.md
```

Expected: `OK`.

- [ ] **Step 5: Word count is open-ended for this page (it is a path index). No verification.**

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add start-here.md
git commit -m "docs: rewrite start-here annotations in friendly-textbook voice"
```

---

## Task 20: Rewrite `curated-links.md`

**Files:**
- Modify: `curated-links.md`

This page is not in the linear path. No prev/up/next footer. Voice rewrite only.

- [ ] **Step 1: Read the current page**

Read `/workspaces/web-dev-playground/ai-literacy-hub/curated-links.md` end-to-end.

- [ ] **Step 2: Rewrite the page**

Apply the voice directive. Preserve every external link and source attribution. Each link's one-sentence "why this is worth your time" gets rewritten in plain language.

- [ ] **Step 3: Skipped (no prev/up/next footer on curated-links)**

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/curated-links.md
```

Expected: `OK`.

- [ ] **Step 5: Word count is open-ended for this page. No verification.**

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add curated-links.md
git commit -m "docs: rewrite curated-links blurbs in friendly-textbook voice"
```

---

## Task 21: Rewrite `README.md` (with new Reading order section)

**Files:**
- Modify: `README.md`

The README is the project entry point. It gets the voice rewrite plus a new "Reading order" section that replaces the current "How to read this" two-bullet block. It does **not** get a prev/up/next footer (it is itself a TOC).

- [ ] **Step 1: Read the current README**

Read `/workspaces/web-dev-playground/ai-literacy-hub/README.md` end-to-end.

- [ ] **Step 2: Rewrite the README**

Apply the voice directive throughout. Specifically:
- Frontmatter `updated:` becomes today's date.
- The opening paragraph (currently uses *downstream of*) gets rewritten in plain words.
- The "Audience", "Out of scope", and "Refresh cadence" sections get a voice pass. Banlist still applies.
- The "How to read this" section is replaced with a new "Reading order" section (next step).

- [ ] **Step 3: Replace the "How to read this" section with a Reading order TOC**

Replace the current `## How to read this` section with:

```markdown
## Reading order

The pages below are in a recommended order. You can also jump
straight to any page that interests you.

If you'd like a guided walkthrough with reading-time budgets
(20 minutes, an hour, a weekend), see [[start-here]].

1. [[how-not-to-produce-ai-slop]] — <one sentence in plain voice>
2. [[what-llms-are]] — <one sentence in plain voice>
3. [[what-llms-arent]] — <one sentence in plain voice>
4. [[why-they-hallucinate]] — <one sentence in plain voice>
5. [[what-theyre-good-and-bad-at]] — <one sentence in plain voice>
6. [[prompt-as-thinking]] — <one sentence in plain voice>
7. [[the-intern-frame]] — <one sentence in plain voice>
8. [[iterating-on-prompts]] — <one sentence in plain voice>
9. [[reading-the-output]] — <one sentence in plain voice>
10. [[what-is-context]] — <one sentence in plain voice>
11. [[chats-vs-projects]] — <one sentence in plain voice>
12. [[feeding-the-model]] — <one sentence in plain voice>
13. [[memory-and-state]] — <one sentence in plain voice>
14. [[which-tool-when]] — <one sentence in plain voice>
15. [[chatbot-vs-agent]] — <one sentence in plain voice>
16. [[personal-workflows]] — <one sentence in plain voice>
17. [[when-workflows-graduate]] — <one sentence in plain voice>
```

For each one-sentence description: derive it from the rewritten page itself (the opening paragraph or thesis). Do **not** copy the rationale from `start-here.md` — that file describes *why the page sits in this order*, while the README describes *what the page is about*. Different jobs.

- [ ] **Step 4: Run the banlist check**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/README.md
```

Expected: `OK`.

- [ ] **Step 5: Word count is open-ended for this page. No verification.**

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add README.md
git commit -m "docs: rewrite README and add Reading order TOC"
```

---

## Task 22: Update `spec-ai-literacy-hub.md` [CHECKPOINT D — STOP after this task]

**Files:**
- Modify: `spec-ai-literacy-hub.md`

Update the existing project spec to match the voice and density rules now in force across the hub.

- [ ] **Step 1: Read the current spec**

Read `/workspaces/web-dev-playground/ai-literacy-hub/spec-ai-literacy-hub.md` end-to-end.

- [ ] **Step 2: Replace the "Voice" subsection (currently lines 43–53)**

Replace the entire subsection beginning with `### Voice` and ending before `### Density` with the content of the "Voice directive" section in `docs/superpowers/specs/2026-05-10-voice-and-navigation-overhaul-design.md`. Specifically: friendly-textbook register, 14-year-old test, banlist (full table), introduce-don't-assume rule, and the "what stays from the current voice" list. Drop the reference to *standards-definition register*; that framing no longer applies.

- [ ] **Step 3: Replace the "Density" subsection (currently lines 56–67)**

Update the word target from "600–900 words" to "800–1500 words" and the "over 1000 words is suspect" line to "over 1800 words is suspect." Keep the visual-rhythm rules.

- [ ] **Step 4: Update the frontmatter**

Change `updated:` to today's date. Status remains `draft`.

- [ ] **Step 5: Run the banlist check on the spec**

```bash
bash /workspaces/web-dev-playground/ai-literacy-hub/scripts/check-banlist.sh \
  /workspaces/web-dev-playground/ai-literacy-hub/spec-ai-literacy-hub.md
```

Expected: `OK`. The spec describes voice rules; it should not itself violate them.

Note: the spec contains the word "register" in the new content (in the heading "Register: friendly textbook"). This is a single legitimate use as the new canonical term. If the banlist script flags it, that is expected — the script flags every use, and this single use is the only allowed instance. Decide between (a) accepting the one flag and noting it in the commit, or (b) rephrasing the heading to "Voice register: friendly textbook" → still flagged → so the cleaner option is (c) rename to "Tone: friendly textbook" and replace the word *register* throughout the spec section. **Do (c).**

After (c), re-run the banlist check. Expected: `OK`.

- [ ] **Step 6: Commit**

```bash
cd /workspaces/web-dev-playground/ai-literacy-hub
git add spec-ai-literacy-hub.md
git commit -m "$(cat <<'EOF'
docs: update spec voice and density sections

Bring the project spec into agreement with the voice and navigation
overhaul. Replaces the standards-definition register guidance with
friendly-textbook rules, adds the banlist, raises the per-page word
target to 800-1500.
EOF
)"
```

- [ ] **Step 7: STOP — Checkpoint D**

Notify the user:

> Checkpoint D reached. The full overhaul is in: 17 path pages, 3 meta pages, the spec, plus the banlist script. Please do a final read of the hub end-to-end (start at `README.md`, follow the Reading order). Confirm the voice holds and the navigation works as expected. Any remaining issues become a separate, smaller follow-up spec.

The plan is complete after the user signs off.

---

## Self-review notes

Reviewed against `docs/superpowers/specs/2026-05-10-voice-and-navigation-overhaul-design.md`:

- **Spec coverage**: every page in the linear path (17) has a task. Each meta page (start-here, curated-links, README) has a task. The spec update has a task. The banlist script (a tooling prerequisite the spec implies) has a task. The four checkpoints (A, B, C, D) are wired to tasks 2, 6, 10, and 22 respectively.
- **Placeholder scan**: the only intentional placeholders are the 17 `<one sentence in plain voice>` slots in Task 21. These are by design — those one-liners can only be written after the rewrites that source them exist.
- **Type consistency**: the footer format is identical across all 17 path pages with deterministic prev/next wikilinks per the canonical reading order.
- **Edge cases handled**: first page (no Previous), last page (no Next, no word-count target), meta pages (no footer), `start-here` open-ended length, README open-ended length, the spec itself flagged for the *register* word and resolved with a rename.

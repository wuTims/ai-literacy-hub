---
title: Review Checklist
created: 2026-04-30
updated: 2026-04-30
status: active
tags: [meta, review]
---

# Universal Review Checklist

Every page must satisfy every applicable item before commit.

## Voice (calibrated against `how-not-to-produce-ai-slop.md`)

- [ ] Standards-definition register, not personal-blog register.
- [ ] Second-person ("you", "the reader") and third-person ("the prompter", "the artifact") dominate. First-person rare and only where personal experience is the substance.
- [ ] Openings are rhetorical questions or direct claims. No "In this section, I'll explain…" or "This page covers…".
- [ ] Uncertainty expressed via scoped claims ("for non-engineers", "in most cases"). No hedges ("I think", "it might be").
- [ ] No filler words: `essentially`, `basically`, `simply`, `just`, `obviously`.
- [ ] No marketing voice: `robust`, `seamless`, `powerful`, `cutting-edge`.
- [ ] No condescension to non-technical readers.
- [ ] No fearmongering.
- [ ] No tool tribalism outside Section 4.

## Density

- [ ] Word count between 600 and 900 (exception: `when-workflows-graduate.md`, which is one paragraph).
- [ ] At least two visual elements per ~600 words from this set: table, monospace structural block, bulleted list with concrete items, Excalidraw diagram, blockquote.
- [ ] No stretch of >4 paragraphs of continuous prose without a visual break.

## Structure

- [ ] Frontmatter contains: `title`, `created`, `updated`, `status`, `tags`. Tags lowercase + hyphenated.
- [ ] Opening is a single paragraph stating the question or claim. No preview, no roadmap.
- [ ] Section headers describe the topic ("How prompts produce slop"), not the rhetorical move ("Let's now examine prompts").
- [ ] Page ends after the last substantive point. No summary conclusion.
- [ ] Footer is one italicized line of `[[Related]]` wikilinks, ≤3 entries.

## Hub integrity

- [ ] MIT study citation budget honored (track in `_meta/citation-tracker.md`, hard cap 2).
- [ ] Wikilinks resolve to existing files or are intentionally forward-pointing (later in plan).
- [ ] Within-section cross-links present and aggressive; cross-section links rare.

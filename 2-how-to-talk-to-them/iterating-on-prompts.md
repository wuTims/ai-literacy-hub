---
title: Iterating on prompts
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [prompting, iteration]
---

# Iterating on prompts

The first prompt is rarely the right prompt.

Editing the prompt is editing the prompter's own thinking. Changing *write a market scan* to *one-page brief for a product lead, two bullets per competitor* is the prompter making a decision the prompt would otherwise have left for the model. Iteration is part of drafting; a first prompt that needs a follow-up is the normal case.

## The first response is a probe

The first output shows what the prompt left for the model to fill in. A vague prompt forces the model to fill in audience, format, and intent from training-data priors (see [[prompt-as-thinking]]).

Read the first output that way and its failures become diagnostic. If the tone is generic, the prompter never named who the output is for. If the artifact is the wrong shape — bullets when the prompter wanted prose, three paragraphs when they wanted one — the deliverable was unnamed. A confident paragraph about a topic the prompter never described exposes that the prompt asked the model to invent the source material instead of handing it over.

The first response is information about the prompt.

## A walkthrough

A realistic case: the prompter needs a one-page market-scan brief on four competitors for a product lead.

```
v1 ─────────────────────────────────────────────────────────────
PROMPT
  Write a market scan of the competitive landscape.

OUTPUT
  Five paragraphs of generic "landscape overview" prose. No
  named competitors. Could have been written about any market.

REALIZATION
  No audience. No deliverable shape. No source material. The
  model is averaging every market-scan it has ever seen.

v2 ─────────────────────────────────────────────────────────────
PROMPT
  One-page bullet brief for a product lead who already knows
  the category. Cover only these four competitors: A, B, C, D.
  Two bullets each: positioning, and the gap they leave open.

OUTPUT
  Right shape. Bullets are bland — pattern-matched takes on
  each company that could be lifted from any analyst write-up.

REALIZATION
  The model has no access to the actual research notes. It is
  paraphrasing the median public description of each company.
  The bullet style needs an example, not a description, to land
  the right shape.

v3 ─────────────────────────────────────────────────────────────
PROMPT
  Same brief, same shape. Source material below — synthesize
  across it; do not introduce facts that are not in the notes.
  Example bullet shape:
    "A — anchors on enterprise SSO; gap: nothing for solo users."

  --- NOTES ---
    [the prompter's actual research, pasted in]
  --- END NOTES ---

OUTPUT
  Brief reads off the prompter's own gathered material in the
  shape the prompter chose. Editable, defensible, signable.
```

What changed across iterations was the number of decisions the prompter made. v2 added the audience and shape; v3 added the source and an example bullet. The added length came from those decisions.

## Iteration moves

The moves that produce iterations like the one above are discrete editorial actions. They are worth naming so they can be reached for deliberately.

- **Name the audience explicitly.**
- **Constrain length, format, or tone.** Replace adjectives like "concise" or "professional" with limits the model can satisfy or fail.
- **Supply one example of the target shape.**
- **Hand over the source material instead of asking the model to invent it.**
- **Ask for variants.** Ask for five subject lines, three openings, or ten alternative phrasings. Then pick.
- **Ask for the inverse.** Asking *what would a bad version of this look like?* shows the prompter what they were implicitly excluding.

## Iterating the prompt vs editing the output

Editing the output keeps the audience and shape the model assumed and changes the wording. Useful when the audience and shape are right and only the prose needs fixing.

Iterating the prompt changes the audience, shape, or source the model is working from. Useful when the issue would recur if the prompt ran a second time.

The diagnostic is: would this problem appear again if the prompt ran a second time? If yes, re-prompt. If no, edit. Sometimes a re-prompt reaches in one round what three rounds of in-place edits cannot. Re-prompting only feels expensive when the first draft gets treated as final. The coworker frame in [[the-intern-frame]] removes that hesitation.

*Related: [[prompt-as-thinking]] · [[the-intern-frame]] · [[reading-the-output]]*

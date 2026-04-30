---
title: Iterating on prompts
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [prompting, iteration]
---

# Iterating on prompts

The first prompt is rarely the right prompt. That fact is structural, not a sign that something has gone wrong.

Editing the prompt is editing the prompter's own thinking. Iteration is part of drafting, the same way a second paragraph is part of writing the first one — not an emergency response to a bad output.

## The first response is a probe

The first output is not a verdict on the model. It is a snapshot of where the prompt left room for the model to invent. As [[prompt-as-thinking]] sets out, a vague prompt forces the model to fill in audience, format, and intent from training-data priors. The first response shows what was filled in.

Read the first output that way and its failures become diagnostic. A generic tone exposes an unnamed audience. A wrong-shaped artifact exposes an unnamed deliverable. A confident paragraph about a topic the prompter never described exposes that the prompt asked the model to invent the source material instead of handing it over.

The point of the first response is not to keep it or discard it. It is to learn what was missing from the prompt.

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

v3 ─────────────────────────────────────────────────────────────
PROMPT
  Same brief, same shape. Source material below — synthesize
  across it; do not introduce facts that are not in the notes.
  Example bullet shape:
    "A — anchors on enterprise SSO; gap: nothing for solo users."

  <notes>
    [the prompter's actual research, pasted in]
  </notes>

OUTPUT
  Brief reads off the prompter's own gathered material in the
  shape the prompter chose. Editable, defensible, signable.
```

What changed across iterations was not "longer prompt." Each round made a different decision — name the audience, scope the deliverable, hand over the source. Length is a side effect of the decisions; the decisions are the work.

## Iteration moves

The moves that produce iterations like the one above are discrete editorial actions. They are worth naming so they can be reached for deliberately, not stumbled into.

- **Name the audience explicitly.** The model has no default reader; it picks one for the prompter if the prompter does not.
- **Constrain length, format, or tone.** Replace adjectives like "concise" or "professional" with limits the model can satisfy or fail.
- **Supply one example of the target shape.** A single example carries decisions a paragraph of adjectives cannot encode.
- **Hand over the source material instead of asking the model to invent it.** Paraphrase-from-training-data is the failure mode this fixes.
- **Ask for variants.** Five subject lines, three openings, ten alternative phrasings — then pick. Abundance beats attachment to the first draft.
- **Ask for the inverse.** "What would a bad version of this look like?" surfaces what the prompter is implicitly ruling out.
- **Reframe the question.** If the output is wrong-shaped, the question is probably wrong-shaped. Editing the wording will not fix it.

Each move is the prompter taking back a decision the model would otherwise have made by averaging.

## Iterating the prompt vs editing the output

Two distinct moves, both valid, doing different work.

Editing the output keeps the model's framing intact and changes the wording. Useful when the framing is right and the prose is not.

Iterating the prompt changes the framing. Useful when the output is wrong-shaped rather than wrong-worded — when the issue would recur in the next draft, not only this one.

The diagnostic is: would this problem appear again if the prompt ran a second time? If yes, re-prompt. If no, edit. Sometimes a re-prompt reaches in one round what three rounds of in-place edits cannot. Knowing when to throw away the draft rather than nurse it along is itself part of the skill, and the [[the-intern-frame]] coworker behavior — re-prompting without apology — is what makes that move cheap to take.

Iteration is the natural state of drafting with a model. The first prompt is a hypothesis about the answer; the prompts that follow are what happens when the hypothesis meets a draft and the prompter decides what to do next.

*Related: [[prompt-as-thinking]] · [[the-intern-frame]] · [[reading-the-output]]*

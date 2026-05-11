---
title: Iterating on prompts
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [prompting, iteration]
---

# Iterating on prompts

The first prompt is rarely the right prompt. That is not a sign of bad prompting. It is the normal shape of the work.

Here is the idea this whole page rests on: **editing the prompt is editing your own thinking.** When you change *write a market scan* into *one-page brief for a product lead, two bullets per competitor*, you are not getting fancier with the model. You are making a decision the prompt would otherwise have left for the model to make on your behalf. Iteration is part of drafting. A first prompt that needs a follow-up is not a failed prompt; it is a first draft.

## The first response is a probe

The first output is information. It shows you what the prompt left for the model to fill in.

A short, vague prompt forces the model to guess at the audience, the format, and the point you are trying to make. It guesses by averaging across everything it has seen that started with a sentence like yours (see [[prompt-as-thinking]] for why). Once you read the first output that way — as a report on what the prompt did and did not say — its failures stop being failures and start being diagnostic.

If the tone is generic, you never named who the output was for. If the artifact is the wrong shape — bullets when you wanted prose, three paragraphs when you wanted one — you never named the deliverable. If you get a confident paragraph about a topic you never described, the prompt asked the model to invent the source material instead of handing it over.

That is the move. Treat the first response as a probe into the prompt, not as a draft of the answer.

## A walkthrough

Take a realistic case. You need a one-page market-scan brief on four competitors for a product lead. Here is what three rounds of iteration actually look like.

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
  Same brief, same shape. Source material below — pull together
  across the notes; do not introduce facts that are not in the
  notes. Example bullet shape:
    "A — anchors on enterprise SSO; gap: nothing for solo users."

  --- NOTES ---
    [your actual research, pasted in]
  --- END NOTES ---

OUTPUT
  Brief reads off your own gathered material in the shape you
  chose. Editable, defensible, signable.
```

What changed across these three rounds was not the prompt's cleverness. It was the number of decisions you made before sending. v2 added the audience and the shape of the deliverable. v3 added the source material and an example bullet. The added length is just those decisions written down.

## Iteration moves

The moves above are discrete editorial actions. Naming them makes them easier to reach for the next time the first output comes back wrong.

- **Name the audience explicitly.** Who is reading this, and what do they already know.
- **Constrain length, format, or tone.** Replace adjectives like *concise* or *professional* with limits the model can actually satisfy or fail. *Under 200 words. Three bullets. Direct, no hedging.*
- **Supply one example of the target shape.** A single example bullet, sentence, or paragraph teaches the shape better than a paragraph of description.
- **Hand over the source material instead of asking the model to invent it.** If your brief is supposed to be about your research, paste your research into the prompt. The model cannot guess what you have read.
- **Ask for variants.** Five subject lines, three openings, ten alternative phrasings. Then pick. One answer accepted as-is is the median outcome.
- **Ask for the inverse.** *What would a bad version of this look like?* shows you what you were implicitly excluding without having to name it yourself.

None of these is a clever trick. They are all the same kind of move: making one more decision in the prompt instead of letting the model make it for you.

## Iterating the prompt vs editing the output

Once the response comes back, you have two ways to fix what is wrong with it. They are not the same.

Editing the output keeps the audience and shape the model assumed and changes the wording. Useful when the audience and the shape are already right and only the prose needs a pass.

Iterating the prompt changes the audience, the shape, or the source material the model is working from. Useful when the issue would come back if the same prompt ran a second time.

The diagnostic is one question: **would this problem appear again if the prompt ran a second time?** If yes, re-prompt. If no, edit. A re-prompt sometimes reaches in one round what three rounds of in-place edits cannot, because it fixes the cause instead of patching the symptom.

Re-prompting only feels expensive when you treat the first draft as final. It is not final. It was a probe. The coworker frame in [[the-intern-frame]] is the same point from the other direction: you are not bothering anyone by asking again. The model has no feelings about being corrected, and the back-and-forth is the work, not a delay before the work.

---

← Previous: [[the-intern-frame]] · Up: [[start-here]] · Next: [[reading-the-output]] →

*Related: [[prompt-as-thinking]] · [[the-intern-frame]] · [[reading-the-output]]*

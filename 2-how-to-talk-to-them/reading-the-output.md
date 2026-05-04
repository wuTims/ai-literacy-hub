---
title: Reading the output
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [reviewing, output]
---

# Reading the output

Read AI output the way a careful editor reads a colleague's draft: looking for places that flow too smoothly to have been thought through. Smooth passages are usually where the model filled in a decision the prompter expected it to make.

## Reading is different from verification

Verification is the mechanical step: open the link, run the code, trace the quote back to the source it claims (the mechanism is set out in [[why-they-hallucinate]]). The work is the same every time — confirm or deny, one claim at a time.

Reading comes first. Reading is what decides which claims are worth verifying. Without reading, every line costs the same to check and most lines get checked by nobody. A reader who trusts fluent prose ships whatever errors the model produced fluently.

## Output smells

The patterns below are reasons to slow down on a passage. Each is a signal that the prose is doing one thing and the reader expected another.

| What to notice                                                                          | What it usually means                                                          | What to check                                                                          |
|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| **Generic structure.** The output reads like the median version of its genre.           | The model is averaging across every example of this artifact in its training.  | Whether anything in the prose is specific to the actual situation, or only to the genre. |
| **Confident specificity without source.** Exact figures, dates, or quotes the prompt did not supply. | The model is sampling plausible-shaped values; the shape is right and the value is unsupported. | The number, date, or quote against a primary source before the passage leaves the desk. |
| **Smoothed contradictions.** The output reconciles tensions the prompter knows are real. | The model is averaging across positions rather than naming the disagreement.    | What the prose flattened, and whether the real claim survives once the tension is restored. |
| **Hedge-shaped certainty.** Phrases like *it is important to note*, *various studies suggest*, *in many cases*. | The hedge is filler standing in for a claim the model could not make precisely. | Whether anything testable lives behind the hedge, or whether the sentence collapses if the hedge is removed. |
| **Naming drift.** Proper nouns that almost match a real thing — a paper, a function, a feature, a person. | The model produced the *shape* of a name from neighboring training material.    | Spelling, attribution, and existence. A name that resists a single search is the default to disbelieve. |
| **Echoed prompt vocabulary.** Distinctive nouns and phrases from the prompt show up unchanged in the output. | The model is restyling the prompt rather than answering it; "your strategic positioning" comes back because the prompt said "strategic positioning". | Whether the output uses any vocabulary the prompt did not seed, or whether it is the prompt rephrased. |

When one of these fires, the next move is to verify the specific claim. The signal does not mean the whole passage is wrong.

## The carry-away test

The single question to ask of any passage before passing the artifact on:

> Could the reader defend this sentence without crediting the model?

If the answer is no, the reader has not engaged with the passage; the next reader inherits the work of figuring out whether to trust it. The four engagement tests in [[how-not-to-produce-ai-slop]] are the production-side version of this question; the carry-away test is the reading-side equivalent.

## Reading and re-prompting

A careful read produces two lists, and they ask for different responses.

The verification list is the set of factual claims to confirm: names, numbers, citations, code that has to run. The work is mechanical and the tools are the ones the prompter would have used before AI existed — a search, a primary source, an executor.

The re-prompt list is the set of passages the model glossed because the prompt left room: generic structure, smoothed contradictions, echoed vocabulary. These get fixed by changing the prompt and running it again. Editing the wording leaves the same gloss in place for the next prompt. Re-prompting feels expensive without the coworker frame from [[the-intern-frame]].

Both lists need to clear before the artifact gets passed on.

*Related: [[iterating-on-prompts]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*

---
title: Reading the output
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [reviewing, output]
---

# Reading the output

Read AI output the way an editor reads a colleague's draft — not for whether it is wrong, but for the kind of right that should be checked.

Fluency is not signal. The reader's job is to surface the places where the prose moves smoothly past a decision the model could not have made.

## Reading is not verification

Two moves. They look adjacent and they do different work.

Verification is the mechanical step: open the link, run the code, trace the quote back to the source it claims. The mechanism is set out in [[why-they-hallucinate]] and the discipline is the same every time — confirm or deny, one claim at a time.

Reading sits upstream. It is the diagnostic posture that decides which claims are worth the verification step. Without it, every line costs the same to check, and most lines get checked by nobody. A reader who treats fluent prose as evidence of correctness has skipped the diagnostic move and inherited whichever errors the model produced confidently.

## Output smells

The patterns below are signals in the prose itself, not proof of error. Each is a reason to slow down on a passage and ask the verification question.

The reading-side diagnostic mirrors the prompting-side one set out in [[iterating-on-prompts]]: generic tone exposes an unnamed audience, a wrong-shaped artifact exposes an unnamed deliverable.

| What to notice                                                                          | What it usually means                                                          | What to check                                                                          |
|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| **Generic structure.** The output reads like the median version of its genre.           | The model is averaging across every example of this artifact in its training.  | Whether anything in the prose is specific to the actual situation, or only to the genre. |
| **Confident specificity without source.** Exact figures, dates, or quotes the prompt did not supply. | The model is sampling plausible-shaped values; the shape is right and the value is unsupported. | The number, date, or quote against a primary source before the passage leaves the desk. |
| **Smoothed contradictions.** The output reconciles tensions the prompter knows are real. | The model is averaging across positions rather than naming the disagreement.    | What the prose flattened, and whether the real claim survives once the tension is restored. |
| **Hedge-shaped certainty.** Phrases like *it is important to note*, *various studies suggest*, *in many cases*. | The hedge is filler standing in for a claim the model could not make precisely. | Whether anything testable lives behind the hedge, or whether the sentence collapses if the hedge is removed. |
| **Naming drift.** Proper nouns that almost match a real thing — a paper, a function, a feature, a person. | The model produced the *shape* of a name from neighboring training material.    | Spelling, attribution, and existence. A name that resists a single search is the default to disbelieve. |
| **Echoed prompt vocabulary.** Distinctive nouns and phrases from the prompt show up unchanged in the output. | The model is restyling the prompt rather than answering it; "your strategic positioning" comes back because the prompt said "strategic positioning". | Whether the output uses any vocabulary the prompt did not seed, or whether it is the prompt rephrased. |

Smells are not verdicts. They are reasons to look closer.

## The carry-away test

One question subsumes the rest. Run it on any passage before passing the artifact on:

> Could the reader defend this sentence without crediting the model?

If the answer is no, the passage has not been read. It has been received. The reader is now one step downstream of the sender of slop, with the verification work outsourced to whoever opens the document next.

## Reading and re-prompting

A careful reading produces two lists, and they ask for different responses.

The verification list is the set of factual claims to confirm — names, numbers, citations, code that has to run. The work is mechanical and the tools are the ones the prompter would have used before AI existed: a search, a primary source, an executor.

The re-prompt list is the set of passages the model glossed because the prompt left room — generic structure, smoothed contradictions, echoed vocabulary. These do not get fixed by editing the wording. They get fixed by changing the prompt and running it again, the move that [[the-intern-frame]] removes the awkwardness from — correcting the coworker takes nothing.

A reader who only verifies ships drafts whose framing was never their own. A reader who only re-prompts ships drafts that read well and assert things that are not true. The two lists are not optional alternatives.

## Reading like an editor

A senior editor reading a junior writer's draft trusts the prose least where it flows most easily. The same instinct turns reading AI output into the work it should have been: a slow pass over the smooth places, a search for the decisions the model made by averaging, a list of what to check and what to ask again.

*Related: [[iterating-on-prompts]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*

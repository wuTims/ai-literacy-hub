---
title: Reading the output
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [reviewing, output]
---

# Reading the output

Read what the model writes the way a careful editor reads a colleague's draft. The places to slow down are not the rough patches — they are the passages that flow too smoothly to have been thought through. A passage that reads like it knows what it is talking about is often a passage where the model filled in a decision you expected it to make.

The job of reading is to find those places before anyone else does.

## Reading is different from verification

Verification is the mechanical step: open the link, run the code, trace the quote back to the source it claims (the page on [[why-they-hallucinate]] explains why this step exists at all). The work is the same every time. Take one claim. Confirm it or deny it. Move to the next.

Reading happens before that, and it is a different activity. Reading is what decides which claims are worth verifying in the first place. Without it, every line in the document costs the same to check, which means most lines get checked by nobody. A reader who trusts fluent prose ends up shipping whatever errors the model produced fluently — and the model produces errors fluently, because fluent is what it does.

So reading is the front half of the job. Verification is the back half. This page is about the front half.

## Output smells

The patterns below are not bugs. They are reasons to slow down on a passage. Each one is a sign that the prose is doing one thing and you, as the reader, expected another.

| What to notice                                                                          | What it usually means                                                          | What to check                                                                          |
|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| **Generic structure.** The output reads like the median version of its genre.           | The model is averaging across every example of this kind of artifact in its training. | Whether anything in the prose is specific to your actual situation, or only to the genre. |
| **Confident specificity without source.** Exact figures, dates, or quotes the prompt did not supply. | The model is sampling values that are the right shape; the shape is right and the value is unsupported. | The number, date, or quote against a primary source before the passage leaves your desk. |
| **Smoothed contradictions.** The output reconciles tensions you know are real.          | The model is averaging across positions instead of naming the disagreement.    | What the prose flattened, and whether the real claim still survives once the tension is restored. |
| **Hedge-shaped certainty.** Phrases like *it is important to note*, *various studies suggest*, *in many cases*. | The hedge is filler standing in for a claim the model could not make precisely. | Whether anything testable lives behind the hedge, or whether the sentence falls apart if you delete the hedge. |
| **Naming drift.** Proper nouns that almost match a real thing — a paper, a function, a feature, a person. | The model produced the *shape* of a name from neighboring training material.   | Spelling, attribution, and existence. A name that resists a single search is the default to disbelieve. |
| **Echoed prompt vocabulary.** Distinctive nouns and phrases from your prompt come back unchanged in the output. | The model is restyling the prompt rather than answering it; "your strategic positioning" comes back because the prompt said "strategic positioning". | Whether the output uses any vocabulary the prompt did not seed, or whether it is the prompt rephrased back at you. |

When one of these fires, the next move is to verify the specific claim or rework the specific passage. The signal does not mean the whole document is wrong. It means *that line* is asking for more attention than the rest.

## The carry-away test

There is one question to ask of any passage before you pass the artifact on:

> Could the reader defend this sentence without crediting the model?

If the answer is no, you have not actually engaged with the passage, and the next reader inherits the work of figuring out whether to trust it. The four engagement tests in [[how-not-to-produce-ai-slop]] are the production-side version of this question. The carry-away test is the reading-side equivalent. Either you can stand behind the sentence in your own voice, or you have shipped a sentence the model wrote and you skimmed.

## Reading and re-prompting

A careful read produces two lists, and they ask for different responses.

The **verification list** is the set of factual claims to confirm: names, numbers, citations, code that has to actually run. The work here is mechanical. The tools are the ones you would have used before AI existed — a search, a primary source, an executor that runs the code and tells you whether it works. Each item gets checked once, and the answer is yes or no.

The **re-prompt list** is different. These are the passages the model glossed because the prompt left room for it to gloss them: generic structure, smoothed contradictions, echoed vocabulary, hedge-shaped sentences that say nothing testable. Editing the wording in place leaves the same gloss waiting for the next prompt. The fix is to change the prompt — name the audience, restore the contradiction, hand over the source material — and run it again. Re-prompting feels expensive only when you have not yet absorbed the coworker frame in [[the-intern-frame]]. The model does not mind being asked again, and the back-and-forth is the work, not a delay before the work.

Both lists need to clear before the artifact gets passed on. A verification list with one unchecked citation is a document that contains one made-up citation. A re-prompt list with one unaddressed gloss is a document with one passage that says nothing — which the next reader will eventually notice, and which will read worse coming from you than it would have coming from a fresh model.

The shorthand for the whole page is small. Read what came back the way you would read a smart colleague's first draft: with attention to the smooth parts, not just the rough ones.

---

← Previous: [[iterating-on-prompts]] · Up: [[start-here]] · Next: [[what-is-context]] →

*Related: [[iterating-on-prompts]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*

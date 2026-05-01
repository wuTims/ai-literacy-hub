---
title: The prompt is a draft of the answer
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [prompting, mental-models]
---

# The prompt is a draft of the answer

A prompt is not a request the model fulfills. It is the entire conditioning signal the model has, and the output is whatever the model can extrapolate from it. One-sentence prompts produce one-sentence-quality work because that is all the prompter has put on the table for the model to extend.

Read the prompt back as if it were the first paragraph of the answer. If it does not yet read like the work of someone who has thought carefully, the output will not read that way either.

## Why prompt clarity does the work

Every behavior a prompter sees is downstream of next-token prediction over a learned probability distribution. The prompt picks the region of that distribution. When the prompt is vague, the region is wide, and the model lands on the median of the wide region — the version of the answer that fits the largest number of possible callers. That is what generic output is: the average of every project the model could have been asked about.

Specificity narrows the region. The work of narrowing it is decision work — audience, constraints, format, examples — and it is work the prompter has to do, because the model has no way to do it on the prompter's behalf. Examples outperform adjectives. Clarity outperforms verbosity. A long prompt that hedges and gestures performs worse than a short prompt that decides.

| Prompt shape                          | What the model has to fill in                       | What the output tends to read like                 |
|---------------------------------------|-----------------------------------------------------|----------------------------------------------------|
| One-sentence ask                      | Audience, format, length, tone, constraints, intent | Median version of that genre                       |
| Vague ask in a confident register     | All of the above, plus what *your* thesis is        | Sounds informed; says what such things sound like  |
| Scoped: audience + format + constraint| Tone, structure, examples                           | On topic, conventional shape, your decisions intact|
| Scoped + example of the target shape  | Almost nothing                                      | The shape you asked for, populated with your input |

The pattern down the table is not "more words." It is "more decisions made by the prompter before the model is asked to make them."

## A realistic rewrite

The temptation is to demonstrate the principle with an extreme contrast — a one-line ask versus an 800-word system prompt. That is not the contrast that matters. The contrast that matters is between a prompt the prompter wrote in five seconds and a prompt the prompter wrote in two minutes, after deciding what the answer actually needs to contain.

```
BEFORE
─────────────────────────────────────────────────────────────
Write a follow-up email from today's meeting.


AFTER
─────────────────────────────────────────────────────────────
Draft a follow-up email to the three engineers who attended
this morning's planning meeting. Audience knows the context;
do not re-introduce the project.

Cover, in this order:
  1. The two decisions we made (migrate to Postgres in Q3;
     defer the search rework to Q4).
  2. The one open question (who owns the migration runbook).
  3. A single ask: reply by Thursday with a yes/no on owning it.

Tone: direct, peers, no filler. Under 120 words.
End with a line break before my name; I will sign off.
```

What changed between the two prompts is not length. It is that every line in the second prompt is a place where the prompter, not the model, made the decision. The audience is fixed. The content is enumerated. The tone is named. The boundary between what the model writes and what the prompter signs is drawn explicitly. The model now has a narrow region to sample from, and the output will reflect the prompter's call rather than the median email-after-a-meeting.

## The diagnostic

There is one test that subsumes the rest:

> Could the prompt have been written by someone who had already thought about the answer?

If the answer is no, the prompt is asking the model to do thinking the prompter has not done. The model will produce something — that is what it does — but the something will be the average shape of that thinking across its training data. Generic, plausible, not yours.

The MIT Media Lab's *Your Brain on ChatGPT* study (2025) is suggestive here: participants who delegated the framing of an essay to an LLM, not just the typing of it, showed reduced neural engagement and weaker recall of what they had produced. The finding fits the mechanism. The prompt is where the framing happens. Skip it, and there is no framing left to engage with.

## Iteration is part of the draft

A clear opening prompt is necessary and not sufficient. Reading the output, finding the line that does not fit, and amending the prompt or the artifact — that is the rest of the draft. Treating the first response as final is the failure mode that [[iterating-on-prompts]] is for.

A prompt is a question with the shape of the answer already inside it. The clearer the shape, the less the model has to invent on the prompter's behalf, and the more the output belongs to the prompter rather than the average of everyone who has ever asked something similar.

*Related: [[the-intern-frame]] · [[reading-the-output]] · [[how-not-to-produce-ai-slop]]*

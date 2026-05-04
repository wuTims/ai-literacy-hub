---
title: The prompt is a draft of the answer
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [prompting, mental-models]
---

# The prompt is a draft of the answer

The prompt is everything the model has to go on. The output is the model's best extension of it. A one-sentence prompt gives the model very little to extend, so it averages in the rest from training data.

The prompt is part of the draft.

## Why prompt clarity does the work

The model produces text by extending the prompt. A vague prompt leaves many possible continuations, and the model picks the most average one — the version of the answer that fits the largest number of possible callers. That is what generic output is: the average of every project the model could have been asked about.

Specificity reduces what the model has to guess at. Narrowing the prompt requires decisions about audience, constraints, format, and examples. The prompter has to make those decisions; the model has no way to do it on the prompter's behalf. Examples outperform adjectives.

| Prompt shape                          | What the model has to fill in                       | What the output tends to read like                 |
|---------------------------------------|-----------------------------------------------------|----------------------------------------------------|
| One-sentence ask                      | Audience, format, length, tone, constraints, intent | Median version of that genre                       |
| Vague ask in a confident register     | All of the above, plus what *your* thesis is        | Sounds informed; says what such things sound like  |
| Scoped: audience + format + constraint| Tone, structure, examples                           | On topic, conventional shape, your decisions intact|
| Scoped + example of the target shape  | Almost nothing                                      | The shape you asked for, populated with your input |

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

What changed between the two prompts is the number of decisions the prompter made before sending. Every line in the second prompt is one of those decisions: the audience, the content, the tone, and the boundary between what the model writes and what the prompter signs. The model now has a narrow region to sample from, and the output will reflect the prompter's call rather than the median email-after-a-meeting.

## The diagnostic

> Could the prompt have been written by someone who had already thought about the answer?

If the answer is no, the prompt is asking the model to do thinking the prompter has not done. The model will produce an answer, but it will sound like other people's answers to this kind of question, not yours.

The MIT Media Lab's *Your Brain on ChatGPT* preprint (2025) is suggestive here: participants who delegated the framing of an essay to an LLM, not just the typing of it, showed reduced neural engagement and weaker recall of what they had produced. One preprint is not proof, but the direction fits the mechanism.

## Iteration is part of the draft

A clear opening prompt is necessary and not sufficient. Reading the output, finding the line that does not fit, and amending the prompt or the artifact — that is the rest of the draft. Treating the first response as final is the failure mode that [[iterating-on-prompts]] is for.

*Related: [[the-intern-frame]] · [[reading-the-output]] · [[how-not-to-produce-ai-slop]]*

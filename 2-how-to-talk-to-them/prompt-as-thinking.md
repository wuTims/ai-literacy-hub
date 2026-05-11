---
title: The prompt is a draft of the answer
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [prompting, mental-models]
---

# The prompt is a draft of the answer

A **prompt** is whatever you type into the model — the question, the instructions, the pasted context, all of it. The model takes that text and writes the most likely continuation it can. So the prompt is not really a request that goes off to a thinker who will then come back with an answer. The prompt is the opening of the answer, and the model finishes it.

That single shift — from *I am asking a question* to *I am writing the first half of the reply* — changes how you write prompts and what you expect back.

## Why a vague prompt produces a vague answer

When the prompt is short, the model has very little to go on. It has to guess at the audience, the format, the length, the tone, and the point you are trying to make. Faced with all that uncertainty, it picks the most average continuation it can — the version of the answer that would fit the largest number of people who might have typed something like that.

That is what generic AI writing actually is. It is not the model failing to try. It is the model averaging across every project, every email, every report it has ever seen that started with a sentence like yours, and handing you back the middle of that pile.

Specificity narrows the pile. Each detail you add — who the reader is, how long the answer should be, what shape it should take, what example to follow — cuts down the number of continuations the model still has to choose between. The decisions have to come from somewhere. The model cannot make them on your behalf, because it does not know what you have in mind. If the prompt does not contain those decisions, the output will not contain them either; it will contain the average ones instead.

A useful rule: **examples beat adjectives.** Telling the model to write something "professional and clear" gives it a vague target. Showing it one paragraph of the kind of writing you want gives it a precise one.

## Four shapes of prompt

Here is the same kind of request at four levels of specificity, and the kind of output each one tends to produce.

| Prompt shape                          | What the model has to fill in                       | What the output tends to read like                 |
|---------------------------------------|-----------------------------------------------------|----------------------------------------------------|
| One-sentence ask                      | Audience, format, length, tone, constraints, intent | Median version of that genre                       |
| Vague ask in a confident tone         | All of the above, plus what *your* point is         | Sounds informed; says what such things sound like  |
| Scoped: audience + format + constraint| Tone, structure, examples                           | On topic, conventional shape, your decisions intact|
| Scoped + example of the target shape  | Almost nothing                                      | The shape you asked for, populated with your input |

The pattern down the rows is the same: the more thinking you put into the prompt, the less averaging the model has to do, and the more the output looks like something *you* would have written rather than something anyone might have written.

## A realistic rewrite

The temptation is to demonstrate this with an extreme contrast — a one-line ask versus an 800-word system prompt. (A **system prompt** is a longer set of standing instructions some apps let you save once and reuse across every chat. Useful, but not the point here.) The contrast that matters in everyday work is smaller: the prompt you wrote in five seconds versus the prompt you wrote in two minutes, after stopping to decide what the answer actually needs to contain.

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

What changed between those two prompts is not the length. It is the number of decisions the writer made before hitting send. Every line in the second version is one of those decisions: who the audience is, what content goes in, in what order, in what tone, where the model stops and the human signs. The model now has a narrow target to aim at, and the email will reflect your call rather than the median follow-up that any meeting in any company might produce.

Notice that none of those decisions required any clever prompting technique. They are the same decisions you would have made if you were writing the email yourself. You just made them in the prompt instead of in the draft.

## The diagnostic question

There is one question you can ask yourself before sending almost any prompt:

> Could the prompt have been written by someone who had already thought about the answer?

If the answer is no, the prompt is asking the model to do thinking you have not done. The model will produce something — that is what it does — but it will sound like other people's answers to this kind of question, not yours. The places where you would have made a specific call are filled in with the average call instead, and you usually will not notice until someone reads it back to you and asks why it does not sound like you.

The MIT Media Lab's *Your Brain on ChatGPT* preprint (Kosmyna et al., 2025; n=54, EEG) found something related: people who handed the *framing* of an essay to an LLM, not just the typing of it, showed reduced brain activity during the task and remembered less of what they had produced afterward. One small preprint is not a settled finding, and you should be careful about reading too much into it. But the direction matches the mechanism described here. Skipping the thinking and asking the model to do it for you does not produce the same result as having done it.

## The first prompt is not the whole draft

A clear opening prompt is necessary, but it is not the whole job. The rest of the job is reading what came back, finding the line that does not fit, and either fixing the prompt or fixing the artifact directly. That back-and-forth is how a draft turns into something usable, and treating the first response as the final answer is the most common way good prompting still produces unusable work. That loop has its own page: see [[iterating-on-prompts]].

The shorthand for this whole page is simple. Write the prompt as if you were writing the first half of the answer, because in a real sense, you are.

---

← Previous: [[what-theyre-good-and-bad-at]] · Up: [[start-here]] · Next: [[the-intern-frame]] →

*Related: [[the-intern-frame]] · [[reading-the-output]] · [[how-not-to-produce-ai-slop]]*

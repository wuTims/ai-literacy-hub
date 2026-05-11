---
title: Personal workflows
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [workflows, examples]
---

# Personal workflows

Most of the work people do with a chatbot falls into four buckets: research, writing, summarizing, and planning. Different on the surface — one ends in a memo, another in a step-by-step plan — but the shape underneath is the same every time. You write a *prompt* (what you want), you supply some *context* (what the model needs to know to do it well), and you handle the *output* (what comes back). Skip any of the three and the result drifts toward the average of everything the model has seen on the internet. Spend a minute on each and the result starts to look like work you would actually send to a real person.

This page walks through the four buckets with one worked example each. The point is not to memorize the templates — it is to see the prompt-context-output cycle repeat enough times that you start running it on your own without thinking about it.

| Task type    | What this example focuses on                                                                            |
|--------------|---------------------------------------------------------------------------------------------------------|
| Research     | Scoping the prompt to the audience and gating every claim through citations.                            |
| Writing      | Naming the tone, the recipient, and the stakes — so the draft does not regress to the median.           |
| Summarizing  | Naming the reader and the decision so the output leads with what matters, not the document's headings.  |
| Planning     | Surfacing hidden assumptions, then revising from those rather than from the goal.                       |

## Research

A language model is not a search engine. It does not look things up; it predicts what an answer probably sounds like. That sounds like a problem, and it is — unless you treat the model as a research assistant doing triage. You bring the source material. The model proposes leads. You check each lead.

A typical flow: hand the model ten papers on a topic and ask which three bear on a specific question, with the relevant excerpts pulled out. Telling the model who the audience is changes the answer in useful ways. Ask for an explanation aimed at a designer with no background in the field and you get plainer framing, fewer canonical-sounding citations the reader cannot actually open, less jargon. Require a citation for every claim, then *open every citation*. Treat any uncited sentence as a hypothesis you still need to verify.

```
PROMPT
  Act as a research assistant for a non-academic reader. Question:
  [the actual question]. Pivot off the two sources below; do not
  introduce claims you cannot cite to a real, named source.

CONTEXT PROVIDED
  - The question, scoped to one decision.
  - Audience: a designer, no domain background.
  - Two seed sources, pasted in full.

OUTPUT HANDLING
  Ask for citations on every claim. Open each one. Drop the claims
  whose citations do not resolve. See [[reading-the-output]] for
  the smell-test list.
```

## Writing

When you ask the model to write something for you, the failure mode is not bad grammar — it is *blandness*. The first draft tends to read like an email that could be about anyone's project: technically fine, recognizably hollow. That happens because a short prompt gives the model very little to anchor on, so it produces the average of every email it has ever seen.

The fix is to tell it three things the average email does not know: who the recipient is, what tone the writer normally uses with them, and what is actually at stake. Then read the draft *aloud*. Reading aloud is the single most reliable way to hear whether a piece of writing sounds like you or like a stranger doing an impression of you. If it does not sound like you, the framing in the prompt was wrong — change the prompt, not the prose. ([[iterating-on-prompts]] has more on why editing the prompt usually beats editing the output.)

```
PROMPT
  Draft the email I owe my manager about the project slipping.
  One short paragraph stating the slip and the new date, one
  paragraph on cause, one on what changes next. No apology line.

CONTEXT PROVIDED
  - What slipped, by how much, and why.
  - Manager's prior reactions: skeptical of optimism, calm with
    cause-and-effect framing.
  - Tone: matter-of-fact, no hedging.

OUTPUT HANDLING
  Read aloud. If it does not sound like the writer, re-prompt.
  Edit phrasing only when the framing is right but the wording is not.
```

## Summarizing

Summarizing is the task language models are best at. The source material is sitting right there in the prompt, the job is to reshape what is already on the page, and there is nothing for the model to invent. The thing that goes wrong is subtler: the model summarizes the document instead of summarizing it *for someone*.

A reader who has thirty pages of report and one decision to make does not need the document's table of contents recapped back to them. They need the facts that bear on the decision, first. Tell the model who the reader is and what they are deciding, and the summary will lead with what matters. Skip that step and the summary mirrors the document's headings — which the reader could have gotten by skimming the original.

```
PROMPT
  Summarize the report below for a reader who has five minutes
  and one decision to make: [the decision]. Lead with the facts
  that bear on that decision. Omit anything that does not.

CONTEXT PROVIDED
  - The full report, pasted in.
  - The decision, stated as one sentence.
  - The reader: role, what they already know, what they don't.

OUTPUT HANDLING
  Check whether the summary leads with the decision-relevant facts.
  If it leads with the document's headings instead, the prompt
  under-specified the reader.
```

## Planning

Planning prompts produce the most generic output of the four by default. Every project plan in the training data looks more or less like every other project plan, so a prompt like "make me a five-step plan for shipping the new onboarding flow" returns the most average version of that plan the model can imagine — owners, milestones, the word *stakeholders* showing up somewhere.

The interesting failure is not the genericness; it is the *unstated assumptions*. When you do not tell the model what is true about your situation, it makes things up to fill the gap. The vendor's SDK arrives on time. Your designer is not on leave next month. Legal review takes a week. The plan reads as reasonable right up until the moment one of those silent guesses turns out to be wrong, and then the whole thing wobbles.

The trick: ask the model to *list its assumptions at the end of the plan*. Read that list before you read the plan. Cross out the assumptions that do not match reality, then re-run the prompt. The plan you actually want follows from the right assumptions, not from the goal.

```
PROMPT
  Break the goal below into a five-step plan. Each step has an
  owner, an exit condition, and a duration. End with the
  assumptions you made to produce this plan.

CONTEXT PROVIDED
  - Goal: ship the redesigned onboarding flow by Q3.
  - Current state: spec approved; two engineers, one designer
    on the team; vendor SDK lands May 15.
  - Constraints: no marketing headcount; legal review needed
    before launch; analytics rebuild blocks the second milestone.
  - Deadline: September 30.

OUTPUT HANDLING
  Read the assumptions list before the plan. Strike the assumptions
  that are wrong; rerun. The plan follows from the assumptions,
  not from the goal.
```

## When a template starts running every Monday

Notice what the four examples have in common. Each prompt is reusable: swap the question, the email subject, the report, the goal — the scaffolding holds. Once you find yourself typing roughly the same prompt every Monday — the manager email, the weekly plan, the standing summary — you no longer have a chat task. You have a workflow worth saving as a custom GPT, a Claude Project, a scheduled run, or a small script. See [[when-workflows-graduate]] for the handoff to engineering reading once you reach that point.

---

← Previous: [[chatbot-vs-agent]] · Up: [[start-here]] · Next: [[when-workflows-graduate]] →

*Related: [[which-tool-when]] · [[iterating-on-prompts]] · [[when-workflows-graduate]]*

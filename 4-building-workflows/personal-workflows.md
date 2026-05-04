---
title: Personal workflows
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [workflows, examples]
---

# Personal workflows

Research, writing, summarizing, and planning all use the same three stages: prompt, context provided, output handling.

| Task type    | What this example focuses on                                                                            |
|--------------|---------------------------------------------------------------------------------------------------------|
| Research     | Scoping the prompt to the audience and gating every claim through citations.                            |
| Writing      | Naming the register, the recipient, and the stakes — so the draft does not regress to the median.       |
| Summarizing  | Naming the reader and the decision so the output leads with decision-relevant facts rather than the document's headings. |
| Planning     | Surfacing hidden assumptions, then revising from those rather than from the goal.                       |

## Research

Language models are not search engines; treat research with one as triage. The prompter scopes the source material, the model proposes leads to chase down, and the prompter checks each one. A typical flow: feed the model ten papers and ask for the three that bear on a specific question, with the relevant excerpts. Naming a non-expert audience changes the output: less jargon, plainer framing, fewer canonical-sounding citations the reader can't actually open. Require a citation for every claim. Treat any uncited claim as a hypothesis to verify.

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

The model can draft what the prompter would have written. By default it produces a median version: an email that could be about anyone's project. Read the draft aloud. If it does not sound like the prompter, the framing was wrong — iterate the prompt rather than the prose (see [[iterating-on-prompts]]).

```
PROMPT
  Draft the email I owe my manager about the project slipping.
  One short paragraph stating the slip and the new date, one
  paragraph on cause, one on what changes next. No apology line.

CONTEXT PROVIDED
  - What slipped, by how much, and why.
  - Manager's prior reactions: skeptical of optimism, calm with
    cause-and-effect framing.
  - Register: matter-of-fact, no hedging.

OUTPUT HANDLING
  Read aloud. If it does not sound like the prompter, re-prompt.
  Edit phrasing only when the framing is right but the wording is not.
```

## Summarizing

Summarizing is the cleanest fit for a language model: the source is in the prompt, the work is to reshape it, and there is nothing for the model to invent. The variable is what the summary is *for*. A reader who has one decision to make and a 30-page report does not need the document's structure recapped; they need the decision-relevant facts first. Name the reader, name the decision, and the model can prioritize. Without naming them, the output mirrors the document's headings — which the reader could have skimmed.

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

Planning prompts produce the most generic outputs by default, because every project plan in the training data resembles every other one. State the goal, the current state, the binding constraints, and the deadline. The hidden failure mode is unstated assumptions. When the prompter does not state them, the model fills them in. The plan reads as reasonable until execution exposes what was missed: a vendor's holiday calendar, a teammate on leave next month, an internal approval the prompter forgot to mention. Ask the model what it assumed, then revise the assumptions before re-running.

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
  that are wrong; rerun. The plan is downstream of the assumptions,
  not the goal.
```

Some templates start running every Monday: the manager email, the weekly plan, the standing summary. At that point you have a workflow worth saving. See [[when-workflows-graduate]].

*Related: [[which-tool-when]] · [[iterating-on-prompts]] · [[when-workflows-graduate]]*

---
title: Personal workflows
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [workflows, examples]
---

# Personal workflows

The same three-stage shape — prompt, context provided, output handling — runs across research, writing, summarizing, and planning. The surface differs; the method does not.

| Task type    | What this example focuses on                                                                            |
|--------------|---------------------------------------------------------------------------------------------------------|
| Research     | Scoping the prompt to the audience and gating every claim through citations.                            |
| Writing      | Naming the register, the recipient, and the stakes — so the draft does not regress to the median.       |
| Summarizing  | Naming the reader and the decision so the model surfaces decision-relevant facts, not the document's structure. |
| Planning     | Surfacing hidden assumptions, then revising from those rather than from the goal.                       |

## Research

Research with a language model is not a search — language models make poor search engines. It is triage over source material the prompter has scoped, with the model proposing leads to chase down. Naming a non-expert audience changes what comes back: jargon drops, framing shifts, and the leads become readable rather than canonical. Citations are the gate. Anything the model offers without a verifiable source is a hypothesis, not a finding.

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

The model can draft what the prompter would have written — but only if the prompter has named the register, the recipient's pattern, and what is at stake. Without those, the output regresses to the median version of its genre and sounds like an email about anyone's project. The voice test runs after the draft: read it aloud. If it does not sound like the prompter, the failure is in the prompt's framing, not the prose. Iterate the prompt — see [[iterating-on-prompts]] — rather than wordsmith the output.

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

Summarizing is the cleanest fit for a language model — the source is in the prompt, the work is to reshape it, and there is nothing for the model to invent. The variable is what the summary is *for*. A 30-page report read by a busy reader with one decision to make wants the decision-relevant facts surfaced, not the report's table of contents replayed. Name the reader, name the decision, and the model can prioritize. Skip naming them, and the output recapitulates the document's own structure, which the reader could have skimmed without help.

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
  Check whether the decision-relevant facts surfaced, not whether
  the document's headings did. If the summary mirrors the report's
  structure, the prompt under-specified the reader.
```

## Planning

Planning prompts produce the most generic outputs by default, because every project plan in the training data resembles every other one. The corrective is to overspecify: state the goal, the current state, the binding constraints, and the deadline. The hidden failure mode is unstated assumptions — the model fills them in silently and the plan looks reasonable until the first step encounters reality. The audit move is to ask the model what it assumed and revise from there.

```
PROMPT
  Break the goal below into a five-step plan. Each step has an
  owner, an exit condition, and a duration. End with the
  assumptions you made to produce this plan.

CONTEXT PROVIDED
  - Goal, in one sentence.
  - Current state: what exists, what does not.
  - Constraints: budget, headcount, dependencies.
  - Deadline.

OUTPUT HANDLING
  Read the assumptions list before the plan. Strike the assumptions
  that are wrong; rerun. The plan is downstream of the assumptions,
  not the goal.
```

When the same template runs more than once a week, the worked example has graduated into a workflow — the next surface, not another chat. See [[when-workflows-graduate]].

*Related: [[which-tool-when]] · [[iterating-on-prompts]] · [[when-workflows-graduate]]*

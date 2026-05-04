---
title: The intern frame
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [prompting, mental-models]
---

# The intern frame

The intern frame is a set of behaviors the prompter performs before sending a prompt: spell out the deliverable, hand over the reference material, push back on the first answer when it is wrong. The "intern" label names the behaviors; it does not describe how the model thinks.

## The original frame

Ethan Mollick's first widely circulated framing described these models as weird, somewhat alien interns that work infinitely fast and sometimes lie to make the prompter happy. The frame puts the prompter in onboarding mode. Onboarding work is concrete: name the deliverable, supply examples of good and bad output, list what the model is allowed to assume and what has to be told.

The table below shows what an onboarder writes down for any new hire who is capable but uninformed. The same rows apply to a prompt.

| Tell explicitly                                                                 | Do not assume                                                          | Push back on                                                         |
|---------------------------------------------------------------------------------|------------------------------------------------------------------------|----------------------------------------------------------------------|
| The deliverable's shape — memo, table, three options, a paragraph under 200 words | That the model knows the audience, the project, or the prior decisions | Output that sounds plausible but contains facts the prompter cannot verify |
| The audience and what the audience already knows                                 | That last week's conversation, file, or correction is still in scope    | Confident citations that resist a single click                       |
| Format and tone, with a one-line example of the target register                 | That the model has seen the team's house style or any internal document | Drafts that pattern-match the median answer rather than the prompter's call |
| Facts about the org, the project, or the constraint that bounds the answer     | That the model will ask a clarifying question rather than guess         | Hedging that smooths over a real disagreement the prompter wants surfaced |

Each row is work the prompter writes down before sending the prompt. The frame works only when the rows are actually filled in.

## Where the frame caps ambition

Mollick himself walked the intern frame back as primary advice. The stated reason: it leads people to use AI in narrowly bounded ways, shaped by what they would ask of an actual intern. A prompter holding the intern frame asks for memos, summaries, and first drafts. They skip the strategy questions, second-opinion critiques, and red-team analyses the same model can also produce. Frontier models routinely exceed what an intern could deliver while remaining as alien as the original frame warned.

The retraction does not abandon the onboarding behaviors. It widens what the prompter thinks to ask for.

## The coworker reframe

The updated framing is an **infinitely patient new coworker who forgets everything you tell them each new conversation**. Three properties matter in that definition.

*Coworker register.* Treat the model as a collaborator. This raises what the prompter is willing to ask for: strategy questions, second opinions, devil's-advocate critiques are all in scope.

*Infinitely patient.* The model does not get tired, annoyed, or judgmental about a fortieth variant. The prompter who acts on this stops asking for one answer and starts asking for many.

*Per-conversation amnesia.* Whatever was true in yesterday's session is gone. Context has to be re-established every time, in every fresh conversation.

The behaviors that follow are concrete:

- Restate the project, the audience, and the goal at the top of every fresh conversation. Do not assume yesterday's thread carries over.
- Ask for many variants in one prompt and pick from them. A single answer accepted as-is is the median outcome.
- Re-prompt without apology when the first response is wrong (see [[iterating-on-prompts]]). The coworker has no feelings about being corrected.
- Hand over the reference material the coworker would need to start cold: the meeting notes, the prior version, the constraint document.
- Push back when the model is wrong. Revise when it is right and the wording still misses.
- The model's confident agreement is more output from the same model. Re-ask if certainty matters.

## Picking a frame

Both frames apply, and the prompter picks based on the task. The intern frame is useful when scoping unfamiliar work; it prompts the kind of careful spell-it-out that an onboarder would do. The coworker frame is useful when scaling out — it widens what the prompter thinks to ask for and licenses abundance once the work is understood.

*Related: [[prompt-as-thinking]] · [[iterating-on-prompts]] · [[how-not-to-produce-ai-slop]]*

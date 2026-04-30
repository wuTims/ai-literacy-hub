---
title: The intern frame
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [prompting, mental-models]
---

# The intern frame

The intern frame is a behavior protocol for the prompter, not a posture about the model.

It dictates what the prompter spells out, what the prompter hands over, what the prompter pushes back on. The model's intern-ness is beside the point; the work the frame forces the prompter to do is the whole point.

## The original frame

Ethan Mollick's first widely circulated framing described these models as weird, somewhat alien interns that work infinitely fast and sometimes lie to make the prompter happy. The framing did real work on adoption. It put the prompter in onboarding mode — name the deliverable, supply examples of good and bad output, mark the boundary between what the intern is allowed to assume and what has to be told.

The frame's value sits in the table that follows from it. An onboarder, faced with someone capable but uninformed, knows what to write down.

| Tell explicitly                                                                 | Do not assume                                                          | Push back on                                                         |
|---------------------------------------------------------------------------------|------------------------------------------------------------------------|----------------------------------------------------------------------|
| The deliverable's shape — memo, table, three options, a paragraph under 200 words | That the model knows the audience, the project, or the prior decisions | Output that sounds plausible but contains facts the prompter cannot verify |
| The audience and what the audience already knows                                 | That last week's conversation, file, or correction is still in scope    | Confident citations that resist a single click                       |
| Format and tone, with a one-line example of the target register                 | That the model has seen the team's house style or any internal document | Drafts that pattern-match the median answer rather than the prompter's call |
| Facts about the org, the project, or the constraint that bounds the answer     | That the model will ask a clarifying question rather than guess         | Hedging that smooths over a real disagreement the prompter wants surfaced |

Each row is the prompter's job, not the model's. None of them get done by adopting the frame as a vibe; they get done by writing the words down before the model is asked to extend them.

## Where the frame underclocks

Mollick himself walked the intern frame back as primary advice. The reason: it caps the prompter's ambition. A prompter who treats the model as an intern asks for intern-grade work and gets it. Frontier models routinely exceed the ceiling of any intern role — while remaining as alien as the original frame warned. Holding the frame too tightly turns it into a self-imposed limit on what the prompter even thinks to request.

The retraction is not a repudiation. The onboarding behaviors are still right. The ambition setting is what has to move.

## The coworker reframe

The updated framing is an **infinitely patient new coworker who forgets everything you tell them each new conversation**. Three load-bearing properties sit inside that sentence.

*Coworker, not subordinate.* The register is collaboration, which raises the ceiling on what the prompter is willing to ask for. Strategy questions, second opinions, devil's-advocate critiques — all in scope.

*Infinitely patient.* The model does not get tired, annoyed, or judgmental about a fortieth variant. The prompter who acts on this stops asking for one answer and starts asking for many.

*Per-conversation amnesia.* Whatever was true in yesterday's session is gone. Context has to be re-established every time, in every fresh conversation, as if walking the coworker into the meeting room from the hallway.

The behaviors that follow are concrete:

- Restate the project, the audience, and the goal at the top of every fresh conversation. Do not assume yesterday's thread carries over.
- Ask for variants in bulk — five subject lines, three opening paragraphs, ten alternative phrasings — and pick. Do not ask for one answer and accept it.
- Re-prompt without apology when the first response is wrong. The coworker has no feelings about being corrected.
- Hand over the reference material the coworker would need if walking into the topic cold — the meeting notes, the prior version, the constraint document.
- Push back when the model is wrong. Revise when it is right and the wording still misses.
- Treat the model's confident-sounding agreement as a continuation, not a verification. Re-ask if certainty matters.

## Picking a frame

The two framings are not competing dogmas. They are tools the prompter selects between depending on the task.

The intern frame is useful when scoping unfamiliar work — it forces the prompter to think like an onboarder, which is the right posture when the work itself is being defined. The coworker frame is useful when scaling out — it removes the ceiling on what to ask for and licenses abundance once the work is understood. Both frames share the move that does the actual work: explicit context, every time, written down before the model is asked to extend it.

A frame is what the prompter does, not what the model is. Hold either one and the same habits follow: write the context down, name the deliverable, inspect the draft before it leaves the conversation.

*Related: [[prompt-as-thinking]] · [[iterating-on-prompts]] · [[how-not-to-produce-ai-slop]]*

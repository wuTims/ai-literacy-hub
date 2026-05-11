---
title: The intern frame
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [prompting, mental-models]
---

# The intern frame

There is a useful trick for writing better prompts: imagine you are not asking a model anything at all. Imagine you are onboarding a new intern. You would not just say *write me a project update* and walk away. You would tell them what the update is for, who is going to read it, what good looks like, and what to do if they get stuck. The same moves — spell out the deliverable, hand over the reference material, push back on the first answer when it is wrong — are the moves that turn a mediocre prompt into a useful one.

The intern label names a set of behaviors the prompter performs before sending a prompt. It is a description of *your* job, not a description of how the model thinks.

## Where the frame comes from

Ethan Mollick's first widely circulated framing described these models as weird, somewhat alien interns that work infinitely fast and sometimes lie to make the prompter happy. The frame puts you in onboarding mode. Onboarding work is concrete: name the deliverable, supply examples of good and bad output, list what the new hire is allowed to assume and what has to be told.

The table below shows what an onboarder writes down for any new hire who is capable but uninformed. The same rows apply to a prompt.

| Tell explicitly                                                                 | Do not assume                                                          | Push back on                                                         |
|---------------------------------------------------------------------------------|------------------------------------------------------------------------|----------------------------------------------------------------------|
| The deliverable's shape — memo, table, three options, a paragraph under 200 words | That the model knows the audience, the project, or the prior decisions | Output that sounds plausible but contains facts you cannot verify    |
| The audience and what the audience already knows                                 | That last week's conversation, file, or correction is still in scope    | Confident citations that resist a single click                       |
| Format and tone, with a one-line example of what you want it to sound like       | That the model has seen the team's house style or any internal document | Drafts that pattern-match the median answer rather than your call    |
| Facts about the org, the project, or the constraint that bounds the answer       | That the model will ask a clarifying question rather than guess         | Hedging that smooths over a real disagreement you wanted surfaced    |

Each row is work you write down before sending the prompt. The frame works only when the rows are actually filled in. Skip a row and the model will fill it in for you, using the average answer from everyone who ever asked something similar.

## Where the frame caps ambition

Mollick himself walked the intern frame back as primary advice. The reason he gave: it leads people to use AI in narrowly bounded ways, shaped by what they would ask of an actual intern. A prompter holding the intern frame asks for memos, summaries, and first drafts. They skip the strategy questions, second-opinion critiques, and red-team analyses the same model can also produce. Today's models routinely do work that exceeds what an intern could deliver, while remaining as alien as the original frame warned.

The walkback does not throw out the onboarding behaviors. It widens what you think to ask for in the first place.

## The coworker reframe

Mollick's updated framing is an **infinitely patient new coworker who forgets everything you tell them each new conversation**. That sentence is doing more work than it looks like. Three properties matter inside it.

*Treat the model like a coworker.* A coworker is a peer, not a junior you are supervising. That small shift in posture raises what you are willing to ask for. Strategy questions, second opinions, devil's-advocate critiques — all in scope. You stop pre-filtering your hardest questions on the assumption that the model cannot help with them.

*Infinitely patient.* The model does not get tired, annoyed, or judgmental about a fortieth variant. A real coworker eventually flinches when you ask them to try one more version. This one does not. The prompter who acts on this stops asking for one answer and starts asking for many — five subject lines, three openings, four ways of structuring the same argument — and picks from them.

*Per-conversation amnesia.* Whatever was true in yesterday's session is gone. Whatever you established three chats ago is gone. The coworker shows up to work every morning with no memory of the day before, and you have to brief them again from scratch. Context has to be re-established every time, in every fresh conversation. (There is more on this in [[memory-and-state]].)

The behaviors that follow from this picture are concrete:

- Restate the project, the audience, and the goal at the top of every fresh conversation. Do not assume yesterday's thread carries over, because it does not.
- Ask for many variants in one prompt and pick from them. A single answer accepted as-is is the median outcome.
- Re-prompt without apology when the first response is wrong (see [[iterating-on-prompts]]). The coworker has no feelings about being corrected, and treating the back-and-forth as polite negotiation is a waste of your turns.
- Hand over the reference material the coworker would need to start cold: the meeting notes, the prior version, the constraint document, the email thread. Pasted context beats remembered context every time, because the model never had the remembered context to begin with.
- Push back when the model is wrong. Revise when it is right and the wording still misses. Both are normal parts of working with a peer.
- The model's confident agreement is more output from the same model — not a second opinion. Re-ask in a different way if certainty matters.

## Picking a frame

Both frames apply, and you pick based on the task in front of you. The intern frame is useful when you are scoping unfamiliar work; it prompts the kind of careful spell-it-out that an onboarder would do, and it keeps you from skipping the boring decisions that the output depends on. The coworker frame is useful when you are scaling out — it widens what you think to ask for and gives you permission to ask for many tries once the work is understood.

In practice, most real prompting moves between the two. You start in intern mode while you figure out what you actually want. Once the shape is clear, you switch to coworker mode and ask for variants, critiques, and second passes. Neither frame is the right one. The right one is whichever one matches the move you are about to make.

---

← Previous: [[prompt-as-thinking]] · Up: [[start-here]] · Next: [[iterating-on-prompts]] →

*Related: [[prompt-as-thinking]] · [[iterating-on-prompts]] · [[how-not-to-produce-ai-slop]]*

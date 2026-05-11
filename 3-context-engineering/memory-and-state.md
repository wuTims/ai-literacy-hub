---
title: Memory and state
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [context-engineering, memory]
---

# Memory and state

When a chat app says it "remembers" you, almost nothing magical is happening. The model itself has not learned anything new about you between turns. What is happening is that the application around the model is keeping a small folder of notes about you and quietly pasting some of those notes into the window before each new chat starts. From the model's point of view, those notes look exactly like words you just typed.

The window rule from [[what-is-context]] still holds: anything that is not in the window this turn does not exist to the model this turn. Memory features do not change that rule — they just decide what gets pasted in before the rule kicks in.

## Four flavors of "memory"

Different products give their memory features different names. Underneath the labels, they fall into four shapes. The shapes matter more than the names.

| Feature shape                                                                                       | What it stores                                                              | What it doesn't                                                                  | What to assume                                                                                       |
|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Conversation history within a chat**                                                              | Turns in this chat, up to the window cap.                                   | Anything from other chats; turns pushed out by the cap.                          | Recent turns are reliably present. Older content may be summarized or dropped.                       |
| **Saved profile / global memory** (e.g., ChatGPT memory)                                            | A small set of facts the system pulled out: preferences, role, ongoing work.| Full prior conversations; anything the system chose not to keep.                 | A short, patchy biography gets pasted into every new chat. You do not write it directly.             |
| **Container instructions / project knowledge** (e.g., Claude Projects' Knowledge, custom GPT instructions, Gemini Gem instructions) | A preamble and attached files scoped to a named container.                  | Anything outside the container; file content until the application surfaces it.  | The preamble gets pasted into each chat inside the container; attached files are fetched on demand, not always present. |
| **Per-chat saved notes** (e.g., a notebook the model writes to mid-chat)                            | Notes the model wrote during the chat, often visible and editable.          | Anything the model didn't choose to write down.                                  | Notes are just tokens, like anything else — accurate only if the moment they were captured was.      |

All four boil down to the same trick: the application reaches into a stash of earlier material and slides some of it onto the desk before the model starts writing. None of them gives the model a way to *look something up* mid-turn. Whatever shows up in the window is whatever the application chose to put there.

## What that means for the model

Two consequences fall out of this directly, and both trip people up.

The first: the model behaves as if it knows a saved fact **only when the application actually pastes it in that turn**. Sometimes the application decides not to — maybe the fact did not seem relevant, maybe the chat is in a different container, maybe the rule for what counts as "relevant" is fuzzy. The fact may be sitting safely in your profile and still be absent from the window right now. From the model's side, absent is the same as never having existed.

The second: the model cannot tell a fact you typed this turn apart from a fact the memory system pasted in. Both look identical — plain text near the top of the window. There is no little flag on the older fact saying "this was inserted by the system in 2024." So a profile note from last year saying *lives in Austin* lands in the window next to your fresh sentence *we moved to Denver in March*, and the model has no way to know which one is current. It will often hedge, sometimes pick the wrong one, and almost never tell you which input it trusted.

## Failure modes worth knowing

These come up often enough that it helps to name them.

- **Saved profile going stale.** A preference captured months ago — an old job title, a project that wrapped, a habit you stopped — is now wrong. The system keeps pasting it in, and answers quietly drift around the wrong fact. The model never lies on purpose; it just trusts what it sees.
- **Cross-container leakage.** You assumed a project was scoped — its own preamble, its own files, its own world. But global profile facts can still show up inside it, because the profile is keyed to your account, not to the project. Or a container's preamble bleeds into a chat you opened thinking it was a clean slate. The walls between containers are thinner than they look.
- **Saved notes treated as ground truth.** The model wrote itself a note in an earlier session, under one set of assumptions. Later it retrieves that note and grounds a confident answer on it, even though the note was wrong on the day it was written.
- **"Memory" used as a database.** You assume a fact is recallable because you once stated it. But the system never decided to retain it, or retained it and chose not to paste it in this turn. The model fills the gap with a plausible answer that has nothing behind it.
- **Squished summaries mistaken for recall.** A long prior chat gets compressed into a few sentences before being carried forward. The model sees the summary, not the original — and the specific detail you cared about may not have survived the squish.
- **Profile contamination across roles.** Your profile is global to your account, not split by topic. You mention in a work chat that the team blocks Friday afternoons. Later, a chat about a family dinner suggests skipping Friday because "you keep Fridays free." The chat container does not constrain what a global memory system pastes in.

Notice the shape of all six: the system did its job correctly, but the result is still wrong, because the system has no view of what *should* be remembered for *this* conversation. It only knows what it stored and a rough idea of when to reuse it.

## How to audit what is in there

The good news is that almost all of this is visible if you look. Every big product exposes the state it is holding for you somewhere: a memory panel, a settings page, a list of attached files, an editable profile. Read it occasionally. Delete things that no longer apply. Treat it like the inside of a desk drawer that fills up if nobody opens it.

When an answer matters and you suspect a memory feature is involved, you can also ask the model to show its work — "what do you know about me that you are using right now?" — or just paste the relevant facts into the chat yourself so there is no ambiguity left in the window (see [[feeding-the-model]]).

The same auditing habit applies to containers. A project's preamble and its attached files are state you own. If you set up a Claude Project, a custom GPT, or a Gemini Gem six months ago and have not looked at the instructions since, those instructions are still being pasted into every chat you open inside it. Old preamble lines and old attachments quietly age into the background. Prune them every so often so the container is not handing the model stale starting material (see [[chats-vs-projects]]).

## The takeaway

The word "memory" makes these features sound like the model is learning about you over time. It is not. The model is exactly as stateless as it was on page one of this section — same blank slate every turn, same hard window cap.

What is happening is that the application around the model is keeping notes for you and choosing what to paste in before each chat starts. Once you see it that way, three things follow:

- If a memory feature surprises you, the surprise is about what the application chose to insert, not about what the model "knows."
- Whatever it inserts is text. Text you can read, edit, or delete.
- Nothing the system stores is private to one container unless the product explicitly says so.

Treat the memory panel the same way you would treat the top of a long email thread: a real input that shapes the reply, easy to overlook, worth checking when the reply seems off.

---

← Previous: [[feeding-the-model]] · Up: [[start-here]] · Next: [[which-tool-when]] →

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[feeding-the-model]]*

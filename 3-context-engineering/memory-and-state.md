---
title: Memory and state
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [context-engineering, memory]
---

# Memory and state

What products call "memory" is the application putting earlier material back into the window before each turn. The model still sees only what is in the window; memory features just decide what gets reinserted.

The window rule from [[what-is-context]] still applies: anything outside the window does not exist to the model this turn.

## Four feature classes

The categories below are based on how the feature works, not on what each product calls it. The labels vary across products, but the underlying mechanism is the same.

| Feature class                                                                                       | What it stores                                                              | What it doesn't                                                                  | What to assume                                                                                       |
|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Conversation history within a chat**                                                              | Turns in this chat, up to the window cap.                                   | Anything from other chats; turns pushed out by the cap.                          | Recent turns are reliably present. Older content may be summarized or dropped.                       |
| **Saved profile / global memory** (e.g., ChatGPT memory)                                            | A small set of facts the system extracted: preferences, role, ongoing work. | Full prior conversations; anything the system chose not to retain.               | A short, lossy biography prepends to every new chat. The user does not author it directly.           |
| **Container instructions / project knowledge** (e.g., Projects' Knowledge, custom GPT instructions, Gem instructions) | A preamble and attached files scoped to a named container.                  | Anything outside the container; file content until the application surfaces it.  | The preamble prepends to each chat inside the container; files are retrievable, not always present.  |
| **Per-chat saved notes** (e.g., a notebook the model writes to mid-chat)                            | Notes the model wrote during the chat, often visible and editable.          | Anything the model didn't choose to write down.                                  | Notes are tokens like any other — accurate only if the moment they were captured was.                |

## What this means in the window

All four work the same way: they reinsert earlier material into the window before the next turn, and none gives the model a way to look something up during it.

Two consequences follow directly:

- The model behaves as if it knows a saved fact **only when the system actually injected it that turn**. Sometimes the system declines to — relevance scores, scope rules, container boundaries. The fact may be stored in the user's profile but absent from the window on this turn.
- The model cannot distinguish a fact the user typed this turn from a fact a memory system inserted. Both look identical to the model; there is no marker on the older fact saying it was inserted by the system. A profile note saying *lives in Austin*, captured last year, lands alongside the user typing *we moved to Denver in March*, and the model has no way to tell which one is current.

## Failure modes worth recognizing

- **Saved profile going stale.** A preference captured months ago (a job title, a project name, a habit) is now wrong. The system keeps inserting it; answers quietly drift around the wrong fact.
- **Cross-container leakage.** Global profile facts surface inside a project the user expected to be scoped. Or a container's preamble bleeds into a chat the user opened thinking it was a clean slate.
- **Saved notes treated as ground truth.** The model wrote a note in an earlier session under one set of assumptions, retrieved it later, and grounds a confident answer in material that was wrong when captured.
- **"Memory" used as a database.** The user assumes a fact is recallable because they once stated it. The system never retained it, or retained it and chose not to insert it this turn. The model produces a plausible answer with nothing behind it.
- **Lossy summarization mistaken for recall.** A long prior chat was compressed into a few sentences before being carried forward. The model has the summary, and specifics from the original may not appear in it.
- **Profile contamination across roles.** A profile is global to the account, not scoped to the topic. The user mentions in a work chat that the team blocks Friday afternoons; later, a chat about a family dinner suggests skipping Friday. The container the user is in does not constrain what a global memory system inserts.

## Auditing what was retained

Audit what the system shows you. Most products expose what they retained — a settings page, a memory panel, a list of attached files. Read it. When the answer matters, ask the system to surface what it pulled in this turn, or paste the material in directly so the prefix is no longer ambiguous (see [[feeding-the-model]]).

The same applies to containers. A project's preamble and attachments are state the user owns. Pruning preamble lines and attachments that no longer apply prevents the container from prepending stale material into every chat (see [[chats-vs-projects]]).

## What this leaves the reader with

Memory features are the application choosing what to put back into the window. Whatever the application reinserts is something you can read, edit, or remove.

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[feeding-the-model]]*

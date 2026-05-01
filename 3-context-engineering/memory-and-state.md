---
title: Memory and state
created: 2026-04-30
updated: 2026-05-01
status: draft
tags: [context-engineering, memory]
---

# Memory and state

"Memory" in current chat tools is not the model remembering you. It is the application putting earlier material back into the window on the model's behalf before the turn begins.

The boundary the foundation describes still holds: anything outside the window does not exist to the model this turn (see [[what-is-context]]). Memory features do not move the boundary. They move material across it.

## Four feature classes

The categories worth distinguishing are mechanical, not branded. Most products implement some subset; the labels vary, the shape underneath is consistent.

| Feature class                                                                                       | What it stores                                                              | What it doesn't                                                                  | What to assume                                                                                       |
|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Conversation history within a chat**                                                              | Turns in this chat, up to the window cap.                                   | Anything from other chats; turns pushed out by the cap.                          | Recent turns are reliably present. Older content may be summarized or dropped.                       |
| **Saved profile / global memory** (e.g., ChatGPT memory)                                            | A small set of facts the system extracted: preferences, role, ongoing work. | Full prior conversations; anything the system chose not to retain.               | A short, lossy biography prepends to every new chat. The user does not author it directly.           |
| **Container instructions / project knowledge** (e.g., Projects' Knowledge, custom GPT instructions, Gem instructions) | A preamble and attached files scoped to a named container.                  | Anything outside the container; file content until the application surfaces it.  | The preamble prepends to each chat inside the container; files are retrievable, not always present.  |
| **Per-chat saved notes** (e.g., a notebook the model writes to mid-chat)                            | Notes the model wrote during the chat, often visible and editable.          | Anything the model didn't choose to write down.                                  | Notes are tokens like any other — accurate only if the moment they were captured was.                |

## What this means in the window

Every one of those features is a mechanism for reinserting tokens into the prefix. None of them is a separate place the model "looks things up" mid-answer.

Two consequences follow directly:

- The model behaves as if it knows a saved fact **only when the system actually injected it that turn**. Sometimes the system declines to — relevance scores, scope rules, container boundaries. The fact is on file and absent from the window simultaneously.
- The model cannot distinguish a fact the user typed this turn from a fact a memory system inserted. Both arrive as tokens in the prefix and are treated with equal weight. Provenance is not visible to the model unless the application makes it so.

## Failure modes worth recognizing

- **Saved profile going stale.** A preference captured months ago — job title, project name, a habit — is now wrong. The system keeps inserting it; answers quietly drift around the wrong fact.
- **Cross-container leakage.** Global profile facts surface inside a project the user expected to be scoped. Or a container's preamble bleeds into a chat the user opened thinking it was a clean slate.
- **Saved notes treated as ground truth.** The model wrote a note in an earlier session under one set of assumptions, retrieved it later, and grounds a confident answer in material that was wrong when captured.
- **"Memory" used as a database.** The user assumes a fact is recallable because they once stated it. The system never retained it, or retained it and chose not to insert it this turn. The model produces a plausible answer with nothing behind it.
- **Lossy summarization mistaken for recall.** A long prior chat was compressed into a few sentences before being carried forward. The model "remembers our last conversation" — meaning it has the summary, not the original. Specifics flatten without warning.
- **Profile contamination across roles.** A profile is global to the account, not to the topic. Work facts enter personal chats; personal facts enter work ones. The container the user is in does not constrain what a global memory system inserts.

The shape across the list is the same: confident output grounded in material the user neither typed nor verified, surfacing as if it were recall.

## Auditing what is in front of the model

The only reliable check is the visible one. Most products expose what they retained — a settings page, a memory panel, a list of attached files. Read it. When the answer matters, ask the system to surface what it pulled in this turn, or paste the material in directly so the prefix is no longer ambiguous (see [[feeding-the-model]]).

The same applies to containers. A project's preamble and attachments are state the user owns; pruning what no longer applies is the difference between a tight container and a cluttered one (see [[chats-vs-projects]]).

## What this leaves the reader with

Memory is the application's hand on the prefix. What the application puts back in front of the model is auditable like any other token: read it, edit it, prune it.

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[feeding-the-model]]*

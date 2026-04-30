---
title: Chats vs projects
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [context-engineering, workflows]
---

# Chats vs projects

Every chat starts with an empty window. Whatever should outlive that chat — instructions, files, voice, the shape of a recurring task — has to live somewhere the next chat can pick it up from.

Products give that "somewhere" a name. Claude calls it a Project. OpenAI calls it a custom GPT. Google calls it a Gem. The shape underneath is the same: a named container that prepends instructions, and often files, into every chat opened inside it.

## Three primitives, one mechanism

The window itself does not change between products (see [[what-is-context]] for what sits inside it). What changes is *who supplies the prefix* and *how long that supply lasts*.

```
A SINGLE CHAT
─────────────────────────────────────────────────────────────
  • The window exists for this session.
  • Closing the tab may persist the transcript so it can be
    reopened, but a brand-new chat starts empty.
  • Anything you typed earlier today, in another chat, is
    not part of this one.

A PROJECT / CUSTOM GPT / GEM
─────────────────────────────────────────────────────────────
  • A named container with a persistent preamble — system
    instructions, often attached files, sometimes saved notes.
  • Each chat inside the container still has its own window.
  • The preamble is prepended into every such window before
    the user's first message.

A NEW CHAT
─────────────────────────────────────────────────────────────
  • An explicit reset of the window.
  • Inside a project, the preamble carries; the conversation
    does not.
  • Outside a project, both are gone.
```

A chat is transient working memory. A project is a way of saying "every chat I open here should start with these instructions in front of it." A new chat is the act of throwing away accumulated turns on purpose. The choice among the three is a choice about what to carry forward.

<!-- diagram lands here: chat-vs-project-state.png -->

## How to pick

| Situation                                                            | Reach for                                       | Why                                                                |
|----------------------------------------------------------------------|-------------------------------------------------|--------------------------------------------------------------------|
| Recurring task with stable instructions (weekly review, house style) | Project / GPT / Gem                             | The preamble carries; you stop re-pasting the same setup.          |
| One-off task unrelated to anything you have been working on          | Fresh chat, no project                          | No prior turns to bias the output, no inherited preamble.          |
| Branch off this chat but the history is now in the way               | New chat (inside the same project, if any)      | Preamble survives, conversation does not.                          |
| The next question depends on what was just said                      | Continue the current chat                       | The state is already in the window; do not reset it.               |
| Sensitive material — HR, legal, unreleased numbers                   | New chat with persistence settings reviewed     | Constrain what gets retained before you paste anything.            |
| Same instructions, many independent threads                          | Project / GPT / Gem                             | One preamble, many chats, no cross-contamination between them.     |
| Long chat where answers are drifting                                 | New chat, paste forward only what still matters | Recency dominates the window; pruning is a tool, not a confession. |

The table is not exhaustive, but the pattern is: a project is for *what should always be there*, a fresh chat is for *what should start clean*, and a new chat inside a project is for *resetting the conversation without losing the setup*.

## Gotchas worth naming

- **Memory features sit on top of all three.** Some products quietly retain notes across chats — preferences, names, prior topics — independent of any project. That is a separate mechanism from the chat/project distinction, and a separate page; see [[memory-and-state]].
- **Attached files are not background knowledge.** A file attached to a project reaches the model only when the application puts its text into the window. Treat project files as material the chat can pull from, not as a passive backdrop the model "knows about."
- **A loose preamble pollutes every chat in the container.** A project whose instructions try to cover every possible task ships that clutter into every window it opens. Containers earn their keep when the instructions inside them are tight enough that you would still want them on the next chat.

## What the choice actually is

Reaching for a project, opening a fresh chat, or hitting "new chat" inside the project you are already in — these look like UI decisions and read like one in product menus. They are not. Each one is a decision about which tokens are sitting in front of the model the next time it is asked something. The interface names the choice; the choice is yours.

The container you pick is the context the next chat will start from. Pick it on purpose.

*Related: [[what-is-context]] · [[feeding-the-model]] · [[which-tool-when]]*

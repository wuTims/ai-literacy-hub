---
title: Chats vs projects
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [context-engineering, workflows]
---

# Chats vs projects

Every chat starts with an empty window. Anything you want carried into the next chat has to be stored outside it: instructions, files, sample voice, recurring task setups.

Products give that storage layer a name: Claude calls it a Project, OpenAI a custom GPT, Google a Gem. All three are the same thing: a named container that prepends instructions, and often files, into every chat opened inside it.

## Three primitives

The window itself does not change between products (see [[what-is-context]] for what sits inside it). What changes is who provides the starting material for each chat, and whether it sticks around between chats.

```
A SINGLE CHAT
─────────────────────────────────────────────────────────────
  Window exists for this session. New chat = empty window.

A PROJECT / CUSTOM GPT / GEM
─────────────────────────────────────────────────────────────
  A named container with a persistent preamble — system
  instructions, often files. Each chat inside still has
  its own window; the preamble prepends into every one.

A NEW CHAT
─────────────────────────────────────────────────────────────
  Explicit reset of the window. Inside a project the
  preamble carries; the conversation does not.
```

A chat is a single window that disappears when the chat ends. A project is a way of saying "every chat I open here should start with these instructions in front of it." Opening a new chat clears the window deliberately.

![[chat-vs-project-state.png]]

## How to pick

| Situation                                                            | Reach for                                       | Why                                                                |
|----------------------------------------------------------------------|-------------------------------------------------|--------------------------------------------------------------------|
| Recurring task with stable instructions (weekly review, house style) | Project / GPT / Gem                             | The preamble carries; you stop re-pasting the same setup.          |
| One-off task unrelated to anything you have been working on          | Fresh chat, no project                          | No prior turns to bias the output, no inherited preamble.          |
| Explore a parallel direction without losing the current thread       | New chat (inside the same project, if any)      | Original chat stays open; the new one starts from the preamble alone. |
| The next question depends on what was just said                      | Continue the current chat                       | The state is already in the window; do not reset it.               |
| Sensitive material — HR, legal, unreleased numbers                   | New chat with persistence settings reviewed     | Constrain what gets retained before you paste anything.            |
| Same instructions, many independent threads                          | Project / GPT / Gem                             | One preamble, many chats, no cross-contamination between them.     |
| Long chat where answers are drifting                                 | New chat, paste forward only what still matters | Recency dominates the window; pruning is a tool, not a confession. |

The pattern is consistent: use a project when the same setup applies every time, a fresh chat when nothing prior should bias the answer, and a new chat inside a project when you want to reset the conversation but keep the setup.

## Gotchas worth naming

- **Memory features sit on top of all three.** Some products quietly retain notes across chats — preferences, names, prior topics — independent of any project. That is a separate mechanism from the chat/project distinction, and a separate page; see [[memory-and-state]].
- **Attached files are not background knowledge.** An attached file reaches the model only when the application puts its text into the window. Until that happens, the model has not seen it.
- **A preamble that tries to cover every task clutters every chat.** When a project's instructions try to address every possible task, every chat opened inside it inherits that clutter. Project instructions are worth keeping only if you would still want them prepended to your next chat.

*Related: [[what-is-context]] · [[feeding-the-model]] · [[which-tool-when]]*

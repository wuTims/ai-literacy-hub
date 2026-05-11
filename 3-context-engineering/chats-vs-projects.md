---
title: Chats vs projects
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [context-engineering, workflows]
---

# Chats vs projects

Every chat starts with an empty window. If you want anything carried into the next chat, it has to live somewhere outside the chat itself — saved instructions, attached files, a sample of your writing voice, the setup for a task you do every week.

The big AI products all give that outside-the-chat storage a name. Claude calls it a **Project**. OpenAI calls it a **custom GPT**. Google calls it a **Gem**. Under the hood, all three are the same idea: a named container that prepends a chunk of saved instructions — and often a few attached files — into every chat you open inside it.

Once you see that pattern, a lot of the chat-vs-project confusion goes away. They are not two competing tools. They are different ways of deciding what gets to start each chat.

## Three shapes of state

The window itself does not change between products. What changes is who provides the starting material for each chat, and whether that material sticks around for the next one. See [[what-is-context]] for what sits inside the window itself.

There are three shapes to keep in mind:

```
A SINGLE CHAT
─────────────────────────────────────────────────────────────
  One window. Lives for this session only. When the chat
  ends, the window goes with it. A new chat is a blank slate.

A PROJECT / CUSTOM GPT / GEM
─────────────────────────────────────────────────────────────
  A named container with a saved preamble — system
  instructions, often a few attached files. Each chat opened
  inside it still has its own private window; the preamble
  gets pasted into every one before your first message.

A NEW CHAT
─────────────────────────────────────────────────────────────
  A deliberate reset of the window. Inside a project, the
  preamble carries forward; the previous conversation does not.
```

A chat is a single window that disappears when you close it. A project is a way of saying "every chat I open here should start with these instructions already in front of it." Opening a new chat inside a project gives you a fresh window but keeps the saved preamble — useful when the last thread has wandered somewhere you no longer want to be.

![[chat-vs-project-state.png]]

The key thing to hold onto: a project does not extend the window. It does not give the model a longer memory. It just decides what shows up at the top of the next window you open.

## How to pick

Here is a quick lookup table for the situations that come up most often:

| Situation                                                            | Reach for                                       | Why                                                                |
|----------------------------------------------------------------------|-------------------------------------------------|--------------------------------------------------------------------|
| Recurring task with stable instructions (weekly review, house style) | Project / GPT / Gem                             | The preamble carries forward; you stop re-pasting the same setup.  |
| One-off task unrelated to anything you have been working on          | Fresh chat, no project                          | No prior turns to bias the output, no inherited preamble.          |
| Explore a parallel direction without losing the current thread       | New chat (inside the same project, if any)      | Original chat stays open; the new one starts from the preamble alone. |
| The next question depends on what was just said                      | Continue the current chat                       | The state is already in the window; do not reset it.               |
| Sensitive material — HR, legal, unreleased numbers                   | New chat with persistence settings reviewed     | Decide what gets retained before you paste anything.               |
| Same instructions, many independent threads                          | Project / GPT / Gem                             | One preamble, many chats, no cross-contamination between them.     |
| Long chat where answers are drifting                                 | New chat, paste forward only what still matters | The model leans hardest on recent text; pruning is a tool, not a confession. |

The shape of the pattern is consistent: reach for a project when the same setup applies every time, a fresh chat when nothing prior should colour the answer, and a new chat *inside* a project when you want to reset the conversation but keep the setup.

## A worked example

Suppose you write a weekly status update for your team. The format is the same every Friday: three bullets on what shipped, three on what is in progress, one on what is blocked. You like a particular tone — direct, no marketing language, no apologies for slipping dates.

If you open a fresh chat each Friday and explain all of that from scratch, you are doing the same setup work over and over again. Worse, you will explain it slightly differently each time, and the output will drift along with you.

The right move is a project. Drop the format and the tone notes into the project's instructions once. Attach last quarter's updates as reference if the voice still needs grounding. Then each Friday, open a new chat *inside* the project and just paste the week's raw notes. The model starts every Friday's chat with the same preamble in front of it, so the output stays consistent week to week.

Now suppose, mid-Friday, you want to use the same model to debug a JavaScript error in something completely unrelated. Don't ask in the status-update project — its preamble is going to colour every answer toward terse status-report prose. Open a chat outside the project, where the model has no inherited instructions, and ask there.

That is the everyday rhythm: projects for the work you do over and over, plain chats for everything else, new chats inside a project when one thread has run its course.

## Gotchas worth naming

A few things trip people up the first time they use projects seriously.

**Memory features sit on top of all three.** Some products quietly retain notes across chats — your preferences, your name, topics you have asked about before — independent of any project. That is a separate mechanism with its own behaviour, and it deserves its own page; see [[memory-and-state]]. If a chat seems to remember something you never told it, suspect a memory feature before you suspect a project.

**Attached files are not background knowledge.** Attaching a file to a project does not put it in front of the model. The model only sees the file once the application has pulled text out of it and dropped that text into the window for a given turn. Most products do this on demand when the conversation seems to need it, which means the file is *available* to be inserted, not *already loaded*. If you need a specific fact from an attached file, it often pays to mention it explicitly so the application actually fetches the relevant chunk.

**A preamble that tries to cover every task clutters every chat.** When a project's instructions try to handle every possible request — "be formal sometimes, casual other times, write code if asked, otherwise write prose, follow these eight style rules" — every chat opened inside that project inherits the whole pile. The model gets less focused, not more. Project instructions earn their place only if you would genuinely want them prepended to the next chat you open there. Anything more specific belongs in the chat itself.

**Projects don't wall off account-level memory.** Conversations inside a project still share whatever account-level memory or persistence the product offers. If you are worried about a sensitive thread bleeding into a general one, the relevant setting is usually in account preferences, not in the project.

The mental model is small but it pays off quickly: the window is the room the model thinks in this turn, a project is the standing instructions you leave at the door of every room you open in a particular house, and a new chat is the choice to walk into a fresh room. Once those three pieces are clear, picking the right one for a given task stops feeling like a guess.

---

← Previous: [[what-is-context]] · Up: [[start-here]] · Next: [[feeding-the-model]] →

*Related: [[what-is-context]] · [[feeding-the-model]] · [[which-tool-when]]*

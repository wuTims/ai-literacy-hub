---
title: What context is
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [context-engineering, mental-models]
---

# What context is

An LLM does not remember your earlier conversations, your files, your account, or your name. It works on whatever is currently inside its **context window** — a finite slab of tokens it processes in a single forward pass. Anything outside that slab does not exist to the model.

Karpathy's framing is the one that holds up: the context window is the model's working memory, the RAM of an emerging operating system. A finite, valuable slot. Whatever the application places there is what the model has to think with this turn.

## What sits inside the window

Every turn, the application assembles a prefix of tokens and hands it to the model. The model conditions on that prefix and predicts the next token (see [[what-llms-are]] for the underlying mechanism). The prefix *is* the context window. There is nothing else the model can refer to.

![[context-window.png]]

```
INSIDE THE WINDOW (the model sees this)
─────────────────────────────────────────────────────────────
  • the system prompt the application sets
  • this user message
  • prior turns of this chat, up to the window cap
  • files pasted or attached this turn (as extracted text)
  • snippets the application retrieved and injected
  • outputs from any tools the model called this turn

OUTSIDE THE WINDOW (the model has no access)
─────────────────────────────────────────────────────────────
  • other chats, even ones from earlier today
  • your account history, your name, your role
  • files on your disk the application did not fetch
  • last week's conversation that scrolled off the cap
  • anything in training data that wasn't retrieved into the prefix
```

The window is finite. When a conversation grows past the cap, something falls off, and what falls off is no longer part of the model's knowledge of the turn.

## Consequences

The boundary is mechanical, but its effects show up as everyday surprises:

- **No memory between chats by default.** A new chat starts from an empty slate. The prior chat's content does not carry over unless the application explicitly puts it back into the window.
- **Pasted documents matter more than uploads might suggest.** The model only sees text once the application places it in the window. "Attaching" a file means little until something extracts text from it and inserts it into the prefix.
- **Long chats degrade in unexpected ways.** As the window fills, older content can be summarized, truncated, or pushed out. A point established at turn three can stop being part of the conversation by turn thirty with no visible signal.
- **Recency dominates.** Within the window, the model attends most heavily to what is closest to the cursor. Instructions buried at the top of a long thread weaken as the thread grows.
- **The application injects material you never see.** System prompts, retrieved snippets, tool outputs — many windows contain content the user did not type. The output is a function of all of it.

Each of these is the same property surfacing in a different shape: the model knows what is in front of it, no more, no less.

## Engineering, not memory

The frame is mechanical, not psychological. The model is not forgetful the way a person is forgetful. It is operating on a fixed slab of tokens, the same way a process operates on whatever is currently in RAM. Anything else is a peripheral the application has to fetch and place into the prefix on the model's behalf.

That maps cleanly onto who controls what:

| Source                                | In context this turn? | Controlled by                         |
|---------------------------------------|-----------------------|---------------------------------------|
| System prompt                         | Yes                   | The application                       |
| This user message                     | Yes                   | The user                              |
| Earlier turns in this chat            | Yes, up to the cap    | Conversation history (capped)         |
| Files attached/pasted this turn       | Yes, as extracted text| The user, via the application         |
| Retrieved knowledge (RAG, search)     | Sometimes             | The application                       |
| Tool outputs from this turn           | Yes                   | The model's tool calls                |
| Other chats with this product         | No                    | Out of scope                          |
| Files on your local disk              | No                    | Out of scope unless explicitly read   |
| Anything seen during training         | No (not as facts)     | Out of scope; weights ≠ retrieval     |

User-controlled, application-controlled, and out-of-scope are the three categories worth keeping in mind. Most surprises about LLM behavior come from confusing the second for the first, or assuming the third is the second.

## What follows from this

Three threads run from here. Interfaces split work into separate chats and "projects" because the window cap forces a choice about what to carry forward — see [[chats-vs-projects]]. The practical work of putting the right material into the window before asking a question is its own discipline — see [[feeding-the-model]]. Products layer saved memories, retrieval, and persistent profiles on top, which soften the boundary at the application level without changing it at the model level — see [[memory-and-state]].

The model knows what is in front of it. Context engineering is the work of deciding what that is.

*Related: [[chats-vs-projects]] · [[feeding-the-model]] · [[what-llms-are]]*

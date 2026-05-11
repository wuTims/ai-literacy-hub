---
title: What context is
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [context-engineering, mental-models]
---

# What context is

An LLM does not remember your earlier conversations, your files, your account, or your name. It works on whatever is currently inside its **context window** — a finite stretch of tokens it reads each turn. Anything outside that window does not exist to the model.

A useful way to picture this comes from Andrej Karpathy: the context window is the model's working memory, the RAM of an emerging operating system. Whatever the application loads into the window is what the model has to think with this turn. When the turn ends, that working memory is gone unless something puts it back next time.

## What sits inside the window

Each turn, the application assembles a chunk of text — called the **prefix** — and hands it to the model. The model reads the prefix and predicts the next token, one at a time (the page on [[what-llms-are]] walks through that mechanism). There is nothing else the model can refer to.

![[context-window.png]]

```
INSIDE THE WINDOW (the model can see this)
─────────────────────────────────────────────────────────────
  • the system prompt the application sets
  • your current message
  • earlier turns of this chat, up to the window cap
  • files you pasted or attached this turn (as extracted text)
  • snippets the application retrieved and slipped in
  • outputs from any tools the model called this turn

OUTSIDE THE WINDOW (the model has no access)
─────────────────────────────────────────────────────────────
  • other chats, even ones from earlier today
  • your account history, your name, your role
  • files on your disk the application did not fetch
  • last week's conversation that scrolled past the cap
  • anything in the training data that wasn't pulled into the prefix
```

The window is finite. When a conversation grows past the cap, the oldest content falls out of the window and the model can no longer use it. The model is not choosing to forget; the text is no longer in front of it.

![[model-sees-vs-you-see.png]]

## Consequences

The window cap is a mechanical limit, but it produces effects that look like personality or memory:

- **No memory between chats by default.** A new chat starts from a blank page. Whatever you said in the prior chat does not carry over unless the application explicitly puts it back into the window.
- **Pasted text matters more than the upload UI suggests.** The model only sees a document once the application has pulled text out of it and dropped that text into the prefix. "Attaching" a file means little until that extraction happens.
- **Long chats decay in quiet ways.** As the window fills up, older content gets summarized, trimmed, or pushed out entirely. A detail you established at turn three may not be part of the conversation by turn thirty — and the model will not announce that it is gone.
- **Recent text counts most.** Within the window, the model leans hardest on what is closest to the end of the prefix. Instructions you typed at the top of a long thread weaken as the thread grows.
- **The application slips in material you never see.** System prompts, retrieved snippets, tool outputs — text the user did not type. The output is shaped by all of it together.

## Engineering, not memory

The model is not forgetful the way a person is forgetful. It works on a fixed window of tokens, and anything else has to be fetched by the application and inserted into that window before the turn begins.

That maps cleanly onto who controls what:

| Source                                | In context this turn? | Controlled by                         |
|---------------------------------------|-----------------------|---------------------------------------|
| System prompt                         | Yes                   | The application                       |
| Your current message                  | Yes                   | You                                   |
| Earlier turns in this chat            | Yes, up to the cap    | Conversation history (capped)         |
| Files you attached or pasted this turn| Yes, as extracted text| You, via the application              |
| Retrieved knowledge (search, RAG)     | Sometimes             | The application                       |
| Tool outputs from this turn           | Yes                   | The model's tool calls                |
| Other chats with this product         | No                    | Out of scope                          |
| Files on your local disk              | No                    | Out of scope unless something reads them |
| Anything seen during training         | No (not as facts)     | Out of scope; weights ≠ retrieval     |

Three categories are worth keeping in mind: **user-controlled** (what you type or paste), **application-controlled** (what the product slips in around your message), and **out-of-scope** (everything the model has no way to reach this turn). Most surprises happen when someone treats application-controlled material as if the user put it there, or treats training data as if the model can look things up in it.

That last line is worth pausing on. The model's training shaped its weights — the giant table of numbers that decides how it predicts the next token — but training is not a filing cabinet the model can open mid-turn. If a fact was not loaded into the window this turn, the model is not "remembering" it; it is generating something that sounds like the fact, which is sometimes right and sometimes not.

## What follows from this

Once you take the window seriously, a lot of product design starts to make sense.

Chat interfaces split work into separate threads and "projects" because the window cap forces a choice about what to carry forward and what to leave behind (see [[chats-vs-projects]]). The everyday work of putting the right material into the window before you ask a question is a discipline of its own (see [[feeding-the-model]]). Products layer on saved memories, retrieval, and persistent profiles to soften the boundary at the application level — but none of that changes the underlying fact that the model only sees what is in the window this turn (see [[memory-and-state]]).

Context engineering is the work of deciding what is in the window each turn. The rest of this section is about how to do that well.

---

← Previous: [[reading-the-output]] · Up: [[start-here]] · Next: [[chats-vs-projects]] →

*Related: [[chats-vs-projects]] · [[feeding-the-model]] · [[what-llms-are]]*

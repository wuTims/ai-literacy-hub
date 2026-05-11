---
title: Feeding the model
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [context-engineering, prompting]
---

# Feeding the model

The model thinks with whatever is in front of it this turn (see [[what-is-context]]). Choosing what to put into the window shapes the answer more than the wording of your question.

A tight selection of the right material beats a giant pile of source material, even when the pile contains the right answer somewhere inside it. More text in the window is not more useful text. Often it is less useful, because the pieces that actually matter get diluted by everything around them.

## Curating, not collecting

Think of the window as a small desk the model has to work on this turn. You decide what goes on the desk. You can put a few well-chosen pages there, or you can dump a whole filing cabinet onto it. Both fit. Only one of them helps.

There are two places this choice gets made. The container — a Claude Project, a custom GPT, a Gem — decides what's on the desk at the start of every chat (see [[chats-vs-projects]]). Feeding decides what extra material you slide onto the desk this turn.

The failure mode looks the same in both places: paste eight unrelated documents, ask for "a summary that captures the key points," and get back a write-up that smooths every contradiction and names nothing in particular. Whatever was interesting in those documents — the places where they disagreed, the surprising specifics — got averaged out of existence.

The fix is to scope the feed:

| Task                                          | Dumping the material in                                                  | Scoped feed                                                                              |
|-----------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Pull a finding out of many documents          | Eight unrelated docs, "summarize the key points." Contradictions flatten.| One document at a time, with the audience and the question stated. Pull threads together afterward. |
| Plan a week from an email backlog             | Whole inbox export, "what should I do this week?" Median advice.         | The flagged threads only, plus your actual constraints for the week.                     |
| Draft in a recognizable voice                 | The author's full archive, "match my voice." Voice averaged across years.| Three pieces from the last quarter, with one line on what makes each one a good sample.  |
| Answer a question grounded in a source        | Long PDF, "what does this say about X?" Plausible paraphrase.            | The PDF plus an instruction to quote the relevant passages before answering.             |
| Extend an in-progress draft                   | The whole document tree, "keep going." Tone drifts toward the median.    | The current draft, the section to extend, and the constraint that breaks the ambiguity.  |

Every row has the same shape. Dumping the material in makes the model search for the relevant part. Scoping the feed hands the model the relevant part directly.

## Three rules for what goes in

**Specificity beats volume.** A two-paragraph excerpt that contains the part that matters will outperform a fifty-page document that contains the same part on page thirty-one. Every paragraph in the window pulls on the answer; the model has no equivalent of a human reader's skim. Irrelevant length lowers the quality of the answer instead of leaving it alone.

**Long source first, the ask last.** Inside the window, the model leans hardest on what is closest to the end of the text — the part nearest the cursor when it starts writing. Put the source material at the top and your question at the bottom, and the source is still nearby when the answer comes out. Put the question first and the model has already started weighting its answer toward whatever came before the source did.

**Quote before answering.** Tell the model to quote the relevant passages from the source before it answers. Once the relevant paragraph is sitting in the window as text the model just produced, the next tokens are shaped by it. As a bonus, the quoting step makes the retrieval visible: you can see which passage the model grabbed onto, and you can tell when it grabbed the wrong one.

![[context-management-flow.png]]

## A template you can borrow

A well-fed prompt has a recognizable shape. The template below labels each part. Once you have written a few of these, the labels stop being necessary — the structure becomes a habit.

```
ROLE / FRAMING
─────────────────────────────────────────────────────────────
  Who the model is acting as, and for whom.

WHAT TO IGNORE
─────────────────────────────────────────────────────────────
  Material in the source that is out of scope for this ask.
  Saying so explicitly costs less than hoping it is obvious.

SOURCE MATERIAL  (clearly bounded)
─────────────────────────────────────────────────────────────
  --- BEGIN SOURCE ---
    [the actual material, pasted in, with clear delimiters]
  --- END SOURCE ---

THE ASK
─────────────────────────────────────────────────────────────
  The single question or deliverable, stated after the source.

DESIRED OUTPUT SHAPE
─────────────────────────────────────────────────────────────
  Length, format, structure, and one example if the shape is
  not obvious from the ask.
```

Each labeled section is a decision the person writing the prompt is making. Leave any of them implicit and the model fills in the median version — the answer that is true on average across the kind of thing you seem to be asking about, which is rarely the answer you wanted for *your* particular case.

## What feeding does not solve

**Retrieval still depends on curation.** Some applications can reach into a larger pile of documents on your behalf and pull pieces into the window automatically — this is what "retrieval-augmented generation" or RAG refers to. It is useful, but it does not remove the curation problem. It just moves it. Now the question is whether the retrieval step picked the right pieces. When you use a retrieval-backed tool, ask what it pulled in before you trust the answer, and treat those retrieved excerpts the same way you would treat material you pasted yourself.

**Attached files are not background knowledge.** A file attached to a project or a chat is not something the model has "read." It is material the application *may* surface, on demand, by pulling text out of the file and dropping that text into the window when the conversation seems to need it. Assume nothing is in the window unless you can see it in the conversation — quote it, ask the model to quote it, or paste the relevant chunk yourself.

## Why the prefix matters

The chunk of text the application hands to the model each turn is called the **prefix** — system instructions, your message, any earlier turns, any extracted file text, anything retrieved. The model reads the prefix and produces what comes next.

That means three small decisions do almost all of the heavy lifting for the answer: what source material to include, where to put it relative to your question, and what to tell the model to ignore. Get those right and the wording of the ask becomes secondary. Get those wrong and no amount of clever phrasing rescues the result.

Feeding the model well is mostly a matter of remembering that the window is small, your attention is the editor, and nothing gets onto the desk unless you put it there.

---

← Previous: [[chats-vs-projects]] · Up: [[start-here]] · Next: [[memory-and-state]] →

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[iterating-on-prompts]]*

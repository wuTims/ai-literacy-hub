---
title: Feeding the model
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [context-engineering, prompting]
---

# Feeding the model

The model thinks with whatever is in front of it this turn (see [[what-is-context]]). Choosing what to put in the window shapes the answer more than the wording of the ask.

A tight selection of relevant material outperforms a large dump of source material, even when the dump contains the right answer somewhere inside it. More material in the window is not more relevant material; often it is less, because the relevant pieces get diluted by everything else.

## Curating, not collecting

Curation works at two levels. The container (a project, a custom GPT, a Gem) decides what's in the window across chats (see [[chats-vs-projects]]). Feeding decides what extra material this turn's window needs.

The failure mode at this layer is the dumping-ground prompt: paste eight documents, ask for "a summary that captures the key points," receive a doc that smooths every contradiction and names no specifics.

| Task                                          | Dumping the material in                                                  | Scoped feed                                                                              |
|-----------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Synthesize across many documents              | Eight unrelated docs, "summarize the key points." Contradictions flatten.| One document at a time, with the audience and the question stated. Synthesize after.     |
| Plan a week from an email backlog             | Whole inbox export, "what should I do this week?" Median advice.         | The flagged threads only, plus the prompter's actual constraints for the week.           |
| Draft in a recognizable voice                 | The author's full archive, "match my voice." Voice averaged across years.| Three pieces from the last quarter, with one line on what makes each one representative. |
| Answer a question grounded in a source        | Long PDF, "what does this say about X?" Plausible paraphrase.            | The PDF plus an instruction to quote the relevant passages before answering.             |
| Extend an in-progress draft                   | The whole document tree, "keep going." Tone drifts toward the median.    | The current draft, the section to extend, and the constraint that breaks the ambiguity.  |

Each row has the same shape: dumping the material in makes the model search for the relevant part; scoping the feed lets the model use it directly.

## Three principles for what goes in

**Specificity beats volume.** A two-paragraph excerpt that contains the load-bearing material outperforms a fifty-page document that contains it on page thirty-one. Every paragraph in the window influences the answer; there is no equivalent of a human reader's skim. Irrelevant length lowers the quality of the answer.

**Long source first, the ask last.** Inside the window, the model attends most heavily to what is closest to the cursor. Source material at the top with the question at the bottom means the source is still close to the cursor when the model writes its answer. Put the question first and the model is already weighting its answer toward whatever appeared at the start.

**Quote before answering.** Ask the model to quote the relevant passages from the source before answering. Once the relevant paragraph is in the window, the next tokens the model produces are shaped by it. The quoting step makes the retrieval visible and checkable.

![[context-management-flow.png]]

## A structural template

A context-rich prompt has a recognizable shape. The template below labels each part; once you have written a few, the labels stop being necessary.

```
ROLE / FRAMING
─────────────────────────────────────────────────────────────
  Who the model is acting as, and for whom.

WHAT TO IGNORE
─────────────────────────────────────────────────────────────
  Material in the source that is out of scope for this ask.
  Saying so explicitly costs less than hoping it is obvious.

SOURCE MATERIAL  (delimited)
─────────────────────────────────────────────────────────────
  --- BEGIN SOURCE ---
    [the actual material, pasted in, clearly bounded]
  --- END SOURCE ---

THE ASK
─────────────────────────────────────────────────────────────
  The single question or deliverable, stated after the source.

DESIRED OUTPUT SHAPE
─────────────────────────────────────────────────────────────
  Length, format, structure, and one example if the shape is
  not obvious from the ask.
```

Each labeled section is a decision the prompter is making. Left implicit, the model fills in the median version.

## What feeding does not solve

Retrieval (letting an application fetch material from a larger corpus and inject it into the window) does not remove the curation problem; it shifts it to whoever decides what to retrieve and how to score relevance. When you use a retrieval-backed tool, ask what it pulled in before trusting the answer; treat the retrieved excerpts as if you had pasted them yourself.

The same caution applies to attached files. A file in a container is not knowledge the model has; it is material the application may surface when it decides the material is relevant. Assume nothing is in the window unless you can see it in the conversation — quote, ask, or paste.

## Why the prefix matters

Choosing the source, ordering it before the ask, and drawing the boundary around what to ignore are the decisions that produce the answer.

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[iterating-on-prompts]]*

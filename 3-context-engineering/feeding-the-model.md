---
title: Feeding the model
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [context-engineering, prompting]
---

# Feeding the model

The model thinks with whatever is in front of it this turn (see [[what-is-context]]). Deciding what to put in front of it is editorial work, not setup.

The discipline is curation, not collection. More material in the window is not more relevant material; often it is less, because the load-bearing pieces sit buried inside the rest.

## Curating, not collecting

Curation works at two levels. The container — a project, a custom GPT, a Gem — decides what should always sit in front of the model across chats (see [[chats-vs-projects]]). Feeding decides what extra material this turn's window needs.

The failure mode at this layer is the dumping-ground prompt: paste eight documents, ask for "a summary that captures the key points," receive a doc that smooths every contradiction and names no specifics. The model has been handed a prefix in which everything is equally weighted, and the output is weighted the same.

| Task                                          | Dumping the material in                                                  | Scoped feed                                                                              |
|-----------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Synthesize across many documents              | Eight unrelated docs, "summarize the key points." Contradictions flatten.| One document at a time, with the audience and the question stated. Synthesize after.     |
| Plan a week from an email backlog             | Whole inbox export, "what should I do this week?" Median advice.         | The flagged threads only, plus the prompter's actual constraints for the week.           |
| Draft in a recognizable voice                 | The author's full archive, "match my voice." Voice averaged across years.| Three pieces from the last quarter, with one line on what makes each one representative. |
| Answer a question grounded in a source        | Long PDF, "what does this say about X?" Plausible paraphrase.            | The PDF plus an instruction to quote the relevant passages before answering.             |
| Extend an in-progress draft                   | The whole document tree, "keep going." Tone drifts toward the median.    | The current draft, the section to extend, and the constraint that breaks the ambiguity.  |

The pattern down the table is the same shape every row: the dump asks the model to find the signal; the scoped feed hands it the signal and asks it to act.

## Three principles for what goes in

**Specificity beats volume.** A two-paragraph excerpt that contains the load-bearing material outperforms a fifty-page document that contains it on page thirty-one. The model does not skim; it conditions on what is there. Length without relevance is noise that competes with the signal for attention.

**Long source first, the ask last.** Inside the window, the model attends most heavily to what is closest to the cursor. Source material at the top with the question at the bottom keeps the source in scope when the answer is formed. The reverse — question stated, then a wall of pasted material — leaves the model writing into the gap before it has finished reading.

**Quote before answering.** Asking the model to surface the relevant passages from the source before it answers is a forcing function for grounded output. A model that has just quoted the paragraph it is relying on writes a different next paragraph than one asked for a conclusion straight away. The quoting step makes the retrieval visible and checkable.

![[context-management-flow.png]]

## A structural template

The shape of a context-rich prompt is legible as a pattern, not a checklist. Once the pattern is familiar, the labels disappear and the structure remains.

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

The template is a reminder of which decisions, if left implicit, the model averages.

## What feeding does not solve

Retrieval — letting an application fetch material from a larger corpus and inject it into the window — does not remove the curation problem. It moves it. Whoever decides what to retrieve, and how to score relevance, is doing the same editorial work by another name. **The behavior to keep:** ask the system what it retrieved before trusting the answer; treat the surfaced excerpts as if you had pasted them yourself.

The same caution applies to attached files. A file in a container is not knowledge the model has; it is material the application may surface when it decides the material is relevant. **The behavior to keep:** assume nothing is in front of the model unless the conversation makes it visible — quote, ask, or paste.

## The prefix is the work

Choosing the source, ordering it before the ask, drawing the boundary around what to ignore — these are decisions that produce the answer, not steps before it. A clean prefix is the work the model amplifies. A messy prefix gets amplified with the same fidelity.

*Related: [[what-is-context]] · [[chats-vs-projects]] · [[iterating-on-prompts]]*

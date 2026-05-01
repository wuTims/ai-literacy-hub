---
title: How not to produce AI slop
created: 2026-04-30
updated: 2026-05-01
status: golden-example
tags: [foundations, habits, slop]
---

# How not to produce AI slop

What separates a useful AI-generated artifact from slop is rarely the model. It's whether the person who prompted it formed a connection to their own work along the way.

That's the thesis of this hub. The rest of this page defines it precisely.

## What slop is

Slop is an artifact produced by a process that looks like this:

```
prompt (one sentence)  →  model output  →  copy / lightly skim  →  send onward
```

The output may be syntactically fine and contain no factual errors. It can still be slop, because nobody who handled it actually engaged with what it said.

Slop is a process failure, not an output property:

- A carefully reviewed AI-generated document is **not** slop.
- A hand-typed document that nobody thought hard about **is**.

## Why the distinction matters

The cost of producing text and code has dropped to near zero. The cost of *understanding* text and code has not.

| | Before LLMs | Now |
|---|---|---|
| Cost to produce a draft | High | ~Zero |
| Cost to understand a draft | Same | Same |
| Where the bottleneck sits | Producer | Reader |

When you ship an artifact you didn't engage with, you've quietly transferred the work of understanding onto whoever reads it next. That person now does two jobs: figure out what the artifact says, and figure out whether they can trust it. Across a team, the cost compounds.

The MIT Media Lab's *Your Brain on ChatGPT* preprint (Kosmyna et al., 2025; n=54, EEG) found that participants who outsourced essay-writing to LLMs showed measurably reduced neural engagement and weaker recall of what they had "written." A preprint with one cohort is not a settled finding, but the direction matches the mechanism: skipping the thinking is the same as not having done the work, regardless of what file ends up on disk.

## Four tests for engagement

Before sending an AI-generated artifact, run these:

| Test | What it checks |
|---|---|
| **Defend** | Could you answer "why does this make this claim?" without saying "the model wrote it"? |
| **Edit** | Did you change anything? A first-pass output is rarely the right shape. |
| **Restate** | Can you summarize the artifact in your own words without re-reading? |
| **Verify** | Did you check the facts, numbers, citations, names, code that has to run? |

If you can't pass all four, the artifact isn't ready.

## How prompts produce slop

Three patterns recur:

**The one-sentence prompt.** *"Write me a project update."* The model has nothing but training-time priors, so it produces the median version. Median work reads like it could have been written about anyone's project.

**The vague prompt with a confident tone.** *"Write a strategic analysis of our market position."* The output reflects what strategic analyses *sound like*, not what your strategic analysis is. Generic voice. Generic claims.

**The dumping-ground prompt.** Pasting eight unrelated documents and asking for "a summary that captures the key points." The model averages everything together, smooths out contradictions, and returns a doc that sounds informed and says nothing.

The corrective in all three: the prompt has to do enough work that *you* know what you're asking for. If you can't write a clear prompt, you don't yet understand the task — and no model patches that gap.

## The habit

Treat every prompt as a draft of the answer.

```
Before sending the prompt:
  Does it read like something written by someone who thought carefully?

After receiving the output:
  Where do you disagree, find vagueness, find things that don't fit?
  If nowhere, you weren't reading carefully.
```

The model is a mirror with extra steps. It reflects the quality of attention you brought to the prompt.

## When AI is the wrong tool

Some tasks resist this discipline because the task itself *is* the thinking:

- Writing in your own voice
- Working out what you actually believe about a hard question
- Drafting feedback for a teammate
- Sketching a plan for a project where you're the one who has to live with the consequences

For tasks like these, AI works as a sounding board — challenge your draft, surface counterarguments, list cases you haven't considered. AI as the *author* is a category error.

The test:

> Would the artifact still have value if it turned out the model wrote every word?

For a research summary the answer is sometimes yes — value lives in the synthesis, not the authorship. For a personal recommendation, a strategic call, or feedback that's supposed to come from you, the answer is no. That's the signal to keep AI in the sounding-board role.

## What this hub is for

Every page about prompting, context engineering, or workflow design is downstream of one habit: forming a real connection to the work AI helps you produce. The mechanics come next. The reason to do it sits here.

---

*Related: [[what-llms-are]] · [[prompt-as-thinking]] · [[which-tool-when]]*

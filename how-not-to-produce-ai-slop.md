---
title: How not to produce AI slop
created: 2026-04-30
updated: 2026-05-10
status: golden-example
tags: [foundations, habits, slop]
---

# How not to produce AI slop

What separates a useful piece of AI-generated work from slop is rarely the model that wrote it. It is whether the person who asked for it stayed connected to their own work along the way — read it carefully, pushed back on it, made it their own.

That is the central idea of this hub. The rest of this page lays out exactly what it means.

## What slop is

Slop is what comes out of a process that looks like this:

```
prompt (one sentence)  →  model output  →  copy / lightly skim  →  send onward
```

The text the model produces may read smoothly, use correct grammar, and contain no factual errors. It can still be slop, because nobody who handled it actually thought about what it said.

Slop is a failure of process, not a property of the words on the page. So:

- A document the model wrote, but a human read closely and edited honestly, is **not** slop.
- A document a human typed by hand but never thought hard about **is** slop.

Notice that the question is never "did a person or a model write this." The question is whether anyone engaged with what is being said.

## Why the distinction matters

The cost of producing text and code has dropped close to zero. The cost of *understanding* text and code has not changed at all.

| | Before LLMs | Now |
|---|---|---|
| Cost to produce a draft | High | ~Zero |
| Cost to understand a draft | Same | Same |
| Where the bottleneck sits | Producer | Reader |

When you send out something you did not engage with yourself, you have quietly handed the work of understanding it to whoever reads it next. That person now has two jobs instead of one: figure out what the document is saying, and figure out whether they can trust it. Multiply that across a team of ten people doing the same thing, and the wasted effort adds up fast. Meetings get longer. Decisions get made on top of claims nobody checked. The team's shared sense of what is true gets fuzzier.

The MIT Media Lab's *Your Brain on ChatGPT* preprint (Kosmyna et al., 2025; n=54, EEG) found that people who handed essay-writing over to LLMs showed measurably lower brain engagement and remembered less of what they had supposedly written. A preprint with one cohort is not a settled finding, and you should not read too much into a single study. But the direction matches what we already know about how learning works: skipping the thinking is the same as not having done the work, no matter what file ends up on disk afterward.

## Four tests for engagement

Before you send out anything an AI helped you write, run it through these four questions:

| Test | What it checks |
|---|---|
| **Defend** | Could you answer "why does this make this claim?" without saying "the model wrote it"? |
| **Edit** | Did you change anything? A first-pass output is rarely the right shape for what you actually need. |
| **Restate** | Could you summarize the document in your own words right now, without re-reading it? |
| **Verify** | Did you check the facts, the numbers, the citations, the names, and any code that has to actually run? |

If you cannot pass all four, the document is not ready to leave your hands.

## How prompts produce slop

Three patterns show up over and over again:

**The one-sentence prompt.** Something like *"Write me a project update."* The model has nothing to work with except the patterns it picked up during training, so it returns the most average version of a project update it can imagine. Average work reads like it could be about anyone's project — which means it tells your reader nothing about *yours*.

**The vague prompt with a confident tone.** Something like *"Write a strategic analysis of our market position."* The model knows what strategic analyses *sound like*, so that is what you get back: the right tone, the right shape, generic claims that could apply to almost any company. The voice is confident. The content is hollow.

**The dumping-ground prompt.** Pasting eight unrelated documents into the chat and asking for "a summary that captures the key points." The model averages everything together, smooths out the places where the documents disagree, and hands you back something that sounds informed and says almost nothing. The disagreements were probably the interesting part. Now they are gone.

The fix in all three cases is the same: the prompt has to do enough work that *you* know what you are asking for. If you cannot write a clear prompt, that is a sign you do not yet understand the task well enough to ask anyone — human or model — to do it for you. No amount of clever prompting patches that gap. The thinking has to happen somewhere, and if the prompt does not contain it, the output will not either.

## The habit

Treat every prompt as a first draft of the answer.

```
Before sending the prompt:
  Does it read like something written by someone who thought carefully?

After receiving the output:
  Where do you disagree, find vagueness, find things that don't fit?
  If nowhere, you weren't reading carefully.
```

The model is a mirror with extra steps. It reflects back the quality of attention you brought to the prompt. Careful, specific input gets careful, specific output. A throwaway prompt gets a throwaway answer dressed up to look like a real one.

## When AI is the wrong tool

Some tasks resist this whole discipline because the task itself *is* the thinking:

- Writing in your own voice
- Working out what you actually believe about a hard question
- Drafting feedback for a teammate
- Sketching a plan for a project where you will be the one who has to live with the consequences

For tasks like these, AI works well as a sounding board. Ask it to challenge your draft, surface counterarguments you missed, or list the cases you did not consider. Use it to sharpen your own thinking. But asking the model to be the *author* of these things is the wrong tool for the job — the value of the work depends on it coming from you.

The test:

> Would the document still have value if it turned out the model wrote every word?

For a research summary the answer is sometimes yes — the value lives in pulling the information together, not in who wrote it. For a personal recommendation, a strategic call, or feedback that is supposed to come from you, the answer is no. That is the sign to keep AI in the sounding-board role and do the writing yourself.

## What this hub is for

Every page in this hub — about prompting, about what context is, about which tool to use when — builds on one habit: staying connected to the work AI helps you produce. The mechanics matter, and the next pages will get into them. But the reason to bother with any of the mechanics sits here. If you skip the connection, the rest is just faster ways to make slop.

---

Up: [[start-here]] · Next: [[what-llms-are]] →

*Related: [[what-llms-are]] · [[prompt-as-thinking]] · [[which-tool-when]]*

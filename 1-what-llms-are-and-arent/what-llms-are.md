---
title: What LLMs are
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [foundations, mental-models]
---

# What LLMs are

When an LLM answers you, it is doing one thing: predicting the next token, then the next, then the next, given everything in front of it. Every other behavior of these models follows from that one fact. Fluent answers on topics barely covered by training data, the same question yielding different answers when re-asked, a small wording change that swings the response from useful to useless, a confident-sounding citation to a paper that does not exist — these all trace back to next-token prediction.

The framing that holds up best in daily use is Simon Willison's: an LLM is a **calculator for words**. A tool for manipulating language, not for retrieving facts.

## How next-token prediction works

Training compresses a vast pile of text into a model that, given any prefix, can score how likely each possible next token is. A token is a fragment of a word — sometimes a whole word, sometimes a few characters. There is no lookup, no database underneath. There is a learned probability distribution over tokens, sampled one token at a time.

A single step looks like this:

```
prompt:    "The capital of France is"
                       │
                       ▼
       ┌──────────────────────────────────┐
       │  probability distribution         │
       │    " Paris"   0.81                │
       │    " a"       0.06                │
       │    " the"     0.04                │
       │    " located" 0.02                │
       │    …          …                   │
       └──────────────────────────────────┘
                       │  (sample)
                       ▼
       output token:   " Paris"
                       │
                       ▼
       new prompt:    "The capital of France is Paris"
                       │
                       ▼                (repeat until stop)
```

The same prompt, run twice, will not always yield the same output. Ask *the capital of France is* and you will get *Paris* almost every time — that distribution is concentrated on one answer. Ask for an opening line to an email and you will get something different on each run — the distribution is wide, and the model is choosing between many continuations that all sound reasonable. This produces two practical actions: save a useful answer before regenerating it (the next run may not match), and when you want range, ask for many variants in one prompt rather than regenerating until something fits.

## What this implies

With the mechanism in mind, the everyday behavior of these models stops being surprising:

- **Eloquence is not evidence.** Fluency is what next-token prediction is best at. Coherent prose says nothing about whether the claims inside it are true.
- **Confidence is not calibrated.** The model has no built-in signal for "the training data did not cover this." It produces plausible-sounding text either way.
- **Recall is unreliable; manipulation is strong.** The model is much better at transforming text the prompter supplies than at retrieving text it might have seen during training. Paste the facts into the prompt; do not trust the model to remember them.
- **Phrasing shifts the distribution.** Two prompts that mean the same thing to a human can produce different outputs, because the model treats them as different inputs.
- **Style is inherited from training data.** Defaults toward an average register — vaguely corporate, vaguely confident — unless the prompt pulls it elsewhere.

## Calculator for words

The single most useful question to ask before reaching for an LLM: *is the task to manipulate language, or to retrieve a fact?*

| Fits the tool                                       | Fights the tool                                  |
|-----------------------------------------------------|--------------------------------------------------|
| Summarize this document                             | Find me the right document                       |
| Rewrite this in a different register                | Tell me what our policy on X is                  |
| Translate this passage                              | Cite a recent paper on Y                         |
| Extract the dates from this email                   | What did the CEO announce last Tuesday           |
| Draft three variants of this paragraph              | Look up this customer's account history          |
| Convert this messy list into a structured table     | Recall the correct phone number for the office   |

Willison notes one weakness in the calculator analogy. A pocket calculator is deterministic; an LLM is not. Two identical prompts can yield different answers, and a prompt that worked yesterday may not work today after a model update.

## What follows

Three category errors follow from "calculator for words": not a search engine, not a database, not a reasoner. They are spelled out next, on [[what-llms-arent]].

A richer framing positions the LLM as the kernel of an emerging operating system that coordinates tools, memory, and external systems. That framing is useful but comes later. For the foundation, the calculator-for-words frame is enough.

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

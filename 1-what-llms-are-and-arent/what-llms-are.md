---
title: What LLMs are
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [foundations, mental-models]
---

# What LLMs are

When an LLM answers you, it is doing one thing: predicting the next token, then the next, then the next, given everything in front of it. That mechanism is the entire story. Every behavior the reader will encounter — fluency, hallucination, sensitivity to phrasing, the unsettling sense of "almost right" — is a consequence of it.

The framing that holds up best in daily use is Simon Willison's: an LLM is a **calculator for words**. A tool for manipulating language. Not a tool for retrieving facts.

## How next-token prediction works

Training compresses a vast pile of text into a model that, given any prefix, can score how likely each possible next token is. A token is a fragment of a word — sometimes a whole word, sometimes a few characters. There is no lookup, no database, no reasoning step underneath. There is a learned probability distribution over tokens, sampled one token at a time.

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

The same prompt, run twice, will not always yield the same output. Sampling is stochastic, and most interfaces add a temperature setting that controls how aggressively the model deviates from its top choice. The model is, by construction, non-deterministic. Treat that as a property to engineer around, not a bug.

## What this implies

Once the mechanism is on the table, the everyday behavior of these models stops being mysterious:

- **Eloquence is not evidence.** Fluency is what next-token prediction is best at. Coherent prose says nothing about whether the claims inside it are true.
- **Confidence is not calibrated.** The model has no built-in signal for "the training data did not cover this." It produces plausible-sounding text either way.
- **Recall is unreliable; manipulation is strong.** The model is much better at transforming text the prompter supplies than at retrieving text it might have seen during training. Paste the facts into the prompt; do not trust the model to remember them.
- **Phrasing shifts the distribution.** Two prompts that mean the same thing to a human can produce different outputs, because they hit different regions of the probability landscape.
- **Style is inherited from training data.** Defaults toward an average register — vaguely corporate, vaguely confident — unless the prompt pulls it elsewhere.

Each behavior follows from "next token, sampled, given context." None of them are surprises once that frame is in hand.

## Calculator for words

The single most useful question to ask before reaching for an LLM: *is the task to manipulate language, or to retrieve a fact?* The first is the job it was built for. The second is the job that produces most disappointment.

| Fits the tool                                       | Fights the tool                                  |
|-----------------------------------------------------|--------------------------------------------------|
| Summarize this document                             | Find me the right document                       |
| Rewrite this in a different register                | Tell me what our policy on X is                  |
| Translate this passage                              | Cite a recent paper on Y                         |
| Extract the dates from this email                   | What did the CEO announce last Tuesday           |
| Draft three variants of this paragraph              | Look up this customer's account history          |
| Convert this messy list into a structured table     | Recall the correct phone number for the office   |

The pattern in the left column: the facts are *in the prompt*, and the model rearranges them. The pattern in the right column: the facts are supposed to come *from the model*, and the model has no reliable way to get them right.

The calculator analogy has one acknowledged weakness, which Willison flags himself. A pocket calculator is deterministic; an LLM is not. Two identical prompts can yield different answers, and a prompt that worked yesterday may not work today after a model update. Build with tolerances. Verify outputs the way an engineer verifies a measurement, not the way a user trusts a search result.

## What it is not

Three negations are worth stating plainly, even though each has its own page:

- An LLM is not a search engine. It does not look anything up.
- An LLM is not a database. Anything it "knows" is encoded in weights, lossy and undated.
- An LLM is not a reasoner in the classical sense. It produces text that often *resembles* reasoning, which is a different thing from doing it.

A richer framing — the LLM as the kernel of an emerging operating system, coordinating tools, memory, and external systems — is useful, but it belongs downstream. For the foundation, the calculator-for-words frame does more work and makes fewer promises.

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

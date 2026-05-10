---
title: Why they hallucinate
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [foundations, hallucination, mental-models]
---

# Why they hallucinate

When you ask a model about something it knows well, it answers in fluent, confident prose. When you ask about something it barely saw during training, it answers in fluent, confident prose. The two answers sound the same. One of them is right and one of them is made up, and there is nothing in the writing itself that tells you which is which.

The industry settled on the word *hallucination* for the second case. A closer description is **persuasive approximation**: the model produces text shaped like an answer, with no separate check that the answer exists. The shape is the easy part. The model is built to produce shapes. Whether the thing inside the shape is real is a different question, and the model is not the one asking it.

## Where the made-up parts come from

The previous page covered the one mechanism: every output **token** — the next little chunk of text — is picked from a ranked list of guesses the model has learned to produce. That ranked list is called a **probability distribution**: the model's guesses for what should come next, with a number on each one saying how likely it thinks that token is. **Sampling** is picking one from that list — usually one of the top-scoring guesses, but not always the very top, which is why the same prompt can give two different answers.

Nothing in that process marks which tokens are coming from well-covered training data and which are guesses. The model emits the most plausible-looking next token in either case, and the prose around it reads the same either way. There is no internal *not sure* signal the reader can trust.

That is the whole story. The rest of this page is a closer look at what it means in practice.

## The mechanism, step by step

Ask the model for a citation it has no real source for, and the production looks like this:

```
prompt:    "Cite a 2021 ACL paper on retrieval-augmented
            generation by an author named Chen."
                       │
                       ▼
       ┌───────────────────────────────────────────────────┐
       │ each token sampled from a learned distribution     │
       │ no separate signal for "this paper exists"         │
       └───────────────────────────────────────────────────┘
                       │
                       ▼
   token 1   "Chen"            common surname in the field
   token 2   ","               citation punctuation
   token 3   " J."             common initial
   token 4   " et al."         most ACL papers are co-authored
   token 5   " (2021)."        year was specified in the prompt
   token 6   " 'Retrieval-"    title fragment matching the topic
   token 7   "Augmented"       completes the term
   token 8   " Generation"     completes the phrase
   token 9   " for Open-"      common ACL title pattern
   token 10  "Domain QA.'"     common ACL title pattern
   token 11  " ACL 2021,"      venue matches the prompt
   token 12  " pp. 142–151."   plausible page-range shape

   output:   a citation that is locally plausible at every
             position and globally non-existent
```

Every step was the most reasonable token given everything that came before it. The model has no list of real papers to consult; it is producing a citation-shaped object out of citation-shaped fragments. When the paper was heavily represented in training, the same process lands on the real one. When it was not, the same process produces this — a citation that reads correctly at every word and refers to nothing.

## Why the model can't tell you when it's guessing

The probability distributions inside the model are over *tokens* — the next word fragment — not over *whether the answer is true*. Those are different things. So a sentence whose phrasing is highly probable in the training data — *Chen et al. (2021)* is exactly the shape ACL citations take — can carry a fact that isn't.

Asking the model "are you sure?" doesn't help. It generates more text from the same machine. Whether the model agrees with itself or backs down tells you nothing about the original answer. It is the same dice rolled a second time, on the same question of *what shape comes next*.

A refusal — *I don't know* — is just another candidate output the model has to rank above the alternatives. On most prompts that ask for a fact, fabrication wins, because text that looks like an answer was rewarded during training and text that looks like *I don't know* was not.

## Shapes and verification

Fabrication takes recognizable shapes. Each one has its own verification step. None of these are exotic — they are what you would do anyway if a stranger handed you the same document and asked you to vouch for it.

| Shape | What it looks like | How to verify |
|---|---|---|
| Citations and URLs | Author names, paper titles, court cases, hyperlinks assembled from shapes that look right for the venue | Open the link. Confirm the paper. Confirm the author. A citation that resists a single click is the default to disbelieve. |
| Names of internal things | APIs, library functions, config flags, command-line options that fit the shape of the SDK | If the code has to actually work, confirm the name exists and is spelled the way the model wrote it. |
| Dates and numbers | Quarters, version numbers, prices, statistics pulled toward the most-quoted training value | Check against a primary source before the document leaves your hands. Re-derive totals and percentages from the source data. |
| Quoted material | Sentences attributed to real people that the real people did not say | Trace direct quotes to the original. Rewrite paraphrases that *sound* like a quote but aren't one. |
| Code that has to run | Invented method calls, hallucinated imports, fabricated config keys | Execution is the verification. Run the code; do not eyeball it. |

## Partial mitigations, not fixes

Search-augmented and retrieval-augmented setups paste real documents into the prompt before the model answers. This *reduces* fabrication on the topics those retrieved documents cover, because the model is now manipulating text the prompter supplied — the kind of task it does well.

It does not eliminate fabrication. A customer-support assistant fed the company's refund policy is unlikely to invent a refund window of "60 days" when the policy in the prompt says 30 — the right number is right there, and the model is good at copying. It can still misquote the conditions. It can still blend two clauses into one. It can still produce a confident answer to an adjacent question the policy never addressed at all, because once the model is generating text, it generates text whether the supporting passage was there or not.

The pattern across this whole page is the same as on the previous two: the model is good at producing the *shape* of an answer. Whether the inside of the shape is true is your job, not the model's. The next page, [[what-theyre-good-and-bad-at]], turns that into a working list of where to lean on the tool and where to keep both hands on the wheel.

---

← Previous: [[what-llms-arent]] · Up: [[start-here]] · Next: [[what-theyre-good-and-bad-at]] →

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*

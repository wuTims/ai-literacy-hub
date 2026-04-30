---
title: Why they hallucinate
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [foundations, hallucination, mental-models]
---

# Why they hallucinate

Fabrication is not a bug in an LLM. It is what the mechanism does on inputs where the training signal was thin, in the same fluent surface it uses on inputs the training signal covered well.

The industry settled on the word *hallucination*. The closer description is **persuasive approximation**: the model produces text shaped like an answer, with no separate check that the answer exists.

## Where fabrication comes from

Every output token is sampled from a probability distribution shaped by training. No second channel runs underneath to mark which regions of that distribution are well-supported and which are extrapolation. The model emits the most plausible-looking continuation in either case, and fluency is identical on both.

There is no internal *not sure* signal the reader can trust. Confidence in the output is a property of the prose, not of the underlying knowledge.

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

Every step was the most reasonable token given everything before it. Nothing in the process consulted a list of real papers, because the model has no list to consult. The same procedure produces a correct citation when the paper was heavily represented in training, and a fabricated one when it was not — fluent surface in both cases.

## Why confidence is uncalibrated

Probability distributions inside the model are over *tokens*, not over *correctness*. A token can carry probability 0.95 because the *phrasing* is highly likely in the training data, while the *fact it asserts* is unsupported. The two are unrelated.

Asking the model "are you sure?" generates more text from the same machine. Agreement is not verification; disagreement is not retraction. Both are continuations sampled the same way as every other token.

A refusal — *no record of that paper* — is itself a token sequence the model must find more probable than the alternatives. On most prompts it does not.

## Shapes and verification

The same mechanism shows up in several recognizable surfaces. Treating fabrication as structural turns verification into a mechanical step. The categories of weakness — see [[what-theyre-good-and-bad-at]] — are stable; the rows shift.

| Shape | What it looks like | How to verify |
|---|---|---|
| Citations and URLs | Author names, paper titles, court cases, hyperlinks assembled from shapes that look right for the venue | Open the link, confirm the paper, confirm the author. A citation that resists a single click is the default to disbelieve. |
| Names of internal things | APIs, library functions, config flags, command-line options that fit the shape of the SDK | If the name is load-bearing, confirm it exists and is spelled the way the model wrote it. |
| Dates and numbers | Quarters, version numbers, prices, statistics pulled toward the most-quoted training value | Check against a primary source before the document leaves your hands. Re-derive totals and percentages from source data. |
| Quoted material | Sentences attributed to real people that the real people did not say | Trace direct quotes to the original. Rewrite paraphrases that *sound* like a quote. |
| Code that has to run | Invented method calls, hallucinated imports, fabricated config keys | Execution is the verification. Run the code; do not eyeball it. |

## Partial mitigations, not fixes

Search-augmented and retrieval-augmented setups paste real documents into the prompt before the model answers. This *reduces* fabrication on the topics the retrieved documents cover, because the model is now manipulating text the prompter supplied — the task it does well. It does not eliminate fabrication. The model can still produce a confident statement absent from the retrieved documents, or stitch fragments together in ways that distort the source. Retrieval is a forcing function for verification, not a replacement for it.

## Verification as a step, not a verdict

Persuasive approximation is the mechanism's default on thin signal. Verification is the workflow it sits inside — the way an engineer reads a measurement: noted, then checked.

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*

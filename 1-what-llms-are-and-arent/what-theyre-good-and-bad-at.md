---
title: What they're good and bad at
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [foundations, capabilities]
---

# What they're good and bad at

Capability is uneven across tasks that look identical from the outside. The unevenness has a stable shape underneath and a moving surface on top.

## The frontier is jagged

Ethan Mollick's term for it is the **jagged frontier**. Two prompts that read like the same task to a human can produce wildly different success rates from the model. A request to summarize a fifty-page document the prompter pastes in is near-solved. A request to summarize "all our exchanges with this customer last quarter" is a category error in the same sentence shape — the second version asks the model to *retrieve* before it manipulates, and retrieval is the half it does badly.

The frontier does not sort by what humans find difficult. Adding a long column of dollar amounts pasted from a statement is a task a reader can verify line by line and many models will get wrong by one entry. Rewriting a paragraph in a specified voice is a task most readers find hard and most models do well. Training shaped what's easy, not intuition.

## A snapshot, paired by domain

Each row pairs two requests in the same domain — one inside the model's strengths, one outside, often by a single word.

| Domain   | Works well now                                          | Fails or drifts now                                            |
|----------|---------------------------------------------------------|----------------------------------------------------------------|
| Email    | Rewrite a draft you've written in a more formal register | Draft a personalized follow-up based on "what we last discussed" |
| Documents | Summarize a fifty-page report you paste into the prompt | Summarize every exchange with this customer over the last quarter |
| Code     | Convert a snippet from Python to TypeScript             | Identify which function in your codebase calls `process_payment` |
| Math     | Explain the intuition behind Bayes' theorem in plain English | Apply Bayes' theorem to update on three sequential pieces of evidence with specific priors |
| Research | Extract every date and dollar figure from a filing you provide | Produce five real, citable papers on lithium-ion degradation |
| Drafting | Turn five bullets you wrote into a tight 200-word paragraph | Write a strategy memo from a one-line brief                   |
| Lists    | Rephrase forty items in parallel grammatical structure  | Count the unique items in a forty-item list and return the number |

The left column gives the model the material; the right column asks the model to supply it. The split inside each row is the jagged frontier in miniature.

> This list will age. Treat it as a snapshot dated to the frontmatter. Re-test before relying on any single row.

## What does not age

The rows move. The categories underneath move much more slowly:

**Reliable strengths:** manipulate, extract, restructure, or generate variants from material in front of the model. The substrate works on what's in the prompt.

**Reliable weaknesses:**

- Retrieve facts from the world, including the prompter's own files unless those files are pasted in.
- Count or enumerate exhaustively — anything where the answer depends on having visited every item.
- Multi-step deduction without external tools — long arithmetic, schedule conflicts, dependency chains.
- Self-assessment — asking "are you sure?" samples more text from the same machine. See [[why-they-hallucinate]].

A capability that sits in the strength column today rarely moves to the weakness column tomorrow. A capability in the weakness column may improve in any given release, but the *shape* of the weakness — answer-from-the-world, exhaustive count, deduction without scratch space — has held across model generations.

## Why the unevenness will not smooth out on a schedule

Capability does not increase along a single axis the reader can chart. A new release closes some gaps and opens others. A model that handles a forty-item count this month may regress on it next month after a tuning pass aimed at something else. Re-test the tasks that matter to you whenever the model under you changes. Trust the categories; verify the rows.

## Calibration, not memorization

The point of the table is not to remember which row goes where. It's to internalize that any new task lands somewhere on a frontier that does not align with human difficulty, and that the only honest way to find out is to try the task and check the output. Hold the categories. Re-test the rows. The good-at column is wider than most readers expect. The bad-at column is sharper-edged than most readers fear.

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

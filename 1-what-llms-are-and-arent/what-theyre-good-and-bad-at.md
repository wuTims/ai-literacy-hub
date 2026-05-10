---
title: What they're good and bad at
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [foundations, capabilities]
---

# What they're good and bad at

If you have used a language model for more than a week, you have probably had this experience: a task you expected to be hard goes perfectly, and a task you expected to be trivial falls apart. The pattern feels random until you realize it isn't. Capability is uneven across tasks that look identical from the outside, and the unevenness has a shape worth learning.

The categories of strength and weakness are stable. The specific tasks inside each category shift from one **model release** to the next — a new version of the model, retrained or retuned, that the company puts out every few months. So the goal of this page is not a permanent list of *do this, not that*. The goal is a way of seeing.

## The frontier is jagged

The researcher Ethan Mollick coined a useful phrase for this: the **jagged frontier**. The boundary between what a model can do and what it cannot is not a smooth curve sorted by difficulty. It is jagged. Two prompts that read like the same task to a human can produce wildly different success rates from the model.

A request to summarize a fifty-page document that you paste into the chat is near-solved. A request to summarize "all our exchanges with this customer last quarter" looks like the same task in plain English, but it asks the model to fetch the exchanges from somewhere first, which is a thing it does poorly. Same shape on the page, very different success rates.

The frontier does not sort by what humans find difficult, either. Adding a long column of dollar amounts pasted from a bank statement is a task a person can verify line by line, and many models will get the total wrong by one entry. Rewriting a paragraph in a specified voice is a task most people find hard and most models do well. What is easy for the model has almost no relation to what is easy for a human.

## A snapshot, paired by domain

The table below pairs two requests in the same domain — one inside the model's strengths, one outside, often separated by a single word. Read across each row and notice how small the change is.

| Domain   | Works well now                                          | Fails or drifts now                                            |
|----------|---------------------------------------------------------|----------------------------------------------------------------|
| Email    | Rewrite a draft you've written in a more formal tone    | Draft a personalized follow-up based on "what we last discussed" |
| Documents | Summarize a fifty-page report you paste into the prompt | Summarize every exchange with this customer over the last quarter |
| Code     | Convert a snippet from Python to TypeScript             | Identify which function in your codebase calls `process_payment` |
| Math     | Explain the intuition behind Bayes' theorem in plain English | Apply Bayes' theorem to update on three sequential pieces of evidence with specific priors |
| Research | Extract every date and dollar figure from a filing you provide | Produce five real, citable papers on lithium-ion degradation |
| Drafting | Turn five bullets you wrote into a tight 200-word paragraph | Write a strategy memo from a one-line brief                   |
| Lists    | Rephrase forty items in parallel grammatical structure  | Count the unique items in a forty-item list and return the number |

The pattern is the same in every row. The left column gives the model the material; the right column asks the model to supply it. Manipulating text you have handed over is what the tool is built for. Going to find that text — or making it up when there is nothing to find — is where things go sideways.

> Test these pairs on your current model before relying on any row. The categories are stable, but any specific task can move a notch in either direction with a new release.

## What does not age

The rows in the table will date. The categories underneath them move much more slowly.

**Reliable strengths.** Anything that asks the model to manipulate, extract, restructure, or generate variants from material you have put in front of it. Translate this passage. Pull every name and date out of this contract. Turn these eight bullets into a paragraph. Give me five subject lines for this email. The material is right there in the prompt, and the model is working on it, not searching for it.

**Reliable weaknesses:**

- **Retrieve facts from the world.** This includes facts the model "should know" from training, *and* facts that live in your own files and inboxes if those files are not pasted in. The model does not have a path out to the internet or to your laptop unless a tool gives it one. Even with a tool, fetching is the part where things still go wrong.
- **Count or enumerate exhaustively.** Anything where the right answer depends on having visited every item. Counting unique names in a list, finding all the bugs in a function, listing every date in a long document — the model will produce a confident number, and the number will often be off by one or two. There is no internal pointer walking the list, only a guess at what *count-shaped* output should look like.
- **Multi-step deduction without external tools.** Long arithmetic, schedule conflicts across many constraints, dependency chains where step five depends on step three. The model can produce text that looks like it worked through the steps. It often did not — the steps and the conclusion are sampled separately, and nothing in the machinery forces them to match.
- **Self-assessment.** Asking "are you sure?" or "double-check that" generates more text from the same model — sometimes catching a real mistake, often walking confidently into a different one. It is not an audit. See [[why-they-hallucinate]].

A capability that sits in the strength column today rarely moves to the weakness column tomorrow. A weakness can improve in any given release — the model might get better at counting, or at long arithmetic, or at finding the right file in a folder. But the *shape* of the weakness has held across model generations: answer-from-the-world, exhaustive count, deduction without scratch space, judging its own output. Every time someone announces those have been "solved," they get partly better and remain worth checking.

## Why the unevenness will not smooth out on a schedule

It is tempting to assume that capability climbs along a single axis you can chart, and that next year's model will be uniformly better than this year's. The reality is messier. A new release closes some gaps and opens others. A model that handles a forty-item count this month may regress on it next month after a tuning pass aimed at something else entirely. Coding ability sometimes improves while writing style gets blander. A new long-context feature shows up and the old short-prompt behavior shifts a little to make room.

That has one practical consequence. Whenever you switch to a new model — your provider rolls out an upgrade, your team adopts a different one, a setting in your tool changes the model behind the scenes — re-test the handful of tasks you actually rely on. Not every task; just the ones whose output you would have been embarrassed by last time if the model had been off. A fifteen-minute spot check will tell you more than any release-notes summary.

The point of this page is not to hand you a list to memorize. It is to give you a way of looking at any prompt and asking, before you press send: *am I asking the model to manipulate something I gave it, or to fetch something I didn't?* That question travels with you across releases. The list of which specific tasks fall on which side will not.

---

← Previous: [[why-they-hallucinate]] · Up: [[start-here]] · Next: [[prompt-as-thinking]] →

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

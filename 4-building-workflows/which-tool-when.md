---
title: Which tool when
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [tools, workflows, decisions]
---

# Which tool when

The four mainstream chat tools — Claude, ChatGPT, Gemini, and Copilot — are not interchangeable. They differ on properties: context window size, retrieval defaults, integration surface, default output shape. A recommendation that names one of those earns its slot. "More thoughtful" and "more conversational" are vibes, and vibes age worse than properties.

This is the only page in the hub that recommends. Elsewhere the hub stays neutral; here the work is to choose.

![[tool-selection-decision-tree.png]]

## What the four tools actually are right now

Each of the four occupies a slot defined by a small number of properties.

- **Claude.** Default output skews longer-form and structured. Reliable on long pasted source. Strong fit when the task is to read a lot of source material and produce a careful artifact.
- **ChatGPT.** Broadest first-party tool surface — image generation, voice, file analysis, custom GPTs, web search. Strong fit when the task needs more than chat and the alternative is wiring up several products.
- **Gemini.** Tight integration with Google Workspace — Gmail, Docs, Drive, Calendar; Workspace Intelligence (Apr 2026) reads across the suite. Web-grounded answers by default. Strong fit when the artifact already lives in Google's stack or the question is about current public information.
- **Copilot (Microsoft 365).** Embedded inside Word, Excel, Outlook, and Teams. The artifact never leaves the document. Weakest of the four as a standalone chat; strongest as an in-document assistant when the file is already open.

## The decision matrix

The table is a snapshot. Capabilities shift; check the dates in the frontmatter before treating any cell as current. Each cell names a fit level and the property behind it.

| Task                                              | Claude                              | ChatGPT                              | Gemini                              | Copilot                              |
|---------------------------------------------------|-------------------------------------|--------------------------------------|-------------------------------------|--------------------------------------|
| Long-document research, 50+ pages                 | Strong — long pasted source         | Workable — smaller window            | Workable — Drive ingest             | Weak — limited paste surface         |
| Drafting prose in your own voice                  | Strong — structured longform default| Fits — flexible register             | Workable — neutral default          | Workable — only inside Word          |
| Summarizing documents you provide                 | Strong — window holds the source    | Strong — tight on uploads            | Fits — best when source is in Drive | Fits — best when source is the open doc |
| Planning, breaking a goal into steps              | Strong — structured longform default| Strong — plus tool calls             | Workable — less structured          | Weak — outside its surface           |
| Email or message drafting in Gmail or Outlook     | Workable — copy-paste round trip    | Workable — copy-paste round trip     | Strong — Gmail-native               | Strong — Outlook-native              |
| Extracting structure from messy notes             | Strong — handles long, mixed source | Strong — reliable on shorter input   | Fits — short input fine             | Fits — inside the document           |
| Web-grounded factual lookup                       | Workable — search opt-in            | Fits — search built in               | Strong — search is the default      | Workable — varies by surface         |
| Spreadsheet operations on a live workbook         | Weak — no workbook access           | Workable — code interpreter on uploads| Workable — Sheets integration       | Strong — Excel-native                |

Two patterns run through the table. Tasks where the artifact's *shape* matters — structured longform, prose drafting — favor Claude's defaults. Tasks dominated by *where the artifact lives* go to whichever vendor owns the surrounding software — Gemini for Google, Copilot for Microsoft. ChatGPT fits where the task needs ad-hoc tools without a host application.

## When to step outside the chat interface entirely

Some tasks are wrong for chat regardless of which chat. Chat is a turn-by-turn channel where the user steers every step. For work that recurs, persists, or branches on its own results, that shape stops paying.

- **The same prompt every Monday.** A recurring task is a workflow, not a chat. Rebuilding the context each time is wasted motion. See [[personal-workflows]].
- **The output never leaves the document.** If the artifact lives in a Google Doc, a Word file, or an inbox thread, the in-document assistant beats round-tripping a chat tab.
- **The task branches on its own results.** Once the work reads "do X, then based on what X says do Y or Z," chat is the wrong shape — see [[chatbot-vs-agent]].
- **The artifact has to come from you.** Recommendation letters, feedback for a teammate, anything where authorship is the point. AI works as a sounding board, not author.

## A prompt that survives the choice

Tool choice is a marginal optimization. The prompt matters more than which of the four sees it, and a structural prompt translates across all of them.

```
Role:    Who you want the model to act as.
Context: What it needs to know that isn't already obvious.
Source:  The material to work from. Pasted in full, not summarized.
Task:    The single thing to produce. One verb, one object.
Format:  Length, structure, tone. Concrete, not adjectival.
```

A prompt this shape performs within a tier of itself across all four tools. The differences in the table are real and worth using. They are smaller than the difference between a prompt that decides what it wants and a prompt that does not.

*Related: [[chatbot-vs-agent]] · [[personal-workflows]] · [[what-is-context]]*

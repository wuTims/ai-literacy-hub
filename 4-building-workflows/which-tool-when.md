---
title: Which tool when
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [tools, workflows, decisions]
---

# Which tool when

Claude, ChatGPT, Gemini, and Copilot are the four mainstream chat tools, and they are not interchangeable. They differ on properties: context window size, retrieval defaults, integration surface, default output shape. A recommendation that names one of those earns its slot. Adjectives like "more thoughtful" or "more conversational" describe a single model release. They go stale within months.

This is the only page in the hub that names specific tools.

![[tool-selection-decision-tree.png]]

## What the four tools actually are right now

- **Claude.** Tends to produce longer, more structured output by default. Reliable on long pasted source. Strong fit when the task is to read a lot of source material and produce a careful artifact.
- **ChatGPT.** Broadest first-party tool surface — image generation, voice, file analysis, custom GPTs, web search. Strong fit when the task needs more than chat and the alternative is wiring up several products.
- **Gemini.** Tight integration with Google Workspace — Gmail, Docs, Drive, Calendar; Workspace Intelligence (Apr 2026) reads across the suite. Web-grounded answers by default. Strong fit when the artifact already lives in Google's stack or the question is about current public information.
- **Copilot (Microsoft 365).** Embedded inside Word, Excel, Outlook, and Teams. Output stays inside the file you're already editing. Strong as an in-document assistant when the file is already open; weak otherwise.

## The decision matrix

Each cell names a fit level and the property behind it.

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

Pick by what dominates the task — output shape or where the file lives. Shape-driven tasks (structured longform, prose drafting) go to Claude. Location-driven tasks go to whoever owns the host app: Gemini for Google, Copilot for Microsoft. ChatGPT fits where the task needs ad-hoc tools without a host application.

## When to step outside the chat interface entirely

Some tasks fit poorly in a chat interface no matter which one.

- **The same prompt every Monday.** A recurring task is a workflow, not a chat. Rebuilding the context each time is wasted motion. See [[personal-workflows]].
- **The output never leaves the document.** If the artifact lives in a Google Doc, a Word file, or an inbox thread, the in-document assistant beats round-tripping a chat tab.
- **The task branches on its own results.** Once the work reads "do X, then based on what X says do Y or Z," chat won't carry it; see [[chatbot-vs-agent]].
- **The artifact has to come from you.** Recommendation letters, feedback for a teammate, anything where authorship is the point. AI works as a sounding board for these.

## A prompt that survives the choice

A well-structured prompt produces comparable output across all four tools. The differences in the table are real, but a clear prompt matters more than which of the four sees it.

```
Role:    Who you want the model to act as.
Context: What it needs to know that isn't already obvious.
Source:  The material to work from. Pasted in full, not summarized.
Task:    The single thing to produce. One verb, one object.
Format:  Length, structure, tone. Concrete, not adjectival.
```

*Related: [[chatbot-vs-agent]] · [[personal-workflows]] · [[what-is-context]]*

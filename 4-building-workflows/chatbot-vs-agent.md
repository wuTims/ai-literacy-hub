---
title: Chatbot vs. agent
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [workflows, agents, mental-models]
---

# Chatbot vs. agent

There is one question that tells you whether a piece of AI software is a chatbot or an agent, and it has nothing to do with what the company on the website calls it.

> **Does the model act between your turns?**

A chatbot waits. You type, it replies, it waits again. Nothing happens in the gap between your messages — the program is just sitting there until you say something next. An agent is different. After you tell it what you want, it goes off and *does things on its own*: opens files, runs programs, sends requests over the internet, looks at what came back, decides what to do next. By the time it talks to you again, the world has changed a little. That is the line.

Hold onto that test. Half the confusion around this topic comes from companies stamping the word "agent" on whatever they are shipping this quarter, and the test lets you ignore the marketing and look at the actual behavior.

## A cleaner definition

Mitchell Hashimoto, who builds developer tools for a living, wrote down the version of this that engineers find most useful: an agent is an LLM that can chat *and invoke external behavior in a loop*. The minimum capabilities are reading files, running programs, and making HTTP requests. Anything missing those three is a chatbot dressed up in agent vocabulary.

Take inbox triage. A system that reads each thread in your inbox, drafts a reply, and sends the reply once it looks reasonable is an agent: you described the goal once, and the program is doing the work — read, decide, write, send — on its own. Compare that to a chatbot you ask "summarize my unread mail." The chatbot can't open your inbox. It can only answer with whatever you paste into the box.

For non-engineers, the same distinction in plain terms:

- **Chatbot.** Turn-by-turn. You initiate every step.
- **Agent.** Reads, fetches, opens, sends, and edits *between* your prompts rather than only *during* them.

```
AGENT
  you ── goal ──▶ model ── (read → call → edit → check) ──▶ result
                          ↑                              │
                          └────── loops as needed ───────┘
```

Anthropic, the company that makes Claude, splits the agent category into two finer ideas. A *workflow* runs through a list of steps that someone wrote out in advance — the model just fills in the blanks at each step. A true *agent* picks the steps itself based on what it finds along the way. That difference matters when you build one of these systems, because picking your own steps is much harder to debug than filling in someone else's. For everyday tool selection, you can lump them together: anything that does work between your turns is on the agent side of the line.

## What's already in your tools

Here is the thing that surprises people: the agentic features are already inside the chat tools you use every day. Most of them go unused because nobody clicked past the chat box. ([[which-tool-when]] handles the cross-tool comparison.)

- **ChatGPT.** Tasks and scheduled runs; tool calls inside conversations.
- **Claude.** Tool use via Projects and Connectors; computer use via API and the desktop app; Routines for cloud-hosted scheduled runs.
- **Gemini in Workspace.** Drafting, scheduling, and sending across Gmail, Calendar, and Drive; Workspace Intelligence reads across the suite (Apr 2026); Scheduled Actions for recurring prompts.
- **Microsoft 365 Copilot.** Agent Mode in Word, Excel, and PowerPoint (GA Apr 2026); named Word/Excel/PowerPoint Agents in Copilot chat; in-app actions across Outlook and Teams.

These features start mattering the moment your work touches multiple apps, branches based on what it finds, or repeats often enough to be worth saving.

## Which to reach for

| Task                                                | Reach for chatbot?         | Reach for agent?           | Why                                                                  |
|-----------------------------------------------------|----------------------------|----------------------------|----------------------------------------------------------------------|
| Drafting prose in your own voice                    | Yes                        | Skip                       | Authorship is the deliverable; verification loop is slow.            |
| Summarizing one document you paste in               | Yes                        | Overkill                   | One turn does it; nothing external to call.                          |
| Triaging an inbox of 80 unread threads              | Workable, slow             | Strong fit                 | Branches per message; reading and drafting become tools.             |
| Pulling numbers from a folder of PDFs into a sheet  | Tedious                    | Strong fit                 | Multi-tool: read each file, write the sheet, verify totals.          |
| Scheduling across calendars and an email thread     | Weak                       | Strong fit                 | Calendar to email to doc; you spend more time pasting than asking.   |
| Talking through a hard decision                     | Strong                     | Skip                       | The thinking *is* the deliverable; action does not help.             |
| Recurring weekly summary across tools               | Weak                       | Strong fit                 | Recurring + multi-tool; the same prompt every week is a workflow.    |
| Researching a topic with web sources                | Fits for narrow scope      | Fits for broad scope       | Agents shrink retrieval; chat works if scope stays small.            |

Single-window tasks — writing a paragraph, summarizing something you pasted in, thinking through a decision — work in chat. Tasks that spread across files, tools, or weeks need an agent, because without one *you* are the agent: you become the thing copying data from the calendar to the email to the doc to the spreadsheet.

That is worth saying directly. If you spend more time moving data between windows than thinking about the task, you have demoted yourself into the role the model should be playing.

## Friction signals

You can usually feel a chat tool running out of room before you can explain why. Watch for these five signs. When three or more fire on the same task, prompt iteration has stopped paying.

- **The same prompt every Monday.** A recurring task is a workflow in disguise. Rebuilding the context from scratch every week is motion you don't need to be doing.
- **The output never leaves the document.** If the final piece of writing is going to live in a Google Doc, a Word file, or an email thread, the in-document agent beats round-tripping a separate chat tab.
- **The task branches on its own results.** When the work reads "do X, then based on what X says, do either Y or Z" — every branch becomes another copy-paste trip that you are personally running.
- **Data is being moved between tools.** Calendar to email to doc to spreadsheet. Each hop is a step you are doing on the model's behalf.
- **The same three-step prompt, on repeat.** A sequence you have memorized is begging to be saved — as a custom GPT, a Claude Project, a scheduled task, or a small script.

When most of these fire at once, the task has outgrown the chat window. See [[when-workflows-graduate]] for what to build next.

---

← Previous: [[which-tool-when]] · Up: [[start-here]] · Next: [[personal-workflows]] →

*Related: [[which-tool-when]] · [[personal-workflows]] · [[when-workflows-graduate]]*

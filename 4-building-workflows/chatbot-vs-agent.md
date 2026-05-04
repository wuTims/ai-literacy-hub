---
title: Chatbot vs. agent
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [workflows, agents, mental-models]
---

# Chatbot vs. agent

A chatbot only acts when you send a prompt; an agent can act between your prompts. That mechanical difference is what separates the two.

## What counts as an agent

Mitchell Hashimoto's working definition is the cleanest one available: an agent is an LLM that can chat *and invoke external behavior in a loop*. The minimum capabilities are reading files, running programs, and making HTTP requests. An inbox-triage system that reads each thread, drafts replies, and sends them is an agent: the user describes the goal, the system does the rest. Tools that lack those three capabilities are chatbots, even when the vendor markets them as "agents."

For non-engineers, the same distinction in plainer terms:

- **Chatbot.** Turn-by-turn. The user initiates every step.
- **Agent.** Reads, fetches, opens, sends, and edits between prompts rather than during them.

```
AGENT
  you ── goal ──▶ model ── (read → call → edit → check) ──▶ result
                          ↑                              │
                          └────── loops as needed ───────┘
```

Anthropic distinguishes two cases inside the agent category: a workflow executes predefined steps the model fills in, while an agent picks the steps itself. That distinction matters when you build one. When you choose between tools, treat anything that runs steps between your turns as an agent.

## What's already in your tools

Agentic features are already inside the chat tools you use. The question for the reader is which tasks they fit. ([[which-tool-when]] handles the cross-tool comparison.)

- **ChatGPT.** Tasks and scheduled runs; tool calls inside conversations.
- **Claude.** Tool use via Projects and Connectors; computer use via API and the desktop app; Routines for cloud-hosted scheduled runs.
- **Gemini in Workspace.** Drafting, scheduling, and sending across Gmail, Calendar, and Drive; Workspace Intelligence reads across the suite (Apr 2026); Scheduled Actions for recurring prompts.
- **Microsoft 365 Copilot.** Agent Mode in Word, Excel, and PowerPoint (GA Apr 2026); named Word/Excel/PowerPoint Agents in Copilot chat; in-app actions across Outlook and Teams.

Most readers have only typed into the chat box. The features above are available in those products but go unused on most tasks. They start mattering when work touches multiple apps, branches on intermediate results, or repeats often enough to be worth saving.

## Which to reach for

| Task                                                | Reach for chatbot?         | Reach for agent?           | Why                                                                  |
|-----------------------------------------------------|----------------------------|----------------------------|----------------------------------------------------------------------|
| Drafting prose in your own voice                    | Yes                        | Skip                       | Authorship is the deliverable; verification loop is slow.            |
| Summarizing one document you paste in               | Yes                        | Overkill                   | One turn does it; nothing external to call.                          |
| Triaging an inbox of 80 unread threads              | Workable, slow             | Strong fit                 | Branches per message; reading and drafting become tools.             |
| Pulling numbers from a folder of PDFs into a sheet  | Tedious                    | Strong fit                 | Multi-tool: read each file, write the sheet, verify totals.          |
| Scheduling across calendars and an email thread     | Weak                       | Strong fit                 | Calendar → email → doc; the user spends more time pasting than asking. |
| Talking through a hard decision                     | Strong                     | Skip                       | The thinking *is* the deliverable; action does not help.             |
| Recurring weekly summary across tools               | Weak                       | Strong fit                 | Recurring + multi-tool; the same prompt every week is a workflow.    |
| Researching a topic with web sources                | Fits for narrow scope      | Fits for broad scope       | Agents compress retrieval; chat works if scope stays small.          |

Single-window tasks (drafting, summarizing pasted material, thinking through a decision) work in chat. Tasks that spread across files, tools, or weeks need an agent: in a chat tool, the user has to copy data between steps manually.

## Friction signals

When three or more of these fire together, prompt iteration stops paying.

- **The same prompt every Monday.** A recurring task is a workflow. Rebuilding the context each week is wasted motion.
- **The output never leaves the document.** If the artifact lives in a Doc, a sheet, or an inbox thread, the in-document agent beats round-tripping a chat tab.
- **The task branches on its own results.** When the work reads "do X, then based on what X says do Y or Z," every branch becomes another round-trip the user runs by hand.
- **Data is being moved between tools.** Calendar to email to doc to spreadsheet. Each copy-paste is a step the user is performing for the model.
- **The same three-step prompt, on repeat.** A sequence the prompter has memorized is asking to be saved — as a custom GPT, a Project, a scheduled task, a script.

If most of these fire at once, the task needs more structure than a chat window provides. See [[when-workflows-graduate]] for what to build next.

*Related: [[which-tool-when]] · [[personal-workflows]] · [[when-workflows-graduate]]*

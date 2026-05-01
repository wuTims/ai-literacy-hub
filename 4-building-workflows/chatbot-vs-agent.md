---
title: Chatbot vs. agent
created: 2026-04-30
updated: 2026-05-01
status: active
tags: [workflows, agents, mental-models]
---

# Chatbot vs. agent

A chatbot waits for your next turn. An agent does not. The line between them is not a UI distinction; it is whether the model is allowed to act in the world between your turns.

## Where the line actually sits

Mitchell Hashimoto's working definition is the cleanest one available: an agent is an LLM that can chat *and invoke external behavior in a loop*. Minimum capabilities — read files, execute programs, make HTTP requests. Below that line, the system is a chatbot, whatever its marketing page calls it.

For non-engineers, the same line redrawn:

- **Chatbot.** Turn-by-turn. The user steers every step. Every action runs through the user's hands.
- **Agent.** Runs steps on its own between turns. Reads, fetches, opens, sends, edits — between prompts, not in response to one.

```
AGENT
  you ── goal ──▶ model ── (read → call → edit → check) ──▶ result
                          ↑                              │
                          └────── loops as needed ───────┘
```

Anthropic draws a finer line inside the "agent" half — a workflow follows predefined steps that the model fills in; a true agent picks the steps itself. That distinction matters when building one. For choosing whether to reach for one, *anything that runs steps between your turns* is on the agent side.

## Where agent capability already lives

Agentic capability is already inside the chat tools you use. The question is task-fit, not access. ([[which-tool-when]] handles the cross-tool comparison; this page handles the chat-vs-agent line.)

- **ChatGPT.** Tasks and scheduled runs; tool calls inside conversations.
- **Claude.** Tool use inside Projects; computer use via API and select desktop surfaces.
- **Gemini in Workspace.** Drafting, scheduling, and sending across Gmail, Calendar, and Drive.
- **Microsoft 365 Copilot.** In-app actions inside Word, Excel, Outlook, and Teams; named agents alongside.

A reader who has only typed into the chat box has been on the chatbot side by default. Stepping over the line is a noticing problem, not an access problem.

## Which to reach for

Snapshot, early 2026. Capabilities shift fast in this row of the matrix; check the frontmatter date.

| Task                                                | Reach for chatbot?         | Reach for agent?           | Why                                                                  |
|-----------------------------------------------------|----------------------------|----------------------------|----------------------------------------------------------------------|
| Drafting prose in your own voice                    | Yes                        | Wrong shape                | Authorship is the deliverable; verification loop is slow.            |
| Summarizing one document you paste in               | Yes                        | Overkill                   | One turn does it; nothing external to call.                          |
| Triaging an inbox of 80 unread threads              | Workable, slow             | Strong fit                 | Branches per message; reading and drafting become tools.             |
| Pulling numbers from a folder of PDFs into a sheet  | Tedious                    | Strong fit                 | Multi-tool: read each file, write the sheet, verify totals.          |
| Scheduling across calendars and an email thread     | Weak                       | Strong fit                 | Calendar → email → doc; chat is a paste buffer.                      |
| Talking through a hard decision                     | Strong                     | Wrong shape                | The thinking *is* the deliverable; action does not help.             |
| Recurring weekly summary across tools               | Weak                       | Strong fit                 | Recurring + multi-tool; the same prompt every week is a workflow.    |
| Researching a topic with web sources                | Fits for narrow scope      | Fits for broad scope       | Agents compress retrieval; chat works if scope stays small.          |

Two patterns run through the table. Work that happens inside one window — drafting, summarizing pasted material, thinking through a decision — stays on the chatbot side. Work that spreads across files, tools, or weeks moves to the agent side, because chat cannot keep up with steps it has to ferry by hand.

## Friction signals

When several of these fire together, a better prompt is not the answer.

- **The same prompt every Monday.** A recurring task is a workflow, not a chat. Rebuilding the context each week is wasted motion.
- **The output never leaves the document.** If the artifact lives in a Doc, a sheet, or an inbox thread, the in-document agent beats round-tripping a chat tab.
- **The task branches on its own results.** Once the work reads "do X, then based on what X says, do Y or Z," the chat shape stops paying.
- **Data is being moved between tools.** Calendar to email to doc to spreadsheet. Each copy-paste is a step the user is performing for the model.
- **The same three-step prompt, on repeat.** A sequence the prompter has memorized is asking to be saved — as a custom GPT, a Project, a scheduled task, a script. Not another chat.

When most of these fire at once, the next step is engineering the surface itself, not the prompt. See [[when-workflows-graduate]].

*Related: [[which-tool-when]] · [[personal-workflows]] · [[when-workflows-graduate]]*

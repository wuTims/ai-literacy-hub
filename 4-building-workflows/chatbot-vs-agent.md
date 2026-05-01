---
title: Chatbot vs. agent
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [workflows, agents, mental-models]
---

# Chatbot vs. agent

A chatbot waits for your next turn. An agent does not. The line between them is not a UI distinction; it is whether the model is allowed to act in the world between your turns.

## Where the line actually sits

Mitchell Hashimoto's working definition is the cleanest in circulation: an agent is an LLM that can chat *and invoke external behavior in a loop*. Minimum capabilities — read files, execute programs, make HTTP requests. Below that line, the system is a chatbot, whatever its marketing page calls it.

For non-engineers, the same line redrawn:

- **Chatbot.** Turn-by-turn. The user steers every step. Every action runs through the user's hands.
- **Agent.** Runs steps on its own between turns. Reads, fetches, opens, sends, edits — without the user in the middle of each step.

```
CHATBOT
  you ── prompt ──▶ model ── reply ──▶ you ── next prompt ──▶ …

AGENT
  you ── goal ──▶ model ── (read → call → edit → check) ──▶ result
                          ↑                              │
                          └────── loops as needed ───────┘
```

Anthropic draws a finer line inside the "agent" half — a workflow follows predefined steps that the model fills in; a true agent picks the steps itself. That distinction matters when building one. For choosing whether to reach for one, *anything that runs steps between your turns* is on the agent side.

## What the agent surfaces look like today

Agentic capability is already inside the chat tools the audience uses. The question is task-fit, not access.

- **ChatGPT.** Tasks and scheduled runs; tool calls inside conversations.
- **Claude.** Tool use inside Projects; computer use in preview surfaces.
- **Gemini in Workspace.** "Draft the reply, schedule the meeting, send the doc" inside Gmail, Calendar, and Drive.
- **Microsoft 365 Copilot.** In-app actions inside Word, Excel, Outlook, and Teams; named agents in the Teams sidebar.

A reader who has only typed into the chat box has been on the chatbot side by default. Stepping over the line is a question of noticing when the work asks for it.

## Reach for which, and why

The table is a snapshot. Capabilities shift; check the frontmatter date before treating any cell as current.

| Task                                                | Reach for chatbot?         | Reach for agent?           | Why                                                                  |
|-----------------------------------------------------|----------------------------|----------------------------|----------------------------------------------------------------------|
| Drafting prose in your own voice                    | Yes                        | Not yet                    | Authorship is the deliverable; verification loop is slow.            |
| Summarizing one document you paste in               | Yes                        | Overkill                   | One turn does it; nothing external to call.                          |
| Triaging an inbox of 80 unread threads              | Workable, slow             | Strong fit                 | Branches per message; reading and drafting become tools.             |
| Pulling numbers from a folder of PDFs into a sheet  | Tedious                    | Strong fit                 | Multi-tool: read each file, write the sheet, verify totals.          |
| Scheduling across calendars and an email thread     | Weak                       | Strong fit                 | Calendar → email → doc; chat is a paste buffer.                      |
| Talking through a hard decision                     | Strong                     | Wrong shape                | The thinking *is* the deliverable; action does not help.             |
| Every Monday, summarize last week's tickets and post| Weak                       | Strong fit                 | Recurring + multi-tool; the same prompt every week is a workflow.    |
| Researching a topic with web sources                | Fits for narrow scope      | Fits for broad scope       | Agents compress retrieval; chat works if scope stays small.          |

Two patterns run through the table. Work that happens inside one window — drafting, summarizing pasted material, thinking through a decision — stays on the chatbot side. Work that spreads across files, tools, or weeks moves to the agent side, because chat cannot keep up with steps it has to ferry by hand.

## Friction signals that mean a chat-based workflow has graduated

When several of these fire together, a better prompt is not the answer.

- **The same prompt every Monday.** A recurring task is a workflow, not a chat. Rebuilding the context each week is wasted motion.
- **The output never leaves the document.** If the artifact lives in a Doc, a sheet, or an inbox thread, the in-document agent beats round-tripping a chat tab.
- **The task branches on its own results.** Once the work reads "do X, then based on what X says, do Y or Z," the chat shape stops paying.
- **Data is being moved between tools.** Calendar to email to doc to spreadsheet. Each copy-paste is a step the user is performing for the model.
- **The same three-step prompt, on repeat.** A sequence the prompter has memorized is asking to be saved — as a custom GPT, a Project, a scheduled task, a script. Not another chat.

When most of these fire at once, the next step might not be a better chat tool. It might be engineering the surface itself. See [[when-workflows-graduate]].

## Fit, not future

Chat is not outdated. Agents are not required. The right interaction model depends on whether the work has a fast verification loop and whether the steps live inside one document or across many. Use the chatbot when the work *is* the talking. Reach for the agent when the work happens *between* the talking.

*Related: [[which-tool-when]] · [[personal-workflows]] · [[when-workflows-graduate]]*

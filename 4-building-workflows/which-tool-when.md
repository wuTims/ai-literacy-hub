---
title: Which tool when
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [tools, workflows, decisions]
---

# Which tool when

People ask which AI chatbot is "the best" the way they ask which car is the best. The honest answer is the same in both cases: it depends on what you are trying to do with it. A pickup truck and a hatchback are both fine vehicles. One of them is wrong for the trip you are taking right now.

This page names the four mainstream chat tools — Claude, ChatGPT, Gemini, and Copilot — and matches them to tasks. It is the only page in the hub that gets specific about products, because the differences between them are real and worth knowing. Adjectives like "more thoughtful" or "friendlier" describe a single model release and go stale within months. What does not go stale is the shape of each tool: how big a chunk of source it can hold, what other apps it plugs into, where the output lands when it is done.

![[tool-selection-decision-tree.png]]

## What the four tools actually are right now

A quick tour, in plain terms. Each tool has a personality that comes less from the model and more from the company's choices about what to wrap around it.

- **Claude.** Tends to produce longer, more structured output by default. Comfortable with a lot of pasted-in source material — you can drop in a fifty-page document and ask questions about it. Strong fit when the task is to read a pile of material and produce a careful artifact at the end.
- **ChatGPT.** The Swiss Army knife. It has the widest set of first-party extras built in — image generation, voice mode, file analysis, custom GPTs, web search. Strong fit when the task needs more than a chat window and the alternative is stitching together several different products.
- **Gemini.** Wired into Google Workspace — Gmail, Docs, Drive, Calendar. The 2026 Workspace Intelligence rollout lets it read across the whole suite. Web search is the default behavior, not an opt-in. Strong fit when the artifact already lives in Google's stack or when the question is about current public information.
- **Copilot (Microsoft 365).** Lives inside the Microsoft apps. When you call it, it pops out of the corner of Word, Excel, Outlook, or Teams, and the output lands directly in the file you are already editing. Strong as an in-document assistant when the file is already open in front of you; not really designed for anything else.

Notice the pattern. Two of these tools are good *anywhere* (Claude and ChatGPT, the standalone chat apps). Two of them are good *somewhere specific* (Gemini in Google's apps, Copilot in Microsoft's). That distinction runs underneath the whole decision matrix below.

## The decision matrix

Each cell names a fit level — Strong, Fits, Workable, or Weak — and the property behind the call. Read across the row for the task you are doing.

| Task                                              | Claude                              | ChatGPT                              | Gemini                              | Copilot                              |
|---------------------------------------------------|-------------------------------------|--------------------------------------|-------------------------------------|--------------------------------------|
| Long-document research, 50+ pages                 | Strong — long pasted source         | Workable — smaller window            | Workable — Drive ingest             | Weak — limited paste surface         |
| Drafting prose in your own voice                  | Strong — structured longform default| Fits — flexible tone                 | Workable — neutral default          | Workable — only inside Word          |
| Summarizing documents you provide                 | Strong — window holds the source    | Strong — tight on uploads            | Fits — best when source is in Drive | Fits — best when source is the open doc |
| Planning, breaking a goal into steps              | Strong — structured longform default| Strong — plus tool calls             | Workable — less structured          | Weak — outside its surface           |
| Email or message drafting in Gmail or Outlook     | Workable — copy-paste round trip    | Workable — copy-paste round trip     | Strong — Gmail-native               | Strong — Outlook-native              |
| Extracting structure from messy notes             | Strong — handles long, mixed source | Strong — reliable on shorter input   | Fits — short input fine             | Fits — inside the document           |
| Web-grounded factual lookup                       | Workable — search opt-in            | Fits — search built in               | Strong — search is the default      | Workable — varies by surface         |
| Spreadsheet operations on a live workbook         | Weak — no workbook access           | Workable — code interpreter on uploads| Workable — Sheets integration       | Strong — Excel-native                |

Two questions get you to the right column most of the time:

1. **What shape is the output?** If you need a long, careful, well-structured piece of writing built from pasted-in source material, the answer is usually Claude. If you need a mix of writing and other moves — image, search, file analysis — in the same session, the answer is usually ChatGPT.
2. **Where does the file live?** If the artifact already exists inside a Google Doc, a Gmail thread, or a Drive folder, Gemini saves you a round trip. If it lives inside Word, Excel, Outlook, or Teams, Copilot does the same.

Shape-driven tasks go to the standalone chat apps. Location-driven tasks go to whichever host already owns the file. ChatGPT is the right pick when the task is shape-driven *and* needs ad-hoc tools — search, image, code — without leaving the chat.

## When to step outside the chat interface entirely

Sometimes none of the four is the right answer, because the task itself does not fit a chat window. Watch for these patterns:

- **The same prompt every Monday.** If you find yourself typing roughly the same instructions on a schedule, you do not have a chat task — you have a workflow. Rebuilding the context every time you open a tab is wasted motion. See [[personal-workflows]].
- **The output never leaves the document.** If the final artifact is going to sit inside a Google Doc, a Word file, or an inbox thread, the in-document assistant beats copying answers out of a chat tab and pasting them back in.
- **The task branches on its own results.** Once the work starts to read "do X, then depending on what X says, do either Y or Z, and then check whether the answer is right" — that is not a chat anymore. That is an agent task. See [[chatbot-vs-agent]].
- **The artifact has to come from you.** Recommendation letters, feedback for a teammate, a personal call you are responsible for — anything where the authorship is the point. AI is fine as a sounding board for these; it is the wrong tool to be the author.

## A prompt that survives the choice

Here is the part that matters more than picking the right tool: a well-structured prompt produces comparable output across all four. The differences in the matrix are real, but a clear, specific prompt matters more than which of the four chatbots receives it. A vague prompt to the "best" tool still produces vague work. A careful prompt to a workable tool still produces careful work.

```
Role:    Who you want the model to act as.
Context: What it needs to know that isn't already obvious.
Source:  The material to work from. Pasted in full, not summarized.
Task:    The single thing to produce. One verb, one object.
Format:  Length, structure, tone. Concrete, not adjectival.
```

If you find yourself agonizing over which tool to use, that is a sign you have not yet written a prompt sharp enough to be worth running through any of them. Sharpen the prompt first. Then look at the matrix.

---

← Previous: [[memory-and-state]] · Up: [[start-here]] · Next: [[chatbot-vs-agent]] →

*Related: [[chatbot-vs-agent]] · [[personal-workflows]] · [[what-is-context]]*

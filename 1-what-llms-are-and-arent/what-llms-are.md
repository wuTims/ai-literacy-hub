---
title: What LLMs are
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [foundations, mental-models]
---

# What LLMs are

When a large language model answers you, it is doing one thing under the hood: predicting the next bit of text, then the next, then the next, given everything that has come before. That is the whole machine. Every other behavior these models show — the fluent answers on topics they barely seem to know, the same question giving you a different answer the second time you ask it, a small change in wording that swings the response from useful to useless, a confident reference to an article that turns out not to exist — all of it traces back to that one mechanism.

The framing that holds up best in daily use comes from the developer Simon Willison: a large language model is a **calculator for words**. It is a tool for moving language around, not a tool for looking facts up. If you keep that one sentence in mind, most of what these models do well, and most of the ways they go wrong, will start to feel predictable instead of mysterious.

## How next-token prediction works

During training, the model is shown an enormous pile of text — books, websites, code, transcripts — and learns to play one game over and over: given some text, guess what comes next. After enough rounds of that game, the finished model can take any prefix you hand it and score how likely each possible next piece of text is.

That piece of text is called a **token**. A token is usually a fragment of a word — sometimes a whole short word like *the*, sometimes a chunk of a longer word like *ing* or *tion*, sometimes a single character or a punctuation mark. The model does not work in whole words; it works in tokens. For most purposes you can read "token" as "the next little chunk of text" and you will not go far wrong.

There is no database sitting underneath the model, and no lookup happening. What the model has is a learned set of probabilities over tokens, and it picks one token at a time. Picking from the probabilities is called **sampling**: most of the time the model picks one of the high-probability tokens, but it does not always pick the very top one, which is why two runs of the same prompt can come out differently.

A single step looks like this:

```
prompt:    "The capital of France is"
                       │
                       ▼
       ┌──────────────────────────────────┐
       │  probability distribution         │
       │    " Paris"   0.81                │
       │    " a"       0.06                │
       │    " the"     0.04                │
       │    " located" 0.02                │
       │    …          …                   │
       └──────────────────────────────────┘
                       │  (sample)
                       ▼
       output token:   " Paris"
                       │
                       ▼
       new prompt:    "The capital of France is Paris"
                       │
                       ▼                (repeat until stop)
```

Once a token is picked, it gets glued onto the prompt and the whole process repeats. The model now scores the next token given the longer prefix, samples one, glues it on, and goes again — until it produces a special "I'm done" token or hits a length limit. A long answer is just this loop, run hundreds or thousands of times.

The same prompt, run twice, will not always give you the same output. Ask *what is the capital of France* and you will get *Paris* nearly every time, because the probabilities for that next token are bunched almost entirely on one answer. Ask for an opening line to a friendly email and you will get something different on each try, because there are hundreds of openings the model considers reasonable and the probabilities are spread thinly across all of them. Both behaviors come out of the same mechanism; the only thing that changes is how concentrated the probabilities are.

That gives you two practical habits. First, when you get an answer you like, save it before you ask for another — the next run may not match. Second, when you want a range of options, ask for several variants in one prompt instead of asking the same question over and over until something fits. The model is better at producing variety on purpose than you are at fishing for it.

## What this implies

Once the mechanism is in mind, the everyday quirks of these models stop being surprising:

- **Smooth writing is not evidence the writing is true.** Producing fluent prose is what next-token prediction is best at. A paragraph can read beautifully and still contain claims that are wrong.
- **The model sounds just as sure when it is wrong as when it is right.** There is no built-in signal inside the model that says "the training data did not really cover this question." The model produces plausible-sounding text either way, in the same steady tone.
- **The model is much better at reshaping text you give it than at remembering text it once saw.** Pulling a fact out of training is unreliable; rewriting, summarizing, or extracting from text in front of it is one of its strongest moves. When facts matter, paste them into the prompt instead of trusting the model to recall them.
- **How you phrase a question changes the answer.** Two prompts that mean the same thing to a person can produce noticeably different outputs, because the model treats them as different inputs and runs them through different probabilities.
- **Style defaults toward the average of the training data.** Without instructions, the writing comes out sounding vaguely corporate and vaguely confident — the average of everything the model has read. If you want a different voice, the prompt has to ask for it.

## Calculator for words

The single most useful question to ask before reaching for a language model is this: *is the task to manipulate language, or to retrieve a fact?* The first kind of task is what the tool is built for. The second kind is where it most often misleads you.

| Fits the tool                                       | Fights the tool                                  |
|-----------------------------------------------------|--------------------------------------------------|
| Summarize this document                             | Find me the right document                       |
| Rewrite this paragraph in a different tone          | Tell me what our policy on X is                  |
| Translate this passage                              | Cite a recent paper on Y                         |
| Extract the dates from this email                   | What did the CEO announce last Tuesday           |
| Draft three variants of this paragraph              | Look up this customer's account history          |
| Convert this messy list into a structured table     | Recall the correct phone number for the office   |

The pattern in the left column is that you supply the material and the model rearranges it. The pattern in the right column is that you ask the model to fetch something it might or might not have seen during training, with no way for you to tell the difference between a real memory and a confident-sounding guess. The first kind of task plays to the strength of the tool. The second kind sets you up to be misled.

Willison points out one place where the calculator analogy breaks down. A pocket calculator is deterministic: type the same numbers in twice and you get the same answer twice. A language model is not. Two identical prompts can give you different answers, and a prompt that worked for you yesterday may not work the same way today, because the model behind the scenes was quietly updated. So the calculator framing is the right shape — input goes in, output comes out, the tool is for working on the input — but it is a calculator with a wobble that a real calculator does not have.

## What follows

Three big mistakes follow naturally from the "calculator for words" picture: treating the model as a search engine, treating it as a database, and treating it as a reasoner. Each one is a different version of asking the calculator to do something it was not built for. They are spelled out next, on [[what-llms-arent]].

There is also a richer framing, popularized by the researcher Andrej Karpathy, that pictures the language model as the central piece of a kind of new operating system — the part that coordinates tools, memory, and outside services on your behalf. That framing is worth knowing, but it sits on top of the calculator-for-words picture rather than replacing it. For laying the foundation, the calculator-for-words picture is enough.

---

← Previous: [[how-not-to-produce-ai-slop]] · Up: [[start-here]] · Next: [[what-llms-arent]] →

*Related: [[what-llms-arent]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

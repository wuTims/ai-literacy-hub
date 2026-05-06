---
title: Onboarding
created: 2026-05-06
updated: 2026-05-06
status: active
tags: [meta, onboarding]
---

# Onboarding

The hub is a graph of cross-linked Markdown notes. You can browse the files on GitHub, but it's designed to be opened as an Obsidian vault — that's how the wikilinks resolve, the back-references work, and the hub feels like a connected whole rather than a folder of files.

This page is the setup walkthrough. It assumes no prior experience with Obsidian or with downloading code from GitHub.

## 1. Install Obsidian

Obsidian is a free desktop app for reading and writing Markdown notes. There's no account to create.

→ Download: [obsidian.md/download](https://obsidian.md/download)

Pick the build for your operating system, run the installer, launch the app. There's nothing to configure on first launch.

## 2. Download the hub

The packaged hub lives on the [Releases page](https://github.com/wuTims/ai-literacy-hub/releases).

1. Open the Releases page.
2. Find the most recent release at the top.
3. Under **Assets**, click `ai-literacy-hub-vX.Y.Z.zip` to download it.
4. Unzip the file. You'll get a folder containing the hub.

You can keep the unzipped folder anywhere — `~/Documents` or your desktop are both fine. Whatever path you pick, remember it for the next step.

## 3. Open it as a vault

In Obsidian's terminology, a *vault* is just a folder of Markdown files that Obsidian knows how to render and cross-link. Opening the hub as a vault is how the wikilinks light up.

1. On Obsidian's welcome screen, click **Open folder as vault**. (If you already have a vault open, use **File → Open vault → Open folder as vault**.)
2. Select the unzipped hub folder — the one that contains `start-here.md`.
3. If Obsidian shows a security prompt about trusting the vault, accept it. The hub is plain Markdown with no scripts or custom plugins.

The left sidebar will fill in with the four numbered sections plus the top-level pages.

## 4. Where to start

Open `start-here.md`. It lays out a recommended reading path with shorter routes for 20-minute and one-hour budgets.

If you only have time for one page, read `how-not-to-produce-ai-slop.md`. The rest of the hub is downstream of that one.

## Updates

The hub doesn't update itself.

When a new release is published, repeat the download steps and replace the old folder. Keep any of your own notes in a separate folder so they aren't overwritten when you replace the hub.

## Troubleshooting

**The sidebar is empty or shows only one or two files.**
You opened a folder one level too high or too low. The vault is the folder that *directly contains* `start-here.md` — not its parent and not one of its subfolders. Use **File → Open vault** and reselect the right folder.

**Wikilinks like `[[what-llms-are]]` show as plain text instead of clickable links.**
You're reading the files outside Obsidian — likely in GitHub's web view or a generic text editor. Open the folder as a vault in Obsidian and the links resolve.

**I don't want to install Obsidian.**
You don't have to. The pages are plain Markdown and read fine on GitHub or in any editor. You'll lose the wikilinks and the graph view, but the prose stands on its own.

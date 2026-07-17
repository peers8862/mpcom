# newpost

Interactive CLI for creating Jekyll blog posts. Handles front matter, categories, content input, and auto-linking in one guided flow.

## Usage

```bash
bin/newpost
```

Run from your Jekyll project root. The script finds `_posts/` relative to its own location.

## Flow

```
Title → Categories → Image → URL → Preface → Content method
```

### 1. Title

Prompted first. Used to generate the filename slug automatically.

```
Title: Can accounting be easier?
→ _posts/2026-07-16-can-accounting-be-easier.markdown
```

### 2. Categories

Two modes:

- **Type (t)** — Enter categories directly, space-separated
- **Pick (p)** — Displays a numbered list of all categories already used across your posts

In pick mode:
- Select by number to add a category (it's removed from the list for the next round)
- Or type a new category name at the number prompt
- After each pick: "Add more? [y/N]"
- Final confirmation prints all selected categories with a chance to redo

Commas are stripped automatically — just spaces between categories.

### 3. Image (optional)

```
Image path (blank for none): /assets/images/posts/my-image.jpeg
Caption: A description of the image
```

Adds `image:` and `caption:` to front matter. Skip with Enter.

### 4. URL (optional)

```
URL (user/repo for GitHub, full link, or blank): peers8862/pairs
→ url: https://github.com/peers8862/pairs
```

- `user/repo` format auto-prefixes `https://github.com/`
- Full `https://...` links pass through as-is
- Skip with Enter

### 5. Preface (optional)

A brief intro paragraph placed between front matter and main content, separated by a horizontal rule.

Asked before content selection. If skipped, asked again after content is provided.

```
Add a preface? [y/N]: y
Type preface (Ctrl-D to finish):
This is the intro paragraph.
^D
```

### 6. Content method

```
1) Paste/type directly (end with Ctrl-D on empty line)
2) Open in nano
3) Open in Sublime Text
4) Open in Obsidian (creates file, opens vault)
5) Empty (just create the file)
6) Import from a file (markdown or text)
```

| Method | Completion signal |
|--------|-------------------|
| Paste (1) | Ctrl-D |
| nano (2) | Save and exit (Ctrl-X) |
| Sublime (3) | Close the file tab |
| Obsidian (4) | Press Enter when done |
| Empty (5) | Immediate |
| File import (6) | Immediate (reads file) |

## Auto-linking

After content is saved, all raw `http://` and `https://` URLs in the body are automatically converted to markdown hyperlinks:

```
https://example.com/page → [https://example.com/page](https://example.com/page)
```

- Skips URLs already in markdown link syntax
- Skips front matter
- Handles trailing punctuation (periods, commas, etc.)

To run this separately on an existing post, use `bin/linkify`.

## Output

Creates a file at `_posts/YYYY-MM-DD-slug.markdown` with structure:

```markdown
---
layout: post
title:  "Your Title"
date:   2026-07-16 08:30:00 -0400
categories: tools accounting
image: /assets/images/example.jpeg
caption: Optional caption
url: https://github.com/user/repo
---

Optional preface paragraph.

---


Main content here.
```

## Requirements

- Bash 4+ (uses `mapfile`)
- `sed` (GNU)
- For Obsidian option: `python3` (URL encoding)
- For Sublime option: `subl` in PATH

---
layout: post
title:  "What is Workwarrior anyways?"
date:   2026-07-16 10:31:35 -0400
categories: command-line babb workwarrior
url: https://github.com/babbworks/workwarrior
---

Once you start 'hacking' a tool together it's easy to forget its origins. How did this thing really get started? Are my original intentions holding or have things evolved into something entirely different? 

In my case, the project had no name or real definition for the longest time. The quest wasn't at all about computers at its core, it was about the long-term challenge to stay organized in each dimension of business. I think this intention for 'easy organization' did hold at each step, and it's why Workwarrior is now a strong set of tools capable of scaling to thousands of users.

After a few years of business ownership, I was feeling overwhelmed by a dozen or more business apps that were soaking up my time. I had gotten used to having attention divided across tools and devices but the whole work flow was starting to not make sense anymore. Poor Return on Time. I was also nearing 40 and feeling the strong urge to get back to the command line and get back in control of my computer. A season of learning Linux had begun, so I created a playful constraint and decided that I could only look for software solutions in the terminal.

As I pursued a better toolbox for business, I started out with an upside down goal: how to use the computer in very advanced and professional ways for the least amount of time per week possible? How to make the tool set so tight that it helps gradually increase our time **away** from the computer while increasing its benefits? In plain terms, how do I get back to doing what I do? How to harness the computer for manual business administration, record keeping, communications and product development so I can develop and master my crafts and talents that exist away from the desk and away from the 'desktop'?

I had a faint hunch that the tools talk together better within the terminal. So I created a simple criteria for inclusion: is the tool absolutely necessary to running a business, or say a family, or any activity for that matter? The genesis of a new rule: what is the minimal set of functions needed to run a business or project? The unnamed project's first rule: functions are indivisible timeless human activities.
 
Therefore, the functions I was hunting for and battling to define must be hidden in plain sight as plain names not technological ones. The clay for the jars that will hold the tecnology would be found within human terminology not industry jargon.

For business leadership, defined as "repsonsibility for all operations and outcomes", the minimal set of indivisible functions seemed to be:
exchange or money tracking, work tracking, time logging, work journals, and list making

The task became simpler: match potential tools with these universal functions.

For accounting there's ledger, hledger and beancount. I studied the ins and outs of each before landing on hledger. Though both ledger and beancount have things only they do well.

Next, I discovered JRNL for notes and just ran with it. 

Taskwarrior and Timewarrior are clearly best at what they do. Before too long though things can get a bit blurry as you try to triage through screens and screens of tasks and project tags. Taskwarrior has great annotaiton functions but few users are making routine use of them. It nailed down the essence of task tracking but to be more accessible it needed a few adjustments.

So I did what any [very novice] developer would do. Having discovered the magic of aliases I began manually editing my bashrc file as one giant config and orchestration file. By the time I was finished weaving together aliases and snippets of bash script, my bashrc file had over 1100 lines! Thankfully, I was still too green and excited about coding to see a problem with this approach. As with many Linux users, it's the first system file I ever edited so it served as a perfect scratchpad for sewing the tools together. Of course, what I had in practice was the equivalent of a hodge podge quilt whose patches were hanging on by threads. However, the common vocabulary and early commands that made the tools pull in the same direction was enough to glimpse a new horizon that I then charged for.

I was starting to see opportunities to systematize the linkages between these tools by creating a "functions and extensions" architecture. The top 4-5 business tools that made the cut would be a core nucleus around a second ring of capabilities. After viewing all the quality Taskwarrior extensions developed by the developer community, and after experimenting with dozens of them, the opportunity to patch together an augmented family of functions anchored by hledger became plain to see.

As of Summer 2026, Workwarrior is a robust command line application with extreme depth. Via command 'ww browser' it's also a very effective local browser application tool that routes all its main activity through the CLI that interacts with the core tools direclty. With these foundations in place, we used a simple 'rofi' solution to enable popups and overlays that give rich access to all functionality. With the popups the tool is ready to serve from the background where business leadership should be.

---



---
layout: post
title:  "Bitpads Protocol"
date:   2026-04-14 01:07:17 -0400
categories: bitpads
---

The Bitpads Protocol was gradually created from a fairly simple obsession: how can old cheap devices be relatively powerful given their old components, low-processing power and simple display systems? It turns out these kinds of concerns share alot in common with the most advanced systems used in industry, aeronautics and spacefaring. The goal in each instance is to place the least demands on the hardware while processing or transmitting the most amount of information, and to do so with the highest fidelity and consistency.

Asking these kinds of questions brings the student of computing immediately back to binary and assembly language from which all other systems sprung. Even the Murray and Baudot and Morse codes were early binary protocols. Once you're back there where it all began you're reminded that that every bit is a potential flag or indicator of some sort. The ancient and timeless nature of making a set of marks for a receiver to interpret is what helps put back computing in its societal context. You start wondering what is communication and what does it mean to carry out an exchange across the ages. This brings us back to the rudimentary forms of civilization and begs the question: how can the way we treat information be timeless too? How do we marry the old with the new to create a persistent approach to the creation and transmission of records?

Bitpads is one attempt to answer these questions.

The system is based on a few first principle assumptions about human and machine to machine communication. These assumptions deserve their own post but for now we'll keep the breakdown brief. We'll stick to the bitpad architecture to lay things out and draw connections to society. So first, the main types of bytes and blocks of bytes for a bitpad transmission.

The protocol operates using a hard-coded set of sequences where each byte or set of bytes has pre-determined locations in the overall stream. Interpretation by the receiver relies on things staying the same each time, and numerous checks and confirmations are built-in to the flow of data to enforce these rules.

The anchor bye for the whole system besides Start of Header is the Meta Byte, or what we can label Meta Byte 1 since there can be a 2nd Meta Byte depending on the settings coded into MB1.

Meta Byte 1 has 8 individual bits, with bits 5-8 operating as a 4 x 4 matrix when MB1 Bit 4 is set to 1 (Catoegory Mode). 

### Meta Byte 1 — Complete Bit Specification

| Bits      | Field                  | Values          | Description |
|-----------|------------------------|-----------------|-------------|
| Bit 1     | BitPad Mode            | 0 / 1           | **0** = Wave mode (lightweight). Layer 1 not required unless category demands it. Bits 5-8 role determined by Bit 4.<br>**1** = Record mode (full BitPad). Meta Byte 2 always follows. Layer 1 is always expected. |
| Bit 2     | ACK Req / SysCtx       | 0 / 1           | **Dual-purpose field**:<br>• When Bit 1 = 0 (Wave): **1** = ACK request. A single byte with only Bit 2 set (`0x02`) is the **universal pulse**.<br>• When Bit 1 = 1 (Record): **1** = System Context Extension follows Layer 1. |
| Bit 3     | Continuation           | 0 / 1           | **0** = Complete, self-contained message.<br>**1** = Fragment. More BitPads follow for the same logical unit. Universal across both Wave and Record modes. |
| Bit 4     | Treatment Switch       | 0 / 1           | **Wave mode only**:<br>• **0** = Basic treatment (Bits 5-8 are Role A descriptors).<br>• **1** = Category mode (Bits 5-8 become Role B 4-bit category code).<br>Ignored in Record mode. |
| Bits 5-8  | Content Field          | varies          | Role depends on Bits 1 and 4:<br>• **Role A** (Bit 1=0, Bit 4=0): Priority / Cipher / ExtFlags / Profile flags.<br>• **Role B** (Bit 1=0, Bit 4=1): 4-bit category code.<br>• **Role C** (Bit 1=1): Value / Time / Task / Note expect flags. |

In the BitPads transmission spectrum, a 1-byte Pure Signal is the smallest and lightest possible message type. It consists of only Meta Byte 1, with no content, no Layer 1, no Meta Byte 2, and no additional payload.

This is explicitly supported in the protocol:

Size | Type | Structure
1 byte | Pure Signal | Meta byte 1 only. The byte IS the message.




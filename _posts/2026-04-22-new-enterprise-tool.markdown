---
layout: post
title:  "Tool for Planning New Enterprises"
date:   2026-04-22 10:07:17 -0500
categories: tools babb newent
---

## newent v2: A Local-First CLI for Designing New Enterprises

Most startup tooling assumes you’re already in motion—tracking tasks, managing teams, or reporting metrics. **`newent` takes a different position**: it focuses on the earliest stage, where an enterprise is still being defined.

This is a command-line tool designed to help you **structure, explore, and evolve a business idea** using a local-first, service-oriented system. It is opinionated in architecture, but flexible in usage.

---

## What `newent` Is (and Isn’t)

At its core, `newent` is:

* A **planning environment**, not a project manager
* A **local system**, not a cloud dependency
* A **structured model**, not a blank canvas

It does not try to replace spreadsheets, CRMs, or accounting software. Instead, it aims to give you a **clear, composable foundation** for thinking through an enterprise before those tools become necessary.

---

## Architectural Approach

The system is built around a few strict principles:

### 1. Service-Oriented Design

Each concern is isolated into a service with defined boundaries. This enforces discipline early and prevents the tool from collapsing into a monolith.

### 2. Store Ownership

All persistent data flows through a single service—the **Store**.
Only this service reads or writes to SQLite, which keeps data access predictable and auditable.

### 3. Local-First by Default

Everything runs locally using SQLite. There is no dependency on network services, and no requirement for accounts or sync.

Cloud support is considered, but intentionally deferred.

### 4. CLI as a Primary Interface

The command-line interface is designed to be **natural-first**:

* Commands read like short phrases
* Grammar is consistent and predictable
* Complexity is introduced gradually

Example philosophy:

* `plan new` and `plan-new` are both valid
* Commands favor readability over terseness

---

## The Core Data Model

The system organizes enterprise information into a layered hierarchy:

```
Business
  → Plan
    → Section
      → Document
        → Heading
          → ContentItem
            → ContextItem
```

This structure enables:

* Clear separation between high-level strategy and detailed notes
* Incremental expansion from idea → plan → execution
* Flexible referencing using compact or dotted addresses

  * Example: `3B2ai` or `3.B.2.a.i`

Upper levels are stable, while lower levels remain more fluid and positional.

Additional first-class elements include:

* Notes
* Archived material
* QA sessions and answers
* Time tracking

---

## Current Focus: The Store Service

Right now, development is centered on the **Store service**, which provides:

* A SQLite-backed persistence layer
* A broad CRUD interface across all entities
* Typed data models at service boundaries

Key components:

* `models.py` — shared data structures
* `services/store.py` — the Store implementation
* `schema/001_initial.sql` — workspace schema
* `schema/001_spaces.sql` — groundwork for multi-space support

The Store is foundational: all other services will depend on it.

---

## Planned Service Ecosystem

The long-term design includes a set of focused services:

* **Store** — persistence layer
* **Doctor** — validation and integrity checks
* **QA** — structured questioning and answers
* **Coach** — guided planning assistance
* **Warmup** — idea generation and prompts
* **New / Ent** — creation and orchestration flows
* **Notes** — lightweight capture
* **Framework** — reusable planning structures
* **Export** — output to external formats
* **Spaces** — multi-workspace management
* **Cloud (stub)** — future sync layer
* **Finance** — evolving from simple assumptions to full financial modeling

Not all of these are implemented yet, but the boundaries are defined.

---

## Working with `newent`

Setup is intentionally minimal and avoids global system pollution.

### Local Development Environment

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e ".[dev]"
```

This gives you:

* An isolated environment
* The `newent` command on your PATH (while active)

You can also:

* Run it directly: `./.venv/bin/newent`
* Or expose it via PATH manually or through `pipx`

### Running and Testing

```bash
newent --help
pytest -q
```

The CLI and module entry point are equivalent.

---

## Design Discipline

A defining characteristic of the project is that **implementation follows design documents**, not the other way around.

Key references include:

* Architecture definition
* CLI grammar
* Data model
* Service boundaries

If code and documentation diverge, the documentation is considered authoritative.

This keeps the system coherent as it grows.

---

## Why This Matters

Most early-stage planning is fragmented:

* Notes in one place
* Ideas in another
* Financial assumptions somewhere else

`newent` attempts to unify this into a **single, structured system** with:

* Explicit relationships
* Traceable decisions
* Evolvable plans

It is less about speed and more about **clarity and integrity of thought**.

---

## Final Perspective

`newent` is not trying to be broadly accessible or immediately polished. It is a **deliberate tool for disciplined thinking** about enterprises.

If you prefer:

* GUI-heavy workflows
* Rapid, unstructured brainstorming
* Cloud-synced collaboration out of the box

this likely won’t fit.

If you want:

* Local control
* Structured planning
* A system you can reason about and extend

then it’s worth examining.

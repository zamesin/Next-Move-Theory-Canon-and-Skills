# Next Move Theory Canon & Skills

**Next Move Theory is a methodology with a step-by-step algorithm for every product decision: it lays out every tactical and strategic move open to you and helps you choose the best, with the odds on your side.**

> **Advanced JTBD — v3.4 · stable.** The proven foundation.
> **Next Move Theory — v0.6 · in active development** — integrating AJTBD with Riskiest Assumption Test, ABCDX Segmentation, Theory of Constraints, and Unit Economics into one operational system. The repository package is the `next-move-theory` Plugin, version `1.0.0`; see the [changelog](CHANGELOG.md).

This repository is a self-contained `next-move-theory` Plugin for Codex and Claude Code. It bundles the open Canon, one hand-maintained `skills/` source tree, and the package metadata needed for user-global installation without changing a Consumer project. It is written for the people who decide *what to build*: founders, indie hackers, product managers, and product marketers. The methodology and the skills are by Ivan Zamesin ([X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/)).

---

## How to start

1. **Install it globally** — follow [Global Plugin installation](#global-plugin-installation). The Plugin is installed at user scope by the Client and does not copy files into the Consumer project.

2. **Start with `nmt-chat`**. It is the model-invoked router and the conversational front door to the methodology: **paste whatever you have** — a half-formed idea, messy notes, a chat thread, a doc — and it pulls out the context, separates what you *know* from what you're *assuming*, and gives you the next concrete move. No project `AGENTS.md` or `CLAUDE.md` injection is required.

---

## There is an algorithm

**There is an algorithm for making any product decision.**

Next Move Theory is the algorithm behind every product call: how to find product-market fit, scale, position, grow conversion, improve retention. It works at every level, from this sprint's tactics to the company's strategy. There is one for each of the questions that decide a product's fate:

- How to launch a product and find Product-Market Fit
- How to scale a product
- How to save a dying product, or know when it's time to shut it down
- How to create value
- How to differentiate from competitors
- How to position a product
- How to exit direct competition
- How to create a Disruptive Innovation
- How to grow conversion
- How to raise average order value
- How to improve retention
- How to build an acquisition channel

**It lays out every move open to you.** Most decisions feel like a coin flip because you only see the one option you'd already fixed on. Next Move Theory lays out every tactical and strategic move actually open to you, including the ones you'd have missed.

**It helps you choose the best.** Scores give you comfort, not direction — you can rank a feature 1,200 and still be wrong. Next Move Theory weighs each move by how much it shifts your goal and points you to the best, with the reason why.

**More of your bets land.** That's the whole point. Hundreds of companies run on Next Move Theory, and across [dozens of documented cases](http://nextmovetheory.com/cases?utm_source=canon&utm_medium=github) the metrics moved significantly — conversion, retention, revenue, market share.

This canon is the result of the last eight years of my work. Eight years ago I found Jobs To Be Done, saw how much it could become, and made an unreasonable decision: rebuild it from scratch so it would finally yield an algorithm. It only became that when I got lucky and found the science that explains what value really is and how a person changes behavior. That body of science sits in [`scientific-foundations.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md), and everything else stands on it. On that foundation I rebuilt JTBD into thousands of theses, the core I call Advanced Jobs To Be Done. AJTBD alone still didn't produce the algorithm. To get there I folded in Unit Economics, the Riskiest Assumption Test, ABCDX segmentation, and Goldratt's Theory of Constraints. That integration became Next Move Theory. I've since taught it to more than 13,000 people in my home country, and this public canon is how I give its foundations to the world.

**The main algorithm is here in full. Read it in [`the-algorithm.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Algorithms/the-algorithm.md).** Reading the steps isn't enough, though. For the algorithm to work for you, you have to understand the foundations it runs on: what a Job is, what value is, how to segment, how to test the riskiest assumption first. That is what the rest of this canon is. These are the foundational theses the algorithm stands on, so it works for you instead of reading like an empty checklist.

The **skills** turn that algorithm into tools: feed in a product idea and get back a *decision*, not a description.

I find this methodology beautiful and powerful, and sharing it with the world is my mission. I hope it brings you real value and lets you see the moves in front of you clearly.

---

## Who this is for

This canon is written for **product builders**. Same algorithm, and here's the win it lands for each:

- **Founders** — *decide what to build, with the odds on your side.* See every tactical and strategic move open to you, find the Job customers will actually pay for, and pick the strategy that wins before you bet the next three months on a hunch.
- **Indie hackers / vibe-coders** — *pick a niche that actually pays.* Writing code was never the problem; choosing what to ship is. Let the methodology pick the Job people pay for, so the next build is the first one with real buyers.
- **Product managers** — *a roadmap that moves the metric, not theater.* Run the logic from the foundations up, find where the metric actually breaks, ship the few moves most likely to shift it, and raise the odds of growth.
- **Senior PMs / VPs / CPOs** — *the operating system your product org runs on.* When every team reasons from the same strong foundations, tactic to strategy, you can stand behind every call and more of your bets pay off.
- **Product marketers / growth** — *positioning that isn't "yet another X."* Find the angle in the customer's real Job, not channel tactics, and the odds it converts climb before you spend a dollar.

If you build, market, or decide the direction of a product, this is for you. You don't have to throw out what you already know. Customer interviews, CJM, ICP, willingness-to-pay, and feature backlogs all still work. They just get grounded in the right unit of analysis and tied to real business decisions instead of floating free. Expect the rewire to take practice. Most people arrive with a feature-first or persona-first model, and the Job-first model takes a few honest attempts before it feels natural.

---

## What's here — and what's coming

**This public canon is the foundation, about 25% of the whole methodology.** What you have here are the foundational theses of Advanced Jobs To Be Done and Next Move Theory: what a Job is, what value is, how segmentation works, behavior change, the Job Graph, and the Riskiest Assumption Test. It also includes the main algorithm itself ([`the-algorithm.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Algorithms/the-algorithm.md)).

**The rest of the methodology is not coming to this public repo.** It lives in the full version, available through the products and courses at **[nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github)**. Beyond the foundations here, the full methodology covers:

- the **product-diagnosis algorithm**;
- the **step-by-step algorithms** for the questions listed at the top — launch and find Product-Market Fit, scale, save a dying product, position, exit competition, grow conversion, raise average order value, improve retention, build an acquisition channel, and the rest;
- the **full 100+ mechanics catalog**;
- **generating product ideas and feature ideas**;
- **goal-setting** — the algorithm for finding a company's real growth points;
- **demand creation and acquisition channels** — how the methodology runs at the delivery stage;
- **branding** — how to build and run a brand on Jobs;
- **process principles** and the algorithms for **rolling the methodology out across a company**;
- **Customer Success and Support** built on Jobs;
- the full **unit-economics integration**, and more.

**Subscribe to the newsletter at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github)** so you don't miss new free materials, courses, and products as they go live.

---

## The Plugin

The repository root carries the Plugin manifests and marketplace metadata. The
package contains one `skills/` source tree; the `nmt-chat` payload carries the
one physical Canon and shared references under `skills/nmt-chat/references/`.
The shared Skill instructions are capability-neutral and reach that payload
through relative paths; no generated Claude or Codex Skill copies are shipped.

| Skill | What it does |
|---|---|
| **[`nmt-chat`](skills/nmt-chat/)** | A conversational **advisor** and model-invoked router. Ask any product, strategy, segmentation, value, pricing, growth, positioning, B2B, or methodology question and get an answer grounded in the bundled Canon. |
| **[`nmt-diagnose`](skills/nmt-diagnose/)** | A chat-first **diagnostic** for live products. It challenges the goal, surfaces risks and growth points, and routes to the Skill that executes the next move. |
| **[`nmt-market-research`](skills/nmt-market-research/)** | Sizes the market and scores segments to answer *"which Jobs of which segment should we compete for first?"* |
| **[`nmt-craft-value-proposition`](skills/nmt-craft-value-proposition/)** | Takes a chosen segment + Jobs and builds a testable value proposition and PRD-ready implementation direction. |
| **[`nmt-product-requirements`](skills/nmt-product-requirements/)** | Turns the chosen segment + value into a build-ready PRD, including edge cases and a challenge-the-build gate. |
| **[`nmt-craft-go-to-market`](skills/nmt-craft-go-to-market/)** | Turns a value proposition into landing-page copy, ads, and a growth-communication plan. |
| **[`nmt-analyze-interviews`](skills/nmt-analyze-interviews/)** | Extracts AJTBD structure and value hypotheses from interviews, notes, sales/support calls, or survey open-ends. |
| **[`nmt-upgrade`](skills/nmt-upgrade/)** | Unchanged Legacy-only updater for existing project-local setups; it is not the global suite update path. |

**Two front doors.** **`nmt-chat`** is the conversational router for advice,
explanation, or pressure-testing an idea. **`nmt-diagnose`** is the front door
for a *live product*: it finds your risks and growth points and routes you to
the next move. Both answer from the bundled Canon and point you to the right
producer Skill when you need a full artifact. For a brand-new idea, start at
`nmt-market-research`.

**The four producer skills form a pipeline**, each one building on the artifact the one before it produced:

1. **`nmt-market-research`** → pick the segment and the Core Jobs to compete for (with the GO / NARROW / PIVOT verdict and the riskiest assumptions to test).
2. **`nmt-craft-value-proposition`** → feed it the nmt-market-research result; get the value proposition plus a PRD-ready implementation spec.
3. From the value proposition, branch to either (or both):
   - **`nmt-product-requirements`** → the build-ready PRD, *what to build*. It consumes the segment from step 1 and the value from step 2.
   - **`nmt-craft-go-to-market`** → the landing page, ads, and growth plan, *how to sell it*. Works best from the value proposition; also accepts the PRD or the nmt-market-research result.

You can also jump in mid-pipeline if you already know your segment and Jobs. Each skill takes what you hand it, or routes you back to the step it needs first.

The eight Skills share the `nmt-` prefix. `nmt-chat` is the only model-invoked
router; the other Skills remain directly reachable through the Client's Plugin
Skill surface and are routed by their descriptions or selected explicitly. The
four producers each have a fast **Quick** mode (no internet) and a deeper
**Deep** mode (web research; parallel sub-agents on Claude Code, sequential on
Codex). `nmt-chat` and `nmt-diagnose` are conversational (no file unless you
ask).

> The skills produce **hypotheses, not conclusions.** Every number is an LLM-generated estimate with a verification path attached. Validate before any decision with expensive consequences. That's the RAT discipline the methodology is built on.

### Global Plugin installation

The supported installation is user-global through the `skills` CLI.

```bash
npx skills@latest add zamesin/Next-Move-Theory-Canon-and-Skills -g
```

The command is cross-platform and installs the published suite globally.
Partial selection is unsupported because the shared Canon and routing
references are carried by the `nmt-chat` payload.

The `skills` CLI materializes the suite in Client user state. It does not add
`AGENTS.md`, `CLAUDE.md`, `.agents/`, `.claude/`, a Canon directory, or a Skill
directory to the Consumer project. After installation, the user-global suite
contains:

```
user Plugin state/
└── next-move-theory/              # one Plugin containing the Canon and eight Skills

Consumer project/
└── (unchanged by installation)
```

Start with `nmt-chat` after installation. The Client may display a
client-specific namespace for direct Skill invocation; the router can reach the
producer Skills without changing the Consumer project.

**Updating later:** run exactly `npx skills update`. Do not repeat the install
command, edit a Client cache, or install a partial suite.

**Legacy boundary:** this release does not ship `install.sh` or `install.ps1`.
`nmt-upgrade` remains unchanged Legacy-only behavior for existing project-local
setups and is not the global suite update path. There is no supported migration
or cleanup flow.

<details>
<summary><b>What is inside the user-global Plugin?</b></summary>

The repository root contains the Plugin manifests and marketplace metadata. It
contains one `skills/` source tree with eight Skills; the `nmt-chat` payload
contains the physical Canon and shared references under its `references/`
directory. The user-global install does not inject instructions into the
Consumer project.

</details>

---

## Repository agent files

This repository also ships **[`CLAUDE.md`](CLAUDE.md)** and **[`AGENTS.md`](AGENTS.md)**.
They remain contributor and historical Legacy-behavior sources; a user-global
suite installation does not copy or inject either file into a Consumer project.

The bundled Canon lives under
[`skills/nmt-chat/references/Next-Move-Theory-Canon/`](skills/nmt-chat/references/Next-Move-Theory-Canon/).
`nmt-chat` reaches it through `references/Next-Move-Theory-Canon/`; the sibling
Skills use `../nmt-chat/references/Next-Move-Theory-Canon/`. The existing Skill
workflows remain unchanged.

---

## How to read the canon

> **Prefer a nicer reading experience?** The same canon is available in a cleaner, more readable form on the site — [read it at nextmovetheory.com/library/canon](https://nextmovetheory.com/library/canon?utm_source=canon&utm_medium=github).

The canon lives in [`skills/nmt-chat/references/Next-Move-Theory-Canon/`](skills/nmt-chat/references/Next-Move-Theory-Canon/), around two dozen interlinked files. You don't have to read them in order. If you want the fastest path to understanding, read these four key-theses files first, in order:

1. **[`Next-Move-Theory/nmt-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md)** — the integrative root: what the whole framework is and how its pillars (AJTBD, Unit Economics, RAT, ABCDX) plus Theory of Constraints — with OKR (Objectives & Key Results) as a supporting methodology — fit into one system. *Start here for the big picture.*
2. **[`Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)** — the substrate the rest stands on: Jobs, the Job Graph, value and the Aha Moment, segmentation. The core you'll use most.
3. **[`Riskiest-Assumption-Test/rat-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md)** — before you build: list the assumptions the idea rests on, rank them by how lethal they are if wrong, and buy the cheapest evidence against the deadliest first.
4. **[`ABCDX-Segmentation/abcdx-segmentation-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/ABCDX-Segmentation/abcdx-segmentation-key-theses.md)** — the theory turned into a concrete operating move on a real customer base: focus the high-margin A/B, fire C/D, and read X as the signal of where to grow next.

Then read the rest in whichever cluster matches your problem.

### Advanced Jobs To Be Done — Foundations

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) | The foundational theses — the methodology in one document. The map to everything else. |
| [`Advanced-Jobs-To-Be-Done/scientific-foundations.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md) | The brain as an energy-budget investor; why needs fail as a unit and Jobs succeed. |
| [`Advanced-Jobs-To-Be-Done/job-structure.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md) | The eight elements that fully specify a single Job, element by element, with interview questions. |

### The Job Graph — where strategy lives

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/job-graph.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md) | The hierarchy of Jobs around your product; the four levels, defined *relative to your product's reach*. |
| [`Advanced-Jobs-To-Be-Done/job-types-and-properties.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md) | The taxonomy of Jobs — Regular, Orientation, Tax, Fake, Emotional, Viral — as a diagnostic instrument. |
| [`Advanced-Jobs-To-Be-Done/critical-chain.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md) | The Job Graph projected onto time — the lived path a team actually ships, where the Aha Moment fires. |

### Creating value

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/value-creation.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md) | The deep canon on value: energy efficiency, success criteria as the specification of value, the Aha Moment. |
| [`Advanced-Jobs-To-Be-Done/value-creation-mechanics.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md) | The foundational catalog of value-creation mechanics — kill a Job, take a Job off the customer, climb a level. |
| [`Advanced-Jobs-To-Be-Done/behaviour-change.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md) | Why switching is swapping one Job Graph for another; a Solution as a *label* for the sub-graph it installs. |
| [`Advanced-Jobs-To-Be-Done/customers-attention-management.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/customers-attention-management.md) | Attention as the metabolic resource every value-creation mechanism routes through. |

### Reaching and converting customers

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/consideration-activators.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md) | The five Consideration Activators — what you load into the customer's head to move their choice your way. |
| [`Advanced-Jobs-To-Be-Done/barrier-removal.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/barrier-removal.md) | Removing the objective barriers that make a better Job Graph non-executable for a segment. |
| [`Advanced-Jobs-To-Be-Done/communication.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md) | Communication in the language of Jobs — the value-proposition formula and the landing-page structure. |

### Choosing where to compete

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/segmentation.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md) | Segmentation by Job Graph similarity, not demographics — the most expensive cut to get wrong. |
| [`ABCDX-Segmentation/abcdx-segmentation-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/ABCDX-Segmentation/abcdx-segmentation-key-theses.md) | ABCDX — splitting your paying base by margin × satisfaction; refocus on A/B, fire C/D, read X as a signal. |
| [`Riskiest-Assumption-Test/rat-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md) | RAT — list the assumptions an idea rests on, rank them by lethality, and buy the cheapest evidence first. |

### Next Move Theory — the meta-framework above AJTBD

| File | What it teaches |
|---|---|
| [`Next-Move-Theory/nmt-key-theses.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md) | The integrative root — how AJTBD, Unit Economics, RAT, ABCDX, and Theory of Constraints combine into one system, with OKR as a supporting methodology. *The product is a single organism.* |
| [`Next-Move-Theory/focus-as-company-attention-management.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Next-Move-Theory/focus-as-company-attention-management.md) | Focus as pointing the whole company's attention at specific Core Jobs of one segment; the Innovator's Dilemma as focus that ossified. |
| [`Next-Move-Theory/subtraction.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Next-Move-Theory/subtraction.md) | Subtraction as the meta-operator across all four pillars — removing Jobs, unprofitable units, risky assumptions, and C/D customers. |

### Practice, B2B, and the operating loop

| File | What it teaches |
|---|---|
| [`HowTos/basic-ajtbd-interview-guide-and-principles.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/HowTos/basic-ajtbd-interview-guide-and-principles.md) | The practical interview guide — principles and a question bank that reconstruct Jobs, criteria, Aha Moments, and Barriers from what a customer actually did. |
| [`Advanced-Jobs-To-Be-Done/b2b.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md) | The B2B deal as a Job Graph across roles — and why personal Jobs usually outweigh business Jobs. |
| [`Algorithms/the-algorithm.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Algorithms/the-algorithm.md) | How the pieces combine into a single cyclical algorithm — and the anti-patterns that kill products. |

> The public canon covers the most foundational theses and mechanics. The full methodology — the product-diagnosis algorithm, the 100+-mechanic catalog, the full unit-economics integration, and more — lives in the products and courses at nextmovetheory.com. **For new theses and book chapters as they're published, subscribe at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github)** — home to the canon, the books, and the newsletter.

---

## What's inside

```
Next-Move-Theory-Canon-and-Skills/
├── .agents/plugins/marketplace.json    # Codex repository marketplace
├── .claude-plugin/                     # Claude manifest + marketplace
├── .codex-plugin/plugin.json           # Codex Plugin manifest
├── skills/                             # one hand-maintained Skill source tree
│   ├── nmt-chat/                       #   router + bundled Canon/references payload
│   │   └── references/
│   │       ├── Next-Move-Theory-Canon/ #     the bundled methodology
│   │       ├── producer-contract.md
│   │       └── readability-contract.md
│   ├── nmt-diagnose/
│   ├── nmt-market-research/
│   ├── nmt-craft-value-proposition/
│   ├── nmt-product-requirements/
│   ├── nmt-craft-go-to-market/
│   ├── nmt-analyze-interviews/
│   └── nmt-upgrade/                    #   Legacy transition updater
└── NOTICE.md                           # attribution and packaging notice
```

---

## How this methodology came to be

By 2018 I taught product for a living: customer research, segmentation, interviews. Yet at the root I didn't actually know how products get created. The model I taught was *find the pain, build the painkiller*. But I kept watching satisfied customers with no problem to solve buy anyway, and I had no explanation for it. I was also building my own company against a stronger competitor, with no rule for *choosing* a strategy, only a pile of plausible advice. So I made an unreasonable decision: build the methodology from scratch.

I went deep into Jobs To Be Done and kept its deepest intuition: a person sits in a situation and wants to *transition* into a different state. I left the rest of the machinery behind, because it never told me how to research, segment, choose where to compete, or create value.

It only came together when I got lucky and found the right science. Lisa Feldman Barrett's work led me to allostasis, prediction, and reward prediction error, which is what *value* actually is to a brain managing an energy budget. It also led me to the theories of needs, emotions, habit, identity, and loss aversion that explain how a person changes behavior. That body of science sits in [`scientific-foundations.md`](skills/nmt-chat/references/Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md), and everything else stands on it. On top of it I could finally build a real algorithm for creating value, the core I called **Advanced Jobs To Be Done (AJTBD)**.

AJTBD alone still wasn't enough. A few more methodologies turned out to be fundamental. First the **Riskiest Assumption Test**. Every initiative is a stack of risky assumptions, any of which might not hold, so you don't just launch and hope. In a sense the idea is already dead and you simply don't yet know what will kill it. RAT is how you find out cheaply, before you've paid for the build. Then **Unit Economics**. A company can only grow and fund its next bets by competing for the Jobs of segments where it can actually earn a target margin. **Goldratt's Theory of Constraints** taught me to find the single bottleneck that limits the system and fix *that*, instead of improving everything at once. Later I added **goal-setting**, an algorithm for finding a company's real growth points. Together it all became **Next Move Theory**.

Today hundreds of companies in my home country run on this work, with dozens of cases documented at [nextmovetheory.com/cases](http://nextmovetheory.com/cases?utm_source=canon&utm_medium=github). My goal now is to give the methodology to the world, so your product work stops being guesswork and becomes something you genuinely enjoy. The full story, with the scenes, the mistakes, and the moments where the wrong model stopped working, is the subject of my book.

---

## The book — *The Nature of Product*

**[*The Nature of Product*](https://nextmovetheory.com/library/the-nature-of-product?utm_source=canon&utm_medium=github)** is free to read on the site. It's the **first book in a series**, and it covers the foundation, **Advanced Jobs To Be Done (AJTBD)**, rather than the whole of Next Move Theory. The broader framework comes in later books. Where the canon states the methodology as theses, the book tells the *story of how it was discovered*. It's a chain of insights, each one a moment where the wrong model stopped working and a better one had to be built. A recurring skeptic, **Wes**, attacks the ideas with the exact questions real students used.

It's for founders, indie hackers, PMs, marketers, and designers making product decisions on incomplete evidence, and it assumes no prior Jobs To Be Done background. Read it on the couch. The canon and skills are here when you want to get operational.

---

## About the author

**Ivan Zamesin** is the author of Advanced Jobs To Be Done and Next Move Theory. Two independent industry studies ranked him the #1 product expert in his home market.

- **Led image search at his home market's largest tech company.** Took 25% of the market from Google Images, growing share from 55% to 72%.
- **Trained 13,000+ founders and product managers** through the most popular product course in his home market, running since 2017.
- **Founded and sold a startup.** A therapist-matching service: built it, grew it, and exited to a larger marketplace.
- **Product-strategy consulting for market leaders**, built on Jobs and unit economics.

[nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github) · [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com)

---

## Talks & questions

**Want me to speak?** If you'd like me to walk your team, company, or event through the methodology — a talk, a workshop, or a conversation about how it applies to your product — I'd genuinely welcome that. Email me at [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com) or reach out on [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/).

Found an error in a thesis or a broken link? Open an issue or a pull request.

## License

The canon and the skills are licensed under [**CC BY-NC-SA 4.0**](https://creativecommons.org/licenses/by-nc-sa/4.0/) (Creative Commons Attribution–NonCommercial–ShareAlike 4.0 International) — see [`LICENSE`](LICENSE) and [`NOTICE.md`](NOTICE.md). This release changes packaging, paths, documentation, and compatibility only; it does not change the methodology or imply endorsement by Ivan Zamesin or the original project. You are free to **share** and **adapt** the material, as long as you:

- **Attribution** — credit Ivan Zamesin and link back to this repository and the license;
- **NonCommercial** — don't use the material for commercial purposes;
- **ShareAlike** — license your adaptations under the same terms.

**Can I use this inside my company — even a for-profit one?** Yes. The license — and copyright generally — covers the *material* (the canon text, the skills code), not the *ideas* in it. Methods, processes, and principles aren't copyrightable, so *applying* the methodology is not a use the license governs at all. Read it, run the skills on your own product, segment your customers, build your metrics, and make product decisions on it — at any company, commercial or not. The NonCommercial term restricts only what you do with the **material itself**: reselling copies, bundling the text into a paid product or course, or putting it behind your own paywall. Attribution and ShareAlike kick in only when you **share or adapt the material** — not when you put what you learned to work. (This is the common-sense reading of the license, not legal advice; for high-stakes decisions, check with a lawyer.)

---

*A note on the writing. I built this methodology over eight years in my own language, where it grew into thousands of theses. To bring it into English, I used Claude to render those theses as the text you're reading. The thinking is entirely mine, worked out over years of practice and teaching; the AI handled the English wording, not the ideas behind it.*

*Built by Ivan Zamesin. [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github) · [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com). The canon is a living document; it grows as new theses are validated in practice.*

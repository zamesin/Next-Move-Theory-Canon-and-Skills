# Next Move Theory Canon & Skills

**An algorithm for any product and business decision — and the AI skills that run it.**

This repository is the open canon (the methodology, written as theses) plus a set of Claude Code skills that operationalize it. It is written for the people who decide *what to build*: founders, indie hackers, product managers, and product marketers. Author of the methodology and the skills — Ivan Zamesin ([X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/)).

---

## How to install

Into your project root (sets up Claude Code + Codex). Clone and run the installer:

```bash
git clone https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills.git
bash Next-Move-Theory-Canon-and-Skills/install.sh --target .
```

Or do it in one command from the site:

```bash
curl -fsSL https://nextmovetheory.com/install.sh | bash
```

[Full details ▸](#install-into-your-project)

---

## There is an algorithm

**There is an algorithm for making any business decision.**

Most product decisions today are guesswork — feeling your way through the fog, betting everything on the one idea that struck you, or an investor's advice. With an algorithm you stop guessing: you lay out every strategy actually open to you and choose among them deliberately, weighing many factors, instead of going all-in on the first one you saw.

Next Move Theory is that algorithm. There is one for each of the questions that decide a product's fate:

- How to launch a product and find Product-Market Fit
- How to scale a product
- How to save a dying product — or know when it's time to shut it down
- How to create value
- How to differentiate from competitors
- How to position a product
- How to exit direct competition
- How to create a Disruptive Innovation
- How to grow conversion
- How to raise average order value
- How to improve retention
- How to build an acquisition channel

This canon is the result of the last eight years of my work. Eight years ago I discovered Jobs To Be Done, saw enormous potential in it, and made an unreasonable decision: rebuild it from scratch so it would finally yield an algorithm. Advanced Jobs To Be Done only realized that potential when I got lucky and found the scientific theories that explain what value actually is and how a person changes behavior — that body of science, gathered in [`scientific-foundations.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md), is the foundation of everything that followed. On top of it I rebuilt JTBD into thousands of foundational theses. But Advanced Jobs To Be Done on its own still didn't produce the algorithm; to get there I had to fold in Unit Economics, the Riskiest Assumption Test, ABCDX segmentation, Goldratt's Theory of Constraints, and other disciplines, and that integration became Next Move Theory. I've since taught this methodology to more than 13,000 people in my home country — and this public canon is how I give its foundations to the world.

**The main algorithm is here in full — read it in [`the-algorithm.md`](Next-Move-Theory-Canon/Algorithms/the-algorithm.md).** But reading the steps isn't enough: for the algorithm to actually work for you, you have to understand the foundations it runs on — what a Job is, what value is, how to segment, how to test the riskiest assumption first. That is what the rest of this canon is — the foundational theses the algorithm stands on, so it works for you instead of reading like an empty checklist.

The **skills** turn that algorithm into tools: feed in a product idea and get back a *decision*, not a description.

I find this methodology incredibly beautiful and powerful, and sharing it with the world is my mission. I hope it brings you a great deal of value — and lets you clearly see the moves available to you.

---

## Who this is for

This canon is written for **product builders** and the Jobs they perform:

- **Early-stage founders (pre-PMF)** — *decide what to build, and whether to keep building.*
- **Indie hackers / solopreneurs** — *pick a niche that pays before sinking weeks into code.*
- **Product managers** — *prioritize a roadmap that isn't theater; diagnose why a metric stalled.*
- **Senior PMs / VPs / CPOs** — *set product strategy that beats annual-planning rituals.*
- **Product marketers / growth** — *position in a crowded category; write messaging that converts.*

If you build, market, or decide the direction of a product, this is for you. You don't have to discard what you already know — customer interviews, CJM, ICP, willingness-to-pay, feature backlogs all still work; they just get grounded in the right unit of analysis and connected to business decisions instead of floating free. Expect the rewire to take practice: most people arrive with a feature-first or persona-first model, and the Job-first model takes a few honest attempts before it feels natural.

---

## What's here — and what's coming

**This public canon is the foundation, not the whole methodology — about 25% of it.** What you have here are the foundational theses of Advanced Jobs To Be Done and Next Move Theory — what a Job is, what value is, how segmentation, behavior change, the Job Graph, and the Riskiest Assumption Test work — plus the main algorithm itself ([`the-algorithm.md`](Next-Move-Theory-Canon/Algorithms/the-algorithm.md)).

**The rest of the methodology is not coming to this public repo.** It lives in the full version — available through the products and courses at **[nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github)**. Beyond the foundations you have here, the full methodology covers:

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

## The skills

The `Skills/` directory holds Claude Code skills that run the methodology for you. Each one reads the canon at runtime, so its output is grounded in *this* methodology — not in the generic JTBD an LLM would otherwise reach for.

| Skill | What it does |
|---|---|
| **[`ask-nmt`](Skills/ask-nmt/)** | A conversational **advisor** you can talk to — ask any product, strategy, segmentation, value, pricing, growth, positioning, B2B, or methodology question and get an answer grounded in the canon (not generic JTBD). It explains concepts, diagnoses your real situation, pressure-tests your hypotheses like a skeptical senior PM, and hands off to the producer skills below when you want a full artifact. |
| **[`diagnose`](Skills/diagnose/)** | A chat-first **diagnostic** for live products. Through up to ~15 adaptive questions it challenges the goal you walked in with (climbing your business-Job graph for a higher-leverage move), then surfaces **all** the risks, **all** the growth points, and the risky assumptions hiding inside your current initiatives — prioritizes the first move and routes you to the skill that executes it. The front door for an existing product the way `market-research` is for a new idea. |
| **[`market-research`](Skills/market-research/)** | Sizes the market and scores segments to answer *"which Jobs of which segment should we compete for first?"* Output: a **GO / NARROW / PIVOT** one-pager, segments scored on a five-factor screen, direct and indirect competitors, an action-first RAT plan, and alternative Big-Job markets to pivot into. |
| **[`craft-value-proposition`](Skills/craft-value-proposition/)** | Takes a chosen segment + Jobs and builds the strongest **Value Proposition** — value hypotheses mapped over the Job Graph and the value-creation mechanics, filtered on feasibility, unit-economics, and competitiveness, ranked, with the top RAT cards. Output includes a PRD-ready implementation spec. |
| **[`product-requirements`](Skills/product-requirements/)** | Turns the chosen segment + value into a build-ready **PRD** (full functionality + edge cases). First runs a *"challenge the build"* gate that hunts for a cheaper way to hit the same business goal before specifying the build. |
| **[`craft-go-to-market`](Skills/craft-go-to-market/)** | Turns the value proposition into ready-to-publish **go-to-market** — landing-page copy, ad / creative formulas, and an acquisition + growth-communication plan (channels loaded with Consideration Activators, lead magnets, viral loops, retention messaging). |

**Two front doors.** **`/ask-nmt`** is the conversational front door for advice, explanation, or pressure-testing an idea. **`/diagnose`** is the front door for a *live product* — it finds your risks and growth points and routes you to the next move. Both answer from the canon and point you to the right producer skill when you need a full artifact; for a brand-new idea, start at `/market-research`.

**The four producer skills form a pipeline**, each one building on the artifact the one before it produced:

1. **`/market-research`** → pick the segment and the Core Jobs to compete for (with the GO / NARROW / PIVOT verdict and the riskiest assumptions to test).
2. **`/craft-value-proposition`** → feed it the market-research result; get the value proposition plus a PRD-ready implementation spec.
3. From the value proposition, branch to either (or both):
   - **`/product-requirements`** → the build-ready PRD — *what to build*. It consumes the segment from step 1 and the value from step 2.
   - **`/craft-go-to-market`** → the landing page, ads, and growth plan — *how to sell it*. Works best from the value proposition; also accepts the PRD or the market-research result.

You can also jump in mid-pipeline if you already know your segment and Jobs — each skill takes what you hand it, or routes you back to the step it needs first.

All six are **user-invocable** in Claude Code (`/ask-nmt`, `/diagnose`, `/market-research`, `/craft-value-proposition`, `/product-requirements`, `/craft-go-to-market`). The four producers each have a fast **Quick** mode (no internet) and a deeper **Deep** mode (subagents + web research); `/ask-nmt` and `/diagnose` are conversational (no file unless you ask).

> The skills produce **hypotheses, not conclusions.** Every number is an LLM-generated estimate with a verification path attached. Validate before any decision with expensive consequences — that's the RAT discipline the methodology is built on.

### Install into your project

Install the canon + skills **into the root of your existing project** (the folder you run your agent from) with **one command**:

```bash
curl -fsSL https://nextmovetheory.com/install.sh | bash
```

That's the whole install — clone + setup in one step, so there's nothing to "run next." It clones the repo to a temp dir and lays everything into your project root. After install that root looks like:

```
your-project/
├── .claude/skills/<skill>/        # skills for Claude Code
├── .codex/skills/<skill>/         # skills for Codex
├── Next-Move-Theory-Canon/        # the canon — keep this exact name (skills read it by this path)
├── AGENTS.md                      # your existing file — rules injected between markers
├── CLAUDE.md                      # your existing file — rules injected between markers
└── NextMoveTheory-README.md       # this README, renamed, for reference
```

**Already ran `git clone` and got a nested `Next-Move-Theory-Canon-and-Skills/` folder?** That's just the raw repo, not an install. Fix it in one step — from inside that folder run:

```bash
bash install.sh            # installs into the PARENT dir (your project root)
# or: bash install.sh --target /path/to/your/project
```

Then invoke a skill:

```
/diagnose            # what should I do next with my product?
/market-research a tool that drafts SOC 2 evidence for early-stage SaaS
```

**Updating later:** re-run the install command. It's **idempotent** — the canon and skills are replaced, the rules between `<!-- Next-Move-Theory-Rules:start -->` … `<!-- Next-Move-Theory-Rules:end -->` are refreshed in place, and your own text outside the markers is untouched.

> **Note for AI agents:** if a user asks you to "install this repo," do **not** stop at `git clone` — that leaves the skills in a nested `Skills/` folder where no agent will find them. Run the one-command installer (or `bash install.sh` from the clone). The skills must end up in `.claude/skills/` and `.codex/skills/` at the project root, never in a top-level `Skills/` folder.

<details>
<summary><b>What the installer does (manual equivalent)</b></summary>

The installer enforces these rules — everything lands in the **project root**; `.claude`/`.codex`/canon are never nested inside one another; skills go **inside** `.claude/skills/` and `.codex/skills/` (never a standalone top-level `Skills/`); the canon folder keeps the exact name `Next-Move-Theory-Canon` (skills read it by that relative path); the rules are injected **between markers** into your existing `CLAUDE.md`/`AGENTS.md` (not a separate file, not overwriting your content); the README is copied in renamed; and re-running is idempotent. The equivalent by hand:

```bash
SRC=$(mktemp -d) && git clone --depth 1 https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills.git "$SRC"
rm -rf ./Next-Move-Theory-Canon && cp -r "$SRC/Next-Move-Theory-Canon" ./Next-Move-Theory-Canon
mkdir -p .claude/skills .codex/skills
cp -r "$SRC"/Skills/. .claude/skills/
cp -r "$SRC"/Skills/. .codex/skills/
cp "$SRC/README.md" ./NextMoveTheory-README.md
# then inject the rules block from "$SRC/CLAUDE.md" and "$SRC/AGENTS.md" between the markers
rm -rf "$SRC"
```
</details>

---

## Make your AI agent methodology-aware

This repo also ships **[`CLAUDE.md`](CLAUDE.md)** and **[`AGENTS.md`](AGENTS.md)** — a compact rules file that teaches a coding agent (Claude Code, Codex, Cursor, and others) to do product work with *this* methodology instead of the generic, often-wrong Jobs To Be Done in its training data.

- **What it is** — the non-negotiable theses (what a Job is, what value is, how to segment) plus a routing table that tells the agent *which canon file to read* for a given task, so it avoids the common JTBD mistakes.
- **How to use it** — the install above injects it for you: step 4 writes these rules into your project's `CLAUDE.md` (Claude Code) and `AGENTS.md` (Codex and most other agents), between `<!-- Next-Move-Theory-Rules:start -->` … `<!-- Next-Move-Theory-Rules:end -->` markers, so updates refresh cleanly and your own rules outside the markers stay intact. The canon it routes to sits at `./Next-Move-Theory-Canon`.
- **Why** — out of the box an agent pattern-matches to generic JTBD and gets the theses wrong. This file points it at the correct definitions and the canon, so its product reasoning is grounded in the methodology.

---

## How to read the canon

> **Prefer a nicer reading experience?** The same canon is available in a cleaner, more readable form on the site — [read it at nextmovetheory.com/library/canon](https://nextmovetheory.com/library/canon?utm_source=canon&utm_medium=github).

The canon lives in [`Next-Move-Theory-Canon/`](Next-Move-Theory-Canon/) — around two dozen interlinked files. You don't have to read them in order. If you want the fastest path to understanding, read these four key-theses files first, in order:

1. **[`Next-Move-Theory/nmt-key-theses.md`](Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md)** — the integrative root: what the whole framework is and how its pillars (AJTBD, Unit Economics, RAT, ABCDX) plus Theory of Constraints — with OKR (Objectives & Key Results) as a supporting methodology — fit into one system. *Start here for the big picture.*
2. **[`Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)** — the substrate the rest stands on: Jobs, the Job Graph, value and the Aha Moment, segmentation. The core you'll use most.
3. **[`Riskiest-Assumption-Test/rat-key-theses.md`](Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md)** — before you build: list the assumptions the idea rests on, rank them by how lethal they are if wrong, and buy the cheapest evidence against the deadliest first.
4. **[`ABCDX-Segmentation/abcdx-segmentation-key-theses.md`](Next-Move-Theory-Canon/ABCDX-Segmentation/abcdx-segmentation-key-theses.md)** — the theory turned into a concrete operating move on a real customer base: focus the high-margin A/B, fire C/D, and read X as the signal of where to grow next.

Then read the rest in whichever cluster matches your problem.

### Advanced Jobs To Be Done — Foundations

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) | The foundational theses — the methodology in one document. The map to everything else. |
| [`Advanced-Jobs-To-Be-Done/scientific-foundations.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md) | The brain as an energy-budget investor; why needs fail as a unit and Jobs succeed. |
| [`Advanced-Jobs-To-Be-Done/job-structure.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md) | The eight elements that fully specify a single Job, element by element, with interview questions. |

### The Job Graph — where strategy lives

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/job-graph.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md) | The hierarchy of Jobs around your product; the four levels, defined *relative to your product's reach*. |
| [`Advanced-Jobs-To-Be-Done/job-types-and-properties.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md) | The taxonomy of Jobs — Regular, Orientation, Tax, Fake, Emotional, Viral — as a diagnostic instrument. |
| [`Advanced-Jobs-To-Be-Done/critical-chain.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md) | The Job Graph projected onto time — the lived path a team actually ships, where the Aha Moment fires. |

### Creating value

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/value-creation.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md) | The deep canon on value: energy efficiency, success criteria as the specification of value, the Aha Moment. |
| [`Advanced-Jobs-To-Be-Done/value-creation-mechanics.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md) | The foundational catalog of value-creation mechanics — kill a Job, take a Job off the customer, climb a level. |
| [`Advanced-Jobs-To-Be-Done/behaviour-change.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md) | Why switching is swapping one Job Graph for another; a Solution as a *label* for the sub-graph it installs. |
| [`Advanced-Jobs-To-Be-Done/customers-attention-management.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/customers-attention-management.md) | Attention as the metabolic resource every value-creation mechanism routes through. |

### Reaching and converting customers

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/consideration-activators.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md) | The five Consideration Activators — what you load into the customer's head to move their choice your way. |
| [`Advanced-Jobs-To-Be-Done/barrier-removal.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/barrier-removal.md) | Removing the objective barriers that make a better Job Graph non-executable for a segment. |
| [`Advanced-Jobs-To-Be-Done/communication.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md) | Communication in the language of Jobs — the value-proposition formula and the landing-page structure. |

### Choosing where to compete

| File | What it teaches |
|---|---|
| [`Advanced-Jobs-To-Be-Done/segmentation.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md) | Segmentation by Job Graph similarity, not demographics — the most expensive cut to get wrong. |
| [`ABCDX-Segmentation/abcdx-segmentation-key-theses.md`](Next-Move-Theory-Canon/ABCDX-Segmentation/abcdx-segmentation-key-theses.md) | ABCDX — splitting your paying base by margin × satisfaction; refocus on A/B, fire C/D, read X as a signal. |
| [`Riskiest-Assumption-Test/rat-key-theses.md`](Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md) | RAT — list the assumptions an idea rests on, rank them by lethality, and buy the cheapest evidence first. |

### Next Move Theory — the meta-framework above AJTBD

| File | What it teaches |
|---|---|
| [`Next-Move-Theory/nmt-key-theses.md`](Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md) | The integrative root — how AJTBD, Unit Economics, RAT, ABCDX, and Theory of Constraints combine into one system, with OKR as a supporting methodology. *The product is a single organism.* |
| [`Next-Move-Theory/focus-as-company-attention-management.md`](Next-Move-Theory-Canon/Next-Move-Theory/focus-as-company-attention-management.md) | Focus as pointing the whole company's attention at specific Core Jobs of one segment; the Innovator's Dilemma as focus that ossified. |
| [`Next-Move-Theory/subtraction.md`](Next-Move-Theory-Canon/Next-Move-Theory/subtraction.md) | Subtraction as the meta-operator across all four pillars — removing Jobs, unprofitable units, risky assumptions, and C/D customers. |

### Practice, B2B, and the operating loop

| File | What it teaches |
|---|---|
| [`HowTos/basic-ajtbd-interview-guide-and-principles.md`](Next-Move-Theory-Canon/HowTos/basic-ajtbd-interview-guide-and-principles.md) | The practical interview guide — principles and a question bank that reconstruct Jobs, criteria, Aha Moments, and Barriers from what a customer actually did. |
| [`Advanced-Jobs-To-Be-Done/b2b.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md) | The B2B deal as a Job Graph across roles — and why personal Jobs usually outweigh business Jobs. |
| [`Algorithms/the-algorithm.md`](Next-Move-Theory-Canon/Algorithms/the-algorithm.md) | How the pieces combine into a single cyclical algorithm — and the anti-patterns that kill products. |

> The public canon covers the most foundational theses and mechanics. The full methodology — the product-diagnosis algorithm, the 100+-mechanic catalog, the full unit-economics integration, and more — lives in the products and courses at nextmovetheory.com. **For new theses and book chapters as they're published, subscribe at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github)** — home to the canon, the books, and the newsletter.

---

## What's inside

```
Next-Move-Theory-Canon-and-Skills/
├── Next-Move-Theory-Canon/             # the methodology, written as theses
│   ├── Advanced-Jobs-To-Be-Done/       #   the Jobs framework — start with ajtbd-key-theses.md
│   ├── ABCDX-Segmentation/             #   segmenting a paying base by margin × satisfaction
│   ├── Riskiest-Assumption-Test/       #   validating ideas before you build them
│   ├── Next-Move-Theory/               #   the integrative meta-framework above AJTBD
│   ├── HowTos/                         #   practical guides — start with the interview guide
│   └── Algorithms/                     #   how the pieces combine into one loop
└── Skills/                             # Claude Code skills that run the methodology
    ├── market-research/
    ├── craft-value-proposition/
    └── product-requirements/
```

---

## How this methodology came to be

By 2018 I taught product for a living — customer research, segmentation, interviews — yet I didn't actually know, at the root, how products get created. The model I taught was *find the pain, build the painkiller* — but I kept watching satisfied customers with no problem to solve buy anyway, and I had no explanation for it. Building my own company against a stronger competitor, I also had no rule for *choosing* a strategy, only a pile of plausible advice. So I made an unreasonable decision: build the methodology from scratch.

I went deep into Jobs To Be Done and kept its deepest intuition — a person sits in a situation and wants to *transition* into a different state — but left the existing machinery behind, because it never told me how to research, segment, choose where to compete, or create value.

It only came together when I got lucky and found the right science. Lisa Feldman Barrett's work led me to allostasis, prediction, and reward prediction error — what *value* actually is to a brain managing an energy budget — and to the theories of needs, emotions, habit, identity, and loss aversion that explain how a person changes behavior. That body of science, gathered in [`scientific-foundations.md`](Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/scientific-foundations.md), is the foundation everything stands on. On top of it I could finally build a real algorithm for creating value — the core I called **Advanced Jobs To Be Done (AJTBD)**.

AJTBD alone still wasn't enough; a few more methodologies turned out to be fundamental. First the **Riskiest Assumption Test**: every initiative is a stack of risky assumptions, any of which might not hold, so you don't just launch and hope. In a sense the idea is already dead — you simply don't yet know what will kill it — and RAT is how you find out cheaply, before you've paid for the build. Then **Unit Economics**: only by competing for the Jobs of segments where you can actually earn a target margin can a company grow and fund its next bets. **Goldratt's Theory of Constraints** taught me to find the single bottleneck that actually limits the system and fix *that*, instead of improving everything at once. Later I added **goal-setting** — an algorithm for finding a company's real growth points. Together, all of it became **Next Move Theory**.

Today thousands of companies in my home country run on this work, with dozens of cases documented at [nextmovetheory.com/cases](http://nextmovetheory.com/cases?utm_source=canon&utm_medium=github). My goal now is to give the methodology to the world — so that your product work stops being guesswork and becomes something you genuinely enjoy. The full story — the scenes, the mistakes, the breaks where the wrong model stopped working — is the subject of my book.

---

## The book — *The Nature of Product*

**[*The Nature of Product*](https://nextmovetheory.com/library/the-nature-of-product?utm_source=canon&utm_medium=github)** is free to read on the site. It's the **first book in a series**, and it covers the foundation — **Advanced Jobs To Be Done (AJTBD)** — not the whole of Next Move Theory; the broader framework comes in later books. Where the canon states the methodology as theses, the book tells the *story of how it was discovered* — a chain of insights, each one a moment where the wrong model stopped working and a better one had to be built, with a recurring skeptic (**Wes**) attacking the ideas with the exact questions real students used.

It's for founders, indie hackers, PMs, marketers, and designers making product decisions on incomplete evidence, and it assumes no prior Jobs-To-Be-Done background — read it on the couch; the canon and skills are here when you want to get operational.

---

## About the author

**Ivan Zamesin** is the author of Advanced Jobs To Be Done and Next Move Theory — ranked the #1 product expert in his home market by two independent industry studies.

- **Led image search at his home market's largest tech company** — took 25% of the market from Google Images, growing share from 55% to 72%.
- **Trained 13,000+ founders and product managers** through the most popular product course in his home market, running since 2017.
- **Founded and sold a startup** — a therapist-matching service: built it, grew it, and exited to a larger marketplace.
- **Product-strategy consulting for market leaders**, built on Jobs and unit economics.

[nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github) · [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com)

---

## Talks & questions

**Want me to speak?** If you'd like me to walk your team, company, or event through the methodology — a talk, a workshop, or a conversation about how it applies to your product — I'd genuinely welcome that. Email me at [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com) or reach out on [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/).

Found an error in a thesis or a broken link? Open an issue or a pull request.

## License

The canon and the skills are licensed under [**CC BY-NC-SA 4.0**](https://creativecommons.org/licenses/by-nc-sa/4.0/) (Creative Commons Attribution–NonCommercial–ShareAlike 4.0 International) — see [`LICENSE`](LICENSE). You are free to **share** and **adapt** the material, as long as you:

- **Attribution** — credit Ivan Zamesin and link back to this repository and the license;
- **NonCommercial** — don't use the material for commercial purposes;
- **ShareAlike** — license your adaptations under the same terms.

---

*A note on how this was written. Every thesis here is mine — built by a human over years of practice, and verified for accuracy. Claude Code turned those theses into a readable text. So if your first thought is "an LLM wrote this" — the wording, yes; the thinking, no.*

*Built by Ivan Zamesin — [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github) · [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · [ivan@nextmovetheory.com](mailto:ivan@nextmovetheory.com). The canon is a living document — it grows as new theses are validated in practice.*

---
name: product-requirements
description: Turn a chosen segment + Core Jobs into a build-ready PRD (full functionality + edge cases) using Ivan Zamesin's AJTBD / Next Move Theory methodology (distinct from generic Christensen JTBD). It CONSUMES upstream work — segments from a /market-research result and the value from a /craft-value-proposition result — and never re-derives them. It runs no research itself: if you haven't done the research, it routes you to run /market-research then /craft-value-proposition first; if you'd rather skip research and just write requirements fast, you describe the segment + Jobs + value you already know and it goes straight to the PRD. Before writing requirements it runs a "challenge the build" gate (5 Whys up the business goal + subtraction-first + local-vs-global + a walk of the value-creation mechanics) that proposes more-effective ways to hit the same business Job than building the thing as specified; if a better way wins, the PRD is written for THAT. Output — a single PRD document — full functionality mapped Core Job → Big Job → value mechanic → success criteria → Aha Moment, built on the Critical Chain, plus edge cases covering ~90% of use cases across people, contexts, and conditions. Writes the PRD in plain language the reader already uses, with methodology terms only in parentheses. Two modes — Quick (default, no internet) and Deep (subagents + web parity check). Defaults to English; adapts to the user's language on request. Use when turning a validated segment+value into a build spec, a feature into requirements, or when the user says "write the PRD / product requirements".
user-invocable: true
---

# Product Requirements (PRD) v4 — English / US edition

> **v4 in one breath.** The skill no longer re-derives segments (that is `/market-research`) or invents value (that is `/craft-value-proposition`) — it **consumes** their output, and it runs **no research itself**. With no upstream artifact it does one of two things: **route** the user to run `/market-research` → `/craft-value-proposition` first (the proper path), or — if the user just wants requirements fast and already knows their segment and value — take the **segment + Jobs + value straight from the user's description** (the fast path) and skip research entirely. It then adds a **"challenge the build"** gate before any requirement is written — *is building this even the right move, or is there a more energy-efficient way to perform the business Job?* — and writes the PRD for whatever wins. The deliverable is a **single PRD only**: full functionality (every feature laddered Core Job → Big Job → value mechanic → success criteria → Aha Moment, on the Critical Chain) + edge cases covering ~90% of use cases across people, contexts, and conditions. Landing/ad/GTM copy moved to `/craft-go-to-market`; analytics and a standalone unit-economics model are out of scope in this version (unit economics survives only as a reasoning filter).

## Where this skill sits in the chain

```
/market-research   →   /craft-value-proposition   →   product-requirements   →   /craft-go-to-market
(segment + Jobs +      (the value hypothesis +          (THIS SKILL:               (landing + ad +
 wedge + competitors)   §11 implementation spec)         the build spec)            GTM/growth comms)
```

This skill is the **build** step. It takes a chosen segment with its Core Jobs and a value direction, challenges whether building is even the right move, and produces the requirements engineers and designers build against. It **does not** re-run segmentation, re-invent the value proposition, or write any customer-facing copy — those are the skills around it. **Never regenerate what an upstream artifact already contains; load it and build on it.**

## What this skill produces

**One file — the PRD** (`{product-slug}-product-requirements-result.md`):
- **Full functionality** for the selected Core Jobs — every requirement laddered Core Job → Big Job → value mechanic → concrete success criteria, with the Aha Moment placed as far left in the Critical Chain as possible.
- **Edge cases covering ~90% of use cases** — derived from Critical-Chain break sites × context variations × Job-types, across the different people, contexts, and conditions the segment performs the Jobs in.
- Plus: target users by Job, competitive parity (reused from upstream), success metrics (criteria → metrics), risk handling (the RAT carried from upstream / the challenge step), and an explicit out-of-scope (anti-segment + deferred Jobs).

**Not produced (this version):** landing/ad/GTM copy → `/craft-go-to-market`; analytics plan → out of scope; standalone unit-economics model → out of scope (unit economics is used only as a *filter* inside the challenge and ranking, never emitted as a document).

**Two modes:**
- **Quick (default, ~5–10 min):** one Claude, no internet, no subagents. Fills the PRD directly from the loaded artifacts + reasoning.
- **Deep (opt-in, longer):** subagents with web access refresh competitor parity and stress-test edge cases against real reviews. See "Deep mode" at the end.

---

## Methodology — source of truth

The **only** source of methodology is the Next Move Theory canon, read at runtime (relative paths; the skill ships in the same repo). **Path note:** if a file is not found, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix the public repo strips.

**Core read set (every run):**

| File | What the skill uses it for |
|---|---|
| `Next-Move-Theory-Canon/Algorithms/the-algorithm.md` | The 10-step spine; **Step 1 — Challenge the business goal** (5 Whys, local-vs-global gate) is the challenge step's home |
| `Next-Move-Theory-Canon/Next-Move-Theory/subtraction.md` | The subtraction-first question + invisible-product asymptote — the heart of the challenge |
| `Next-Move-Theory-Canon/Next-Move-Theory/local-vs-global-optimum.md` | Is this an additive local-optimum build when a global-optimum move returns more? |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | Value formula (§3), success criteria (§9), criteria→mechanics map (§11), Aha Moment (§12), the two dominant mechanics (§14), value-lives-outside-Core-Jobs (§17) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | The mechanics catalog — the menu for the challenge AND the feature→mechanic mapping |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | The chain the functionality is built on; **break sites = the edge-case source** (§5, §7) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | The 8 Job elements; context→criteria (§3); criteria→metrics (§8); fidelity levels |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md` | Tax / Orientation / Emotional / Viral Jobs — edge-case and functionality sources |
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | Risk handling; the drop-it exercise (used in the challenge); MVP = probe |

**As-needed read set:**

| File | When |
|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md` | When the Job-Graph slice needs care (level placement, many-to-many, directional moves) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | Path D — sharpening a manually-described segment; confirming Core-Job level placement |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | Aha Moment placement, triggers, the seven behavior-change triggers |
| `Next-Move-Theory-Canon/UnitEconomics/unit-economics.md` | The financial filter inside the challenge + ranking (filter only — not an output) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md` | When the buyer is a company — role-chain edge cases, two parallel Job Graphs |

**This skill runs no research and performs no segmentation.** With no upstream artifact it either **routes** the user to `/market-research` → `/craft-value-proposition` (the proper path), or takes a **manually-described** segment + Jobs + value (the fast path) and writes the PRD directly. The canon files above are read to *build the PRD on* a segment+value that already exists — not to discover one.

**Do NOT use generic JTBD from the internet or prior training.** Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per project `CLAUDE.md`):
- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), in order to perform a higher-level Job. Not "a struggle for progress."
- **Value** is greater energy efficiency for the brain in performing a Job, measured against the brain's prediction. The **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. **Never use the abbreviations PPE / NPE** (Rule 22) — write *Aha Moment* / *Problem*.
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job. Each infinitive verb is a separate Job (Rule 7); parse multi-verb statements into the hierarchy.
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs.

**Methodological invariants — the PRD is invalid if any is violated:**
- **Every feature links Core Job → Big Job** AND names the **value mechanic** it implements (from `value-creation-mechanics.md`). A feature with no Big-Job ladder and no mechanic is not a requirement — it's feature thinking (`value-creation.md §1`).
- **The Aha Moment is a positive-prediction-error event**, never signup / login / "first action", placed as far left in the Critical Chain as possible (`value-creation.md §12`).
- **The Critical Chain is explicitly constructed per Core Job** (`critical-chain.md`) — functionality and edge cases are both read off it.
- **Success criteria are concrete** (direction + level) and translate into the success metrics (`job-structure.md §8`).
- **Segmentation is never re-derived here** — it is consumed (Core Jobs + success criteria as the root; Big Job is motivation context, not the segmentation cut).
- **The challenge step runs before any requirement is written** — and the PRD is written for the *winning* way to perform the business Job, not necessarily the originally-specified build.

Per `CLAUDE.md`: every named external source is a clickable Markdown link (Rule 2); US-context analogs and recognition test for examples (Rules 6, 19); two-part disclaimer at the top of the result (Rule 3).

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the user-facing document in the plain, everyday language the focal segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label.

- ❌ *"Red Queen value-gap compression…"* · *"the Critical Chain breaks at M4"* · *"load the Consideration Activators."*
- ✅ *"The free do-it-yourself option caught up, so your edge shrank even though you didn't get worse (in the methodology, a* Red Queen *effect)."*

**Who reads it** — the focal segments (internal map: `Strategy/Segments-and-Jobs.md`): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain)* · the exact step where they get stuck *(a Critical Chain break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and any explicit **methodology appendix**, where full methodology language is expected. The *lead the reader sees* is plain; the *parenthetical and the appendix* carry the precise terms.

---

## Output file (one file per run — `CLAUDE.md` Rule 4)

The skill writes **exactly one** file, in the project root (never `TMP/` or `.claude/`):

```
Skill-Results/product-requirements/{YYYY-MM-DD_HH-MM}_{product-slug}-product-requirements-result.md
```

Everything internal — the normalized input, the challenge (business-goal ladder, subtraction-first, the more-effective ways and which won, the locked build subject), the Critical Chain per Core Job, dropped alternatives, and the self-critic verdicts — **stays in-context**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

---

## The pipeline (S0 → S5)

```
S0  Intake & route ──────(human: language, mode, input path) ──► [no research path? → route OUT
     │                                                              to /market-research → /craft-value-
     │                                                              proposition, OR take a manual
     │                                                              segment+Jobs+value to write fast]
S1  Select segment + Core Jobs ─(human: pick segment → pick Core Jobs)
     │
S2  Business context ────(human: ≤4 batched Qs — only the fields not already supplied)
     │
S3  CHALLENGE THE BUILD ─(human: pick the build subject — the original, or a more-effective way)
     │
S4  PRD generation ──────(functionality on the Critical Chain + ~90% edge cases — no questions)
     │
S5  Assemble + self-critic + summary ──(human: optional tweaks)
```

Question budget: **3–5 human touchpoints**, fewer when an upstream artifact already carries the segment/value/context. The skill never runs research inside itself — it routes out for it (S0) or takes a manual segment+value. Quick mode runs S4 in a single pass.

---

## S0 — Intake & route

### Language
Default **English**. If the user writes in another language, offer to work in it (English / their language / Other). Hold the choice in context. The PRD uses the chosen language; canon files and source URLs stay as-is.

### One batched `AskUserQuestion`

```
Q1 "Where are you starting from?"
  - "I have a /craft-value-proposition result"   → Path A (best — segments AND value present)
  - "I have a /market-research result"            → Path B (segments present; value not yet crafted)
  - "I haven't done research and want to"         → Path C (ROUTE OUT — run the chain first)
  - "Skip research — I know my segment & value"   → Path D (fast path — I'll describe them)

Q2 "Mode?"
  - "Quick (default — fast, no internet)"
  - "Deep (subagents + web parity check)"

Q3 (Paths A/B only) "Path to the result file?"  → free text; Read it.
```

### Resolve the input path

- **Path A — craft-value-proposition result.** Read it. Its **§11 Implementation spec** already carries the product shape, the feature table (Core Job / criterion / mechanic / Aha link), Critical Chain & Aha placement, cost-to-build & cheapest probe, unit-econ direction, and anti-segment — **plus** the focal segment, Big Job(s), competitors, proof, and RAT cards in the body. **This is the richest input — segments AND value are both present.** Most of S1/S2 is already answered; confirm rather than re-ask, then go to S3.
- **Path B — market-research result.** Read it. Parse the focal segment(s) (✅/⚠️), their Core Jobs + success criteria, Big Jobs, competitors (direct/indirect/turnkey), the wedge, and the action-first RAT — **carry all of it forward, never regenerate it.** The value layer is *not yet crafted*, so say so: *"You have segments but no crafted value proposition. Strongly recommended: run `/craft-value-proposition` on the focal segment first — the PRD is much sharper from a real value hypothesis. Run it now, or proceed using the market-research wedge as the value direction?"* If the user proceeds, use the wedge/differentiation hypothesis as the value direction; flag the reduced confidence at the top of the PRD.
- **Path C — no research yet, wants it (ROUTE OUT — do not run research here).** Reply: *"The right order is `/market-research` → `/craft-value-proposition` → back here. Run `/market-research` first (it finds and scores the segments), then `/craft-value-proposition` (it builds the value hypothesis + a PRD-ready spec), then return and pick Path A. Want me to open the `/market-research` input prompt now?"* Hand off and stop — this skill does not size markets or discover segments.
- **Path D — fast path, manual segment + Jobs + value (no research).** For the user who already knows the segment and the value and just wants requirements. Collect, by description/dictation: product (1–2 sentences) + URL if any; focal segment NAME + causal criteria (behaviour/characteristic, **not** demographics); Big Job(s) + criteria; top 1–3 **Core Jobs** in canonical `When … I want to {outcome} with success criteria {direction+level}, in order to {Big Job}` form; **the value** (what value we create + roughly via which mechanic — this stands in for `/craft-value-proposition`); ≥3 known alternatives (direct/indirect/turnkey if known); the business goal. Validate against the invariants — fix multi-verb Jobs (Rule 7), demographic "criteria", and adjective "value" before proceeding. Then go straight into S1→S5. Flag reduced confidence at the top of the PRD (*"generated from a manually-described segment + value, not a research-backed one"*).

**Hold** the normalized input in context.

---

## S1 — Select segment + Core Jobs

**If a single focal segment arrives from Path A (or a clearly-focal ✅ segment from Path B, or the one segment described on Path D)** — skip the segment pick; confirm it in one line and go straight to Core-Job selection.

**Otherwise** present the segments on the table and ask:

```
Q "Which segment do we build for?"
  - [Segment 1 — one line: who they are + their dominant criteria]
  - [Segment 2 — …]
  - …
  - "None of these"
```

If the user picks **"None of these"**, the skill does **not** go discover a new market itself — it offers the two real options: *describe a different segment now (continue on the fast path), or run `/market-research` to find and score better segments and come back.* Never force a segment.

Then select the **Core Jobs** to design for (these are what the product performs fully — `job-graph.md §2`):

```
Q "Which Core Jobs of {segment} should the PRD cover?"
  - [Core Job 1 — When … I want to … with success criteria …]
  - [Core Job 2 — …]
  - "All of the above"
  - "I'll adjust"
```

Keep the focus tight — **1–3 Core Jobs**. Push back on "all of everything"; focus is the subtraction of non-focal Jobs (`subtraction.md §1`, `segmentation.md §9`). Hold the chosen segment + Core Jobs (canonical form, with success criteria) in context.

---

## S2 — Business context (only the gaps)

Gather only what an upstream artifact didn't already supply, in **one batch of ≤4** `AskUserQuestion`. Skip any field already known.

- **Business goal / business Job** — why are we building this? (launch / grow an existing product / new feature / expand to a new segment). *This is the anchor the S3 challenge ladders up from.*
- **Constraints** — team, budget, build horizon (<2 wks / 1–2 mo / 3–6 mo / 6+ mo). Sets MVP-vs-full scope and the cheapest-probe framing.
- **Stage / traction** — idea on paper / interviews done / early users / live with traffic. Sets PMF context (`the-algorithm.md §5`).
- **Product type & monetization** — SaaS / mobile / service / marketplace / course; subscription / one-off / freemium / lead-gen. (B2B? → load `b2b.md` for the role-chain edge cases.)

"Don't know" is fine — capture as a hypothesis (in context).

---

## S3 — Challenge the build (the gate)

**This runs before any requirement is written.** Source: `the-algorithm.md §4 Step 1`, `subtraction.md`, `local-vs-global-optimum.md`, `rat-key-theses.md §10`, `value-creation.md §1, §14, §17`. The point is not to talk the user out of building — it is to make sure the build is the **most energy-efficient way to perform the business Job**, because *the planning unit is the value hypothesis, not the feature.*

Run these four moves (hold the result in context):

1. **Ladder the business goal up (5 Whys).** *Why build this? → in order to do what? →* climb 3–5 levels (feature → conversion → sales → margin → the strategic goal). Name the **real business Job** the build is meant to serve. The thing handed to you is frequently a mis-set goal; analyzing *how* to hit a mis-set goal is the most expensive early waste (`the-algorithm.md` Step 1).
2. **Subtraction-first.** Ask the one question that travels across pillars: *"What can we **remove** from this product / segment / chain / assumption-stack that would produce a comparable or larger effect for less cost?"* Hold the invisible-product asymptote: *"What would it look like for the customer to reach this outcome with no product to interact with at all?"* (`subtraction.md §2–§3`).
3. **Local-vs-global check.** Is the proposed build an **additive local-optimum** move (improve the current product/segment/model — low risk, capped return) when a **global-optimum** move (move-up-a-level, change segment, change business model, capture Previous/Next Job) would return multiplicatively more? Name the choice explicitly; don't drift into local by default (`local-vs-global-optimum.md`).
4. **Generate the more-effective ways.** Walk the value-creation mechanics over the segment's Job Graph and generate **2–4 alternatives** to building the thing as specified — each one a concrete way to perform the business Job *more energy-efficiently*. Lead with the two dominant mechanics (**move up a level**, **kill a Job**) and the cheapest-probe forms (concierge, no-code, done-for-you, partner, capture the Previous Job, "do nothing"). For each alternative state: the **mechanic**, **what it removes/adds**, **cost-to-build vs. the original**, a **unit-economics-direction** sanity check (does the value convert to margin?), and the **riskiest assumption** it carries (RAT drop-it: which alternative removes risk rather than adding it).

Then present the choice:

```
Q "Here's the build as specified, plus {N} potentially more-effective ways to hit
   the business Job '{laddered business Job}'. Which do we write the PRD for?"
  - "Build it as specified"           [+ one line on why it's the right call]
  - "{More-effective way 1}"           [mechanic — what it removes — cost vs. original]
  - "{More-effective way 2}"           […]
  - "Blend — I'll describe"
```

**Lock the winning build subject.** If a more-effective way wins, the PRD is written **for that** — re-anchor the Core Jobs / Critical Chain on the chosen approach before S4. Hold the decision (and the alternatives not taken, with reasons) in context.

> Keep this proportionate. For a small, well-validated feature on a working product the challenge may be one paragraph that confirms the build; for a from-scratch product it is the highest-leverage step in the run. Do not manufacture alternatives for symmetry — if the specified build genuinely is the most efficient way, say so and move on (`CLAUDE.md` Rule 12).

---

## S4 — PRD generation

Generate against the **locked build subject** for the **selected Core Jobs**. In Quick mode this is one pass; in Deep mode it is parallelized (below). Build the Critical Chain first (held in context), then write the PRD sections.

### 4.0 Build the Critical Chain per Core Job
For each selected Core Job, construct the **Critical Chain** — the sequence of Micro Jobs that must all complete for the Big Job to land (`critical-chain.md §1–§2`). Mark the **shape** of each segment (AND-parallel / OR-alternative / conditional) and the **break sites** (hand-offs, cycles, slowest link, external-interruption points). Mark the **Aha-Moment position** and how far left it can be shifted. This chain is the substrate for both functionality (§4.3) and edge cases (§4.4).

### PRD structure (the result file)

```markdown
# Product Requirements — {product / build subject}

> **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses, each with a runnable verification path. Validate before any major decision.
> **Hallucination disclaimer.** Generated by an LLM; may contain hallucinations in unknown places. For expensive decisions, run a full research pass; do not act on this document alone.
> ⚠️ {Path D → reduced-confidence flag; Path A/B → name the source artifact file path; if the challenge changed the build subject, say so in one line.}
```

**1. Overview**
- What we're building (the build subject locked in S3) and the **business Job** it serves (from the S3 ladder).
- Target segment(s) + the selected Core Jobs (canonical form, with success criteria).
- **Aha Moment per segment** — the positive-prediction-error event, where it fires on the Critical Chain, how far left it's shifted. (Never signup/login.)
- If the challenge changed the approach: one line on what was *not* built and why.

**2. Target users (by Job, not demographics)**
- Per segment: causal criteria; the Core Jobs they hire us for; their dominant success criteria (direction + level); the Big Job(s) above (motivation).
- B2B: business Job *and* personal Job per relevant role; the role chain (`b2b.md §5, §7`).

**3. Functional requirements** *(the core)*
For each selected Core Job:
- **The Critical Chain** (the Micro-Job sequence from §4.0, shape marked).
- Requirements phrased from the user's side — *"User can {Micro Job}"* — each with **acceptance criteria = the success criteria (direction + level)**.
- **Every requirement declares:** (a) which Core Job it serves, (b) **which Big Job it ladders to** (mandatory), (c) **which value mechanic it implements** (from `value-creation-mechanics.md`), (d) its link to the Aha Moment.
- **Onboarding → value activation:** the shortest path to the first Aha Moment; what to remove/simplify to shift it left; the Aha validity check (*what does the user predict here? what do they get? is the actual better than the prediction?* — if nothing is surprising, it isn't an Aha Moment).
- **No feature dilution:** every requirement serves the focal segment, or is moved to §7 deferred.

**4. Edge cases — ~90% of use cases across people, contexts, conditions**
Edge cases in AJTBD are **where the Critical Chain breaks or produces a Problem (a Negative Prediction Error)** under a real variation — not a generic QA checklist. Generate from five sources, then cover the standard technical/operational categories *as they hit the chain*:

- **(a) Context variations** — same expected outcome, different **context** → different success criteria → effectively a different Job (`job-structure.md §3, §11`). Enumerate the contexts the segment + adjacent users actually hit: new vs returning user; B2B roles; regulatory contexts (HIPAA / FERPA / state-by-state); locale / device / language; scale (0 items / 1 / many / 10,000); free vs paid tier; first-time (Orientation-Job-heavy) vs Nth-time.
- **(b) Critical-Chain break sites** (`critical-chain.md §7`) — hand-offs (ownership ambiguity, latency, information loss), cycles (return-for-rework), the slowest link, external interruptions (a higher-priority Job bursts in; criteria change mid-walk; a competitor surfaces mid-walk).
- **(c) Tax Jobs** (`job-types-and-properties.md §7`) — work forced on the customer when a chain link fails; each is a Problem and a churn/abandonment trigger.
- **(d) Job-type branches** — Orientation Jobs for first-timers; Emotional Jobs (anxiety states); Viral Jobs (the Job performed for/with another person); conditional chain steps that exist only for a sub-context.
- **(e) B2B role-chain breaks** (if B2B) — breaks at role boundaries, mostly *personal-Job* failures (IT security veto, procurement/legal late stalls) (`b2b.md §9`).
- **Standard categories, framed as chain-breaks:** empty/oversized/malformed input; no/slow/lost network; concurrency & conflicting operations; auth & permissions; payments (cancelled / partial refund / lapsed sub / double charge); security (injection, unauthorized access, rate limits).

Render as a table, sorted by **importance-driven severity** (`critical-chain.md §5` — high-importance break → same-day churn trigger; medium → silent churn; low → the customer drops the Job):

```
| # | Use-case / context | Where in the Critical Chain | What breaks (the Problem / Tax Job) | Severity (Critical/High/Med/Low) | Requirement to handle it |
```

**Critical and High edge cases become core requirements in §3**; Medium/Low live in this section. Target ~90% coverage of the likely use cases; if you cap coverage, say what was dropped (`CLAUDE.md` — no silent truncation).

**5. Competitive parity** *(reused from upstream — do not re-mine in Quick mode)*
- Functionality that must at least match competitors (from the upstream competitor set).
- Functionality competitors close poorly = our wedge (the underserved success-criterion intersection).
- (Deep mode refreshes this against live competitor sites + reviews.)

**6. Success metrics**
- Per Core Job: the success criteria **translated into measurable activation / value-delivery metrics** (`job-structure.md §8` — criteria *are* the metric set).
- **Aha-Moment rate** (share of new users who reach it, and how far left it fires).
- North Star: the focus segment performing the Core Job at criteria, repeatedly.

**7. Risk handling & out of scope**
- **Risks:** the RAT carried from upstream (or generated here) — for each, how the PRD minimizes/accounts for it, and **the single riskiest assumption to validate (cheaply) before the build** (`rat-key-theses.md §8` — kill the product, don't launch it; the MVP is a probe, name what it tests).
- **Anti-segment / out of scope:** who this is explicitly NOT for (2–3 groups); Jobs/segments deliberately subtracted to hold focus; features deferred to a later phase (the non-focal Jobs from §3).

**8. Non-functional requirements** *(only when relevant)* — performance, security, scalability, compliance, expressed against the chain where they bite.

---

## S5 — Assemble, self-critic, summarize

Run the **self-critic** over the draft (Quick: a self-critique pass; Deep: a separate critic agent), fix in place, keep verdicts in-context. Then write the single result file and give the user a brief chat summary: what the challenge decided, what the PRD covers, the Aha Moment, the riskiest assumption to validate first, and the file path. Offer the handoff: *"Feed this PRD to `/craft-go-to-market` for landing + ad + GTM copy."*

### Self-critic criteria (methodology only — format is guaranteed by the template)
1. **No segment re-derivation** — the segment/Core Jobs were consumed from an upstream artifact or taken from the user's description; never discovered, sized, or scored inside this skill.
2. **Challenge ran first** — the business goal was laddered, subtraction-first asked, local-vs-global named, and the PRD is written for the *winning* build subject.
3. **Every feature ladders Core Job → Big Job AND names a value mechanic** — no bare features.
4. **Aha Moment is a real positive-prediction-error event**, placed as far left as the chain allows — not signup/login.
5. **The Critical Chain is explicit per Core Job**, with shape and break sites marked.
6. **Edge cases are chain-break-driven and context-spanning**, ~90% coverage, severity by importance — not a generic QA list.
7. **Success criteria are concrete** (direction + level) and map to the success metrics.
8. **Out-of-scope names the anti-segment and the subtracted Jobs** — focus is visible.
9. **Disclaimers present; external sources are clickable links; US-context analogs; no PPE/NPE** (`CLAUDE.md` Rules 2, 3, 6, 19, 22).

- [ ] Plain-language-led — the PRD leads in the reader's own words; methodology terms only in parentheses (never jargon-first); any methodology appendix / debug may stay in full terms.

---

## Deep mode (subagents + web)

Same S0→S3 with the human; S4 parallelized and web-grounded. Agents are spawned with the `Agent` tool, `subagent_type: "general-purpose"`, `run_in_background: true`. Each reads the core canon set, **returns its result in its final message — no files**, links every external source. The orchestrator holds all returns in context and writes the single output file.

```
Wave 1 (parallel):
  [PARITY]  Competitor-parity refresh — only if upstream parity is stale or absent. Given the upstream
            competitor set, confirm/extend the parity table from live sites + reviews; mark what
            competitors close poorly (the wedge). ≤8 fetches. → returns the parity table in-message.
  [CHAIN]   Critical-Chain builder — given the input + the challenge + critical-chain.md + job-structure.md,
            build the chain per Core Job (shapes + break sites + Aha placement). → returns the chain in-message.
Wave 2 (sequential): PRD designer — given the input + the challenge + the chain + the parity return + core set,
            write functionality (§1–§3, §5–§8). → returns the PRD body in-message.
Wave 3 (parallel):
  [EDGE]    Edge-case analyst — given the chain + the PRD body + reviews (web), generate the ~90%
            edge-case table, chain-break-driven, severity by importance. → returns the table in-message.
  [CRITIC]  Adversarial self-critic — run the 9 criteria; return fix_instructions (≤2 rounds, then escalate).
Orchestrator: hold all returns in context; merge §3 with Critical/High edge cases; apply critic fixes; write the single result file; chat summary.
```

Web caps: parity ≤8 fetches; edge-case review mining ≤8. Source links mandatory (Rule 2); never invent sources or numbers.

---

## What this skill does NOT do

- **Does not re-derive segments or size markets** → `/market-research`.
- **Does not invent the value proposition or pick the focal segment** → `/craft-value-proposition` (it consumes the §11 implementation spec).
- **Does not write landing, ad, or GTM/growth copy** → `/craft-go-to-market`.
- **Does not produce an analytics plan** (out of scope this version) or a **standalone unit-economics model** (unit economics is used only as a reasoning filter in S3/ranking).
- **Does not run interviews or execute the RATs** — it names the riskiest assumption to validate; the user runs it next.
- Quick mode: no internet, no subagents.

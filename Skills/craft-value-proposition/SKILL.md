---
name: craft-value-proposition
description: Generate the strongest possible Value Proposition for a chosen segment using Ivan Zamesin's AJTBD / Next Move Theory methodology (distinct from generic Christensen JTBD). Input — a /market-research result OR a manual segment+Jobs description. The skill extracts the segment's dominant success criteria, builds the Job Graph + Critical Chain substrate, generates value hypotheses by mapping the value-creation mechanics catalog over that graph (the strongest / fastest / cheapest way to create value — app, feature, done-for-you service, offline space, guarantee, bundle…), then filters every hypothesis on feasibility, cost-to-build, unit-economics, and competitiveness versus direct/indirect/turnkey competitors, ranks by RICE, and surfaces a primary + supplementary value proposition. Output — a US-native value-proposition document (one-liner, segment, Job story, pains/gains, before→after, benefit themes, differentiation vs alternatives, proof, a falsifiable value hypothesis, success metric + threshold, top-3 RAT cards), an NMT methodology appendix, and a PRD-ready implementation spec that feeds /product-requirements. Writes the value-proposition document in plain language the reader already uses, with methodology terms only in parentheses. Two modes — Quick (default, ~10-15 min, no internet) and Deep (~30-45 min, subagents + web-grounded competitor mining). Defaults to English; adapts to the user's language on request.
user-invocable: true
---

# Craft Value Proposition v2

This skill turns a market-understanding artifact (or a manual segment description) into the **strongest possible, validatable value proposition** for a chosen focal segment — and a **PRD-ready implementation spec** that describes how to build it.

It sits in the middle of the chain:

```
/market-research → /craft-value-proposition → /product-requirements → /craft-go-to-market
(segment + Jobs +   (the value hypothesis +     (the build: PRD —        (landing + ad +
 wedge + competitors) §11 implementation spec)    functionality +          GTM/growth comms)
                                                   edge cases)
```

`/market-research` hands over a focal segment with its Core Jobs, success criteria, Big Jobs, competitors and a one-line wedge. This skill goes **much deeper than that wedge**: it extracts the segment's *dominant* success criteria, builds the Job Graph the mechanics operate over, **generates** value hypotheses by walking the full value-creation mechanics catalog over that graph, then **filters and ranks** them on feasibility, cost-to-build, unit-economics, and real competitiveness. The output's `§ Implementation spec` is the canonical input `/product-requirements` consumes.

The bigger gift is **invention** — systematically generating the strongest / fastest / cheapest way to create value — not validation. Validation (the RAT cards) is the deliverable, not the differentiator.

---

## Core methodological principle

**Source of truth — `Next-Move-Theory-Canon/` in the project root.** Do NOT use generic interpretations of Jobs To Be Done from the internet or LLM training. Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per project `CLAUDE.md`):

- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), `in order to` perform a higher-level Job. Not "a struggle for progress."
- **Value** is greater energy efficiency for the brain in performing a Job, measured against the brain's prediction. The **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. **Never use the abbreviations PPE / NPE** (per Rule 22) — write *Aha Moment* / *Problem*.
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job. Each infinitive verb is a separate Job (Rule 7).
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs.

**Methodological invariants this skill MUST enforce — output is invalid if any is violated:**

- **Value = `Probability of the Outcome × Outcome − Cost`** (`value-creation.md §3`). Three levers: raise probability (guarantee/proof), raise outcome (move-up-a-level), lower cost (money/time/effort/cognitive/negative-emotion/Tax-Jobs). A value hypothesis names which lever it pulls.
- **Mechanics operate over a Job Graph**, not against a Core Job in isolation (`create-value.md`, `job-graph.md §12`).
- **Segmentation root = similar Core Jobs + similar success criteria, in a similar priority order.** The *priority order over criteria* is what makes a segment a segment (`segmentation.md §2`, `value-creation.md §10`). Big Job is motivation context, **never** the primary segmentation criterion. Demographics are second-order correlates.
- **Habit cannot be fought head-on** — reuse it or sidestep it via an Aha Moment + loaded Consideration Activators (`behaviour-change.md §9–§11`). Never "beat the habit."
- **Aha Moment is a specific positive-prediction-error event** — NOT signup, login, or first feature use. Place it as far left in the Critical Chain as possible.
- **All switches go through the Big Job** — the value prop must be communicable through a Big-Job criterion (`behaviour-change.md §4`).
- **Anti-segment must be nameable** — if everyone wants this, the value prop is too universal.
- **Unit economics is a filter** — value that does not convert to margin (LTV > CAC, Job budget covers cost-to-serve) is not a product (`unit-economics.md`).
- **Risks compound** — a value prop stacking ≥5 unvalidated assumptions gets flagged (`rat-key-theses.md §1`).

Per project `CLAUDE.md`: every named external source in any output is a clickable Markdown link `[Name](https://...)` (Rule 2). Disclaimers (numerical + hallucination) at the top of `result.md` (Rule 3). Outputs are written for a **US product audience** (Rule 6) — default to US-context analogs.

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the user-facing document in the plain, everyday language the focal segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label.

- ❌ *"Red Queen value-gap compression…"* · *"the Critical Chain breaks at M4"* · *"load the Consideration Activators."*
- ✅ *"The free do-it-yourself option caught up, so your edge shrank even though you didn't get worse (in the methodology, a* Red Queen *effect)."*

**Who reads it** — the focal segments (internal map: `Strategy/Segments-and-Jobs.md`): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain)* · the exact step where they get stuck *(a Critical Chain break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and the explicit **§12 Methodology appendix (NMT)**, where full methodology language is expected. The *lead the reader sees* in §0–§11 is plain; the *parenthetical and the appendix* carry the precise terms.

---

## Methodology — source of truth (read at runtime)

Read these canon files at run start (relative paths; the skill ships in the same repo as the canon). **Path note:** if a file is not found, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix the public repo strips.

**Core read set (every run):**

| File | What the skill uses it for |
|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | The value formula (§3), 6 cost dimensions (§8), success criteria (§9), the 8 criteria-priority orders (§10), **the criteria→mechanics map (§11)**, the Aha Moment (§12), move-up / kill-a-Job (§14), the invisible-product North Star (§20) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | The ~26 foundational mechanics (the generation catalog) |
| `Next-Move-Theory-Canon/Algorithms/create-value.md` | The canonical algorithm this skill instantiates: graph → pick mechanics → apply over graph → RICE → strategy |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | Segmentation root, sub-segment vs new segment |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | Forces of behaviour change, Consideration Activators, Class 1/2, habit reuse |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | Critical Chain, breaks/cycles/hand-offs, Aha placement, Previous/Next Job |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | The 8 Job elements, success criteria (direction + level), 3 fidelity levels |
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | The RAT chain, the RAT formula, custom risks |
| `Next-Move-Theory-Canon/UnitEconomics/unit-economics.md` | The feasibility / cost-to-serve / margin filter |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md` | The one-liner formula and value-prop language (for the artifact) |

**Extended read set (Deep mode, or when needed):**

| File | When |
|---|---|
| `Next-Move-Theory-Canon/Next-Move-Theory/mechanics-catalog.md` | S3 generation — the broader ~80-mechanic catalog grouped by business task |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md` | When the graph substrate needs care (levels, many-to-many, directional moves) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` | When the value prop's Big-Job communication / fear reduction needs depth |

---

## The pipeline (S0 → S6 with critic gates)

```
S0  Intake & Route ───(human: input path, mode, focal segment)
     │
S1  Dominant success criteria + anchors ──────────► GATE-1 ─┐
     │                                                        │ loop ≤2 rounds,
S2  Job-Graph substrate (Micro + Critical Chain) ─► GATE-2 ─┤ then escalate to human
     │
S3  Value-hypothesis GENERATION (divergence) ─────► GATE-3 ─┤  ⇇ Deep: parallel mechanic-family
     │   "strongest / fastest / cheapest way"                │      agents + reviews-mining
S4  Feasibility · Cost · Competitiveness FILTER ──► GATE-4 ─┤  ⇇ Deep: web-grounded competitor matrix
     │   + unit-econ + RICE → top 1–2
S5  De-risk (RAT cards) ──────────────────────────► GATE-5 ─┘
     │
   ──(human: pick PRIMARY vs SUPPLEMENTARY)──
     │
S6  Synthesize artifact (US value-prop + appendix + impl spec) ► GATE-6 (panel) ──(human: ship)
```

This is the `create-value.md` algorithm with `unit-economics.md` as the feasibility filter and `rat-key-theses.md` as the de-risking layer. The spine is a **prompt-chaining workflow with an evaluator-optimizer gate after each substantive stage** — not an autonomous agent.

### The critic / gate design (shared by every GATE)

Each GATE is an **adversarial, binary, evidence-citing critic grounded in the canon** — in Quick mode a self-critique pass, in Deep mode a separate critic agent. The verdict rule:

```
You are an adversarial reviewer. REFUTE the output; find the strongest reason each
criterion FAILS before deciding it passes. Default to REJECT under uncertainty — a
criterion passes ONLY with a cited span of evidence. Do NOT rewrite; only judge + instruct.

Per criterion → { verdict: pass | fail, evidence: "<exact span>", critique: "<specific, actionable>" }
Overall      → { overall: pass | fail, blocking: [...], fix_instructions: "<ordered changes>" }
Binary verdicts only — no 1–5 scores.
```

- **Hard checks are deterministic, not LLM-judged** — run them as code-style checks (Job grammar = one `I want to + infinitive`; every external number carries a clickable link; a hypothesis is stated as `mechanic × Core Job × criterion × alternative`, never as a bare feature).
- **Loop control:** generate → judge → `pass` ships; `fail` feeds `fix_instructions` back to the generator. **Max 2 rounds**, then escalate to the user (prevents the self-correction-degradation failure mode). If a round's critique repeats the prior round's unresolved issues, escalate immediately.
- **GATE verdicts stay in-context**, not in the user-facing file.

---

## Output file (per `CLAUDE.md` Rule 4 — one file per run)

The skill writes **exactly one** file, in the project root (never `TMP/` or `.claude/`):

```
Skill-Results/craft-value-proposition/{YYYY-MM-DD_HH-MM}_{product-slug}-craft-value-proposition-result.md
```

Everything else — the normalized input, the ranked criteria, the Job Graph, the raw hypotheses, the scored shortlist, the RAT inventory, dropped hypotheses, and every GATE verdict — **stays in-context across the stages**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

---

# Quick mode (default, ~10–15 min, no internet)

One Claude, no internet, no subagents. Runs the full S0→S6 chain inline; each GATE is a self-critique pass with the adversarial prompt above, grounded in the canon. Feasibility and competitiveness are reasoning-grade (Deep mode grounds them on the web).

## S0 — Intake & Route

### Language
Default **English**. If the user writes in another language, offer to work in it via `AskUserQuestion` (English / their language / Other). Hold the choice in context. The report uses the chosen language; canon files and source URLs stay as-is.

### Determine input path
Ask via `AskUserQuestion`:

```
Q1: "What's your input?"
- "I have a /market-research result file"   → path A: load and parse
- "I want to run /market-research first"    → path B: hand off, then come back
- "I'll describe the segment manually"      → path C: standalone manual intake
```

**Path A — market-research result loaded.** Ask for the result file path, `Read` it, parse the segment list. Then:

```
Q2: "Which focal segment(s)?" (list the ✅/⚠️ segments parsed from the result)
- Pick 1 (recommended) or 2 (max). Push back on 3+.

Q3: "What's the active business goal?"
- "Launch a new product"
- "Reposition an existing product"
- "Expand an existing product into a new segment"
- "Other — I'll describe"
```

**Path B — wants market-research first.** Reply: *"Strongly recommended — the value prop is much sharper from a real market-research run. Run `/market-research` (Quick or Deep), then come back here with the result file. Want me to open the `/market-research` input prompt now?"* Hand off.

**Path C — manual segment description.** Only if the user declines market-research. Collect a structured manual input via plain-text prompts:

```
Required:
- Product description (1–2 sentences) + URL if any
- Focal segment NAME (short, memorable, follows from causal criteria)
- Persona — causal criteria (NOT demographics): behavioral trigger · stage/lifecycle ·
  information-diet · causal pain trigger
- Big Job(s)  (verb + noun + life/business state change); personal Big Job for B2B
- Top 1–3 Core Jobs in canonical form:
  When {context + trigger + negative emotions}, I want to {expected outcome}
  with success criteria {concrete: direction + level}, in order to {Big Job + positive emotions}.
- Known alternatives — ≥3 ways the segment closes the Big Job today (with URLs)
- Active business goal (launch / reposition / expand)
```

Validate the manual input against the invariants; ask for fixes if any fail (e.g. *"that segment criterion is demographic — describe the behaviour or characteristic that causes the Job"*; *"that Job has two infinitive verbs — parse it into the hierarchy"*). Flag reduced confidence at the top of `result.md`: *"⚠️ Confidence reduced — value prop generated from a manual segment description, not a full market-research run."*

**Output (held in context):** focal segment + causal criteria · Core Jobs (canonical form, "in order to" not "so that") · Big Jobs (+ personal Big Job for B2B) · known alternatives/competitors (direct · indirect · turnkey) · the market-research wedge & first mechanic guess (path A) · mode · language · business goal.

## S1 — Dominant success criteria + anchors  → GATE-1

**Objective.** Extract *all* success criteria from the focal segment's Core Jobs, classify each on the six cost dimensions and the eight criteria-priority orders (`value-creation.md §8–§10`), and **rank to the 1–3 dominant criteria that define this segment.** Pull the §11 lead-mechanic shortlist for those criteria.

Procedure:

1. **List every success criterion** across the chosen Core Jobs. Each must have a *direction* (which axis: price / latency / comfort / privacy …) and a *level* (the threshold above which the customer feels value — `job-structure.md §8`). Rewrite adjectives into concrete criteria (*"fast"* → *"car arrives in under 4 minutes"*).
2. **Tag each criterion** by cost dimension (money / time / effort / cognitive load / negative emotion / Tax Jobs) and name the segment's **priority order** (speed-first / price-first / done-for-me-first / no-stress-first / reliability-first / control-first / status-first / privacy-first — or a 2–3 criterion combination).
3. **Rank to the dominant set** — the 1–3 criteria whose priority defines the segment. State *why* these dominate (from the persona's causal criteria), not just that they do.
4. **Map to lead mechanics** using `value-creation.md §11` (e.g. *done-for-me-first* → *Take the Job off the customer*; *no-stress-first* → *Remove negative emotions*). This shortlist seeds — does not cap — S3.
5. **Anchors:** capture the Big-Job ladder (each dominant criterion must ladder up to a Big-Job criterion), the alternatives list, and the segment's triggers.

**Output (held in context):** ranked dominant criteria (direction + level) · priority-order label · per-criterion cost dimension · lead-mechanic shortlist · Big-Job ladder · alternatives.

**GATE-1 acceptance criteria** (yes/no, evidence-cited):
- ▢ Criteria are concrete (direction + level), not adjectives.
- ▢ The *dominant* set (1–3) is identified with a causal rationale, not merely listed.
- ▢ Each dominant criterion ladders up to a named Big-Job criterion.
- ▢ Lead mechanics are drawn from the §11 map for this priority order.
- **Hard checks:** every Core Job is a single `I want to + infinitive`; every external number carries a clickable link.

## S2 — Job-Graph substrate (Micro + Critical Chain)  → GATE-2

**Objective.** Build the surface the mechanics operate over: the Job Graph **one level below** the top 1–2 Core Jobs (the Micro Jobs the person performs in order to perform the Core Job), *and* the Critical Chain (the graph projected onto a time axis) with break-points marked. Mechanics apply to a graph, not a Job in isolation.

For each of the top 1–2 Core Jobs (highest importance × frequency), generate the lower-level graph using this prompt:

```
Work according to Advanced Jobs To Be Done methodology.

Describe the Job Graph one level below the Core Job for segment
{SEGMENT_NAME + CAUSAL_CRITERIA} for product {PRODUCT_DESCRIPTION + URL}.

Core Job: {CORE_JOB in canonical When / I want to / in order to form with success criteria}

For every Job one level below the Core Job, output:
- when: { context · trigger · loaded Consideration Activators · negative emotions at State A }
- I want to {expected outcome: verb + noun}
  - success criteria: { concrete, direction + level }
- in order to {how this lower Job serves the Core Job above it}
- Problem(s) [if any] + strength on a 1–10 scale

Output 5–10 lower-level Jobs as a sequence (or parallel branches if the Core Job
has parallel sub-flows). Then project them onto the Critical Chain and mark:
breaks · cycles · role hand-offs · time-gaps · Tax Jobs.
```

**Output (held in context):** 5–10 Micro Jobs per Core Job + the Critical Chain with break-points flagged. This is the substrate S3 operates on.

**GATE-2 acceptance criteria:**
- ▢ Nodes are real Jobs (verb form), anchored to past performance — not future-tense fantasy (no Fake Jobs).
- ▢ The Critical Chain marks at least the break / cycle / hand-off points.
- ▢ Levels are named and product-relative (Rule 20).
- ▢ "For what? / in order to do what?" resolves at every node (`job-graph.md §18`).

## S3 — Value-hypothesis GENERATION (divergence)  → GATE-3

**This is the core of the skill.** Walk the **full value-creation mechanics catalog** (the ~26 foundational in `value-creation-mechanics.md`; in Deep mode also the broader ~80 in `mechanics-catalog.md`) over `(dominant criteria × Job Graph × competitor weaknesses)`. For each applicable mechanic, ask: *"Where on this graph does this mechanic create the most value against the dominant criteria — and what is the strongest / fastest / cheapest way to deliver it?"*

- **Generate the *way value is created*, concretely** — not an abstract mechanic. An app, a feature, a done-for-you service, an offline space, a flying/field service, a guarantee, a bundle, a marketplace, a concierge, a piece of content. Name the delivery format.
- **Lead with the two dominant mechanics** — *move up a level* and *kill a Job* (`value-creation.md §14`) — and hold the invisible-product North Star (§20): *what would it look like for the customer to reach the outcome with no product to interact with at all?*
- **Push for "fastest / cheapest"** — for each strong hypothesis, name the cheapest delivery that still produces the Aha Moment (concierge, no-code, partial-value slice).
- **Generate broadly** — target **12–20 raw hypotheses**; drop non-applicable mechanics (note them in-context).

Each hypothesis is written in the canonical form:

```
For {focal segment} performing {Core Job + dominant criterion},
we close it more efficiently by {mechanic(s)} applied to {specific graph node},
delivered as {concrete product / service shape},
which displaces {alternative} because {its specific weakness}.
Lever: {raise probability / raise outcome / lower cost — which}.
Aha Moment: {the specific positive-prediction-error event}.
```

**Output (held in context):** 12–20 hypotheses in canonical form, each tagged with its mechanic family and the value lever it pulls.

**GATE-3 acceptance criteria:**
- ▢ Each hypothesis is stated as `mechanic × Core Job × criterion × alternative` — **not** "we ship feature X".
- ▢ A positive-prediction-error / Aha Moment is articulable (not signup/login).
- ▢ It operates at Core-Job level or above (not Micro-polish — unless Micro-polish *is* the wedge for this segment).
- ▢ Habit is reused or sidestepped, never fought head-on.
- ▢ It is communicable through a Big-Job criterion.
- **Hard check:** no hypothesis is a bare feature; each names a mechanic and a specific displaced alternative.

## S4 — Feasibility · Cost · Competitiveness filter + RICE  → GATE-4

**This is the user-requested filter.** For each surviving hypothesis assess three things, then rank.

1. **Build feasibility & cost-to-implement.** What does it actually take to build? Name the cheapest viable path (concierge / no-code / vibe-coding / partner) and the cheapest *probe* that proves value before the build. Flag any hypothesis whose realizability is genuinely uncertain (fusion-class impossible vs merely hard).
2. **Unit-economics fit** (`unit-economics.md` as the filter). Does the value convert to margin? Compare cost-to-serve against the segment's **Job budget** and willingness-to-pay; sanity-check the LTV > CAC *direction*. A delightful hypothesis the segment can't profitably be served on is dropped (or flagged as a different-segment move).
3. **Competitiveness** — does it actually beat the competitive set **on the dominant criteria**? Build / extend the **criteria × competitor matrix** across direct (Core-Job), indirect (Big-Job), and turnkey (Big-Job-level) competitors. The wedge is an *underserved criteria intersection*, not a single criterion. In Quick mode this is reasoning-grade; in Deep mode it is web-grounded on real reviews.

Then **RICE-rank** the survivors:

- **R (Reach)** — % of the focal segment for whom it applies.
- **I (Impact)** — subjective value to one customer.
- **C (Confidence)** — grounded in the market-research / canon evidence.
- **E (Effort)** — cost to build a probe / MVP (lower = better).
- **+1 strategic bonus** if the mechanic is *move up a level* or *kill a Job* (`value-creation.md §14` — the strongest mechanics).
- **+1 defensibility bonus** if it exits direct competition (Previous/Next Job, graph-shift, exclusive value).

**Surface the top 2.** The first is the **primary** value-prop candidate; the second is the **supplementary** — a *distinct* angle (different mechanic family, different sub-segment, different chain placement, or a hedge against a different alternative). The supplementary must NOT be a sub-mechanic of the primary.

**Output (held in context):** the criteria×competitor matrix · per-hypothesis feasibility + cost-to-build + cheapest-probe + unit-econ read · RICE table with bonuses · the top 2 with one-line rationale.

**GATE-4 acceptance criteria:**
- ▢ Competitiveness is grounded in actual competitor evidence (Quick: named competitors + their "covers poorly" criteria; Deep: cited reviews) — not bare assertion.
- ▢ Cost-to-implement estimated and the cheapest probe named for the top 2.
- ▢ Unit-econ direction is sane (Job budget covers cost-to-serve; LTV > CAC direction stated).
- ▢ Ranking math is shown; the winner beats alternatives on a *dominant* criterion, not a peripheral one.
- ▢ The supplementary is genuinely distinct from the primary.

## S5 — De-risk (RAT cards)  → GATE-5

Per `rat-key-theses.md`: for the chosen **primary** value prop, inventory every assumption across the RAT chain (Market / Segment+Jobs / Value / Unit-economics / Channels) **plus the custom risks specific to this product** (where products actually die). Write each as an evil twin, rank by `(P(wrong) × cost-if-wrong) / cost-to-validate`, surface the **top 3** in the compact 5-line format:

```markdown
### Risky assumption #N: {one-line title}
**Bet:** {what we're assuming, positive form, 1 sentence — segment/price/channel-bound}.
**Risk if wrong:** {evil twin, 1 sentence, in $-terms}.
**Probability × cost:** {H/M/L} × ~${X} — {one-line combined reasoning}.
**Validate by:** {the cheapest falsifying action} ({timeline}). Confirms: {signal}; kills: {signal}.
```

Keep the full inventory + ranking math in-context; the three surfaced cards become §10 of the final file.

**GATE-5 acceptance criteria:**
- ▢ Assumptions are in positive, falsifiable, *concrete* form (segment / price / channel bound — not slogans).
- ▢ At least one **custom** (non-generic, product-specific) risk is present.
- ▢ Each is paired with the cheapest falsifying test (often cheaper than building a probe).
- ▢ Ranked cheapest-and-deadliest first; the Segment+Jobs / Value assumption is near the top.

### Human gate — pick primary vs supplementary
Present the top 2 via `AskUserQuestion`:

```
Q: "Which is your PRIMARY value proposition? (the other becomes supplementary, not discarded)"
- "[Candidate A short title] as primary, [Candidate B] supplementary"
- "[Candidate B short title] as primary, [Candidate A] supplementary"
- "Keep only [Candidate A] / only [Candidate B]"
- "Neither — let me reformulate"  → free-text; re-run S3–S4 on the new angle
```

## S6 — Synthesize the artifact  → GATE-6 (panel) → human ship gate

Assemble the single output file in the structure below — **US-native front (§0–§11), NMT methodology appendix (§12).** §0–§10 satisfy a US product audience; **§11 is the PRD-ready implementation spec `/product-requirements` consumes.**

````markdown
# Value Proposition — {product name / focal segment}

> **Numerical disclaimer** (per CLAUDE.md). All numerical estimates are LLM-generated hypotheses, each with a runnable verification path. Validate before any major decision.
>
> **Hallucination disclaimer** (per CLAUDE.md). Generated by an LLM; may contain hallucinations in unknown places. For expensive decisions, run a full research pass; do not act on this document alone.

> ⚠️ Confidence note: {path C → reduced-confidence flag; path A → name the source market-research file path}

## 0. Headline value statement
**{One-liner: [what it is] + [Core Jobs it performs] + [value by criteria] — ≤15 words}.**
{Full version, 1–2 sentences. Moore "Mad Libs" form: For {segment} who {need}, {Product} is a {category} that {benefit}; unlike {alternative}, it {differentiator}.}

## 1. Target segment
{Who cares most — causal criteria, specific, not demographics. The persona's dominant criteria in one short paragraph + 3–5 causal-criterion bullets.}

## 2. The Job
*When {context + trigger}, I want to {expected outcome} with success criteria {dominant criteria}, in order to {Big Job}.* {Intercom job-story phrasing = the NMT Level-2 Job.}

## 3. Pains and Gains
**Pains** (prioritized — the Problems / Tax Jobs the current Job Graph produces): {top 3–5 bullets}.
**Gains** (prioritized — what beating the dominant criteria delivers): {top 3–5 bullets}.

## 4. Before → After
| | Current Job Graph (alternative) | Our Job Graph |
|---|---|---|
| Core Jobs performed | {…} | {…} |
| What the customer still does | {…} | {killed / taken off / collapsed} |
| Dominant-criteria outcome | {…} | {…} |

## 5. Our value — benefit themes
{3–5 themes, each a cluster of mechanic applications across the graph. Each theme: the customer outcome + the "so what?". Mechanics named here in plain language; the full mechanic table is in §12.}

## 6. Differentiation vs competitive alternatives
{Dunford order. List the competitive alternatives the segment would otherwise use — including "do nothing" / the DIY status quo. Then: "Unlike {alternative + URL}, {Product} {differentiator on the dominant criterion}."}
| Dominant success criterion | {Direct competitor} | {Indirect / Big-Job} | {Turnkey} | Us |
|---|---|---|---|---|
| {criterion} | ⚠️ | ❌ | ⚠️ | ✅ |
**The wedge:** {the underserved criteria intersection}.

## 7. Proof & the Aha Moment
**Aha Moment:** {the specific positive-prediction-error event — where it fires on the Critical Chain, how far left it is shifted}. NOT signup/login.
**Proof / how we make it true:** {evidence, comparable cases with links, or the cheapest probe that will prove it}.

---
*Above = the proposition. Below = the bet and the build.*
---

## 8. Value hypothesis (the riskiest bet, falsifiable)
**We believe that {segment} performing {Core Job} will {measurable outcome} because {reason}.**
*What / who / how:* {Rachleff's value hypothesis — what we build, who is desperate for it, how it's delivered}.

## 9. Success metric & threshold
**Metric:** {the measurable signal}. **Confirm at:** {threshold}. **Kill below:** {threshold}.

## 10. Top-3 risky assumptions (the test plan)
{The three compact RAT cards from S5, in the §10 format.}

## 11. Implementation spec  → /product-requirements
*This section is the canonical input for `/product-requirements`.*
- **Product shape:** {what the product IS — name + components + delivery format (app / service / offline / hybrid)}.
- **Feature table** (delivery vehicles for value):
  | Core Job / criterion | Mechanic | What we ship | Aha-Moment link |
  |---|---|---|---|
  | {…} | {#mechanic} | {feature / service} | {step where value beats prediction} |
- **Critical Chain & Aha placement:** {the chain the customer walks; where the Aha fires; what to remove to shift it left}.
- **Cost-to-build & cheapest probe:** {build path + the probe that validates before building}.
- **Unit-economics direction:** {Job budget vs cost-to-serve; pricing hypothesis; LTV>CAC direction}.
- **Anti-segment / out of scope:** {who this is NOT for — 2–3 groups; non-focal Jobs deferred}.

## 12. Methodology appendix (NMT)
- **Mechanics applied (combination)** — the full table: Job × mechanic(s) × how the product performs it (typically 5–12 applications across the graph).
- **The 4 dominant-criteria → mechanics mapping** used.
- **Forces of behaviour change** for the primary: Added Value {lever} · Problems surfaced {how} · Fears {reduction lever} · Habit {reuse / sidestep — NOT fought}.
- **Canon references:** value-creation.md (§3 formula, §11 map, §14 dominant mechanics), create-value.md, behaviour-change.md, critical-chain.md, rat-key-theses.md, unit-economics.md.

## Self-validation checklist
- [ ] One-liner = [what it is] + [Core Jobs] + [value by criteria]
- [ ] Dominant success criteria identified and the value prop beats competitors on them
- [ ] Primary names a product + a mechanic combination + a Core Job + a displaced alternative (not a slogan)
- [ ] Supplementary is distinct from the primary
- [ ] Aha Moment is a specific in-product event (not signup / login)
- [ ] Anti-segment names 2–3 groups
- [ ] Habit reused or sidestepped (not fought head-on)
- [ ] Feasibility + cost-to-build + unit-econ direction stated
- [ ] Value hypothesis is falsifiable with a confirm/kill threshold
- [ ] ≤3 unvalidated assumptions stacked in the chosen prop
- [ ] §11 implementation spec is PRD-ready
- [ ] Every external source is a clickable link

## What this enables next
1. `/product-requirements` — feed §11 (the implementation spec) directly; it becomes the PRD's segment + value + risk input.
2. `/craft-go-to-market` — once the PRD exists, feed this value prop + the PRD to write the landing, ad, and GTM/growth copy.
3. Run RAT card #1 — don't build until #1 is validated or killed.

## Get more
{CTA — newsletter signup on the canon site.}
````

**GATE-6 (final ship gate — run as a small panel / k-of-N voting):**
- ▢ All methodology invariants hold (value formula; mechanics over graph; segmentation root; habit not fought; Aha = real event; Big-Job communicability; anti-segment named; unit-econ filter applied).
- ▢ US-native layout present; passes the "so what?" test (every claimed attribute → benefit → why-they-care) and the 5-second test.
- ▢ §11 implementation spec is genuinely PRD-ready (maps to `/product-requirements` inputs).
- ▢ Disclaimers present; every external source is a clickable link (Rule 2); US-context analogs (Rule 6).
- **Human gate:** the user approves & ships.

---

# Deep mode (~30–45 min, with internet)

Same S0→S6 chain, but substantive stages are parallelized and web-grounded. Agents are spawned with the `Agent` tool, `subagent_type: "general-purpose"`, `run_in_background: true`. **Each agent returns its full result in its final message — no per-agent files.** The orchestrator holds those returns in context and writes the single output file at the end. Every external source is a clickable link.

**Shared preamble for every agent:**
> You work with Ivan Zamesin's AJTBD / Next Move Theory methodology. Use ONLY the canon files named below as the methodology source — do NOT use generic JTBD from the internet or prior training. (If a path is not found, retry with a `1-` prefix on the canon folder.) Write *Aha Moment* / *Problem*, never PPE / NPE. Every named external source is a clickable Markdown link. **Return your full result in your final message — do not write any files.**

**Waves:**

```
Wave 0 (background from start):  [R] reviews-mining — independent, feeds S3 + S4
Wave 1 (sequential):            [S1] dominant-criteria → [S2] job-graph substrate
Wave 2 (parallel sectioning):   [G1..Gk] mechanic-family generators over the graph (consume R)
Wave 3 (sequential):            [F] feasibility · cost · competitiveness + RICE (web-grounded matrix; consumes G* + R)
Wave 4 (parallel):              [C] critic gates (GATE-1..GATE-5) · [RAT] RAT-card generator
                                ──(human: pick primary vs supplementary)──
Wave 5 (sequential):            [SYN] synthesis → [GATE-6 panel] → (human: ship)
```

**Agent prompts (objective · input · output · boundaries · effort budget — every agent returns its result in-message):**

- **[R] reviews-mining.** Given the segment + alternatives, fetch reviews from G2 / Reddit / Product Hunt / Trustpilot / Capterra. Return **raw signals only** (do NOT synthesize hypotheses): the specific Problems-with-current, which dominant criteria each competitor covers poorly, and 5–10 quotable quotes per competitor **with source URLs**. ≤12 fetches / ~10 min.
- **[S1] dominant-criteria.** Given the normalized input + core canon, return the ranked dominant criteria + lead mechanics + Big-Job ladder per S1. No web.
- **[S2] job-graph.** Given the input + the S1 result + `job-graph.md` + `critical-chain.md`, return the Job Graph + Critical Chain per S2. No web.
- **[G1..Gk] mechanic-family generators (sectioning).** Each agent owns one mechanic family (e.g. *subtract/kill/move-up*; *take-off/done-for-you/chain-repair*; *emotion/expectation/need*; *price/cost/cognitive*; *Previous/Next/link-to-Big-Job*). Given the Job Graph + dominant criteria + the reviews signal + `value-creation-mechanics.md` + `mechanics-catalog.md`, return the strongest / fastest / cheapest hypotheses in their family in canonical form; the orchestrator merges them. Effort: 3–6 hypotheses per family.
- **[F] feasibility · cost · competitiveness.** Given the merged hypotheses + the reviews signal + `unit-economics.md` + the read set, return the web-grounded criteria×competitor matrix, the feasibility + cost-to-build + unit-econ read per hypothesis, and the RICE ranking with bonuses + top 2. ≤6 fetches.
- **[C] critic gates.** Given a stage's returned output + its acceptance criteria + the canon anchors, run the adversarial binary critic per GATE and return the verdict + `fix_instructions` for any failures (≤2 rounds, then escalate to the user).
- **[RAT] RAT-card generator.** Given the chosen primary + `rat-key-theses.md`, return the top-3 RAT cards with web-validated cost-of-validation estimates. ≤3 fetches.
- **[SYN] synthesis.** Given all stage returns, assemble the single output file per the §0–§12 template and run GATE-6 as a panel.

**Progress** is reported inline in chat as waves complete — not to a log file.

---

## Methodology violations — auto-warnings

Produce a `⚠️ Methodology violation` warning (not silent output) for any of:

| Violation | Detection | Skill response |
|---|---|---|
| Value prop is a feature | "we build {X feature}" without mechanic + alternative | "This is a feature. Value prop = mechanic × Core Job × criterion × alternative. Try: {rephrased}." |
| Mechanic not over the graph | Mechanic applied to a Core Job in isolation, no graph node | "Mechanics operate over the Job Graph. Name the graph node it hits." |
| Big Job used as the segmentation root | Segment defined by a Big Job / "customers who want X" | "Big Job is motivation context, not the segmentation root. Segment by Core Jobs + success criteria in a priority order." |
| Fights Habit head-on | No habit-reuse lever AND no Aha-Moment + Consideration-Activators plan | "Habit can't be beaten directly. Reuse it or sidestep via an Aha Moment + loaded Consideration Activators." |
| No anti-segment | Cannot name who this is not for | "Every value prop has an anti-segment. Sharpen the dominant criterion." |
| Aha Moment = signup / login | Pattern match | "Signup is not an Aha Moment. Name the first in-product event where value beats the customer's prediction." |
| No feasibility / cost check | A surfaced prop with no cost-to-build or unit-econ read | "A value prop without a feasibility + unit-econ read isn't validatable. Add cost-to-build and the Job-budget vs cost-to-serve check." |
| Competitiveness asserted, not grounded | "we're better" with no criteria×competitor matrix | "Ground competitiveness on the dominant criteria vs named competitors (Deep: cited reviews)." |
| Stacks 5+ assumptions | ≥5 stacked unvalidated assumptions | "Risks compound. 5 assumptions at 60% failure each ≈ 1% survival. Strip one." |
| PPE / NPE abbreviations | Pattern match | "Write *Aha Moment* / *Problem* (Rule 22), never PPE / NPE." |

---

## What this skill does NOT do

- Does NOT pick the focal segment on path A — that happens in `/market-research`.
- Does NOT size the market → `/market-research`.
- Does NOT write the PRD → `/product-requirements` (it hands over the §11 implementation spec); does NOT write landing / ad / GTM copy → `/craft-go-to-market`.
- Does NOT run customer interviews or execute the RATs — it generates the cards; the user runs RAT #1 next.
- Does NOT generate the full multi-level Job Graph *above* Core Jobs — it builds one level *below* Core Jobs as the mechanics substrate.

---

## Execution checklist (orchestrator) — before writing `result.md`

- [ ] GATE-1…GATE-5 ran (verdicts kept in-context); GATE-6 panel passed.
- [ ] Dominant success criteria extracted and ranked (S1).
- [ ] Job-Graph + Critical Chain substrate exists with break-points marked (S2).
- [ ] 12–20 raw hypotheses generated; mechanics walked over the graph (S3).
- [ ] Feasibility + cost-to-build + unit-econ + competitiveness matrix done; RICE-ranked (S4).
- [ ] Primary + supplementary surfaced and distinct; user picked the primary.
- [ ] Top-3 RAT cards with confirm/kill signals (S5).
- [ ] Disclaimers at top of `result.md`; every external source a clickable link (Rule 2); US-context analogs (Rule 6).
- [ ] §11 implementation spec is PRD-ready.
- [ ] No methodology invariant violated; anti-segment named; Aha is a real event; habit reused/sidestepped.
- [ ] Plain-language-led — §0–§11 lead in the reader's own words; methodology terms only in parentheses (never jargon-first); §12 appendix / debug may stay in full terms.
- [ ] If path C: reduced-confidence flag at top of `result.md`.

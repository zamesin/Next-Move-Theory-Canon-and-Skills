---
name: craft-value-proposition
description: Generate a sharp Value Proposition Statement for a chosen segment using Ivan Zamesin's AJTBD/Next Move Theory methodology. Input — a /market-research result OR a manual segment+Job description; output — a Job Graph one level below the Core Job, 3 ranked value-prop candidates against the 19 Next Move Theory mechanics, the chosen Value Proposition Statement (mechanic × Core Job × alternative × Force), Aha Moment hypothesis, and top-3 RAT cards. Two modes — Quick (10-15 min, no internet) and Deep (30-45 min, full pipeline with subagents and competitor reviews mining). Defaults to English; adapts to user's language on request.
user-invocable: true
---

# Craft Value Proposition v1

This skill turns a market-understanding artifact (or a manual segment description) into a **specific, validatable value proposition** for a chosen focal segment.

It bridges the gap between `/market-research` (which produces segments + alternatives + Forces) and `/run-rat` / `/positioning` / `/product-requirements` (which need a committed value hypothesis to operate on).

The bigger gift is **invention** — systematically generating value-prop candidates by walking Next Move Theory's 19 value-creation mechanics over the segment's Job Graph — not validation. Validation is the deliverable but not the differentiator.

---

## Core methodological principle

**Source of truth — `Next-Move-Theory-Canon/` in the project root.** Do NOT use generic interpretations of Jobs To Be Done from the internet or LLM training. Ivan Zamesin's methodology diverges substantially from those.

Methodological invariants this skill **must** enforce — output is invalid if any is violated:

- Value is *"Jobs performed more energy-efficiently with surprise"* — not a feature, not a slogan, not a benefit list.
- Mechanics operate over a **Job Graph**, not against Core Jobs in isolation.
- Habit cannot be fought head-on — must be **reused** or **sidestepped via Aha Moment + Activating Knowledge**.
- Anti-segment must be nameable — if everyone wants this, the value prop is too universal.
- Aha Moment is a specific **positive prediction error event** — NOT signup, login, or first feature use.
- All switches go through the **Big Job** — value prop must be communicable through the Big Job link.
- Risks compound — value props that stack ≥5 unvalidated assumptions get flagged.
- Demographics are second-order correlates — never the primary segmentation criterion.

Per project-root `CLAUDE.md`: every named source in any output must be a clickable Markdown link `[Name](https://...)`. Disclaimers (numerical + hallucination) at the top of `result.md`.

---

## Output file structure

All results saved in `Skill-Results/` in project root.

```
Skill-Results/craft-value-proposition/{slug}/
  ├── 00-input.md                                          — input path / manual description + focal segment + business goal
  ├── 01-extracted-inputs.md                               — parsed Big Job / Core Jobs / alternatives / Forces
  ├── 02-job-graph.md                                      — generated Job Graph below top 1-2 Core Jobs
  ├── 03-raw-hypotheses.md                                 — 8-15 mechanic × graph × alternative hypotheses
  ├── 04-validation-gate.md                                — 10-check pass/fail per hypothesis
  ├── 05-ranked-shortlist.md                               — top 3 with RICE + strategic bonus
  ├── 06-rat-cards.md                                      — top 3 RAT cards for the chosen value prop
  ├── debug.md                                             — full reasoning, dropped hypotheses, internal notes
  ├── progress.log                                         — Deep mode only: live agent log
  └── {product-slug}-craft-value-proposition-result.md     — final user-facing report
```

`{slug}` = `YYYY-MM-DD_HH-MM_<short-product-name>` (per `CLAUDE.md` Rule 4). Each run creates a new folder.

---

## Quick mode (10-15 min, no internet) — DEFAULT

### STAGE 0: Language

Default English. If user writes in another language, ask via `AskUserQuestion`. Save to `00-input.md`.

### STAGE 1: Determine input path (THREE paths)

Ask via `AskUserQuestion`:

```
Q1: "What's your input?"
- "I have a /market-research result file"     → path A: load and parse
- "I want to run /market-research first"      → path B: redirect to /market-research, then come back
- "I'll describe the segment manually"        → path C: standalone, prompt for persona + Job
```

**Path A — market-research result loaded:**

Ask for the result file path. Read it. Parse the segment list. Then:

```
Q2: "Which focal segment(s)?" (list segments parsed from the result)
- Pick 1 (recommended) or 2 (max). Push back on 3+.

Q3: "What's the active business goal?"
- "Launch a new product"
- "Reposition existing product"
- "Expand existing product into a new segment"
- "Other — I'll describe"
```

**Path B — wants market-research first:**

Reply: *"Strongly recommended — the wedge is much sharper with a real market-research run. Spawn `/market-research` (Quick or Deep), then come back here with the result. Should I open the input prompt for /market-research now?"* Hand off.

**Path C — manual segment description:**

If user explicitly declines market-research, collect a structured manual input via plain-text prompts:

```
Required:
- Product description (1-2 sentences) + URL if any
- Focal segment NAME (short, memorable, follows from causal criteria)
- Persona — causal triggers (NOT demographics):
  - Behavioral trigger
  - Stage / lifecycle trigger
  - Information-diet trigger
  - Causal pain trigger
- Big Job (verb + noun + life/business state change)
  - Personal Big Job (B2B only)
- Top 1-3 Core Jobs in canonical "When / I want / so that" format with success criteria
- Known alternatives — at least 3 ways the segment closes the Big Job today (with URLs)
- Active business goal (launch / reposition / expand)
```

Validate the manual input against Next Move Theory invariants; ask for fixes if they fail (e.g., "your segment criteria is demographic — please describe the *behavior* or *characteristic* that causes the Job"). Save to `00-input.md`. Flag in `debug.md` and at the top of `result.md`: *"⚠️ Confidence reduced — value prop generated from manual segment description, not from a full market-research run."*

### STAGE 2: Extract structured inputs

For path A: parse the chosen segment(s) from the market-research result and extract:
- Big Job (segment + buyer's personal Big Job for B2B)
- Core Jobs with success criteria (in `When / I want / so that` form)
- The 5 alternatives ("Other ways segment closes this Big Job")
- Four Forces reading (High/Medium/Low scores per Force)
- Persona's causal triggers
- Anti-segment cues if present

For path C: take from the manual input. Flag missing pieces.

Write `01-extracted-inputs.md`.

### STAGE 2.5: Generate Job Graph one level below Core Job

For each of the **top 1-2 Core Jobs** (highest pain × frequency), generate the Job Graph one level below using the Next Move Theory prompt.

**The prompt:**

```
Work according to Advanced Jobs To Be Done methodology.

Describe the Job Graph one level below the Core Job for segment {SEGMENT_NAME_AND_CRITERIA}
for product {PRODUCT_DESCRIPTION_WITH_URL}.

Core Job for which the lower-level Job Graph is needed:
{CORE_JOB in canonical When/I want/so that form with success criteria}

Example of one Job in the graph (for context, do not output for the user):
when
  context: outdoor trips / dacha
  trigger: last time got wet / cold
  activating knowledge: "At Sportmaster I'll get a membrane jacket,
                         trekking boots and thermolayer at a fair price"
  emotions at point A: frustration from past discomfort
I want to buy a membrane jacket / boots / thermolayer for myself
  success criteria: water-resistance + breathable fabric; non-slip sole;
                    light weight; layer compatibility; not "overpaying for brand"
so that I spend weekends comfortably AND feel freedom and pleasure
        from active recreation.

The Job Graph is the full sequence of Jobs one level below the Core Job
that the person performs in order to perform the Core Job.

For every Job in the graph, output in the following structure:

- when
  - context:
  - trigger:
  - activating knowledge:
  - emotions at point A:
- I want to get expected result: {Job verb + noun}
  - success criteria for the expected result: {bullet list}
- so that {how this lower Job serves the Core Job above it}

Problems [if any, describe each]:
Strength of problem on 10-point scale:

Output 5-10 lower-level Jobs as a sequence (or as parallel branches if the Core Job
involves multiple parallel sub-flows).
```

Write the resulting graph(s) to `02-job-graph.md`. This is the substrate over which mechanics will operate in STAGE 3.

### STAGE 3: Generate raw hypotheses by applying mechanics OVER the graph

Walk the **19 mechanics from `value-creation.md`** against the Job Graph (Core Jobs + lower-level Jobs from STAGE 2.5). For each mechanic, ask: *"Where on this graph does this mechanic apply non-trivially?"*

**The 19 mechanics:**

1. Start performing Jobs that aren't being performed
2. Fix a problem in a Job that's currently performed badly
3. Take the Job off the person (do it for them)
4. Reduce time delays between Jobs in the chain
5. Perform more Jobs with one solution
6. Move up the graph (climb to a higher-level Job)
7. Perform the next Job in the Critical Chain (cross-sell)
8. Provide graph clarity (Orientation Jobs)
9. Satisfy basic needs directly (status, autonomy, safety, connection)
10. Aesthetics
11. Adjust the customer's expectations
12. Lower costs (money / cognitive / time / negative emotions)
13. Grow benefit (one characteristic dramatically better)
14. Kill a Job (make it disappear as a class)
15. Move up to the Big Job
16. Gamification
17. Eliminate negative emotions (sell peace of mind)
18. Lower cognitive cost (no-brainer)
19. Result guarantee (sell the fact, not the attempt)

**Plus 3 structural strategies from `create-value.md`** (apply only if the focal segment has a competitor at the level above the user's product):

- Niche strategy: beat the level-above competitor on one narrow segment, every Job
- Micro-Job focus: do one Micro Job dramatically better for many segments
- Graph-shift: move competition to a different Job Graph

For each mechanic, output a hypothesis in the canonical form:

```
For {focal segment}, performing the Core Job {Core Job, success criteria},
we close it more efficiently by applying mechanic {mechanic name}
to {specific Job(s) in the graph},
which displaces {alternative from market-research / manual input}
because {specific weakness in that alternative}.
```

Mechanics with no non-trivial application get dropped silently (note in `debug.md`). Target: 8-15 raw hypotheses. Write to `03-raw-hypotheses.md`.

### STAGE 4: Filter through Four Forces

For each raw hypothesis, map which Forces it operates on:

| Force | What hypothesis must do |
|-------|--------------------------|
| Added Value | Pull forward — perform Job(s) more energy-efficiently than alternative |
| Problems with current | Surface (NOT create) — point to specific friction in alternative |
| Fears toward us | Reduce — must include a concrete fear-reduction lever or it dies |
| Habit toward current | Reuse OR sidestep via Aha Moment — NEVER fight head-on |

Per `behaviour-change.md`: we can only influence Added Value and Fears; we surface Problems; we reuse-or-sidestep Habit. Hypotheses that fight Habit head-on get downgraded unless paired with an explicit Aha Moment + Activating Knowledge plan. Hypotheses missing fear-reduction get flagged.

After this filter: typically 5-8 hypotheses survive. Write the analysis to `03-raw-hypotheses.md` (extend) or to a Forces sub-section.

### STAGE 5: Critical Chain placement

For each surviving hypothesis, annotate:

- **Where in the Critical Chain does it intervene?** (Early / Mid / Late)
- **Does the chain break here today?** (chain breaks = leverage points)
- **Shift-left opportunity?** (move Aha Moment leftward = activation conversion lever)
- **Viral Job involved?** (cheap / free acquisition lever)

Hypotheses that intervene at currently-broken links get prioritized.

### STAGE 6: Validation gate (10 checks)

Each hypothesis runs through the strict gate:

| # | Check | Pass condition |
|---|-------|----------------|
| 1 | Not a feature | Stated as `mechanic + Job + alternative`, not as "we ship X" |
| 2 | Real Job exists | Segment is *already* paying / spending time on this Job |
| 3 | Closes a real Core Job | Mechanic operates at Core Job level or higher (not Micro Job optimization) |
| 4 | Surprise component present | Mechanic creates positive prediction error vs current expectations |
| 5 | Aha Moment articulable | Specific in-product event nameable; signup/login don't count |
| 6 | Anti-segment exists | Skill can name who this is *not* for |
| 7 | Habit not fought head-on | Reused, sidestepped, or paired with Aha Moment plan |
| 8 | Fear-reduction lever present | Specific fear named + lever to reduce it |
| 9 | Doesn't compound risks | Fewer than 5 stacked unvalidated assumptions |
| 10 | Communicable through Big Job | Can be stated as "for the Big Job X, here's a more efficient way" |

Hypotheses failing ≥3 checks get dropped (logged in `debug.md`). After this gate: typically 3-5 hypotheses remain. Write to `04-validation-gate.md`.

### STAGE 7: Rank by RICE + strategic bonus → top 2

For each remaining hypothesis, score:

- **R (Reach)**: % of focal segment for whom this applies (higher = better)
- **I (Impact)**: subjective value to a single customer (higher = better)
- **C (Confidence)**: grounded in market-research / canonical evidence (higher = better)
- **E (Effort)**: cost to build a probe / MVP (lower = better)
- **+1 strategic bonus** if mechanic is "move up the graph" or "kill a Job" (per `value-creation.md`: strongest mechanics)
- **+1 defensibility bonus** if it exits competition (move to previous/next Job, graph-shift)

**Surface the top 2.** The first is the **primary value proposition candidate**; the second is the **supplementary candidate** — distinct enough to offer alongside (different sub-segment / different lifecycle moment / hedge against a different alternative). Other hypotheses live in `debug.md` only.

Pairing rule: the supplementary should NOT be a sub-mechanic of the primary. Pick the strongest *distinct* angle (different mechanic family, different chain placement, or different alternative displaced).

Write to `05-ranked-shortlist.md`.

### STAGE 8: User picks one as primary; the other becomes supplementary

Present the top 2 via `AskUserQuestion`:

```
Q: "Which is your PRIMARY value proposition? (the other becomes supplementary, not discarded)"
- "[Candidate A short title] as primary, [Candidate B] as supplementary"
- "[Candidate B short title] as primary, [Candidate A] as supplementary"
- "Drop the supplementary, keep only [Candidate A] / [Candidate B]"
- "Neither — let me reformulate"  → free-text input, re-run STAGES 4-7
```

Both primary and supplementary appear in `result.md` (Sections 1 and 2). The supplementary is offered as a complementary angle the team can run alongside (e.g., for a sub-segment, as a free-tier hook into the primary, or as a hedge against a primary RAT that fails).

### STAGE 9: Generate top-3 risky assumptions for the primary value prop

Per `Riskiest-Assumption-Test/rat-key-theses.md`:

1. Inventory every assumption inside the chosen primary value prop (typically 10-20 across 5 categories: Market / Segment / Value / Unit Econ / Demand + custom).
2. For each, write the **evil twin** — concrete risk if it fails.
3. Rank by `(probability × consequences in $) / cost-to-validate`.
4. Surface top-3 in compact format.

Each card uses the **compact 5-line format** (not the verbose 7-field format):

```markdown
### Risky assumption #N: {one-line title}

**Bet:** {what we're assuming, 1 sentence}.
**Risk if wrong:** {evil twin, 1 sentence in $-terms}.
**Probability × cost:** {H/M/L} × ~${X} — {one-line combined reasoning}.
**Validate by:** {concrete action} ({timeline}). Confirms: {signal}; kills: {signal}.
```

Full assumption inventory + ranking math goes in `debug.md`. Write the 3 surfaced cards to `06-rat-cards.md`.

### STAGE 10: Output the Value Proposition Report

Two value props (primary + supplementary). Each anchored in a **named product**, with mechanics applied as a *combination* (typically 6-12 mechanic applications across the Job Graph, NOT a single mechanic). Required `result.md` structure:

```markdown
# Value Proposition — {product name / focal segment}

> **Numerical disclaimer** (per CLAUDE.md). All numerical estimates are LLM-generated hypotheses. Validate before any major decision.
>
> **Hallucination disclaimer** (per CLAUDE.md). Generated by LLM; may contain hallucinations. For expensive decisions, run full research; do not act on this document alone.

> ⚠️ Confidence note: {if path C, flag reduced confidence; if path A, name source market-research file path}

## TL;DR

**Primary value proposition.** *Product:* {1-sentence product description with components}. *Statement:* For {focal segment}, the product performs {Core Job(s)} dramatically more efficiently than {alternative} by combining {N} value-creation mechanics across the Job Graph (table in §1.3).

**Supplementary value proposition.** *Product:* {component variant if different}. *Statement:* {1-sentence}. Use when {sub-segment / lifecycle moment} OR as a hedge against {primary risk}.

**Top risky assumption to validate first**: {one-line top-1 risk}.

**Next skills**: `/run-rat` (validate top-1) → `/positioning` → `/product-requirements`.

---

## 1. Primary Value Proposition

### 1.1. Product
{1-2 sentences: what the product IS — name + components + how it gets delivered}.

### 1.2. Value Proposition Statement
*For {focal segment, causal criterion}, **{Product name}** performs {Core Job(s) + success criteria} dramatically more efficiently than {alternative + URL} by combining {N} value-creation mechanics across the Job Graph G{X}.{Y}–G{X}.{Z} (table below).*

### 1.3. Mechanics applied (combination)

| Job | Mechanic(s) | How {Product} performs it |
|-----|-------------|-----------------------------|
| G{x}.1 ({short Job name}) | #N {Name}, #M {Name} | {one-line how} |
| G{x}.2 ({short Job name}) | #N {Name} | {one-line how} |
| ... (typically 5-7 rows covering G1.1 → G1.6) | | |

### 1.4. Why this combination (chain of logic)
- **Focal segment:** {name + causal criterion}.
- **Core Job(s) closed more efficiently:** {Core Job + success criteria}.
- **Where in the Critical Chain:** {Early / Mid / Late}. Chain {breaks / throttles / intact} here today.
- **Alternative displaced:** {alternative + URL} — solves the Job today by {description}; specific weakness = {weakness with quoted source if available}.
- **Forces attacked:** Added Value ({lever}), Problems with current ({how we surface}), Fears ({reduction lever}), Habit ({sidestep / reuse plan — NOT fight head-on}).

### 1.5. Aha Moment hypothesis
**Specific event:** {description of in-product moment of positive prediction error — NOT signup/login. Where on the chain. Shift-left active or not.}

### 1.6. This value prop is not a value prop for...
{Bulleted mirror description of who would NOT find this valuable. If you cannot name 2-3 such groups, the value prop is too universal — sharpen the focal criterion.}

---

## 2. Supplementary Value Proposition

### 2.1. Product
{1 sentence — same product or component variant}.

### 2.2. Value Proposition Statement
*For {sub-segment or same segment in different moment}, **{Product variant}** performs {Core Job} more efficiently than {alternative} by combining {N} mechanics: {brief list inline}.*

### 2.3. Mechanics applied (combination)
| Job | Mechanic(s) | How it works |
|-----|-------------|----------------|
| ... 3-5 rows ... | | |

### 2.4. When to use this alongside the primary
{1-2 sentences: when this complements the primary (different sub-segment, different funnel stage, hedge against a primary RAT failure, etc.).}

### 2.5. This value prop is not a value prop for...
{Brief — 2-3 lines.}

---

## 3. Other alternatives we considered (and why ranked lower)

Brief list — full reasoning in `debug.md`.

- **{Title}** ({mechanic family}) — {1-line why ranked below primary + supplementary}.
- **{Title}** ({mechanic family}) — {1-line why}.
- ... (typically 2-4 entries)

---

## 4. The 4 Forces vector (for the primary)

| Force | Reading | Lever |
|-------|---------|-------|
| Added Value | H/M/L | {lever} |
| Problems with current | H/M/L | {how we surface} |
| Fears toward us | H/M/L | {fear-reduction plan} |
| Habit toward current | H/M/L | {reuse / sidestep / Aha plan — NOT fight head-on} |

---

## 5. Top 3 risky assumptions (and how to validate them)

Each card uses the compact 5-line format:

### Risky assumption #1: {one-line title}
**Bet:** {1 sentence}.
**Risk if wrong:** {1 sentence in $-terms}.
**Probability × cost:** {H/M/L} × ~${X} — {one-line reasoning}.
**Validate by:** {concrete action} ({timeline}). Confirms: {signal}; kills: {signal}.

### Risky assumption #2: ...
### Risky assumption #3: ...

---

## 6. Self-validation checklist
- [ ] Primary value prop names a **product** + **multiple mechanics** + **Core Job** + **alternative** (not just a slogan)
- [ ] Supplementary value prop is **distinct** from primary (different mechanic family, sub-segment, or chain placement)
- [ ] Real Job (segment is already paying / spending time on it)
- [ ] Surprise / positive prediction error articulated
- [ ] Aha Moment is a specific in-product event (not signup / login)
- [ ] "Not a value prop for…" section names 2-3 groups
- [ ] Habit not fought head-on (reused or paired with Aha Moment plan)
- [ ] Specific fear-reduction lever named
- [ ] No more than 3 unvalidated assumptions stacked
- [ ] Communicable through the Big Job
- [ ] Top-1 risky assumption is cheaper to validate than to build a probe

---

## 7. What this enables next
1. `/run-rat` — execute risky assumption #1. Don't build until #1 is validated or killed.
2. `/positioning` — turn primary value prop into copy.
3. `/product-requirements` — turn primary value prop into a PRD.

## 8. Methodology references
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` — 19 mechanics, value as positive prediction error
- `Next-Move-Theory-Canon/Algorithms/create-value.md` — 9-step main algorithm
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` — Four Forces of Progress archive
- `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` — RAT formula
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` — Critical Chain placement and shift-left

## 9. Why this differs from "Value Proposition Canvas" / Lean Canvas
{Brief paragraph.}

## 10. Get more
{CTA — newsletter signup}
```

---

## Deep mode (30-45 min, with internet)

Adds parallel subagents (analogous to market-research v8):

**Wave 1 (parallel)**:
- `reviews-mining` agent: fetch reviews of the alternatives from G2 / Reddit / ProductHunt / Trustpilot / Capterra; extract specific Problems-with-current quotes
- `mechanics-discovery` agent: web-search for non-obvious applications of mechanics in adjacent products / segments

**Wave 2 (sequential)**:
- `value-prop-synthesis` agent: consume Wave 1 + canon + market-research; generate hypotheses with web-grounded confidence

**Wave 3 (sequential)**:
- `critic` agent: run hypotheses through the 10-check gate + invariants; auto-apply fixes (1 pass max)
- `rat-generation` agent: produce top-3 RAT cards with web-validated cost-of-validation estimates

**Live progress logging** to `progress.log` with format `[YYYY-MM-DD HH:MM:SS] [agent-name] [phase] description`. Background spawn + Monitor for streaming.

---

## Methodology violations — auto-warnings

The skill must produce a `⚠️ Methodology violation` warning (not silent output) for any of:

| Violation | Detection | Skill response |
|-----------|-----------|-----------------|
| Value prop is a feature | Pattern: "we build {X feature}" without mechanic + alternative | "This is a feature. Value prop = mechanic × Core Job × alternative. Try: {rephrased}" |
| Fights Habit head-on | No reuse-existing-habit lever AND no strong Aha Moment plan | "Habit is the strongest Force — almost impossible to beat directly. Reuse it (PitchMe case) or pair with explicit Aha Moment plan." |
| No anti-segment | Cannot name who this is not for | "Every value prop has an anti-segment. Sharpen the focal criterion." |
| Aha Moment = signup / login | Pattern match | "Signup is not an Aha Moment. The Aha Moment is the first surprise — what does the user expect vs. actually get?" |
| Stacks 5+ assumptions | Count of "we assume X" ≥ 5 | "Risks compound. With 5 assumptions at 60% failure each, success ≈ 1%. Strip an assumption." |
| Demographic segmentation | Pattern: "ages X-Y", "$N+ income", role title without behavioral cause | "Demographics is a second-order correlate. The cause is behavior or characteristic, not age/revenue." |
| Skips Big Job | Mentions Core Job mechanic but no Big Job link | "All switches go through the Big Job. State the Big Job link." |
| Slogan-style UVP | Marketing sentence with no mechanic / no specific alternative | "A value prop is not a slogan. Name a *mechanic* and a *specific alternative being displaced*." |

---

## What this skill does NOT do

- Does NOT write positioning copy or landing copy → `/positioning`
- Does NOT write a PRD → `/product-requirements`
- Does NOT run customer interviews → `/conduct-ajtbd-interview` (recommends them as RAT validations)
- Does NOT validate via sales → user runs the top-1 RAT card after this skill
- Does NOT pick the focal segment if path A — that happens inside `/market-research`
- Does NOT size the market → `/market-research`
- Does NOT execute RATs — only generates the cards → `/run-rat`
- Does NOT generate the full multi-level Job Graph above Core Jobs → `/map-your-job-graph` (it generates one level *below* Core Jobs as a substrate for mechanics)

---

## Execution checklist (orchestrator)

Before writing the user-facing `result.md`, verify:

- [ ] All 10 validation gate checks ran for the chosen value prop
- [ ] Top-3 RAT cards include cost-to-validate estimates and explicit confirms/kills signals
- [ ] Disclaimers (numerical + hallucination) at top of `result.md`
- [ ] Every external named source is a clickable Markdown link (CLAUDE.md Rule 2)
- [ ] If path C: confidence flag at top of `result.md`
- [ ] `02-job-graph.md` exists and contains 5-10 Jobs in canonical structure
- [ ] No methodology invariants violated
- [ ] Anti-segment named
- [ ] Aha Moment is not signup / login
- [ ] Habit handled by reuse / sidestep / Aha plan (not fought head-on)

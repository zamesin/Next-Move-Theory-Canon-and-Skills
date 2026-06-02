---
name: market-research
description: Run market research for a product or feature idea using Ivan Zamesin's AJTBD / Next Move Theory methodology (distinct from generic Christensen JTBD). Output — an A4 executive one-pager (verdict GO / NARROW / PIVOT) plus a detailed report: market sizing at the Big-Job level, customer segments scored on the value × demand × margin × size-and-switchability selection screen, competitors (direct on the Core Job, indirect on the Big Job), a differentiation hypothesis, an action-first RAT plan, and — as a primary result — alternative Big-Job markets that better fit the idea's technology, team, and resources. Use this skill whenever the user wants to size a market, find or evaluate customer segments and Jobs, assess competitors, decide whether an idea's segment+Jobs are worth pursuing, or explore which market to pivot into — even if they don't say "market research". Two modes — Quick (default; fast; no internet) and Deep (subagents + web research). Defaults to English; adapts to the user's language on request.
user-invocable: true
---

# Market Research v10

> **v10 in one breath.** The deliverable is now a **decision**, not a description: page 1 is an A4 one-pager with a **GO / NARROW / PIVOT** verdict; the report scores segments on a **five-factor selection screen** (replacing the deprecated Four Forces); the RAT section is **action-first** (every risk paired with what to do); and a new **pivot sub-pipeline** recommends alternative Big-Job markets that fit the idea's assets. Methodology comes from four canon files read at runtime. Quick mode is the default. Full version history is in `CHANGELOG.md` beside this file.

## What this skill produces

1. **An A4 executive one-pager** (page 1 of the report) — verdict, the focus pick, market at a glance, the wedge, the top-3 risks with their cheapest tests, and pivot options. Readable in ~60 seconds by someone who has never heard of the methodology.
2. **A detailed report (~10–15 pages)** — market snapshot, a Map of Segments with every segment expanded, a differentiation hypothesis on the focal segment, a strategic recommendation with alternative Big-Job markets, an action-first risk plan, and a short sizing appendix.
3. **A brief outcome in the chat** (not just files) + the one-pager printed inline + concrete suggestions to rerun the skill on alternative markets.

**Two modes:**
- **Quick (default, ~3–5 min):** no internet, no subagents. One Claude fills the templates directly from reasoning.
- **Deep (opt-in, longer):** a team of subagents with web access fills the same templates with real competitor, review, and sourcing data. See "Deep mode pipeline" at the end.

---

## Methodology — source of truth

The **only** source of methodology is the Next Move Theory canon, read at runtime from these **four files** (relative paths; the skill ships in the same repo as the canon):

| File | What the skill uses it for |
|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md` | Jobs, the Job Graph, value & the Aha Moment, segmentation, Consideration Activators, Barrier Removal, the published value-creation mechanics (§22–§23) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | the deep segmentation method |
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | the RAT cause-and-effect chain, the RAT formula, pivot logic |
| `Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md` | the chain to profit, local-vs-global optimum, the segment-selection logic |

One agent (the Strategy agent, Deep mode) additionally reads `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` for the richer published mechanic menu.

> **Path note.** Use the paths above. If a file is not found there, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix that the public repo strips.

**Do NOT use generic JTBD from the internet or prior training.** Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per the project `CLAUDE.md`):
- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), in order to perform a higher-level Job. Not "a struggle for progress."
- **Value** is greater energy efficiency for the brain in performing a Job, measured against the brain's prediction. The **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. Never use the abbreviations PPE/NPE.
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job.
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs.

**Methodological invariants — output is invalid if any is violated:**
- Segments are formed by **similar Core Jobs sharing similar success criteria** — never by demographics, industry, or Big Job as the primary cut.
- A "real segmentation criterion" is a **cause** (a behaviour or characteristic), never a paraphrased value or a consequence.
- Competitors are defined by **Jobs, not categories** (direct on the Core Job; indirect on the Big Job, including "do nothing" and non-obvious substitutes).
- Features follow from success criteria and a chosen value mechanic — not the reverse.
- Every segment is scored on the **selection screen** (below); the focus pick is justified on it.

---

## Output files & naming

All output lives in `Skill-Results/market-research/{slug}/` in the **project root** (never in `TMP/` or `.claude/`).

```
Skill-Results/market-research/{slug}/
  ├── 00-input.md                                   — what the user provided (idea, language, country, type, ambition, assets)
  ├── debug.md                                      — all reasoning, internal checks, methodology citations, milestone log (long)
  └── {product-slug}-market-research-result.md      — the user-facing report (one-pager + detailed report + short appendix)
```

- `{slug}` = `YYYY-MM-DD_HH-MM_{product-slug}` (date + 24h time + ~30-char kebab product slug), computed at run start. Every run gets a new folder; old runs are never overwritten.
- The result file name carries product + skill + "result" so it's identifiable when shared.
- `debug.md` holds everything internal: discarded hypotheses, the antisegment checks, Big-Job validation, the full sizing method tables, and **all methodology citations** (which never appear in the user-facing report — see "Readability" below).
- Deep mode adds intermediate per-agent files in the same folder (listed in the Deep pipeline section).

---

## STAGE 0 — Document language

Default to **English**. If the user is writing in another language, the skill's first message offers to work in that language, then asks via `AskUserQuestion` (English / their language / Other). Save the choice in `00-input.md`. All communication and the report use the chosen language; canon files and source URLs stay as-is.

---

## STAGE 1 — Product idea + context + assets

Collect in a short stream + two batched `AskUserQuestion` calls (max 4 questions each).

### Step 1 — Idea as a stream (free text)
> Describe your idea as a stream — what it is, who it's for, what Job it performs, and anything you already have going for it (technology, team, partners, traction).

### Step 2 — Batch 1: mode, stage, country, business type
- **Mode** — Quick (default; fast; no internet) / Deep (subagents + web research).
- **Stage** — Idea / MVP / Launched / Scaling.
- **Country / market** — United States / United Kingdom / Russia-CIS / Global-English / Other.
- **Business type** — B2C / B2B / Both B2C and B2B / B2B2C (true channel-through-business only).

### Step 3 — Batch 2: project context, segments, competitors, ambition
- **Project context** — path / URL / Skip. (Quick: local paths via `Read`; Deep: also `WebFetch`.)
- **Hypothesized segments** — "Yes, I'll describe" / "I don't know — find them" (default) / Skip.
- **Known competitors** — "Yes, I'll list them" / "I don't know — find them" (default) / Skip.
- **Ambition** — "I'll describe" (revenue / margin / timeframe) / Skip.

### Step 4 — Batch 2b: assets & constraints (powers the pivot recommendation)
Ask once (free text is fine), capturing the idea's **transferable assets and hard constraints** — used by the pivot sub-pipeline (STAGE 9):
> What does this idea have going for it that could carry into *other* markets? Name your (1) core technology / unique capability, (2) the team's expertise and unfair advantages, (3) resources already in hand — money/runway, partners, traction, distribution, data, brand, and (4) any hard constraints or non-negotiables (regulatory, geographic, ethical).

If the user skips, extract the assets from the idea stream and project context as best you can, and flag in `debug.md` that assets were inferred.

**Save** everything to `00-input.md`.

---

## The Segment-and-Job selection screen (this replaces Four Forces)

> Four Forces is **deprecated** in the canon (`ajtbd-key-theses.md §21`). Every segment in this skill — and every alternative market in the pivot pipeline — is scored on the screen below. It answers the core question: *which Jobs of which segment should we compete for first?*

Four **ranking dimensions** (rate strong / medium / weak; bigger is better) plus one **gate**:

1. **Added value — noticeable.** Can we perform the segment's Core Jobs with *additional value the customer actually notices* versus their current way? The bigger and more perceptible the value gap, the better.
2. **Demand we can generate.** Can we create demand and acquire these customers — and how big and how accessible are the channels that reach them?
3. **Target margin per paying unit.** Does the unit economics support the desired average margin per paying customer (price/budget minus the cost to serve)?
4. **Size in money × switchability.** Is the segment big enough in money — **customers × average Job budget per year** — *and* open to new solutions? Openness is not optional: buyable demand lives in the count of **triggered, unsatisfied customers willing to switch** — *the Problem is the trigger.* A large segment of people happily locked into a good-enough habitual solution (whom we cannot pry loose or acquire) is not a buyable market, however big it looks.
5. **Existential-risk gate (pass / FAIL).** Is there a legal/regulatory blocker that forbids operating, or a technology that is *impossible* (fusion-energy-class impossibility — not merely "hard to build"; a capable founder can build hard things)? A FAIL removes the segment regardless of the four dimensions.

Per segment block, render:

```markdown
#### Why this segment, scored (selection screen)
| Factor | Rating | One line |
|---|---|---|
| Added value (noticeable) | strong/medium/weak | {the value gap vs. the current way} |
| Demand we can generate | strong/medium/weak | {channels, reachability} |
| Target margin per unit | strong/medium/weak | {unit-economics shape here} |
| Size × switchability | strong/medium/weak | {$ size + how many are triggered/unsatisfied & willing to switch} |
| Existential-risk gate | pass / FAIL | {legal / impossible-tech check} |

**Compose to focus?** {Yes / on the edge / No} — {the binding constraint, one line}
```

The focal segment is the one whose dimensions compose most in our favour **and** best fits the idea's assets.

---

## Job grammar (every Job, every time)

- Format: **When** {context + trigger + negative emotions before}, **I want to** {expected outcome} **with success criteria** {concrete, measurable criteria — plain text}, **in order to** {higher-level Job + positive emotions after}. The canon uses **"in order to,"** not "so that."
- The `I want to` clause names the **expected outcome** (the canon's primary Job element) — not just any verb. Each infinitive verb is one Job (split multi-verb statements into the hierarchy).
- **Name the level every time** — Big / Core / Small / Micro Job — and remember levels are **relative to our product's reach**, not absolute positions.
- **Core Jobs** = the highest-level Jobs the product performs fully. **Big Jobs** = motivation context one level above (not the segmentation root). **Number of Core Jobs is variable** — list as many as the segment performs.
- **Aha Moment** = the customer experiences a Core Job performed *better than the success criteria they expected*. Place it as early in the Critical Chain as possible. Positioning promises only what the chain actually delivers (over-promising manufactures a Problem).
- In questions addressed to customers, use the everyday word **task**, never "Job."

---

## Mandatory disclaimers (top of the one-pager AND repeated in the report)

> ⚠️ **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses. Each metric is computed via 3 methods, averaged, with a runnable verification path (see appendix). Validate before any investment decision.
>
> ⚠️ **Hallucination disclaimer.** Everything in this document is generated by an LLM and may contain hallucinations in unknown places. For decisions with expensive consequences, run a full quantitative and qualitative research pass; do not act on this document alone.

Source-link rule (project `CLAUDE.md` Rule 2): every named source in the report and appendix is a clickable Markdown link `[Name](https://...)`. In Quick mode (no internet) use the best-known canonical URL or `[Name (URL TBD)](#)` and list it in the verification checklist.

---

## Readability rules (the report is for a customer who doesn't know the methodology)

- **No internal methodology citations in the user-facing report.** Never write "per b2b.md §6", "per Rule 14", or any canon file path in the report. All such traceability goes to `debug.md`.
- **Plain language first, term second.** On first use, gloss a methodology term in 3–5 words in parentheses — e.g., *"the Big Job (the life or business outcome the customer is really after)"*. Link `references/glossary.md` once at the top of the report.
- **Keep source links** for external facts (Rule 2).

---

# Report structure (shared by both modes)

Assemble `{product-slug}-market-research-result.md` in this exact order.

## Page 1 — the A4 one-pager

```markdown
# {Product} — Market Research one-pager
{date · country · B2C/B2B · stage}

> ⚠️ All numbers are LLM-generated hypotheses with verification paths — validate before deciding.
> ⚠️ Everything here is LLM-generated and may contain errors; for expensive decisions run full research.

## Verdict: GO / NARROW / PIVOT
{1–2 sentences — the single most important conclusion and the binding constraint.}

## The pick
- **Focus segment:** {name} — {one line on who they are}
- **Core Jobs we'd compete on:** {Level-3 Job phrasing}
- **Why this one:** {selection-screen result in one line — added value × demand × margin × size & switchability}

## Market at a glance
TAM ~${X} · SAM ~${Y} · SOM (18–24mo) ~${Z} · landscape: {fragmented / red ocean / blue ocean / niche}
Ambition fits? {share of SAM needed → ✅ / ⚠️ / ❌}

## The wedge
{The differentiation hypothesis in one sentence — the unowned success-criterion intersection.}

## Top 3 risks to test next (paired with the cheapest test)
1. {riskiest assumption, positive form} → {cheapest falsifying test}
2. {…} → {…}
3. {…} → {…}

## If this market is weak — pivot options (other Big-Job markets for your assets)
1. {Alternative Big-Job market} — {why your tech / team / resources transfer}
2. {…}
3. {…}

## Next action
{One concrete sentence.}
```

## Section 1 — Market snapshot

```markdown
## 1. Market snapshot ({Country})

**Market-level Big Job:** {infinitive verb + noun, plain language}

| Metric | Estimate | How computed (1 line — averaged across 3 methods) |
|--------|----------|----------------------------------------------------|
| TAM (global) | ~${X} | {top-down / bottom-up / analog, 1 line} |
| SAM ({Country}) | ~${Y} | {1 line} |
| SOM (1–2 yr) | ~${Z} | {1 line} |

**Landscape:** {new market / red ocean / blue ocean / niche}.
**Ambition vs. share:** target {revenue} → needs {Y%} of SAM → {✅ <10% / ⚠️ 10–30% / ❌ >30%}.
**Takeaway:** {1 sentence — is the market big enough, and what's the binding constraint instead?}

> Full 3-method tables + verification are in the Appendix; the market-level Big Job is validated internally (debug.md), not shown here.
```

## Section 2 — Map of Segments (every segment expanded at equal depth)

Start with the comparison table, then expand each segment.

```markdown
## 2. Map of Segments — covering ~80% of the total market

| Segment | $ size / yr | Job budget | Switchable demand | Reachability | Verdict |
|---------|-------------|------------|-------------------|--------------|---------|
| {S1} | ~${} | ~${} | {how many triggered/unsatisfied} | {channel} | ✅ focus |
| {S2} | … | … | … | … | ⚠️ hold |
| {Sn} | … | … | … | … | ❌ not ours |

Segments are grouped by similar Core Jobs + similar success criteria (not by vertical or demographics); the same vertical can split across segments when the Core Jobs and criteria differ. Ordered ✅ → ⚠️ → ❌.
```

Then, for each segment (✅ first, ⚠️ second, ❌ last), at equal depth:

```markdown
### {S#} — {Name tied to Jobs and real criteria} {✅/⚠️/❌}

> **{I propose we focus on this segment because… / I'd hold off on this segment for now because… / This isn't our segment because…}** {1–2 sentences — selection-screen balance, switchability, the binding constraint}.
> **Coverage:** ~{X}% of total market customers.

#### Why this segment is attractive
{1 short paragraph — motivation, urgency, willingness to pay, reachability. Never use the word "pain".}

#### Persona
{ONE short paragraph telling the persona's story, then 3–5 inline causal-criteria bullets. The persona IS the criteria; demographics only as second-order correlates.}
- **{Causal criterion 1}** — cause: {1 line on how this produces buying behaviour / value / margin / acquisition}.
- **{Causal criterion 2}** — cause: {1 line}.
- **{Causal criterion 3}** — cause: {1 line}.

#### Core Jobs
1. **When** {context + trigger + negative emotions}, **I want to** {expected outcome} **with success criteria** {measurable, plain text}, **in order to** {Big Job + positive emotions}.
2. …

#### Big Jobs (motivation context above the Core Jobs)
*Personal:* **I want to** {verb} {noun} **in order to** {life / status / identity outcome}.
*Business (B2B / hybrid):* **I want to** {verb} {noun} **in order to** {business outcome}.

### Segment size + Job budget
| Metric | Estimate |
|--------|----------|
| People / companies in segment | ~{N} |
| **Job budget per customer per year** | **~${B}** |
| **Total money in segment per year** | **~${N×B}/yr** |
| **Switchable share** | **~{%} are triggered / unsatisfied and willing to switch** |

> Full 3-method size + budget tables are in the Appendix.

[selection-screen table — see "The Segment-and-Job selection screen" above]

#### Direct competitors (Core Job level, in this segment)
| Competitor | Core Jobs covered | Main message / USP | Covers poorly (by success criteria) |
|------------|-------------------|--------------------|--------------------------------------|
| {[Name](url)} | … | … | … |

#### Indirect competitors (Big Job level — other ways customers close this Big Job)
| Way / solution | Big Job it closes | Why people use it | What it does poorly |
|----------------|-------------------|-------------------|---------------------|
| {do nothing / postpone} | … | … | … |
| {hire someone / agency} | … | … | … |

#### Big-Job-level players (turnkey threat)
| Player | How they close the Big Job turnkey | Scaling capacity | Threat |
|--------|-------------------------------------|------------------|--------|
| … | … | … | low / medium / high |
```

Close Section 2 with a short **cross-segment themes** block (4–7 patterns spanning segments) and a one-line coverage-verification path (interview 6–8 past payers; if 30%+ don't fit, add a segment).

## Section 3 — Differentiation hypothesis (focal segment)

```markdown
## 3. Differentiation hypothesis: focal segment "{name}"

### Positioning (the Core Job → Big Job link — headline first)
> For **{segment with real criteria}**, who performs the Core Job **{Core Job}** in pursuit of the Big Job **{Big Job}**, **{Product}** delivers {value through the chosen mechanic} — so that {Big Job} is achieved {how exactly: faster / more reliably / without doing X / turnkey / with guarantee}.

### Why focal
{1 paragraph — ROI × opportunity cost × selection-screen balance × fit with the idea's assets.}

### Matrix: success criteria × competitors
| Core Job success criterion | Direct 1 | Direct 2 | Indirect (Big-Job) | Hypothesis for us |
|----------------------------|----------|----------|--------------------|-------------------|
| {criterion} | ⚠️ | ❌ | ✅ | ✅ |

**Underserved criteria (the wedge):** {1–3 criteria all competitors close poorly — usually an *intersection*, not a single criterion}.

### Value-creation mechanic (published mechanics only)
**Mechanic:** {one of the published mechanics — `ajtbd-key-theses.md §22–§23` / `value-creation-mechanics.md`; the most powerful when applicable is *climb a level / kill a Job as a class*}.
**What changes for the customer:** {how exactly more energy-efficient}.
**The Aha Moment this creates:** {what becomes the "wow" — value beating the customer's prediction}.

### Features (delivery vehicles for value)
| Success criterion / value hypothesis | Mechanic | Feature |
|--------------------------------------|----------|---------|
| {criterion} | {mechanic} | {what we ship} |

### Threat from Big-Job-level players
{If turnkey Big-Job players with scaling potential exist — how serious, and partner-or-displace?}
```

## Section 4 — Strategic recommendation & pivot

```markdown
## 4. Strategic recommendation & pivot options

### Verdict on the proposed segment + Jobs: GO / NARROW / PIVOT
{Walk the RAT cause-and-effect chain — Market → Segment+Jobs → Value → Unit economics → Channels — and name the verdict + the binding constraint. GO = the chain holds; NARROW = it holds only for a sub-segment / sub-Job; PIVOT = an upstream link is broken and an alternative market scores better.}

### Within-segment Job switches
{Using the focal segment's Job Graph: which Previous Job or Next Job in the chain to capture; whether to climb to a higher Big Job (the most powerful mechanic); which sibling Small Jobs to add. "You're competing on Job X; the more valuable adjacent Job for this same segment is Y."}

### Alternative Big-Job markets for your assets (ranked)
{Generated by the pivot pipeline from your technology, team expertise, and resources, scored on the same selection screen.}

| Alternative Big-Job market | Hypothesized segment + Core Jobs | Why your assets transfer | Selection-screen read (value · demand · margin · size×switch · risk-gate) | What changes vs. the original (channel · UE · build) | Confidence |
|---|---|---|---|---|---|
| {market} | {segment + Core Jobs hypothesis} | {tech / team / partners} | {strong/med/weak per factor; gate pass/FAIL} | {what's different} | high/med/low |

### Suggested reruns
1. Rerun this skill on **{alternative Big-Job market}** — {why}.
2. Rerun with **{a narrower segment / different business model / different channel}** — {why}.
```

## Section 5 — Risks & next moves (action-first RAT)

```markdown
## 5. Risks & next moves

Walked across the package on the cause-and-effect chain (Market → Segment+Jobs → Value → Unit economics → Channels). Each assumption is in positive, falsifiable form and paired with the action to validate it. The goal is to *falsify cheaply* — to kill or pivot before the build, not to confirm.

| # | Risky assumption (positive form) | Why risky / cost if wrong | What to do to validate it (the action — cheapest falsifying test) |
|---|----------------------------------|---------------------------|--------------------------------------------------------------------|
| 1 | {top risk — usually the Segment-and-Jobs or WTP assumption} | {money / time / years} | {the concrete action} |
| 2 | … | … | … |
| 3 | … | … | … |
| 4 | … | … | … |
| 5 | … | … | … |

### Action plan — the next moves, in priority order
1. **{Step 1}** — {the cheapest, highest-leverage falsification first}.
2. **{Step 2}** — {…}.
3. **{Step 3}** — {…}.
{Order by `(P(wrong) × cost-if-wrong) / cost-to-validate`. Segment-and-Jobs validation usually comes first.}
```

## Section 6 — Disclaimer + verification checklist

Repeat the two-part disclaimer; then a checklist covering: run the 3-method sizing verifications (appendix); find 6–8 past payers in the focal segment and run AJTBD interviews (ask about *tasks*, not "Jobs"); confirm segment coverage and the antisegment; run the action plan from Section 5; a source-link audit (every named source is a live clickable link; re-check any flagged "URL TBD").

## Appendix — sizing methods (short)

For each of TAM / SAM / SOM, and for each segment's size + budget, **one compact table**: the three method names, each one-line result + the single key assumption + the linked source, then the average; plus **one runnable verification line** ("open {source}, take {figure}, × {assumption} → within 30% confirms"). Full input breakdowns and divergence notes live in `debug.md`, not here.

---

## Methodology self-critic criteria (checked before the report ships)

Methodology only — format is guaranteed by the templates above, so it is not re-checked.

1. **Segments = similar Core Jobs + similar success criteria** — not demographics, not Big Jobs, not industry.
2. **Real criteria are causes** (a behaviour / characteristic explaining how we create value, earn margin, or acquire), not paraphrased value or consequences.
3. **Selection screen applied** to every segment, and the focus pick justified on it.
4. **Switchability assessed** — the segment has triggered, unsatisfied customers willing to switch (the Problem is the trigger), not only habitual locked-in users.
5. **Jobs use the canon grammar** — `When … I want to {expected outcome} with success criteria … in order to …`; one expected outcome per Job; levels named and product-relative.
6. **Core vs Big distinguished** — Core = highest Jobs the product performs fully; Big = motivation above, not the segmentation root.
7. **Aha Moment placed** — where delivered value beats the customer's expected criteria; positioning promises only what the chain delivers.
8. **Competitors defined by Jobs, not categories** — direct on the Core Job; indirect on the Big Job, incl. do-nothing and non-obvious substitutes.
9. **Wedge = an underserved success-criterion intersection**, delivered via a *published* mechanic; features follow from criteria + mechanic.
10. **RAT walks the cause-and-effect chain**, each risk positive + falsifiable + paired with a validation action; riskiest-and-cheapest-to-falsify ordered first.
11. **Pivot markets evaluated on the same selection screen** against the extracted assets; existential-risk gate applied; each is a concrete Segment + Big-Job pair.

---

## Quick mode (default)

One Claude, no internet, no subagents. Steps:
1. Create the run folder + `00-input.md`.
2. Read the four canon files (read set above).
3. Fill every template section directly from reasoning: market snapshot → Map of Segments (all segments, selection screen) → differentiation → **pivot** (extract assets from `00-input.md`, generate 3–5 alternative Big-Job markets with segment+Jobs hypotheses, score them on the selection screen) → action-first RAT → appendix.
4. Run the 11 self-critic criteria over the draft; fix in place; record the methodology trace in `debug.md`.
5. Compute the **one-pager last** from the finished analysis.
6. Write `debug.md` and the result file.
7. In the chat: print the brief outcome + the one-pager + rerun suggestions + the file paths (see "End-of-run chat output").

Quick mode does not access the internet, run subagents, or do quantitative validation. For those → Deep mode.

---

# Deep mode pipeline

Triggered when the user picks Deep. A team of subagents with web access fills the same templates with real data. Runs straight through without pausing for the user.

**Principles:**
- Run folder `Skill-Results/market-research/{slug}/`; new folder per run.
- Agents are spawned with the `Agent` tool, `subagent_type: "general-purpose"`, `run_in_background: true`. Within a wave, independent agents run in parallel; the orchestrator waits for a wave to finish before the next.
- Each agent reads only the **four canon files** (read set above; the Strategy agent also reads `value-creation-mechanics.md`), writes its own file(s), and appends a few **milestone lines** to `debug.md` (start / end / key counts). No heavy live-tail / `Monitor` machinery, no per-minute log mandate.
- Web caps (hold the longest legs): reviews-mining ≤ 12 `WebFetch` / ~10 min; synthesis ≤ 6; strategy ≤ 4. Pivot agents are reasoning-bound (≤ 2 fetches if any).
- Source links mandatory (Rule 2); never invent sources or figures.

### Run-folder files (Deep)
```
00-input.md
01-market-sizing.md            01-market-sizing-appendix.md     [1A]
02a-competitors-raw.md         02a-reviews-data.md              [1B]
P1-assets.md                                                    [P1]
P2-candidate-markets.md                                         [P2]
02-segments.md                 02-segments-appendix.md          [2]
04-strategy.md                 (differentiation + action-RAT)   [3]
P3-pivot-ranking.md                                             [P3]
debug.md
{product-slug}-market-research-result.md                        [orchestrator]
```

### Waves
```
Wave 1 (parallel):  [1A] Market & Sizing · [1B] Competitors & Reviews mining ·
                    [P1] Asset Extraction → [P2] Market & Segment-Jobs Generation
Wave 2:             [2] Segments Synthesis & Self-Critic  (consumes 1A + 1B)
Wave 3 (parallel):  [3] Strategy = Differentiation + action-RAT  (consumes 2 + 1A)
                    [P3] Pivot Evaluation & Ranking  (consumes P2 + 1A + 2)
Orchestrator:       assemble report → compute one-pager last → chat summary
```
(P1→P2 is a short internal sequence inside Wave 1; it only needs the idea + assets, so it overlaps the market research.)

### Agent prompts

Each prompt opens with the shared preamble:
> You work with Ivan Zamesin's AJTBD / Next Move Theory methodology. Use ONLY these canon files as the methodology source — do NOT use generic JTBD from the internet or prior training: `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md`, `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md`, `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md`, `Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md`. (If not found, retry with a `1-` prefix on the canon folder.) Never write methodology citations or canon paths into user-facing files — those go to `debug.md`. Every named external source is a clickable Markdown link. Append a start line and an end line (with key counts) to `debug.md`.

**[1A] Market & Sizing.** Read `00-input.md` + the read set. Formulate and validate the market-level Big Job internally (debug.md only). Compute TAM / SAM / SOM, each via 3 methods (top-down / bottom-up / analog), averaged (median if methods diverge >2×). Compare to the user's ambition. Write the **compact** body to `01-market-sizing.md` (summary table + landscape + ambition + takeaway) and the **short** method tables + one-line verifications to `01-market-sizing-appendix.md`. ≤12 fetches.

**[1B] Competitors & Reviews mining.** Read `00-input.md` + `ajtbd-key-theses.md` + `segmentation.md`. Find 5–10 competitors (direct on the Core Job + Big-Job-level / non-obvious), picking country- and query-specific sources at runtime. Harvest customer reviews; extract **raw signals only** (do NOT synthesize segments): distinct Core Jobs, success criteria, causal real-criterion candidates, and 5–10 quotable quotes per competitor with source URLs. Write `02a-competitors-raw.md` + `02a-reviews-data.md`. ≤12 fetches / ~10 min.

**[P1] Asset Extraction.** Read `00-input.md` (idea + assets) + `nmt-key-theses.md`. From first principles, extract and name the idea's **essence**, **technology / capability**, **team expertise & unfair advantages**, **resources in hand** (money, partners, traction, distribution, data, brand), and **hard constraints**. Tag each asset **transferable** vs **idea-specific**. Write `P1-assets.md`. No web.

**[P2] Market & Segment-Jobs Generation.** Read `P1-assets.md` + the read set. Generate **5–8 candidate Big-Job markets** where the assets create value, across diverse angles (where the tech applies · where the team's expertise/access/partners apply · adjacent Big Jobs / climb-a-level moves). For **each** candidate, also generate the **Segment-and-Jobs hypothesis** — a named focus segment (causal criteria) + its Core Jobs + success criteria — and which assets transfer. (Segment+Job is one analytical entity; a bare market name is not evaluable.) Depth = hypothesis, not deep research. Write `P2-candidate-markets.md`. ≤2 fetches.

**[2] Segments Synthesis & Self-Critic.** Read `00-input.md` + `01-market-sizing.md` + `02a-*` + the read set. Group customers from the mined signals into segments by **similar Core Jobs + similar success criteria + causal criteria**. Build each segment block per the Section-2 template (persona → Core Jobs → Big Jobs → size+budget+switchable share → **selection screen** → competitors inline). Order ✅ → ⚠️ → ❌. Write the cross-segment themes block. Run the **11 self-critic criteria** over the draft and fix in place. Internal-only items (Big-Job validation, antisegment causality, discarded segments) → `debug.md`. Write `02-segments.md` + `02-segments-appendix.md` (short method tables).

**[3] Strategy (Differentiation + action-RAT).** Read `00-input.md` + `01-market-sizing.md` + `02-segments.md` + `02a-reviews-data.md` + the read set + `value-creation-mechanics.md`. Pick the focal segment (selection-screen composition + asset fit). Produce Section 3 (positioning headline → why focal → criteria×competitors matrix → underserved wedge → published mechanic → features → Big-Job-level threat) and Section 5 (action-first RAT on the cause-and-effect chain: each risk positive + falsifiable + paired with its validation action; then the Step 1/2/3 action plan, ordered by RAT priority; drop any "≤1 week" constraint). Write `04-strategy.md`. ≤4 fetches.

**[P3] Pivot Evaluation & Ranking.** Read `P2-candidate-markets.md` + `P1-assets.md` + `01-market-sizing.md` + `02-segments.md` + the read set. Score every candidate market on the **selection screen** (added value · demand · margin · size×switchability · existential-risk gate); drop gate-failures; rank; select top 3–5. Reuse main-pipeline sizing where a candidate overlaps a researched market. For each pick state **what changes vs. the original idea** (channel · UE · build · which assets carry) and a confidence level. Write `P3-pivot-ranking.md`. ≤2 fetches.

### Orchestrator
1. Create the folder + `00-input.md`; record start time.
2. Spawn Wave 1 (1A, 1B, P1→P2) in background; wait for all.
3. Spawn Wave 2 (Segments); wait.
4. Spawn Wave 3 (Strategy + P3) in parallel; wait.
5. Assemble `{product-slug}-market-research-result.md`: one-pager (computed LAST from the finished sections) → Section 1 (`01-market-sizing.md`) → Section 2 (`02-segments.md`) → Section 3 (from `04-strategy.md`) → Section 4 (within-segment switches from `02-segments.md` Job Graph + alternative markets from `P3-pivot-ranking.md`) → Section 5 (action-RAT from `04-strategy.md`) → Section 6 → Appendix (merge `01-market-sizing-appendix.md` + `02-segments-appendix.md`, kept short).
6. Source-link audit; flag any bare or "URL TBD" sources in the checklist.
7. Append a short timing + counts summary to `debug.md`.
8. Chat output (below).

---

## End-of-run chat output (both modes)

In the chat, output **only**:
1. **Brief outcome** — 3–5 lines: the verdict, the focus pick, the top risk, and whether a pivot market looks more promising than the original idea.
2. **The one-pager**, printed verbatim.
3. **Concrete rerun suggestions** — e.g., *"Re-run for the Big-Job market `{X}` where your `{asset}` also applies, or with a `{per-worker / subscription}` model for `{segment}`?"*
4. **Paths** — the result file, `debug.md`, and the run folder.

Framing: the goal is the success of the whole business initiative, not only the first idea (local-vs-global optimum) — so the reruns are a first-class invitation, not an afterthought.

---

## What this skill does NOT do

- No quantitative survey (300–500 respondents), no ABCDX analysis of existing customers, no full unit-economics model — those are separate skills.
- Quick mode: no internet, no subagents, no quantitative validation.
- Does not pause to ask the user mid-pipeline (Deep mode runs straight through).
- Does not invent sources or numbers; thin data is recorded as thin, never fabricated.

---
name: nmt-craft-value-proposition
description: >-
  Generate the strongest possible Value Proposition for a chosen segment using
  Ivan Zamesin's AJTBD / Next Move Theory methodology. Input — a $nmt-market-
  research result OR a manual segment+Jobs description. It extracts the segment's
  dominant success criteria, builds the Job Graph + Critical Chain of Jobs,
  generates value hypotheses via the value-creation mechanics catalog, filters on
  feasibility, cost, unit economics, and competitiveness, ranks by RICE, and
  surfaces a primary + supplementary value proposition with top-3 RAT cards and a
  PRD-ready spec for $nmt-product-requirements. Use when the user wants a value
  proposition, differentiation, or asks "how do we win this segment". Two modes —
  Quick (default) and Deep. Defaults to English.
user-invocable: true
---

> **Update check — best-effort, ≤2s, never blocks.** Before the steps below, run
> `curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-craft-value-proposition"`; on any error
> or timeout, skip silently. Compare `.nmt-version` (project root) with the feed's `latest`. If
> behind, print one line — the `<installed> → <latest>` gap, a one-line summary per newer entry,
> and "run $nmt-upgrade to update" — then continue. If it matches or `.nmt-version` is absent, continue.

# Craft Value Proposition v2

This skill turns a market-understanding artifact (or a manual segment description) into the **strongest possible, validatable value proposition** for a chosen target segment — and a **PRD-ready implementation spec** that describes how to build it.

It sits in the middle of the chain:

```
$nmt-market-research → $nmt-craft-value-proposition → $nmt-product-requirements → $nmt-craft-go-to-market
(segment + Jobs +   (the value hypothesis +     (the build: PRD —        (landing + ad +
 wedge + competitors) §11 implementation spec)    functionality +          GTM/growth comms)
                                                   edge cases)
```

`$nmt-market-research` hands over a target segment with its Core Jobs, success criteria, Big Jobs, competitors and a one-line wedge. This skill goes **much deeper than that wedge**: it extracts the segment's *dominant* success criteria, builds the Job Graph the mechanics operate over, **generates** value hypotheses by walking the full value-creation mechanics catalog over that graph, then **filters and ranks** them on feasibility, cost-to-build, unit-economics, and real competitiveness. The output's `§ Implementation spec` is the canonical input `$nmt-product-requirements` consumes.

The bigger gift is **invention** — systematically generating the strongest / fastest / cheapest way to create value — not validation. Validation (the RAT cards) is the deliverable, not the differentiator.

The output is a single file in **three reading depths, linked top-to-bottom** (so one document serves the co-founder skim, the skeptical read, and the methodology audit + the PRD hand-off):

1. **Layer 1 — The Value Proposition, in one breath** (~1 page, zero methodology words): what it is, who it's for, why they'd switch, the one bet that must be true, the one thing to do next — each line drilling down to its reasoning. Forwardable to a co-founder who's never heard of the methodology.
2. **Layer 2 — The Reasoning** (2–4 pages, plain English): *how we got here* for each Layer-1 claim — what the segment wants most, the wedge, the before→after, the Aha in plain terms, the riskiest bet — each linking down to the full work.
3. **Layer 3 — The Full Work** (the §0–§12 detail): the mechanic tables, before→after, competitor matrix, RAT cards, the **PRD-ready §11 implementation spec** `$nmt-product-requirements` consumes, and the §12 methodology appendix.

> **Producer contract (binding) — `../PRODUCER-CONTRACT.md`.** Six cross-cutting behaviors shared by all producer skills, from user feedback: (1) print a **helicopter-view** before the first question; (2) ask **Markdown or HTML** output; (3) treat **all** user input as hypothesis and emit a *"risks I see in what you gave me"* block; (4) print **validation debt** and write any go-ahead as **`GO (to validation)`**, never a bare "build it now"; (5) accept a **custom output path**; (6) Deep mode runs an **evidence floor + self-critic loop** and offers a **web-MCP fallback**. The hooks below wire each into this skill; the contract is the source of truth for the wording.

---

## Core methodological principle

**Source of truth — `Next-Move-Theory-Canon/` in the project root.** Do NOT use generic interpretations of Jobs To Be Done from the internet or LLM training. Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per project `AGENTS.md`):

- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), `in order to` perform a higher-level Job. Not "a struggle for progress."
- **Value** is greater energy efficiency for the brain in performing a Job, measured against the brain's prediction. The **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. **Never use the abbreviations PPE / NPE** (per Rule 22) — write *Aha Moment* / *Problem*.
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job. Each infinitive verb is a separate Job (Rule 7).
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs.

**Methodological invariants this skill MUST enforce — output is invalid if any is violated:**

- **Value = `Probability of the Outcome × Outcome − Cost`** (`value-creation.md §3`). Three levers: raise probability (guarantee/proof), raise outcome (move-up-a-level), lower cost (money/time/effort/cognitive/negative-emotion/Tax-Jobs). A value hypothesis names which lever it pulls.
- **Mechanics operate over a Job Graph**, not against a Core Job in isolation (`value-creation.md §11`, `job-graph.md §12`).
- **Segmentation root = similar Core Jobs + similar success criteria, in a similar priority order.** The *priority order over criteria* is what makes a segment a segment (`segmentation.md §2`, `value-creation.md §10`). Big Job is motivation context, **never** the primary segmentation criterion. Demographics are second-order correlates.
- **Habit cannot be fought head-on** — reuse it or sidestep it via an Aha Moment + loaded Consideration Activators (`behaviour-change.md §9–§11`). Never "beat the habit."
- **Aha Moment is a specific positive-prediction-error event** — NOT signup, login, or first feature use. Place it as far left in the Critical Chain of Jobs as possible.
- **All switches go through the Big Job** — the value prop must be communicable through a Big-Job criterion (`behaviour-change.md §4`).
- **Anti-segment must be nameable** — if everyone wants this, the value prop is too universal.
- **Unit economics is a filter** — value that does not convert to margin (LTV > CAC, Job budget covers cost-to-serve) is not a product (`nmt-key-theses.md §4`).
- **Risks compound** — a value prop stacking ≥5 unvalidated assumptions gets flagged (`rat-key-theses.md §1`).

Per project `AGENTS.md`: every named external source in any output is a clickable Markdown link `[Name](https://...)` (Rule 2). Disclaimers (numerical + hallucination) at the top of `result.md` (Rule 3). Outputs are written for a **US product audience** (Rule 6) — default to US-context analogs.

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the user-facing document in the plain, everyday language the target segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label.

- ❌ *"Red Queen value-gap compression…"* · *"the Critical Chain of Jobs breaks at M4"* · *"load the Consideration Activators."*
- ✅ *"The free do-it-yourself option caught up, so your edge shrank even though you didn't get worse (in the methodology, a* Red Queen *effect)."*

**Who reads it** — the target segments (the essentials are inline here, so the skill stays self-contained and public-safe): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain of Jobs)* · the exact step where they get stuck *(a Critical Chain of Jobs break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning held in context and the explicit **§12 Methodology appendix (NMT)** inside Layer 3, where full methodology language is expected. The *lead the reader sees* in Layers 1–2 (and in Layer-3 prose) is plain; the *parenthetical and the appendix* carry the precise terms.

Link `references/glossary.md` once at the top of Layer 2, where the methodology terms first appear.

---

## Readability rules (the document is for a customer who doesn't know the methodology)

The value-proposition document is **three reading depths in one file**, linked top-to-bottom like canon §-references. Most readers stop at Layer 1; doubters drop one level to see *how we got here*; experts read the bottom (the full mechanic work + the PRD-ready spec). The full template is in "S6 — Synthesize the artifact (three layers)" below. The rules that make it work:

- **Three layers, escalating depth — state each conclusion once per layer, never twice at the same depth.** Layer 1 = the value proposition in one breath (the headline only). Layer 2 = the reasoning in plain English. Layer 3 = the full methodology work (the mechanic tables, before→after, competitor matrix, RAT cards, the §11 implementation spec, the §12 appendix). A bet is a headline in L1, a plain sentence in L2, a full RAT card in L3 — three depths, not three copies.
- **Drill-down links are mandatory.** Every Layer-1 claim a skeptic could doubt carries a `▸` link to its Layer-2 anchor; every Layer-2 claim links to the Layer-3 part that derives it. Use Markdown anchors: write `[how we know they'll switch ▸](#l2-bet)` and put `<a id="l2-bet"></a>` above the target. This is what makes the simple layers *trustworthy* — the reader can always click through to the derivation.
- **Layer 1 = minimal jargon, plain words lead.** Lead every sentence in plain product English a junior PM gets at a glance. A methodology term may appear **in parentheses** as a short plain gloss when it genuinely helps — but never *open* a sentence with a raw term, and keep jargon to a minimum. Short sentences — "explain it to a smart friend." Watch the sneaky business-jargon leaks: *wedge, bet, beachhead, ACV* read as jargon too — translate them (wedge → "the one thing only we do"; the bet → "the one thing that must be proven first") or gloss in parentheses.
- **Layer 2 = plain language first, term glossed.** On first use, gloss a methodology term in 3–5 words in parentheses — e.g., *"the Big Job (the outcome the customer is really after)"*. Nested or repeated parenthetical glosses are fine — clarity beats purity. Link `references/glossary.md` once at the top of Layer 2.
- **No internal methodology citations in Layers 1–2.** Never write "per behaviour-change.md §1", "per Rule 7", or any canon file path in the readable layers.
- **Layer 3 may carry methodology citations — but fenced, not inline.** This is the biggest readability fix for this skill: the old output embedded inline citations everywhere (`[Value Creation §10](…)`, `(per [Behaviour Change §1])`, `[AGENTS.md Rule 7]`). **No canon path or `Rule N` appears inline in Layer-3 prose.** Put each canon reference in a collapsed **methodology trace** at the end of a subsection, styled out of the reading flow, e.g.:
  > <sub>**▸ methodology trace.** Value = Probability × Outcome − Cost (`value-creation.md §3`); mechanics operate over the Job Graph (`value-creation.md §11`); segmentation root = similar Core Jobs + similar success criteria in a priority order (`segmentation.md §2`).</sub>
  Never break a sentence of report prose with `(value-creation.md §11)`. The **§12 methodology appendix MAY keep a single consolidated canon-references list** — it is an explicit appendix — but the body prose stays clean. Project-internal rule numbers (`AGENTS.md Rule 7`) never appear in **any** layer, including §12 — they are for your reasoning, not the reader.
- **Disclaimers once.** The two-part disclaimer appears **once** (top of file), plus a one-line pointer in Layer 1. Do not repeat the full disclaimer block inside Layer 3. (Search the file before shipping — the disclaimer wording should hit at most twice.)
- **Keep source links** for external facts (Rule 2).

**Enforcement gate (these kept getting skipped in real runs — check each before writing the file; full version in `../READABILITY-CONTRACT.md`):**

- **Unique, resolving anchors.** Every `▸` drill-down link points to its own unique `<a id="…">` that exists **exactly once**; no two links share a target. The live failure for this skill was two different Layer-1 links both pointing at `#l2-bet`, and `l3-value`+`l3-segment` stacked on one heading — give each its own anchor. Before shipping, list every `▸` target and confirm each resolves to one place.
- **Inline-gloss opaque Layer-3 table headers.** A non-obvious column header carries a 3–6-word plain gloss right there. Don't rely on the glossary file — a casual reader never opens it.

---

## Methodology — source of truth (progressive loading)

The **only** source of methodology is the Next Move Theory canon, read at runtime (relative paths; the skill ships in the same repo as the canon). **Don't load all of it up front** — read the eager core first, then pull the staged files only when the run reaches the stage that needs them (the same progressive-disclosure pattern Claude skills use with `references/`). This keeps a Quick run light and lets each Deep-mode agent read only its slice.

**This is a public skill — it grounds only in the public canon.** Every file in the sets below is a published canon file (the set whitelisted in `8-Tools/sync/PUBLIC_MANIFEST.yml`); the skill ships to the public mirror, where private files do not exist. **Never read or quote any canon file outside the sets below** — the value-creation algorithm, the unit-economics theory, and the full mechanics catalog are folded into the public files below; their deeper private and paywalled forms are out of bounds. This holds in **both** repos — even when running inside the Internal repo where those files exist on disk.

**Eager core (read before any analysis — every run):**

| File | What it powers | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | The value formula (§3), 6 cost dimensions (§8), success criteria (§9), the 8 criteria-priority orders (§10), **the criteria→mechanics map (§11)**, the Aha Moment (§12), move-up / kill-a-Job (§14), the invisible-product North Star (§20) — defines the segment's dominant criteria and seeds the mechanics | ~8k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | The ~26 foundational mechanics — the generation catalog spine S3 walks | ~4.9k |

**Staged — load only at the stage that uses it:**

| File | Load when | Used by | ~tokens |
|---|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | confirming the segment root at intake / S1 | segment root, sub-segment vs new segment | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | building the success-criteria list (S1) | the 8 Job elements, success criteria (direction + level), 3 fidelity levels | ~4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | building the graph substrate (S2 — Aha-placement stage) | Critical Chain of Jobs, breaks/cycles/hand-offs, Aha placement, Previous/Next Job | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | reaching the forces / Aha stage (S3, §7 proof, §12 forces) | forces of behaviour change, Consideration Activators, Class 1/2, habit reuse | ~6k |
| `Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md` | reaching the unit-economics filter (S4) | §4 chain-to-profit (LTV > CAC, payback, target margin per unit) + §5 Consequence 2 (segment budget covers cost-to-serve) | ~5.4k |
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | reaching the RAT-cards stage (S5) | the RAT chain, the RAT formula, custom risks | ~6.5k |
| `Next-Move-Theory-Canon/Algorithms/the-algorithm.md` | when the strategic spine needs framing (S0 routing / S6) | the market → segment → value → de-risk spine this skill's value step sits inside | ~4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md` | synthesizing the artifact (S6, §0 one-liner) | the one-liner formula and value-prop language | ~3k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md` | only when the graph substrate needs care (S2 — levels, many-to-many, directional moves) | the graph substrate | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` | only when Big-Job communication / fear reduction needs depth (S3, S6) | Consideration Activators, fear reduction | ~4k |

Quick mode (one Codex agent): read the eager core, then read each staged file the first time the run reaches its stage — not before. Deep mode: **each agent reads only the files its wave needs** (the [S1] dominant-criteria agent → eager core + `segmentation.md` + `job-structure.md`; [S2] job-graph → `critical-chain.md` (+ `job-graph.md` if needed); [G*] mechanic generators → eager core + `behaviour-change.md`; [F] feasibility → `nmt-key-theses.md`; [RAT] → `rat-key-theses.md`; [SYN] → `communication.md`). Never have an agent load a file outside its slice.

**Path note:** if a file is not found, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix the public repo strips.

---

## The pipeline (S0 → S6 with critic gates)

```
S0  Intake & Route ───(human: input path, mode, target segment)
     │
S1  Dominant success criteria + anchors ──────────► GATE-1 ─┐
     │                                                        │ loop ≤2 rounds,
S2  Job-Graph substrate (Micro + Critical Chain of Jobs) ─► GATE-2 ─┤ then escalate to human
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

This is the value-creation algorithm (`value-creation.md §11–§14`, inside the `the-algorithm.md` strategic spine) with `nmt-key-theses.md §4` as the unit-economics filter and `rat-key-theses.md` as the de-risking layer. The spine is a **prompt-chaining workflow with an evaluator-optimizer gate after each substantive stage** — not an autonomous agent.

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

## Output file (per `AGENTS.md` Rule 4 — one file per run)

The skill writes **exactly one** file. Default location (used unless the user gave a custom output path in intake — `PRODUCER-CONTRACT.md §5`), grouped under the product's folder in the project root (never `TMP/` or `.claude/`):

```
Skills-Results/{product-slug}/craft-value-proposition/{YYYY-MM-DD_HH-MM}_{product-slug}-craft-value-proposition-result.{md|html}
```

- **Extension follows the chosen output format** (`PRODUCER-CONTRACT.md §2`): `.md` (default) or a single self-contained `.html` (inline CSS, working in-page anchors for the How-to-read jumps + every `▸` drill-down link, `<details>` for Layer 3 and methodology traces, source links opening in a new tab). HTML carries the identical content — same attribution, disclaimers, three layers, tables, links — just in a more readable shell. Never write both; one file per run.
- If the user gave a custom path, write the one file there with the same filename pattern.
- Everything else — the normalized input, the ranked criteria, the Job Graph, the raw hypotheses, the scored shortlist, the RAT inventory, dropped hypotheses, and every GATE verdict — **stays in-context across the stages**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

**Attribution (Rule 23).** The file opens with the attribution top-line (the very first content, above the disclaimers) and closes with the attribution block — `utm_source=nmt-craft-value-proposition&utm_medium=skill-artifact`.

---

# Quick mode (default, ~10–15 min, no internet)

One Codex agent, no internet, no subagents. Runs the full S0→S6 chain inline; each GATE is a self-critique pass with the adversarial prompt above, grounded in the canon. Feasibility and competitiveness are reasoning-grade (Deep mode grounds them on the web).

**Canon loading (Quick).** Read the **eager core** (`value-creation.md` + `value-creation-mechanics.md`) at run start; pull each **staged** file the first time the run reaches the stage that uses it — not before (see "Methodology — source of truth"). Build the Layer-3 work first (S0→S6), then **compute Layer 2, then Layer 1, LAST** from the finished Layer-3 work, wiring the `▸` drill-down links to the Layer-3 anchors. Write the single file in the order: top disclaimers once → Layer 1 → Layer 2 → Layer 3.

## S0 — Intake & Route

### Orientation (helicopter view) — print before any question
**First, the orientation block** (`PRODUCER-CONTRACT.md §1`) — print it before any question, in plain words:

> **What you'll get:** one document — your value proposition (what it is, who it's for, why they'd switch), the top-3 things to test before building, and a PRD-ready spec the next skill (`$nmt-product-requirements`) can build from.
> **The steps:** (1) a few questions about your segment + input → (2) I pull out what this customer wants most → (3) I generate many ways to create value and filter them on feasibility, cost, unit economics, and how well they beat competitors → (4) I rank them and surface a primary + a back-up value prop with test cards → (5) you get one document in three reading depths.
> **Where I work vs. where you decide:** I do the analysis, the invention, and the hypotheses. *You* pick the primary value prop and run the field validation — interviews, fake-door tests, first sales. I can't validate for you; I can only tell you what to check first and how.
> **Two modes:** *Quick* (default — no internet, ~10–15 min, reasoning only; good for a first cut and "did I miss a stronger angle") · *Deep* (opt-in — subagents + web research, longer; real competitor and review data; best on a top model with a web-research MCP).
> **Honest caveat:** this speeds up the *thinking*, not the *proving*. Every value prop here is a hypothesis until you check it in the field.

Then proceed to intake.

### Language
Default **English**. If the user writes in another language, offer to work in it via `request_user_input` (English (Recommended) / their language; for another language, ask directly in chat). Hold the choice in context. The report uses the chosen language; canon files and source URLs stay as-is.

### Determine input path
Ask via `request_user_input`:

```
Q1: "What's your input?"
- "I have a $nmt-market-research result file"   → path A: load and parse
- "I want to run $nmt-market-research first"    → path B: hand off, then come back
- "I'll describe the segment manually"      → path C: standalone manual intake
```

**Path A — nmt-market-research result loaded.** Ask for the result file path, `Read` it, parse the segment list. Then:

```
Q2: "Which target segment(s)?" (list the ✅/⚠️ segments parsed from the result)
- Pick 1 (recommended) or 2 (max). Push back on 3+.

Q3: "What's the active business goal?"
- "Launch a new product"
- "Reposition an existing product"
- "Expand an existing product into a new segment"
- "Other — I'll describe"
```

**Hand-off debt — what's been validated since (`PRODUCER-CONTRACT.md §4c`).** The nmt-market-research result carried a validation debt (its risky assumptions, the RAT in its Section 5). Ask once: *"That research left a list of unvalidated assumptions. Which of them have you since checked in the field — interviews, sales, a test — and what did you learn?"* Carry the answers in context: anything confirmed becomes evidence (cite how it was checked); anything still unchecked stays tagged unvalidated and flows into S5's RAT cards. Debt travels down the chain — it is not silently dropped.

**Path B — wants nmt-market-research first.** Reply: *"Strongly recommended — the value prop is much sharper from a real nmt-market-research run. Run `$nmt-market-research` (Quick or Deep), then come back here with the result file. Want me to open the `$nmt-market-research` input prompt now?"* Hand off.

**Path C — manual segment description.** Only if the user declines nmt-market-research. Collect a structured manual input via plain-text prompts:

```
Required:
- Product description (1–2 sentences) + URL if any
- Target segment NAME (short, memorable, follows from causal criteria)
- Persona — causal criteria (NOT demographics): behavioral trigger · stage/lifecycle ·
  information-diet · causal pain trigger
- Big Job(s)  (verb + noun + life/business state change); personal Big Job for B2B
- Top 1–3 Core Jobs in canonical form:
  When {context + trigger + negative emotions}, I want to {expected outcome}
  with success criteria {concrete: direction + level}, in order to {Big Job + positive emotions}.
- Known alternatives — ≥3 ways the segment closes the Big Job today (with URLs)
- Active business goal (launch / reposition / expand)
```

Validate the manual input against the invariants; ask for fixes if any fail (e.g. *"that segment criterion is demographic — describe the behaviour or characteristic that causes the Job"*; *"that Job has two infinitive verbs — parse it into the hierarchy"*). Flag reduced confidence at the top of `result.md`: *"⚠️ Confidence reduced — value prop generated from a manual segment description, not a full nmt-market-research run."*

### Run options & output (all paths)

Ask as a Codex intake sequence. Use `request_user_input` for structured choices, split into calls of at most 3 questions across separate logical questions, and ask custom paths or other free-text answers directly in chat. If one logical question lists more than 3 choices, ask that entire question directly in chat; do not split one logical question across several `request_user_input` calls. Do not include an explicit Other option.

- **Mode** — Quick (default; fast; no internet) / Deep (subagents + web competitor mining).
- **Output format** (`PRODUCER-CONTRACT.md §2`) — Markdown (default; faster) / HTML (a bit slower; easier to read — collapsible sections + working in-page navigation; all source and drill-down links stay clickable).
- **Where to save the result** (`PRODUCER-CONTRACT.md §5`) — default `Skills-Results/{project}/craft-value-proposition/…` / or a folder path to match your repo (e.g., `docs/research/`). Skip = default. One file per run regardless of location (Rule 4).

### User materials, claims ledger, direction confirmation (all paths)

- **Materials.** Ask once: *"Any files or folders with material I should use — a Notion export (markdown), past research, interview notes, a strategy doc, your current site, a deck, a codebase?"* Read what's given; tag everything taken from it **[user data]** in-context. "Nothing" is a fine answer.
- **Input-as-hypothesis gate (`PRODUCER-CONTRACT.md §3`).** Treat *all* input — the nmt-market-research result, the user's free-text claims, every uploaded deck / landing / codebase / past research — as **hypothesis, never established fact**. A landing page is the team's belief about value, not proof customers want it; the Job stated in a deck may be the team's projection, not the customer's real Job (the most expensive error). Don't just record the input — **actively hunt the risks inside it**: for each load-bearing input ask — is this customer-validated or the team's belief? Does the stated Job / segment look like the real one? Any internal contradictions, or guesses dressed as data? What must be true for it to hold, and is that checked? Hold the findings in context — they become the **"What you told me — and the risks I see in it"** block in Layer 2, with the single worst one surfaced in Layer 1. Never silently bake an unvalidated input into the wedge or the value prop.
- **User-claims ledger.** Collect the strong factual claims the user made (segment beliefs, competitor facts, "customers always…"), tag each as **data / observation / hunch** (ask in one batched question if unclear; hunch is the default for anything from a deck / landing / idea stream). User claims enter the pipeline as *hypotheses, never facts*: GATE-4's competitiveness check treats an unverified user claim as unsupported evidence, and a primary value prop resting mainly on a user hunch gets flagged in `result.md` with a RAT card pointed at that claim.
- **Hard gate.** No value prop or wedge may rest *primarily* on an unvalidated user input without the document saying so explicitly and pointing a RAT card at it. If the wedge is built on a Job taken from the user's materials and not confirmed by customer evidence, name that as the single most expensive risk.
- **Direction confirmation.** Before S1 starts, play the understanding back in one short block — *"Here's what I understood: {segment, Core Jobs, business goal, what's out of scope}"* — and confirm via one `request_user_input` (Confirm / Correct). Cheapest moment to fix a wrong direction.

**Output (held in context):** target segment + causal criteria · Core Jobs (canonical form, "in order to" not "so that") · Big Jobs (+ personal Big Job for B2B) · known alternatives/competitors (direct · indirect · turnkey) · the nmt-market-research wedge & first mechanic guess (path A) · user materials + claims ledger · mode · language · business goal.

## S1 — Dominant success criteria + anchors  → GATE-1

**Objective.** Extract *all* success criteria from the target segment's Core Jobs, classify each on the six cost dimensions and the eight criteria-priority orders (`value-creation.md §8–§10`), and **rank to the 1–3 dominant criteria that define this segment.** Pull the §11 lead-mechanic shortlist for those criteria.

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

## S2 — Job-Graph substrate (Micro + Critical Chain of Jobs)  → GATE-2

**Objective.** Build the surface the mechanics operate over: the Job Graph **one level below** the top 1–2 Core Jobs (the Micro Jobs the person performs in order to perform the Core Job), *and* the Critical Chain of Jobs (the graph projected onto a time axis) with break-points marked. Mechanics apply to a graph, not a Job in isolation.

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
has parallel sub-flows). Then project them onto the Critical Chain of Jobs and mark:
breaks · cycles · role hand-offs · time-gaps · Tax Jobs.
```

**Output (held in context):** 5–10 Micro Jobs per Core Job + the Critical Chain of Jobs with break-points flagged. This is the substrate S3 operates on.

**GATE-2 acceptance criteria:**
- ▢ Nodes are real Jobs (verb form), anchored to past performance — not future-tense fantasy (no Fake Jobs).
- ▢ The Critical Chain of Jobs marks at least the break / cycle / hand-off points.
- ▢ Levels are named and product-relative (Rule 20).
- ▢ "For what? / in order to do what?" resolves at every node (`job-graph.md §18`).

## S3 — Value-hypothesis GENERATION (divergence)  → GATE-3

**This is the core of the skill.** Walk the **full value-creation mechanics catalog** in `value-creation-mechanics.md` over `(dominant criteria × Job Graph × competitor weaknesses)` — in Quick mode hit the foundational mechanics; in Deep mode walk the catalog exhaustively, applying every mechanic to every applicable graph node. For each applicable mechanic, ask: *"Where on this graph does this mechanic create the most value against the dominant criteria — and what is the strongest / fastest / cheapest way to deliver it?"*

- **Generate the *way value is created*, concretely** — not an abstract mechanic. An app, a feature, a done-for-you service, an offline space, a flying/field service, a guarantee, a bundle, a marketplace, a concierge, a piece of content. Name the delivery format.
- **Lead with the two dominant mechanics** — *move up a level* and *kill a Job* (`value-creation.md §14`) — and hold the invisible-product North Star (§20): *what would it look like for the customer to reach the outcome with no product to interact with at all?*
- **Push for "fastest / cheapest"** — for each strong hypothesis, name the cheapest delivery that still produces the Aha Moment (concierge, no-code, partial-value slice).
- **Generate broadly** — target **12–20 raw hypotheses**; drop non-applicable mechanics (note them in-context).

Each hypothesis is written in the canonical form:

```
For {target segment} performing {Core Job + dominant criterion},
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
2. **Unit-economics fit** (`nmt-key-theses.md §4` as the filter). Does the value convert to margin? Compare cost-to-serve against the segment's **Job budget** and willingness-to-pay; sanity-check the LTV > CAC *direction*. A delightful hypothesis the segment can't profitably be served on is dropped (or flagged as a different-segment move).
3. **Competitiveness** — does it actually beat the competitive set **on the dominant criteria**? Build / extend the **criteria × competitor matrix** across direct (Core-Job), indirect (Big-Job), and turnkey (Big-Job-level) competitors. The wedge is an *underserved criteria intersection*, not a single criterion. In Quick mode this is reasoning-grade; in Deep mode it is web-grounded on real reviews.

Then **RICE-rank** the survivors:

- **R (Reach)** — % of the target segment for whom it applies.
- **I (Impact)** — subjective value to one customer.
- **C (Confidence)** — grounded in the nmt-market-research / canon evidence.
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

Per `rat-key-theses.md`: for the chosen **primary** value prop, inventory every assumption across the RAT chain (Market / Segment+Jobs / Value / Unit-economics / Channels) **plus the custom risks specific to this product** (where products actually die). **Path A: start from the action-first RAT in the nmt-market-research result's Section 5** — carry its assumptions forward, update them for the chosen value prop, and add the value-prop-specific risks; don't build a contradicting inventory from scratch. **Paths B/C (no upstream RAT): build the inventory from scratch.** Write each as an evil twin, rank by `(P(wrong) × cost-if-wrong) / cost-to-validate`, surface the **top 3** in the compact 5-line format:

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
Present the top 2 with `request_user_input` using at most three structured choices; if the user wants neither or wants to reformulate, ask for that directly in chat:

```
Q: "Which is your PRIMARY value proposition? (the other becomes supplementary, not discarded)"
- "[Candidate A short title] as primary, [Candidate B] supplementary"
- "[Candidate B short title] as primary, [Candidate A] supplementary"
- "Keep only [Candidate A] / only [Candidate B]"
- "Neither — let me reformulate"  → free-text; re-run S3–S4 on the new angle
```

## S6 — Synthesize the artifact (three layers)  → GATE-6 (panel) → human ship gate

Assemble the single output file as **three reading depths, linked top-to-bottom** (so one document serves the co-founder skim, the skeptical read, and the methodology audit + the PRD hand-off). Order in the file: top-of-file attribution + disclaimers (once) → **How to read this (3 levels, with jump links)** → **Layer 1** → **Layer 2** → **Layer 3**. **Compute Layer 1 and Layer 2 LAST**, from the finished Layer-3 work. Layer 3 keeps the full §0–§12 substance — the mechanic tables, before→after, competitor matrix, RAT cards, the PRD-ready §11 spec, and the §12 appendix — renamed and anchored, **with all inline citations fenced into methodology traces** (see "Readability rules").

### Top of file (once — above Layer 1)

The attribution top-line (Rule 23) is the very first content; the two-part disclaimer block follows it, stated **once** here and nowhere else (Layer 1 carries only the one-line pointer to it):

```markdown
<a id="disclaimers"></a>
> ⚠️ **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses, each with a runnable verification path. Validate before any major decision.
>
> ⚠️ **Hallucination disclaimer.** Generated by an LLM; may contain hallucinations in unknown places. For expensive decisions, run a full research pass; do not act on this document alone.
```

### How to read this — the three levels

Emitted once, right after the disclaimers and before Layer 1, so the reader sees the structure and can jump. Plain words only:

```markdown
## How to read this
Three levels — go as deep as you need:
- **Level 1 — The Value Proposition, in one breath** (1 page, plain words): what it is, who it's for, why they'd switch, the one thing to prove first, what to do next. Most readers stop here. [jump ▸](#layer-1)
- **Level 2 — The Reasoning** (plain English): how we got there — what the segment wants most, the edge, the before→after, the riskiest assumption. [jump ▸](#layer-2)
- **Level 3 — The Full Work** (the audit trail + build spec): the full mechanic work, before→after, competitor matrix, test cards, and the PRD-ready implementation spec. [jump ▸](#layer-3)
```

### Layer 1 — The Value Proposition, in one breath

```markdown
<a id="layer-1"></a>
# {Product} — the value proposition
{date · {plain one-phrase segment} · {launch / reposition / expand}}

> ⚠️ These are hypotheses, not facts — [full disclaimer ▸](#disclaimers)

> **Validation debt:** this value prop stands on **{N}** unvalidated assumptions — **{M}** of them fatal (would sink it if wrong). The fatal ones are the first things to test, before you build. [see them ▸](#l3-bet)
> <sub>N = risky assumptions across the RAT inventory; M = those that kill it if wrong. A Quick run on thin input has high debt — say so honestly (`PRODUCER-CONTRACT.md §4`).</sub>

## What it is
**{The headline value statement in plain words — what the product is + what it does for them, ≤15 words, zero jargon.}** [the value, in plain terms ▸](#l2-value)

## Who it's for
{The target segment in one plain sentence — who they are, not a methodology label.} [who exactly, and why them ▸](#l2-segment)

## Why they'd switch
{The promise in one or two plain sentences — the concrete gain vs. their current way, and the reason it's worth leaving what they use today.} [the edge, in plain terms ▸](#l2-wedge)

## The one bet that has to be true
{The single riskiest assumption, in plain words — if this is false, nothing else matters.} [how we know they'll switch ▸](#l2-bet)

## Do this next
{One concrete next action — usually: run the cheapest test of the bet above. This skill emits no "build it now" verdict: the next step is always to **validate first**, not to build (`PRODUCER-CONTRACT.md §4` — the value prop is a hypothesis to test, not a green light).} [the test cards — every check ▸](#l3-bet)
```

**Layer 1 rule: minimal jargon, plain words lead** — a methodology term may appear in parentheses as a plain gloss, but never opens a sentence; short, plain sentences ("explain it to a smart friend"). **Each Layer-1 line links to its own unique anchor — never point two lines at the same target** (the bet and the next-action are different links). Every line a skeptic could doubt ends with a `▸` drill-down link.

### Layer 2 — The Reasoning

Plain English, one gloss per methodology term, `references/glossary.md` linked once at the top of this layer. **No big tables** (prose + at most one small table); the full tables live in Layer 3. Each subsection carries an `<a id="l2-…"></a>` anchor that Layer 1 links to, and links down to its Layer-3 part. **No canon paths or `Rule N` here.**

```markdown
---

<a id="layer-2"></a>
# How we got here — the reasoning

*Plain-English walk-through of the logic behind the proposition above. The full mechanic work, tables, and the build spec are in the next layer. Methodology terms are defined in the [glossary](references/glossary.md).*

<a id="l2-input-risks"></a>
## What you told me — and the risks I see in it
*Everything you gave me — your idea, your deck, your landing, your numbers, the upstream research — I treated as a hypothesis, not as fact. These are the inputs the value prop leans on, and what I'd check before trusting each. (`PRODUCER-CONTRACT.md §3`.)* (Omit this block only if the user provided no claims or materials at all.)

| What you provided / claimed | How I treated it | The risk I see in it | How to check it fast |
|---|---|---|---|
| {claim or material, tagged data / observation / hunch} | {used as hypothesis in {where — wedge / segment / mechanic}} | {the specific risk — e.g., "this is your stated value, not customer-validated; the real Job may differ"} | {the cheapest falsifying test} |

{If the wedge or the value prop rests primarily on an unvalidated input, say so here in one bold sentence and point to the matching RAT card in §10.}

<a id="l2-value"></a>
## What this segment actually wants most
{The 1–3 dominant success criteria in plain words — the few things this customer weighs above everything else, and why (from who they are). The product's value is "we beat them on exactly these."} [the full criteria + mechanic work ▸](#l3-value)

<a id="l2-segment"></a>
## Who they are — and how we know it's them
{The causal criteria that pick this customer out — what they do / how they're set up, not demographics. Why a lookalike with the same demographics is a different customer.} [the full segment + Job statements ▸](#l3-segment)

<a id="l2-wedge"></a>
## The wedge — what every alternative makes them give up
{What each existing option (including doing nothing / DIY) forces the customer to sacrifice, and why ours doesn't — the wedge in plain words. Then the before→after of their life in one or two sentences, and the moment it clicks for them (the Aha — plain terms).} [the criteria-by-competitor matrix + before→after ▸](#l3-wedge)

<a id="l2-bet"></a>
## The riskiest bet — and the cheapest way to find out
{The single assumption most likely to kill this, in one plain sentence, + the cheapest test that confirms or kills it, + what result means go vs. stop. Note the other bets live in the full list.} [the full RAT cards ▸](#l3-bet)
```

### Layer 3 — The Full Work

The current §0–§12 substance, kept whole, sitting below the plain layers. Add an HTML anchor above each part Layers 1–2 link to: `<a id="l3-value"></a>` (the segment + dominant-criteria work, §1–§3), `<a id="l3-segment"></a>` (the segment + Job statements, §1–§2), `<a id="l3-wedge"></a>` (differentiation + before→after + Aha, §4–§7), `<a id="l3-bet"></a>` (the value hypothesis + RAT cards, §8–§10), `<a id="l3-spec"></a>` (the implementation spec, §11), `<a id="checklist"></a>` (above the appendix / checklist block; the `disclaimers` anchor lives at the top block). Keep methodology citations out of the prose — fence them in a `▸ methodology trace` line per the readability rules.

````markdown
---

<a id="layer-3"></a>
# The full work

> ⚠️ Confidence note: {path C → reduced-confidence flag; path A → name the source nmt-market-research file path}

<a id="l3-value"></a>
## 0. Headline value statement
**{One-liner: [what it is] + [Core Jobs it performs] + [value by criteria] — ≤15 words}.**
{Full version, 1–2 sentences. Moore "Mad Libs" form: For {segment} who {need}, {Product} is a {category} that {benefit}; unlike {alternative}, it {differentiator}.}

<a id="l3-segment"></a>
## 1. Target segment
{Who cares most — causal criteria, specific, not demographics. The persona's dominant criteria in one short paragraph + 3–5 causal-criterion bullets.}

> <sub>**▸ methodology trace.** Segmentation root = similar Core Jobs + similar success criteria in a priority order (`segmentation.md §2`); the priority order is what makes a segment; demographics are second-order.</sub>

## 2. The job, in the customer's own words
*When {context + trigger}, I want to {expected outcome} with success criteria {dominant criteria}, in order to {Big Job}.* {Job-story phrasing = the methodology's Core Job.}

## 3. Pains and Gains
**Pains** (prioritized — the Problems / Tax Jobs the current Job Graph produces): {top 3–5 bullets}.
**Gains** (prioritized — what beating the dominant criteria delivers): {top 3–5 bullets}.

> <sub>**▸ methodology trace.** Dominant criteria + their cost dimensions and priority order (`value-creation.md §8–§11`).</sub>

<a id="l3-wedge"></a>
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
**Aha Moment:** {the specific positive-prediction-error event — where it fires on the Critical Chain of Jobs, how far left it is shifted}. NOT signup/login.
**Proof / how we make it true:** {evidence, comparable cases with links, or the cheapest probe that will prove it}.

> <sub>**▸ methodology trace.** Mechanics operate over the Job Graph, not a Core Job in isolation (`value-creation.md §11`); strongest mechanics = move up a level / kill a Job (`value-creation.md §14`); Aha = a positive-prediction-error event placed as far left on the Critical Chain of Jobs as possible (`value-creation.md §12`, `critical-chain.md`); all switches go through the Big Job (`behaviour-change.md §4`).</sub>

---
*Above = the proposition. Below = the bet and the build.*
---

<a id="l3-bet"></a>
## 8. Value hypothesis (the riskiest bet, falsifiable)
**We believe that {segment} performing {Core Job} will {measurable outcome} because {reason}.**
*What / who / how:* {the value hypothesis — what we build, who is desperate for it, how it's delivered}.

## 9. Success metric & threshold
**Metric:** {the measurable signal}. **Confirm at:** {threshold}. **Kill below:** {threshold}.

## 10. The 3 bets most likely to kill this — and the cheapest tests (the riskiest assumptions)
{The three compact RAT cards from S5, in the S5 5-line format.}

> <sub>**▸ methodology trace.** Risks walked across the chain (Market / Segment+Jobs / Value / Unit-economics / Channels) + product-specific custom risks; ranked by (P(wrong) × cost-if-wrong) ÷ cost-to-validate (`rat-key-theses.md`); risks compound (`rat-key-theses.md §1`).</sub>

<a id="l3-spec"></a>
## 11. Implementation spec  → $nmt-product-requirements
*This section is the canonical input for `$nmt-product-requirements`.*
- **Product shape:** {what the product IS — name + components + delivery format (app / service / offline / hybrid)}.
- **Feature table** (delivery vehicles for value):
  | Core Job / criterion | Mechanic | What we ship | Aha-Moment link |
  |---|---|---|---|
  | {…} | {#mechanic} | {feature / service} | {step where value beats prediction} |
- **Critical Chain of Jobs & Aha placement:** {the chain the customer walks; where the Aha fires; what to remove to shift it left}.
- **Cost-to-build & cheapest probe:** {build path + the probe that validates before building}.
- **Unit-economics direction:** {Job budget vs cost-to-serve; pricing hypothesis; LTV>CAC direction}.
- **Anti-segment / out of scope:** {who this is NOT for — 2–3 groups; non-focal Jobs deferred}.

> <sub>**▸ methodology trace.** Unit economics is a filter — value that doesn't convert to margin is not a product (`nmt-key-theses.md §4`; budget covers cost-to-serve, `nmt-key-theses.md §5`).</sub>

## 12. Methodology appendix (NMT)
- **Mechanics applied (combination)** — the full table: Job × mechanic(s) × how the product performs it (typically 5–12 applications across the graph).
- **The dominant-criteria → mechanics mapping** used.
- **Forces of behaviour change** for the primary: Added Value {lever} · Problems surfaced {how} · Fears {reduction lever} · Habit {reuse / sidestep — NOT fought}.
- **Canon references (consolidated):** `value-creation.md` (§3 formula, §11 map, §14 dominant mechanics), `value-creation-mechanics.md`, `the-algorithm.md`, `behaviour-change.md`, `critical-chain.md`, `rat-key-theses.md`, `nmt-key-theses.md §4`.

<a id="checklist"></a>
## Verification & checklist
*Disclaimers at the top of this file apply (not repeated here).*

### Self-validation checklist
- [ ] **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses), Layer 2 (plain reasoning, one gloss per term, no big tables), Layer 3 (the full §0–§12 work). No conclusion repeated at the same depth across layers.
- [ ] **Drill-down links resolve and are unique** — every Layer-1 claim links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l...`/`#disclaimers` target exists **exactly once** and **no two links share a target** (the bet and the next-action are different links).
- [ ] **Opaque Layer-3 table headers carry an inline plain gloss.**
- [ ] **Disclaimers once** — full two-part disclaimer at top only; Layer 1 has the one-line pointer; this block does not repeat it.
- [ ] **Citations fenced** — no canon path or `Rule N` inline in Layers 1–2 or in Layer-3 prose; any canon reference sits in a `▸ methodology trace` line; the §12 consolidated list is the only place a flat reference list is allowed; no `AGENTS.md Rule N` anywhere.
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
- [ ] **Producer contract satisfied** (`../PRODUCER-CONTRACT.md`): helicopter-view printed before intake; output-format + output-path asked; if HTML, one self-contained `.html` with resolving anchors + `<details>`; the **"What you told me — and the risks I see in it"** block present (unless no input given); **validation-debt line** in Layer 1; the next step framed as **validate first, not build** (no bare "build it now"); on hand-off from nmt-market-research, asked what debt has been retired; Deep mode hit its evidence floor + self-critic loop (or flagged thin coverage + offered the web MCP).

## What this enables next
1. `$nmt-product-requirements` — feed §11 (the implementation spec) directly; it becomes the PRD's segment + value + risk input.
2. `$nmt-craft-go-to-market` — once the PRD exists, feed this value prop + the PRD to write the landing, ad, and GTM/growth copy.
3. Run RAT card #1 — don't build until #1 is validated or killed.

## Get more
{CTA — newsletter signup on the canon site.}
````

**GATE-6 (final ship gate — run as a small panel / k-of-N voting):**
- ▢ All methodology invariants hold (value formula; mechanics over graph; segmentation root; habit not fought; Aha = real event; Big-Job communicability; anti-segment named; unit-econ filter applied).
- ▢ **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses), Layer 2 (plain reasoning, one gloss per term, no big tables), Layer 3 (the full §0–§12 work). No conclusion repeated at the same depth across layers.
- ▢ **Drill-down links resolve** — every Layer-1 claim links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l...`/`#disclaimers` target exists.
- ▢ **Disclaimers once** — full two-part disclaimer at top only; Layer 1 carries the one-line pointer; not repeated lower down.
- ▢ **Citations fenced** — no canon path or `Rule N` inline in Layers 1–2 or in Layer-3 prose; any canon reference sits in a `▸ methodology trace` line; the §12 consolidated list is the only flat reference list; no `AGENTS.md Rule N` in any layer.
- ▢ US-native phrasing; passes the "so what?" test (every claimed attribute → benefit → why-they-care) and the 5-second test on Layer 1.
- ▢ §11 implementation spec is genuinely PRD-ready (maps to `$nmt-product-requirements` inputs).
- ▢ Every external source is a clickable link (Rule 2); US-context analogs (Rule 6).
- **Human gate:** the user approves & ships.

---

# Deep mode (~30–45 min, with internet)

Same S0→S6 chain, but substantive stages are parallelized and web-grounded. Agents are spawned with Codex's available execution (parallel subagents if your build supports them, otherwise sequentially in one context). **Each agent returns its full result in its final message — no per-agent files.** The orchestrator holds those returns in context and writes the single output file at the end. Every external source is a clickable link.

**Shared preamble for every agent:**
> You work with Ivan Zamesin's AJTBD / Next Move Theory methodology. Use ONLY the canon files this prompt names for your wave as the methodology source — do NOT use generic JTBD from the internet or prior training, and do NOT read files outside your slice (the eager core is `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` + `…/value-creation-mechanics.md`; other files are named per-agent below). (If a path is not found, retry with a `1-` prefix on the canon folder.) Write *Aha Moment* / *Problem*, never PPE / NPE. **Keep methodology citations and canon paths out of report prose** — hold them in context; the orchestrator fences any that belong in Layer 3 into a `▸ methodology trace` line. Every named external source is a clickable Markdown link. **Return your full result in your final message — do not write any files.**

**Deep-mode QA — evidence floor, self-critic loop, web-MCP fallback (`PRODUCER-CONTRACT.md §6`):**

- **Evidence floor, not just a ceiling.** The web-touching legs ([R] reviews-mining, [F] feasibility/competitiveness, [RAT]) have fetch *caps*; treat the lower bound as a *floor* too. A leg may not return "done" until it has hit a real minimum of distinct sources for its task — reviews/competitors → ≥4 competitors with real review sources; feasibility → the competitor matrix grounded on cited reviews, not assertion — **or** explicitly reported why fewer were possible (blocked / none exist). "Did two queries and stopped" is a failure state, not a completion.
- **Self-critic loop per leg.** After each research leg returns, run a short critic pass (this is what the [C] critic gates already do per GATE): *enough distinct sources? load-bearing claims actually verified against a source? any methodology error (segment by demographics, Big-Job-as-segment, features-before-criteria, unit-econ ignored)? gaps left?* If it fails, re-run the leg with the gap named — up to 2 extra rounds, then escalate to the user. Don't ship a leg that failed its own critic.
- **Web-MCP fallback.** When the built-in fetch is blocked or thin on a needed source (G2, Capterra, local-market sites), tell the user once and use a web-research MCP if one is connected — [Firecrawl](https://www.firecrawl.dev/) or [Exa](https://exa.ai/) (both ship MCP servers; discover via tool search). Without it, proceed and flag thin coverage in the verification checklist.

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

- **[R] reviews-mining.** Given the segment + alternatives, fetch reviews from G2 / Reddit / Product Hunt / Trustpilot / Capterra. Return **raw signals only** (do NOT synthesize hypotheses): the specific Problems-with-current, which dominant criteria each competitor covers poorly, and 5–10 quotable quotes per competitor **with source URLs**. ≤12 fetches / ~10 min. **Evidence floor:** cover ≥4 competitors with real review sources, or report why fewer were possible (blocked / none exist) — two queries and stop is a failure. If a source blocks the built-in fetch (G2, Capterra), flag it and use a web-research MCP (Firecrawl / Exa) if connected.
- **[S1] dominant-criteria.** Read the eager core + `segmentation.md` + `job-structure.md`. Given the normalized input, return the ranked dominant criteria + lead mechanics + Big-Job ladder per S1. No web.
- **[S2] job-graph.** Read `critical-chain.md` (+ `job-graph.md` only if the substrate needs care). Given the input + the S1 result, return the Job Graph + Critical Chain of Jobs per S2. No web.
- **[G1..Gk] mechanic-family generators (sectioning).** Read the eager core + `behaviour-change.md`. Each agent owns one mechanic family (e.g. *subtract/kill/move-up*; *take-off/done-for-you/chain-repair*; *emotion/expectation/need*; *price/cost/cognitive*; *Previous/Next/link-to-Big-Job*). Given the Job Graph + dominant criteria + the reviews signal, return the strongest / fastest / cheapest hypotheses in their family in canonical form; the orchestrator merges them. Effort: 3–6 hypotheses per family.
- **[F] feasibility · cost · competitiveness.** Read `nmt-key-theses.md`. Given the merged hypotheses + the reviews signal, return the web-grounded criteria×competitor matrix, the feasibility + cost-to-build + unit-econ read per hypothesis, and the RICE ranking with bonuses + top 2. ≤6 fetches.
- **[C] critic gates.** Given a stage's returned output + its acceptance criteria + the canon anchors for that stage, run the adversarial binary critic per GATE and return the verdict + `fix_instructions` for any failures (≤2 rounds, then escalate to the user).
- **[RAT] RAT-card generator.** Read `rat-key-theses.md`. Given the chosen primary, return the top-3 RAT cards with web-validated cost-of-validation estimates. ≤3 fetches.
- **[SYN] synthesis.** Read `communication.md`. Given all stage returns, assemble the single output file as the **three layers** (top disclaimers once → Layer 1 → Layer 2 → Layer 3 = the §0–§12 work). Include the Layer-2 **"What you told me — and the risks I see in it"** block from the input-as-hypothesis findings, and the **validation-debt line** in Layer 1 (`PRODUCER-CONTRACT.md §3, §4`). Add the Layer-3 anchors; **compute Layer 2 then Layer 1 LAST** from the assembled Layer-3 work, wiring the `▸` drill-down links; fence every methodology citation into a `▸ methodology trace` line (no canon path or `Rule N` inline in any layer). If HTML was chosen, render the one file as self-contained `.html` (`PRODUCER-CONTRACT.md §2`). Run GATE-6 as a panel.

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

- Does NOT pick the target segment on path A — that happens in `$nmt-market-research`.
- Does NOT size the market → `$nmt-market-research`.
- Does NOT write the PRD → `$nmt-product-requirements` (it hands over the §11 implementation spec); does NOT write landing / ad / GTM copy → `$nmt-craft-go-to-market`.
- Does NOT run customer interviews or execute the RATs — it generates the cards; the user runs RAT #1 next.
- Does NOT generate the full multi-level Job Graph *above* Core Jobs — it builds one level *below* Core Jobs as the mechanics substrate.

---

## Execution checklist (orchestrator) — before writing `result.md`

- [ ] GATE-1…GATE-5 ran (verdicts kept in-context); GATE-6 panel passed.
- [ ] Dominant success criteria extracted and ranked (S1).
- [ ] Job-Graph + Critical Chain of Jobs substrate exists with break-points marked (S2).
- [ ] 12–20 raw hypotheses generated; mechanics walked over the graph (S3).
- [ ] Feasibility + cost-to-build + unit-econ + competitiveness matrix done; RICE-ranked (S4).
- [ ] Primary + supplementary surfaced and distinct; user picked the primary.
- [ ] Top-3 RAT cards with confirm/kill signals (S5).
- [ ] **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses), Layer 2 (plain reasoning, one gloss per term, no big tables), Layer 3 (the full §0–§12 work); no conclusion repeated at the same depth; **Layer 2 then Layer 1 computed LAST** from the finished Layer-3 work.
- [ ] **Drill-down links resolve** — every Layer-1 claim links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l...`/`#disclaimers` target exists.
- [ ] **Disclaimers once** — full two-part disclaimer at the top of `result.md` only; Layer 1 has the one-line pointer; not repeated lower down. Every external source a clickable link (Rule 2); US-context analogs (Rule 6).
- [ ] **Citations fenced** — no canon path or `Rule N` inline in Layers 1–2 or in Layer-3 prose; canon references sit in `▸ methodology trace` lines; the §12 consolidated list is the only flat reference list; no `AGENTS.md Rule N` in any layer.
- [ ] §11 implementation spec is PRD-ready.
- [ ] No methodology invariant violated; anti-segment named; Aha is a real event; habit reused/sidestepped.
- [ ] Plain-language-led — Layers 1–2 (and Layer-3 prose) lead in the reader's own words; methodology terms only in parentheses (never jargon-first); §12 appendix may stay in full terms.
- [ ] If path C: reduced-confidence flag at top of `result.md`.
- [ ] **Step ledger:** every stage S0–S6 checked off by name; a skipped stage or gate was declared to the user, never silent.
- [ ] **User claims stayed hypotheses:** ledger claims tagged (data / observation / hunch); the primary value prop does not rest primarily on a single unverified user hunch without saying so.
- [ ] **Producer contract satisfied** (`../PRODUCER-CONTRACT.md`): helicopter-view printed before intake; output-format + output-path asked; if HTML, one self-contained `.html` with resolving anchors + `<details>`; the **"What you told me — and the risks I see in it"** block present (unless no input given); **validation-debt line** in Layer 1; the next step framed as **validate first, not build** (no bare "build it now"); on hand-off from nmt-market-research, asked what validation debt has been retired and re-tagged anything still unvalidated; Deep mode hit its evidence floor + self-critic loop (or flagged thin coverage + offered the web MCP).

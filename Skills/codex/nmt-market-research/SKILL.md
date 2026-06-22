---
name: nmt-market-research
description: >-
  Run market research for a product or feature idea using Ivan Zamesin's AJTBD /
  Next Move Theory methodology (distinct from generic Christensen JTBD). Output —
  an A4 one-pager with a GO / NARROW / PIVOT verdict plus a detailed report —
  market sizing, customer segments scored on the selection screen, competitors
  defined by Jobs, a differentiation hypothesis, an action-first risk plan, and
  ranked strategic options including alternative markets to pivot into. Use
  whenever the user wants to size a market, find or evaluate segments and Jobs,
  assess competitors, decide whether an idea is worth pursuing, or explore a pivot
  — even if they don't say "market research". Two modes — Quick (default) and
  Deep. Defaults to English.
user-invocable: true
---

> **Update check — best-effort, ≤2s, never blocks.** Before the steps below, run
> `curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-market-research"`; on any error
> or timeout, skip silently. Compare `.nmt-version` (project root) with the feed's `latest`. If
> behind, print one line — the `<installed> → <latest>` gap, a one-line summary per newer entry,
> and "run $nmt-upgrade to update" — then continue. If it matches or `.nmt-version` is absent, continue.

# Market Research v11

> **v11 in one breath.** Before any research runs, an **intake gate** closes the gaps that change the research: adaptive clarifying questions (with "I don't have this info" as a valid answer), user materials read in, a **user-claims ledger** (the user's inputs are hypotheses, not facts), and a **direction confirmation**. The deliverable is a **decision**: an A4 one-pager with a **GO (to validation) / NARROW / PIVOT** verdict, segments scored on the **five-factor selection screen**, an **action-first** RAT, and **ranked strategic options** (incl. pivot markets that fit the idea's assets). Quick mode sizes honestly (one calculation, assumptions named); the 3-method averaging runs only in Deep mode, on real sources. Full version history is in `CHANGELOG.md` beside this file.

> **Producer contract (binding) — `../PRODUCER-CONTRACT.md`.** Six cross-cutting behaviors shared by all producer skills, from user feedback: (1) print a **helicopter-view** before the first question; (2) ask **Markdown or HTML** output; (3) treat **all** user input as hypothesis and emit a *"risks I see in what you gave me"* block; (4) print **validation debt** and write **`GO (to validation)`**, never bare `GO`; (5) accept a **custom output path**; (6) Deep mode runs an **evidence floor + self-critic loop** and offers a **web-MCP fallback**. The hooks below wire each into this skill; the contract is the source of truth for the wording.

## What this skill produces

A single file in **three reading depths, linked top-to-bottom** (so one report serves the co-founder skim, the skeptical read, and the methodology audit):

1. **Layer 1 — The Answer** (~1 page, zero methodology words): the verdict, who to sell to, why, the make-or-break risk, the next action, and how big — each line drilling down to its reasoning. Readable in ~60 seconds by someone who's never heard of the methodology; forwardable to a co-founder or investor.
2. **Layer 2 — The Reasoning** (2–4 pages, plain English): *how we got here* for each Layer-1 claim — verdict logic, how the buyer was found, the edge, the ranked risks, the plan — each linking down to the full work.
3. **Layer 3 — The Full Work** (the detailed report + appendix): market snapshot, a Map of Segments with every segment expanded, the differentiation hypothesis, the strategic recommendation with alternative Big-Job markets, the action-first risk plan, and the sizing appendix.

Plus **a brief outcome in the chat** + Layer 1 printed inline + concrete suggestions to rerun the skill on alternative markets.

**Two modes:**
- **Quick (default, ~3–5 min):** no internet, no subagents. One Codex agent fills the templates directly from reasoning.
- **Deep (opt-in, longer):** a team of subagents with web access fills the same templates with real competitor, review, and sourcing data. See "Deep mode pipeline" at the end.

---

## Methodology — source of truth (progressive loading)

The **only** source of methodology is the Next Move Theory canon, read at runtime. **Don't load all of it up front** — read the eager core first, then pull the staged files only when the run reaches the stage that needs them (the same progressive-disclosure pattern Claude skills use with `references/`). This keeps a Quick run light and lets each Deep-mode agent read only its slice.

**Eager core (read before any analysis — every run):**

| File | What it powers | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md` | Jobs, Job Graph, value & the Aha Moment, segmentation, Consideration Activators, the published value mechanics (§22–§23) | ~13k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | the deep segmentation method (the heart of the skill) | ~5k |

**Staged — load only at the stage that uses it:**

| File | Load when | Used by | ~tokens |
|---|---|---|---|
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | reaching the verdict + risk stage (Section 4–5) | the RAT chain, the verdict logic, pivot logic | ~6.5k |
| `Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md` | reaching the pivot + strategic-options stage (Section 4) | the chain to profit, local-vs-global optimum, segment-selection logic | ~5.4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | reaching the differentiation / mechanic stage (Section 3) | the richer published mechanic menu | ~4.9k |

Quick mode (one Codex agent): read the eager core, then read each staged file the first time the run reaches its stage — not before. Deep mode: each agent reads **only** the files its wave needs (sizing & competitor agents → eager core only; Strategy agent → core + rat + nmt + mechanics; Pivot agents → core + nmt). Never have an agent load a file outside its slice.

> **Path note.** Use the paths above. If a file is not found there, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix that the public repo strips.

**Do NOT use generic JTBD from the internet or prior training.** Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per the project `AGENTS.md`):
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

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the user-facing document in the plain, everyday language the target segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label.

- ❌ *"Red Queen value-gap compression…"* · *"the Critical Chain of Jobs breaks at M4"* · *"load the Consideration Activators."*
- ✅ *"The free do-it-yourself option caught up, so your edge shrank even though you didn't get worse (in the methodology, a* Red Queen *effect)."*

**Who reads it** — the target segments (the essentials are inline here, so the skill stays self-contained and public-safe): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain of Jobs)* · the exact step where they get stuck *(a Critical Chain of Jobs break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and any explicit **methodology appendix**, where full methodology language is expected. The *lead the reader sees* is plain; the *parenthetical and the appendix* carry the precise terms.

---

## Output file (one file per run — `AGENTS.md` Rule 4)

The skill writes **exactly one** file. Default location (used unless the user gave a custom output path in intake — `PRODUCER-CONTRACT.md §5`), grouped under the product's folder in the project root (never `TMP/` or `.claude/`):

```
Skills-Results/{product-slug}/market-research/{YYYY-MM-DD_HH-MM}_{product-slug}-market-research-result.{md|html}
```

- **Extension follows the chosen output format** (`PRODUCER-CONTRACT.md §2`): `.md` (default) or a single self-contained `.html` (inline CSS, working in-page anchors for the How-to-read jumps + every `▸` drill-down link, `<details>` for Layer 3 and methodology traces, source links opening in a new tab). HTML carries the identical content — same attribution, disclaimers, three layers, tables, links — just in a more readable shell. Never write both; one file per run.
- If the user gave a custom path, write the one file there with the same filename pattern.
- `{YYYY-MM-DD_HH-MM}` (24h local time) makes each run's file unique; reruns never overwrite.
- Everything internal — what the user provided, discarded hypotheses, antisegment checks, Big-Job validation, the full sizing tables, milestone notes, and **all methodology citations** (which never appear in the user-facing report — see "Readability") — **stays in-context**, never in a separate file.
- Deep mode adds no intermediate files: subagents return their results in-message and the orchestrator writes the one file (see the Deep pipeline section).

**Attribution (Rule 23).** The report opens with the attribution top-line (the very first content, above the disclaimers) and closes with the attribution block — `utm_source=nmt-market-research&utm_medium=skill-artifact`.

---

## STAGE 0 — Orientation (helicopter view) + language

**First, the orientation block** (`PRODUCER-CONTRACT.md §1`) — print it before any question, in plain words:

> **What you'll get:** one report — a GO (to validation) / NARROW / PIVOT decision, the segment to sell to first, why, the make-or-break risk, and how big the market is.
> **The steps:** (1) a few questions about your idea → (2) I find and score the customer segments → (3) I size the market → (4) I pick a wedge and rank your strategic options → (5) you get one report in three reading depths.
> **Where I work vs. where you decide:** I do the analysis and the hypotheses. *You* pick the direction and run the field validation — interviews, sales, tests. I can't validate for you; I can only tell you what to check first.
> **Two modes:** *Quick* (default — no internet, ~3–5 min, reasoning only; good for a first cut and "did I miss something") · *Deep* (opt-in — subagents + web research, longer; real competitor/market/review data; best on a top model with a web-research MCP).
> **Honest caveat:** this speeds up the *thinking*, not the *proving*. Every number and segment is a hypothesis until you check it in the field.

Then **document language.** Default to **English**. If the user is writing in another language, offer to work in that language, then ask via `request_user_input` (English (Recommended) / their language; for another language, ask directly in chat). Hold the choice in context. All communication and the report use the chosen language; canon files and source URLs stay as-is.

---

## STAGE 1 — Product idea + context + assets

Collect in a short stream plus a Codex intake sequence: use `request_user_input` only for structured-choice questions, with at most 3 questions per call and 2-3 choices per question; ask free-text prompts directly in chat. Split the intake into as many calls as needed across separate logical questions, but do not skip required questions. If one logical question lists more than 3 choices, ask that entire question directly in chat; do not split one logical question across several `request_user_input` calls. Do not include an explicit Other option.

### Step 1 — Idea as a stream (free text)
> Describe your idea as a stream — what it is, who it's for, what Job it performs, and anything you already have going for it (technology, team, partners, traction).

### Step 2 — Batch 1: mode, output format, stage, country, business type
- **Mode** — Quick (default; fast; no internet) / Deep (subagents + web research).
- **Output format** (`PRODUCER-CONTRACT.md §2`) — Markdown (default; faster) / HTML (a bit slower; easier to read — collapsible sections + working in-page navigation; all source and drill-down links stay clickable).
- **Stage** — Idea / MVP / Launched / Scaling.
- **Country / market** — United States / United Kingdom / Russia-CIS / Global-English / Other.
- **Business type** — B2C / B2B / Both B2C and B2B / B2B2C (true channel-through-business only).

### Step 3 — Batch 2: project context, segments, competitors, ambition
- **Project context & materials** — path / URL / Skip. Name what counts: *a folder or files with anything you already have — a Notion export (markdown), spreadsheets, past research, interview notes, a strategy doc, your current site.* (Quick: local paths via `Read`; Deep: also `WebFetch`.) Everything taken from the user's materials is tagged **[user data]** in-context and cited as such in the report.
- **Hypothesized segments** — "Yes, I'll describe" / "I don't know — find them" (default) / Skip.
- **Known competitors** — "Yes, I'll list them" / "I don't know — find them" (default) / Skip.
- **Ambition** — "I'll describe" (revenue / margin / timeframe) / Skip.
- **Where to save the result** (`PRODUCER-CONTRACT.md §5`) — default `Skills-Results/{project}/market-research/…` / or a folder path to match your repo (e.g., `docs/research/`). Skip = default. One file per run regardless of location (Rule 4).

### Step 4 — Batch 2b: assets & constraints (powers the pivot recommendation)
Ask once (free text is fine), capturing the idea's **transferable assets and hard constraints** — used by the pivot sub-pipeline (STAGE 9):
> What does this idea have going for it that could carry into *other* markets? Name your (1) core technology / unique capability, (2) the team's expertise and unfair advantages, (3) resources already in hand — money/runway, partners, traction, distribution, data, brand, and (4) any hard constraints or non-negotiables (regulatory, geographic, ethical).

If the user skips, extract the assets from the idea stream and project context as best you can, and note in-context that assets were inferred.

### Step 5 — Adaptive clarifying questions (only the gaps that change the research)
After Steps 1–4, scan the collected input for **gaps that would materially change the research** and ask about *those only* — up to ~5–7 targeted questions, batched via `request_user_input`, each with an explicit **"I don't have this info"** option. Skip this step entirely when the input already covers it. Candidate gaps:

- **Local vs global** — is the market local (one country/city, local channels, local competitors) or global? Deep mode: which *local* sources, marketplaces, or competitor names does the user already know? (The built-in web search often misses local-market players — user-named local sources are the workaround.)
- **Segment specifics** — anything the user already knows about who buys and why (from sales, support, interviews), even fragmentary.
- **Sizing logic** — when the market has no ready-made reports, agree the **calculation logic with the user before computing**: what is the licensable/billable unit (seats, screens, locations, transactions), what real-world object it attaches to, and what extrapolation path makes sense (e.g., software licensed per screen → screens per location → locations per vertical). Propose a logic; let the user correct it.
- **What NOT to do** — directions, segments, or framings the user has already ruled out.

**"I don't have this info" is a valid answer.** Record it in-context as an explicit assumption — the report then *marks the dependent numbers as assumptions* instead of silently inventing specifics.

### Step 6 — User-claims ledger + input-as-hypothesis gate (`PRODUCER-CONTRACT.md §3`)
Collect every **strong factual claim** the user made across Steps 1–5 (market insights, "everyone wants X", competitor facts, regulatory claims, segment beliefs) **and every load-bearing input from their uploaded materials** — a deck, a landing page, a codebase, past research — into an in-context ledger. **All of it is hypothesis, not fact** — a landing page is the team's belief about value, not proof customers want it. Tag each with its source — **data** (measured / documented), **observation** (seen in interviews, sales calls), or **hunch** (belief, intuition; this is the default for anything from a deck/landing/idea stream). If the source is unclear, ask in one batched question: *"Quick check on a few things you mentioned — for each, is it data you have, something you observed, or a hunch?"*

**Actively hunt for the risks inside the input** (don't just record it). For each load-bearing input ask: is this customer-validated, or the team's belief about the customer? Does the stated Job / segment look like the customer's real Job, or the team's projection of it (the most expensive error)? Any internal contradictions, or guesses dressed as data? Hold the findings in context — they become the **"What you told me — and the risks I see in it"** block in Layer 2 (see the Layer-2 template), with the single worst one surfaced in Layer 1.

Downstream rules (enforced in synthesis and self-critic):
- User claims and materials are **hypotheses, not facts**. They enter the analysis tagged, never silently merged with researched facts, and never silently baked into the wedge.
- **Deep mode:** load-bearing claims (anything the verdict, target-segment pick, or a pivot recommendation would rest on) get a web-verification attempt (≤2 fetches each, inside existing agent budgets). Confirmed → cite the source. Unconfirmed → keep the tag.
- **No verdict, target-segment pick, wedge, or pivot recommendation may rest primarily on a single unverified user input.** If it does, the report says so explicitly — *"this recommendation stands on your unverified input X; validate it first"* — names it as the single most expensive risk, and points the corresponding RAT row at that claim.

### Step 7 — Direction confirmation (before any research runs)
Before generating anything (Quick) or spawning any agent (Deep), play the understanding back in one short block: *"Here's what I understood: {product, market + local/global, who it's hypothetically for, what you already have, what's out of scope}. The research direction: {one sentence}."* Then one `request_user_input`: **Confirm / Correct (free text)**. On "Correct", update the held input and re-confirm once. This is the cheapest moment to fix a wrong direction — web research is the most expensive stage, and everything downstream builds on it.

**Hold** everything in context.

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

The target segment is the one whose dimensions compose most in our favour **and** best fits the idea's assets.

---

## Job grammar (every Job, every time)

- Format: **When** {context + trigger + negative emotions before}, **I want to** {expected outcome} **with success criteria** {concrete, measurable criteria — plain text}, **in order to** {higher-level Job + positive emotions after}. The canon uses **"in order to,"** not "so that."
- The `I want to` clause names the **expected outcome** (the canon's primary Job element) — not just any verb. Each infinitive verb is one Job (split multi-verb statements into the hierarchy).
- **Name the level every time** — Big / Core / Small / Micro Job — and remember levels are **relative to our product's reach**, not absolute positions.
- **Core Jobs** = the highest-level Jobs the product performs fully. **Big Jobs** = motivation context one level above (not the segmentation root). **Number of Core Jobs is variable** — list as many as the segment performs.
- **Aha Moment** = the customer experiences a Core Job performed *better than the success criteria they expected*. Place it as early in the Critical Chain of Jobs as possible. Positioning promises only what the chain actually delivers (over-promising manufactures a Problem).
- In questions addressed to customers, use the everyday word **task**, never "Job."

---

## Mandatory disclaimers (top of the file, once — never repeated below)

> ⚠️ **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses. Each metric names its assumptions and carries a runnable verification path (see appendix); in Deep mode sizing is computed via 3 methods on real sources and averaged. Validate before any investment decision.
>
> ⚠️ **Hallucination disclaimer.** Everything in this document is generated by an LLM and may contain hallucinations in unknown places. For decisions with expensive consequences, run a full quantitative and qualitative research pass; do not act on this document alone.

Source-link rule (project `AGENTS.md` Rule 2): every named source in the report and appendix is a clickable Markdown link `[Name](https://...)`. In Quick mode (no internet) use the best-known canonical URL or `[Name (URL TBD)](#)` and list it in the verification checklist.

---

## Readability rules (the report is for a customer who doesn't know the methodology)

The report is **three reading depths in one file**, linked top-to-bottom like canon §-references. Most readers stop at Layer 1; doubters drop one level to see *how we got here*; experts read the bottom. The full template is in "Report structure" below. The rules that make it work:

- **Three layers, escalating depth — state each conclusion once per layer, never twice at the same depth.** Layer 1 = the answer (headline only). Layer 2 = the reasoning in plain English. Layer 3 = the full methodology work (tables, Job statements, selection screens). The old failure was risks appearing 3–4× at the *same* depth (one-pager → §4 options → §5 RAT). Now: a risk is a headline in L1, a plain sentence in L2, a full row in L3 — three depths, not three copies.
- **Drill-down links are mandatory.** Every Layer-1 claim that a skeptic could doubt carries a `▸` link to its Layer-2 anchor; every Layer-2 claim links to the Layer-3 section that derives it. Use Markdown anchors: write `[why narrow ▸](#l2-verdict)` and put `<a id="l2-verdict"></a>` above the target. This is what makes the simple layers *trustworthy* — the reader can always click through to the derivation.
- **Layer 1 = minimal jargon, plain words lead.** Lead every sentence in plain product English a junior PM gets at a glance. A methodology term may appear **in parentheses** as a short plain gloss when it genuinely helps — but never *open* a sentence with a raw term, and keep jargon to a minimum. Short sentences — "explain it to a smart friend."
- **Layer 2 = plain language first, term glossed.** On first use, gloss a methodology term in 3–5 words in parentheses — e.g., *"the Big Job (the outcome the customer is really after)"*. Nested or repeated parenthetical glosses are fine — clarity beats purity. Link `references/glossary.md` once at the top of Layer 2.
- **No internal methodology citations in Layers 1–2.** Never write "per b2b.md §6", "per Rule 14", or any canon file path in the readable layers.
- **Layer 3 may carry methodology citations — but fenced, not inline.** Put canon references in a collapsed **methodology trace** at the end of a subsection, styled out of the reading flow, e.g.:
  > <sub>**▸ methodology trace.** Segmentation root = similar Core Jobs + similar success criteria (`segmentation.md`, Rule 18); levels named product-relative (Rules 8, 20).</sub>
  Never break a sentence of report prose with `(b2b.md §7)`. Project-internal rule numbers (`AGENTS.md Rule 7`) never appear in any layer — they are for your reasoning, not the reader.
- **Disclaimers once.** The two-part disclaimer appears **once** (top of file), plus a one-line pointer in Layer 1. Do not repeat the full disclaimer block inside Layer 3. (Search the file before shipping — the disclaimer wording should hit at most twice.)
- **Keep source links** for external facts (Rule 2).

**Enforcement gate (these kept getting skipped in real runs — check each before writing the file; full version in `../READABILITY-CONTRACT.md`):**

- **Unique, resolving anchors.** Every `▸` drill-down link points to its own unique `<a id="…">` that exists **exactly once** in the file; no two links share a target. (The live failure was two Layer-1 links pointing at the same anchor.) Before shipping, list every `▸` target and confirm each resolves.
- **Inline-gloss opaque Layer-3 table headers.** A non-obvious column header carries a 3–6-word plain gloss right there — *"Job budget (what one customer spends a year on this)," "Switchable demand (how many are unhappy enough to switch)," "Reachability (how easily you can get in front of them)."* Don't rely on the glossary file — a casual reader never opens it.
- **Segment depth across layers** (see Layer 2 / Layer 3 templates). The target segment is **partially described in Layer 2** (who they are, what they're trying to get done, what they care about most, why they'll switch) with a **brief strategic recommendation**; the other top candidate segments get a light touch in Layer 2; the **full Map of Segments at depth lives in Layer 3.**
- **Validation plan across layers** (see templates). Layer 1 touches it (the make-or-break risk + the next action). Layer 2 carries the **focused list — every risky assumption paired with how we'd check it.** Layer 3 carries the **detailed step-by-step validation plan per assumption, grounded in the canon (RAT).**

---

# Report structure — three layers in one file

Assemble the single output file as **three reading depths, linked top-to-bottom**:

- **Layer 1 — The Answer** (~1 page, zero methodology words): the verdict and the few things that matter, in plain product English, each linking down to its reasoning. Forwardable to a co-founder who's never heard of the methodology.
- **Layer 2 — The Reasoning** (2–4 pages, plain English, terms glossed once): *how we got here* for each Layer-1 claim. Where trust is built; each claim links down to the full work.
- **Layer 3 — The Full Work** (the detailed report + appendix): the complete methodology — Map of Segments at depth, selection screens, competitor tables, action-RAT, pivot table, sizing appendix. For readers who want the audit trail.

Order in the file: top-of-file attribution + disclaimers (once) → **How to read this (the three levels)** → Layer 1 → Layer 2 → Layer 3. **Compute Layer 1 and Layer 2 LAST**, from the finished Layer-3 analysis.

## How to read this — the three levels

Emitted once, right after the disclaimers and before Layer 1, so the reader sees the structure and can jump to the depth they want. Keep the descriptions plain (no methodology words):

```markdown
## How to read this
Three levels — go as deep as you need:
- **Level 1 — The Answer** (1 page, plain words): the verdict, who to sell to, why, the make-or-break risk, what to do next. Most readers stop here. [jump ▸](#layer-1)
- **Level 2 — The Reasoning** (plain English): how we reached each answer — the buyer in more detail, the edge, and every assumption with how to check it. [jump ▸](#layer-2)
- **Level 3 — The Full Work** (the audit trail): the full market sizing *with a do-it-yourself re-check*, all segments at depth, competitors, the strategy, and the step-by-step plan to test each assumption. [jump ▸](#layer-3)
```

## Layer 1 — The Answer

```markdown
<a id="layer-1"></a>
# {Product} — what the research says
{date · {plain one-phrase market} · stage}

> ⚠️ These are hypotheses, not facts — [full disclaimer ▸](#disclaimers)

## The answer: {GO (to validation) / aim narrower / pivot — in plain words, e.g. "promising, but aim narrower"}
{2–4 short sentences. Plain words, no jargon. The single most important conclusion and the one binding constraint. The first time the verdict is "GO (to validation)", add the half-line gloss: "— worth the next step, which is checking it in the field, not building it yet."} [why this, not a clean yes ▸](#l2-verdict)

> **Validation debt:** this stands on **{N}** unvalidated assumptions — **{M}** of them fatal (would sink it if wrong). The fatal ones are the first things to check. [see them ▸](#l2-risks)
> <sub>N = risky assumptions in the RAT table; M = those that kill it if wrong. A Quick run on thin input has high debt — say so honestly (`PRODUCER-CONTRACT.md §4`).</sub>

## Who to sell to
{The target segment in one plain sentence — who they are, not a methodology label.} [how we found this buyer ▸](#l2-buyer)

## Why they'd buy
{The value in one or two plain sentences — the concrete gain vs. their current way.} [the edge, in plain terms ▸](#l2-edge)

## The one thing that decides everything
{The single make-or-break risk, in plain words.} [the full risk list ▸](#l2-risks)

## Do this next
{One concrete next action.} [the action plan ▸](#l2-next)

## How big
{TAM/SAM/SOM in one plain line + whether size is the constraint.} [where these numbers come from ▸](#l3-sizing)
```

**Layer 1 rule: minimal jargon, plain words lead** — a methodology term may appear in parentheses as a plain gloss, but never opens a sentence; short, plain sentences ("explain it to a smart friend"). The make-or-break risk + the next action are Layer 1's light touch of the validation plan. Every line that a skeptic could doubt ends with a `▸` drill-down link.

## Layer 2 — The Reasoning

Plain English, one gloss per methodology term, `references/glossary.md` linked once at the top of this layer. **No big tables** (prose + at most one small table); the full tables live in Layer 3. Each subsection carries an `<a id="…"></a>` anchor that Layer 1 links to, and links down to its Layer-3 section.

```markdown
---

<a id="layer-2"></a>
# How we got here — the reasoning

*Plain-English walk-through of the logic behind the answer above. The full methodology, tables, and sources are in the next layer. Methodology terms are defined in the [glossary](references/glossary.md).*

<a id="l2-input-risks"></a>
## What you told me — and the risks I see in it
*Everything you gave me — your idea, your deck, your landing, your numbers — I treated as a hypothesis, not as fact. These are the inputs the analysis leans on, and what I'd check before trusting each. (`PRODUCER-CONTRACT.md §3`.)* (Omit this block only if the user provided no claims or materials at all.)

| What you provided / claimed | How I treated it | The risk I see in it | How to check it fast |
|---|---|---|---|
| {claim or material, tagged data / observation / hunch} | {used as hypothesis in {where — wedge / segment / sizing}} | {the specific risk — e.g., "this is your stated value, not customer-validated; the real Job may differ"} | {the cheapest falsifying test} |

{If any wedge / segment / verdict rests primarily on an unvalidated input, say so here in one bold sentence and point to the matching RAT row.}

<a id="l2-verdict"></a>
## Why "{verdict}", not a clean yes
{How an idea is tested by walking a chain — market → buyable customer → real value → working economics → reachable. Name where the chain holds and where it breaks, in plain words. Why the verdict is what it is.} [full chain walk-through ▸](#l3-verdict)

<a id="l2-buyer"></a>
## The buyer, in a bit more detail
{A **partial profile of the target segment** — not the full Layer-3 work, but enough to picture them: who they are, the situation they're in, what they're trying to get done, what they care about most (their dominant success criteria, in plain words), and why they'd switch from their current way. Then **a brief strategic recommendation** — in 1–2 sentences, what to do about this segment (focus here / how to enter / what to lead with).}

{Then one short paragraph or 3-row table on the **other top candidate segments** — name each, one line on who they are and why they rank lower (later / slower / not buyable yet). Full detail on all segments is in Layer 3.} [the full segment map, all segments at depth ▸](#l3-segments)

<a id="l2-edge"></a>
## The edge, in plain terms
{What every existing option forces the customer to give up, and why ours doesn't — the differentiation wedge in plain words.} [the criteria-by-competitor matrix ▸](#l3-differentiation)

<a id="l2-risks"></a>
## How we'd prove or kill this — every assumption and its check
{This is the heart of Layer 2. List **every risky assumption (hypothesis)** the whole case rests on — walked across the chain (market → buyer → value → economics → reach) — and pair each with **how we'd check it** in one plain sentence. Order by how-bad-if-wrong ÷ cost-to-check (riskiest, cheapest-to-falsify first). A compact two-column table is good here: *Assumption (in plain, falsifiable words) · How we'd find out fast.* This is the list the reader is meant to act on — the step-by-step "how" for each lives in Layer 3.} [the detailed step-by-step validation plan ▸](#l3-risks)

<a id="l2-next"></a>
## The plan, in order
{The next moves as a short numbered list, plain — which assumption to test first, second, third. One line on why this order (riskiest and cheapest-to-kill first). Don't build past the make-or-break check until it lands.} [the reasoning + full plan ▸](#l3-risks)

## If this market is too slow — where else this fits
{Pivot markets in one plain sentence each.} [ranked pivot options ▸](#l3-pivot)
```

---

<a id="layer-3"></a>
# Layer 3 — The Full Work

The detailed report below is the audit trail (Sections 1–6 + appendix). Add an HTML anchor above each section heading so Layers 1–2 can link in: `<a id="l3-segments"></a>` before Section 2, `<a id="l3-differentiation"></a>` before Section 3, `<a id="l3-verdict"></a>` and `<a id="l3-pivot"></a>` before the relevant parts of Section 4, `<a id="l3-risks"></a>` before Section 5, `<a id="l3-sizing"></a>` before the appendix, `<a id="disclaimers"></a>` before Section 6. Keep methodology citations out of the prose — fence them in a `▸ methodology trace` line per the readability rules.

## Section 1 — Market snapshot

```markdown
## 1. Market snapshot ({Country})

**Market-level Big Job:** {infinitive verb + noun, plain language}

| Metric | Estimate | How computed (1 line) |
|--------|----------|------------------------|
| TAM (global) | ~${X} | {Quick: one bottom-up calculation + its key assumption · Deep: averaged across 3 methods} |
| SAM ({Country}) | ~${Y} | {1 line} |
| SOM (1–2 yr) | ~${Z} | {1 line} |

**Landscape:** {new market / red ocean / blue ocean / niche}.
**Ambition vs. share:** target {revenue} → needs {Y%} of SAM → {✅ <10% / ⚠️ 10–30% / ❌ >30%}.
**Takeaway:** {1 sentence — is the market big enough, and what's the binding constraint instead?}

> Sizing tables + verification are in the Appendix; the market-level Big Job is validated internally (in-context), not shown here.
```

**Sizing honesty rule.** In **Quick mode** (no internet) compute each figure **once**, bottom-up, with the calculation logic agreed in the intake (STAGE 1 Step 5), every assumption named, and the figure marked as an *estimate without data — verify via the appendix path*. Do NOT fake rigor by "averaging 3 methods" that all come from the same reasoning. The **3-method averaging (top-down / bottom-up / analog)** runs only in **Deep mode**, where each method stands on real, linked sources.

## Section 2 — Map of Segments (depth follows the verdict)

Start with the comparison table, then expand each segment. **Depth follows the verdict:** ✅ target segments get the full block below; ⚠️ hold segments get a half block (recommendation line, persona, Core Jobs, selection screen — skip the full size tables and competitor tables); ❌ not-ours segments get **one paragraph only** — who they are, the one binding reason they're not ours, coverage %. Don't spend three pages on a segment the reader is told to ignore.

```markdown
<a id="l3-segments"></a>
## 2. Who's in this market — the segments (Map of Segments), covering ~80% of the total market

| Segment | $ size / yr | Job budget | Switchable demand | Reachability | Verdict |
|---------|-------------|------------|-------------------|--------------|---------|
| {S1} | ~${} | ~${} | {how many triggered/unsatisfied} | {channel} | ✅ focus |
| {S2} | … | … | … | … | ⚠️ hold |
| {Sn} | … | … | … | … | ❌ not ours |

Segments are grouped by similar Core Jobs + similar success criteria (not by vertical or demographics); the same vertical can split across segments when the Core Jobs and criteria differ. Ordered ✅ → ⚠️ → ❌.
```

Then, for each segment (✅ first, ⚠️ second, ❌ last), at the depth its verdict earns (full / half / one paragraph):

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
Here's what they hire a product for, in the customer's own words:
1. **When** {context + trigger + negative emotions}, **I want to** {expected outcome} **with success criteria** {measurable, plain text}, **in order to** {Big Job + positive emotions}.
2. …

#### Big Jobs (motivation context above the Core Jobs)
*Personal:* **I want to** {verb} {noun} **in order to** {life / status / identity outcome}.
*Business (B2B / hybrid):* **I want to** {verb} {noun} **in order to** {business outcome}.

### Segment size + Job budget
| Metric | Estimate |
|--------|----------|
| People / companies in segment | ~{N} |
| **What one customer spends on this problem per year (Job budget)** | **~${B}** |
| **Total money in segment per year** | **~${N×B}/yr** |
| **Share unhappy enough to switch (switchable demand)** | **~{%} are triggered / unsatisfied and willing to switch** |

> Sizing method + verification are in the Appendix.

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

#### Who can do the whole job for them (turnkey, Big-Job-level players)
| Player | How they close the Big Job turnkey | Scaling capacity | Threat |
|--------|-------------------------------------|------------------|--------|
| … | … | … | low / medium / high |
```

Close Section 2 with a short **cross-segment themes** block (4–7 patterns spanning segments) and a one-line coverage-verification path (interview 6–8 past payers; if 30%+ don't fit, add a segment).

## Section 3 — Differentiation hypothesis (target segment)

```markdown
<a id="l3-differentiation"></a>
## 3. Differentiation hypothesis: target segment "{name}"

### Positioning (the Core Job → Big Job link — headline first)
> For **{segment with real criteria}**, who performs the Core Job **{Core Job}** in pursuit of the Big Job **{Big Job}**, **{Product}** delivers {value through the chosen mechanic} — so that {Big Job} is achieved {how exactly: faster / more reliably / without doing X / turnkey / with guarantee}.

### Why this segment
{1 paragraph — ROI × opportunity cost × selection-screen balance × fit with the idea's assets.}

### Matrix: success criteria × competitors
| Core Job success criterion | Direct 1 | Direct 2 | Indirect (Big-Job) | Hypothesis for us |
|----------------------------|----------|----------|--------------------|-------------------|
| {criterion} | ⚠️ | ❌ | ✅ | ✅ |

**Underserved criteria (the wedge):** {1–3 criteria all competitors close poorly — usually an *intersection*, not a single criterion}.

### Value-creation direction (one line, not a feature list)
**Mechanic direction:** {one of the published mechanics — `ajtbd-key-theses.md §22–§23` / `value-creation-mechanics.md`; the most powerful when applicable is *climb a level / kill a Job as a class*} — {how exactly the customer's life gets more energy-efficient, 1 sentence}.

> **What to build to deliver this — features, delivery format, cost, the Aha Moment — is `$nmt-craft-value-proposition`'s job.** It generates and filters the concrete ways to deliver this value across the whole mechanics catalog; don't anchor on a feature list invented here. This report stops at the wedge + the mechanic direction.

### Threat from Big-Job-level players
{If turnkey Big-Job players with scaling potential exist — how serious, and partner-or-displace?}
```

## Section 4 — Strategic recommendation & pivot

```markdown
<a id="l3-verdict"></a>
## 4. Strategic recommendation & pivot options

### Verdict on the proposed segment + Jobs: GO (to validation) / NARROW / PIVOT
{Walk the RAT cause-and-effect chain — Market → Segment+Jobs → Value → Unit economics → Channels — and name the verdict + the binding constraint. **GO (to validation)** = the chain holds on the evidence so far → the next step is to validate it in the field, not to build; NARROW = it holds only for a sub-segment / sub-Job; PIVOT = an upstream link is broken and an alternative market scores better. Never write a bare "GO" — it reads as "build it now" (`PRODUCER-CONTRACT.md §4`).}

### Adjacent jobs you could capture next (Job switches within the segment)
{Using the target segment's Job Graph: which Previous Job or Next Job in the chain to capture; whether to climb to a higher Big Job (the most powerful mechanic); which sibling Small Jobs to add. "You're competing on Job X; the more valuable adjacent Job for this same segment is Y."}

<a id="l3-pivot"></a>
### Alternative Big-Job markets for your assets (ranked)
{Generated by the pivot pipeline from your technology, team expertise, and resources, scored on the same selection screen.}

| Alternative Big-Job market | Hypothesized segment + Core Jobs | Why your assets transfer | Selection-screen read (value · demand · margin · size×switch · risk-gate) | What changes vs. the original (channel · UE · build) | Confidence |
|---|---|---|---|---|---|
| {market} | {segment + Core Jobs hypothesis} | {tech / team / partners} | {strong/med/weak per factor; gate pass/FAIL} | {what's different} | high/med/low |

### Strategic options — top 3–5, ranked
{Compose the analysis into 3–5 concrete, ranked strategies the user could actually run. Draw from the full move space, not only "switch markets": stay and narrow to the strongest sub-segment; pivot to an alternative Big-Job market (from the table above); sequence markets (keep cash-flowing market A to fund entry into market B); change the business model or pricing; capture the Previous Job or Next Job in the chain; climb to a higher Big Job. Rank by expected return × confidence.}

| # | Strategy (one sentence) | Why it can win (the mechanism) | Main risk | First cheapest step to validate |
|---|---|---|---|---|
| 1 | {the recommended strategy} | {…} | {…} | {…} |
| 2 | … | … | … | … |

{Each strategy is a hypothesis with a validation step — not advice to follow blind. If a strategy rests on a user-provided claim from the claims ledger, name it: "stands on your input X — validate it first."}

### Suggested reruns
1. Rerun this skill on **{alternative Big-Job market}** — {why}.
2. Rerun with **{a narrower segment / different business model / different channel}** — {why}.
```

## Section 5 — Risks & next moves (action-first RAT)

```markdown
<a id="l3-risks"></a>
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

### Detailed validation plan — per assumption, step by step

This is the heart of Layer 3: for **each** risky assumption in the table above (at least the top 3–4), a concrete, canon-grounded plan to test it — so the reader can run it, not just read it. One block per assumption:

**Assumption {#}: {the assumption, in plain falsifiable words}**
- **Method (per canon):** {the right test for this kind of risk — e.g., AJTBD customer interviews on past behavior for a Segment-and-Jobs risk; a fake-door / landing-page smoke test or a priced letter-of-intent for a willingness-to-pay risk; a concierge / done-manually run for a value-delivery risk; a back-test against historical data for a prediction risk. Name why this method fits — RAT: test the riskiest, cheapest-to-falsify first; interview about real past Jobs, not hypotheticals.}
- **Steps:** {numbered, concrete — who to recruit and how many, what to ask or build, what to measure. Use *task*, never "Job", in any question put to a customer.}
- **Kill criterion:** {the specific result that falsifies the assumption — "if fewer than X of N behave this way, the assumption is dead and we {narrow / pivot / stop}." State the threshold up front so the test can't be rationalized away.}
- **Cost / time:** {the honest cost and rough timeline — no artificial "≤1 week" cap.}

> <sub>**▸ methodology trace.** Validate the riskiest assumption first, cheapest-to-falsify first; the goal is to kill or pivot before the build (`rat-key-theses.md`). Interview about real past tasks, not hypotheticals; recruit the people who actually performed the Job (`segmentation.md`).</sub>
```

## Section 6 — Verification checklist

Emit `<a id="disclaimers"></a>` above this heading (Layer 1 links to it). **Do not repeat the full two-part disclaimer here** — it appears once at the top of the file; a single italic pointer line is enough (*"Disclaimers at the top of this file apply."*). Then a checklist covering: run the sizing verifications (appendix — Quick: the single calculation's assumptions; Deep: the 3-method tables); find 6–8 past payers in the target segment and run AJTBD interviews (ask about *tasks*, not "Jobs"); confirm segment coverage and the antisegment; validate the tagged user claims the analysis leaned on; run the action plan from Section 5; a source-link audit (every named source is a live clickable link; re-check any flagged "URL TBD").

<a id="l3-sizing"></a>
## Appendix — market sizing, and how to re-check it yourself
(Emit `<a id="l3-sizing"></a>` above the appendix heading — Layer 1 "How big" links here.)

This appendix has one job: make every number **re-checkable by the reader without trusting us.** For each figure, show the math, then give a concrete do-it-yourself re-check — *where to go, what to pull, what to multiply, and what result would confirm or break our number.* Every named source is a clickable link (Rule 2); where the run had no internet, the source is named with a `[(URL TBD — look this up)](#)` link and flagged.

### A. The calculations (what we did)

For **each** of TAM / SAM / SOM, and for **each segment's size + Job budget**, one compact block:

```markdown
**{Figure} = {result}**
- **Formula:** {the explicit arithmetic — e.g., SOM = reachable buyers × annual price × win-rate}.
- **Inputs (each with its assumption + source):**
  | Input | Value | Where it came from | Assumption / confidence |
  |---|---|---|---|
  | {e.g., # of mid-size plants in US+EU} | {n} | [{source}](https://…) | {how firm — observed / analog / guess} |
  | {annual price per customer} | {$} | {[user data] or [analog](https://…)} | {…} |
  | {win-rate in 1–2 yrs} | {%} | {benchmark / assumption} | {…} |
```

In **Quick mode** each figure is one bottom-up calculation with assumptions named (no fake 3-method averaging). In **Deep mode** show a compact 3-method table (top-down / bottom-up / analog), each method on a real linked source, plus the reconciled number.

### B. Re-check it yourself — step by step

For **SOM and each segment's size** (the numbers that drive the decision), a runnable recipe the reader can execute:

```markdown
**Re-check {SOM / segment size}:**
1. **Count the buyers.** Go to {named source + link}. Pull {the specific figure / filter to apply}. → you should land near {our input}.
   - *Where to look:* {pick the ones that fit the market} — official statistics ([U.S. Census / County Business Patterns](https://www.census.gov/programs-surveys/cbp.html), [Bureau of Labor Statistics](https://www.bls.gov/), [Eurostat](https://ec.europa.eu/eurostat), [data.gov](https://data.gov/)); industry analysts ([Statista](https://www.statista.com/), [IBISWorld](https://www.ibisworld.com/), Gartner/Forrester press releases); trade & industry associations for the vertical; company counts ([Crunchbase](https://www.crunchbase.com/), [LinkedIn](https://www.linkedin.com/) company/headcount filters, job-posting volume as a proxy for hiring/scale); public financials ([SEC EDGAR 10-Ks](https://www.sec.gov/edgar/searchedgar/companysearch), annual reports).
2. **Get the price.** {How to find what one buyer pays — competitor pricing pages, [G2](https://www.g2.com/) / [Capterra](https://www.capterra.com/) plan tiers, procurement records, the user's own quotes}. → compare to {our annual price}.
3. **Bound the win-rate (SOM only).** SOM is not the whole market — it is what you can realistically win in 1–2 years through the channels you actually have. Estimate it as {reachable-via-your-channels} × {a conversion benchmark for your motion — e.g., outbound/PLG/sales benchmarks from [OpenView](https://openviewpartners.com/), [First Round](https://review.firstround.com/), public SaaS benchmarks}. → compare to {our win-rate}.
4. **Redo the multiply** (step 1 × step 2 × step 3). **Confirm/break rule:** within ~30% of our number confirms the order of magnitude; off by >2× means an input is wrong — the table above shows which one to challenge first (the one tagged the weakest).
```

For **Job budget** (what one customer spends a year on this problem today): name where to verify it — the customer's current line items, competitor contract sizes, or interview data — and the one figure to ask for in a customer interview.

> Keep this section concrete and linked. A reader should be able to open the sources, redo the arithmetic in 20 minutes, and either trust our number or find exactly which input to push on. Full input breakdowns and divergence notes stay in-context, not dumped into the file.

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
9. **Wedge = an underserved success-criterion intersection** + a one-line published-mechanic direction — **no feature list** (features are `$nmt-craft-value-proposition`'s job).
10. **RAT walks the cause-and-effect chain**, each risk positive + falsifiable + paired with a validation action; riskiest-and-cheapest-to-falsify ordered first.
11. **Pivot markets evaluated on the same selection screen** against the extracted assets; existential-risk gate applied; each is a concrete Segment + Big-Job pair.
12. **User claims stayed hypotheses** — every load-bearing user claim is tagged (data / observation / hunch); no verdict, target-segment pick, or strategy rests primarily on a single unverified user hunch without saying so; "I don't have this info" answers surface as explicit assumptions, not invented specifics.
13. **Strategic options are ranked hypotheses** — 3–5 options, each with a mechanism, a main risk, and a first cheapest validation step; none reads as consultant advice to follow blind.
- [ ] Plain-language-led — every user-facing point leads in the reader's own words; methodology terms only in parentheses (never jargon-first); the methodology appendix / debug may stay in full terms.
- [ ] **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses), Layer 2 (plain reasoning, terms glossed), Layer 3 (the full work). No conclusion is repeated at the same depth across layers.
- [ ] **Drill-down links resolve and are unique** — every Layer-1 claim links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l...`/`#disclaimers` target exists **exactly once** and no two links share a target.
- [ ] **Segment depth across layers** — the target segment is partially profiled in Layer 2 (who · what they're getting done · what they care about · why they'd switch) + a brief strategic recommendation; other top segments touched in Layer 2; the full Map of Segments at depth is in Layer 3.
- [ ] **Validation plan across layers** — Layer 1 touches it; Layer 2 lists every risky assumption paired with how we'd check it; Layer 3 gives the detailed step-by-step plan per assumption (Method / Steps / Kill criterion / Cost), canon-grounded.
- [ ] **Opaque Layer-3 table headers carry an inline plain gloss** (Job budget, switchable demand, reachability, etc.).
- [ ] **Disclaimers once** — full two-part disclaimer at top only; Layer 1 has the one-line pointer; Section 6 does not repeat the block.
- [ ] **Citations fenced** — no canon path or `Rule N` inline in Layers 1–2 or in Layer-3 prose; any canon reference sits in a `▸ methodology trace` line.
- [ ] Step ledger ran — every pipeline stage checked off by name; any skip was declared, never silent.
- [ ] **Producer contract satisfied** (`../PRODUCER-CONTRACT.md`): helicopter-view printed before intake; output-format + output-path asked; if HTML, one self-contained `.html` with resolving anchors + `<details>`; the **"What you told me — and the risks I see in it"** block present (unless no input given); **validation-debt line** in Layer 1; every `GO` written as **`GO (to validation)`**; Deep mode hit its evidence floor + self-critic loop (or flagged thin coverage + offered the web MCP).

---

## Quick mode (default)

One Codex agent, no internet, no subagents. Steps:
1. Hold the user's input in context (no `00-input.md` file) — including the materials read from the user's paths, the clarifying answers, the claims ledger, and the confirmed direction (STAGE 1 Steps 5–7).
2. Read the **eager core** (`ajtbd-key-theses.md` + `segmentation.md`). Pull each **staged** file (`rat-key-theses.md`, `nmt-key-theses.md`, `value-creation-mechanics.md`) the first time the run reaches the stage that uses it — not before (see "Methodology — source of truth").
3. Build the **Layer-3** work first, directly from reasoning: market snapshot → Map of Segments (all segments, selection screen) → differentiation → **pivot** (extract assets from the input, generate 3–5 alternative Big-Job markets with segment+Jobs hypotheses, score them on the selection screen) → **strategic options (top 3–5, ranked)** → action-first RAT → appendix. Add the section anchors.
4. Run the self-critic criteria over the draft; fix in place; keep the methodology trace fenced (Layer 3) or in-context.
5. **Step ledger:** before writing the file, check every pipeline stage above off by name. A skipped stage is never silent — say which stage was skipped and why, and get the user's OK if it affects the verdict.
6. **Compute Layer 2 (the reasoning) and then Layer 1 (the answer) LAST**, from the finished Layer-3 analysis — so the simple layers summarize the real work, with drill-down links wired to the Layer-3 anchors.
7. Write the single result file (top disclaimers once → Layer 1 → Layer 2 → Layer 3).
8. In the chat: print the brief outcome + **Layer 1** + rerun suggestions + the file path (see "End-of-run chat output").

Quick mode does not access the internet, run subagents, or do quantitative validation. For those → Deep mode.

---

# Deep mode pipeline

Triggered when the user picks Deep. A team of subagents with web access fills the same templates with real data. Runs straight through without pausing for the user.

**Principles:**
- Writes one file `Skills-Results/{product-slug}/market-research/{YYYY-MM-DD_HH-MM}_{product-slug}-market-research-result.md`; new file per run.
- Agents are spawned with Codex's available execution (parallel subagents if your build supports them, otherwise sequentially in one context). Within a wave, independent agents run in parallel; the orchestrator waits for a wave to finish before the next.
- Each agent reads **only the canon slice its wave needs** (per "Methodology — source of truth": sizing & competitor agents → eager core only; Strategy → core + rat + nmt + mechanics; Pivot → core + nmt) and **returns its result in its final message — no per-agent files.** The orchestrator holds those returns in context. No live-tail / `Monitor` machinery.
- Web caps (hold the longest legs): reviews-mining ≤ 12 `WebFetch` / ~10 min; synthesis ≤ 6; strategy ≤ 4. Pivot agents are reasoning-bound (≤ 2 fetches if any).
- **Evidence floor, not just a ceiling** (`PRODUCER-CONTRACT.md §6`). Each web leg also has a *minimum*: it may not return "done" until it has hit a real floor of distinct sources for its task (sizing → ≥3 independent inputs; competitors/reviews → ≥4 competitors with real review sources) **or** explicitly reported why fewer were possible (blocked / none exist). "Did two queries and stopped" is a failure, not a completion.
- **Self-critic loop per leg.** After a leg returns, a critic pass checks: enough distinct sources? load-bearing claims verified against a real source? any methodology error (segment by demographics, Big-Job-as-segment, features-before-criteria, undersized SAM)? gaps? If it fails, re-run the leg with the gap named — up to 2 extra rounds. Don't ship a leg that failed its own critic (this is the fix for "promised deep research, did two fetches, quit").
- **Web-MCP fallback.** When the built-in fetch is blocked or thin on a needed source (G2, Capterra, local-market sites), tell the user once and use a web-research MCP if one is connected — [Firecrawl](https://www.firecrawl.dev/) or [Exa](https://exa.ai/) (both ship MCP servers; discover via tool search). Without it, proceed and flag thin coverage in the verification checklist.
- Source links mandatory (Rule 2); never invent sources or figures.

### No run-folder files (Deep)

Deep mode writes **no intermediate files**. Each agent below returns its result in its final message; the orchestrator holds all returns in context and writes the single `{YYYY-MM-DD_HH-MM}_{product-slug}-market-research-result.md` at the end.

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
> You work with Ivan Zamesin's AJTBD / Next Move Theory methodology. Use ONLY the Next Move Theory canon as the methodology source — do NOT use generic JTBD from the internet or prior training. Read **only the canon files this prompt names for your wave** (the eager core is `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md` + `…/segmentation.md`; other files are named per-agent below). (If a path is not found, retry with a `1-` prefix on the canon folder.) Keep methodology citations and canon paths out of report prose — hold them in context (the orchestrator fences any that belong in Layer 3). Every named external source is a clickable Markdown link. Return your full result in your final message — do not write any files.

**[1A] Market & Sizing.** Given the user input + the read set. Formulate and validate the market-level Big Job internally (in-context only). Compute TAM / SAM / SOM, each via 3 methods (top-down / bottom-up / analog), averaged (median if methods diverge >2×). Compare to the user's ambition. Return, in your final message, the **compact** body (summary table + landscape + ambition + takeaway) and the **short** method tables + one-line verifications. ≤12 fetches.

**[1B] Competitors & Reviews mining.** Given the user input + `ajtbd-key-theses.md` + `segmentation.md`. Find 5–10 competitors (direct on the Core Job + Big-Job-level / non-obvious), picking country- and query-specific sources at runtime. Harvest customer reviews; extract **raw signals only** (do NOT synthesize segments): distinct Core Jobs, success criteria, causal real-criterion candidates, and 5–10 quotable quotes per competitor with source URLs. Return the competitor list + raw review signals in your final message. ≤12 fetches / ~10 min.

**[P1] Asset Extraction.** Given the user input (idea + assets) + `nmt-key-theses.md`. From first principles, extract and name the idea's **essence**, **technology / capability**, **team expertise & unfair advantages**, **resources in hand** (money, partners, traction, distribution, data, brand), and **hard constraints**. Tag each asset **transferable** vs **idea-specific**. Return the asset inventory in your final message. No web.

**[P2] Market & Segment-Jobs Generation.** Given the [P1] asset inventory + the read set. Generate **5–8 candidate Big-Job markets** where the assets create value, across diverse angles (where the tech applies · where the team's expertise/access/partners apply · adjacent Big Jobs / climb-a-level moves). For **each** candidate, also generate the **Segment-and-Jobs hypothesis** — a named target segment (causal criteria) + its Core Jobs + success criteria — and which assets transfer. (Segment+Job is one analytical entity; a bare market name is not evaluable.) Depth = hypothesis, not deep research. Return the candidate markets in your final message. ≤2 fetches.

**[2] Segments Synthesis & Self-Critic.** Given the user input + the [1A] sizing + the [1B] competitor/review returns + the read set. Group customers from the mined signals into segments by **similar Core Jobs + similar success criteria + causal criteria**. Build each segment block per the Section-2 template (persona → Core Jobs → Big Jobs → size+budget+switchable share → **selection screen** → competitors inline). Order ✅ → ⚠️ → ❌; **depth follows the verdict** (✅ full block · ⚠️ half block · ❌ one paragraph). Include the cross-segment themes block. Run the **self-critic criteria** over the draft and fix in place. Keep internal-only items (Big-Job validation, antisegment causality, discarded segments) in your reasoning, not the output. Return the segment blocks + short method tables in your final message.

**[3] Strategy (Differentiation + action-RAT + strategic options).** Given the user input (incl. the user-claims ledger) + the [1A] sizing + the [2] segments + the [1B] review signals + the read set + `value-creation-mechanics.md`. Pick the target segment (selection-screen composition + asset fit). Produce Section 3 (positioning headline → why this segment → criteria×competitors matrix → underserved wedge → one-line mechanic direction, NO feature list → Big-Job-level threat) and Section 5 (action-first RAT on the cause-and-effect chain: each risk positive + falsifiable + paired with its validation action; then the Step 1/2/3 action plan, ordered by RAT priority; drop any "≤1 week" constraint; **then the detailed per-assumption validation plan** — for the top 3–4 assumptions, a canon-grounded block each with Method / Steps / Kill criterion / Cost-time, so the reader can run the test, not just read the risk). Also draft the **Strategic options table (top 3–5, ranked)** for Section 4, drawing on the full move space (narrow / pivot / sequence markets / model change / Previous-Next Job / climb a level). Verify any load-bearing user claim from the ledger (≤2 of your fetches); a strategy resting on an unverified user claim must say so. Return Section 3 + the strategic options + Section 5 in your final message. ≤6 fetches.

**[P3] Pivot Evaluation & Ranking.** Given the [P2] candidate markets + the [P1] assets + the [1A] sizing + the [2] segments + the read set. Score every candidate market on the **selection screen** (added value · demand · margin · size×switchability · existential-risk gate); drop gate-failures; rank; select top 3–5. Reuse main-pipeline sizing where a candidate overlaps a researched market. For each pick state **what changes vs. the original idea** (channel · UE · build · which assets carry) and a confidence level. Return the ranked pivot markets in your final message. ≤2 fetches.

### Orchestrator
1. Hold the user's input in context; record start time.
2. Spawn Wave 1 (1A, 1B, P1→P2) in background; wait for all; collect their returns.
3. Spawn Wave 2 (Segments) with the Wave-1 returns; wait.
4. Spawn Wave 3 (Strategy + P3) in parallel; wait.
5. Assemble the single file as the three layers: top disclaimers (once) → **How to read this (3 levels, with jump links)** → **Layer 1 (The Answer)** → **Layer 2 (The Reasoning)** → **Layer 3** = Section 1 (sizing) → Section 2 (segments) → Section 3 (differentiation) → Section 4 (within-segment switches + alternative markets + strategic options) → Section 5 (action-RAT) → Section 6 → Appendix. Add the section anchors; **compute Layer 2 then Layer 1 LAST** from the assembled Layer-3 work, wiring drill-down links to the anchors; fence any methodology citations into `▸ methodology trace` lines.
6. **Step ledger:** check every wave and every section off by name before assembly; a skipped stage is declared to the user, never silent.
7. Source-link audit; flag any bare or "URL TBD" sources in the checklist.
8. Chat output (below).

---

## End-of-run chat output (both modes)

In the chat, output **only**:
1. **Brief outcome** — 3–5 lines: the verdict, the focus pick, the top risk, and whether a pivot market looks more promising than the original idea.
2. **Layer 1 (The Answer)**, printed verbatim.
3. **Concrete rerun suggestions** — e.g., *"Re-run for the Big-Job market `{X}` where your `{asset}` also applies, or with a `{per-worker / subscription}` model for `{segment}`?"*
4. **Path** — the single result file.

Framing: the goal is the success of the whole business initiative, not only the first idea (local-vs-global optimum) — so the reruns are a first-class invitation, not an afterthought.

---

## What this skill does NOT do

- No quantitative survey (300–500 respondents), no ABCDX analysis of existing customers, no full unit-economics model — those are separate skills.
- Quick mode: no internet, no subagents, no quantitative validation.
- Does not pause to ask the user mid-pipeline (Deep mode runs straight through).
- Does not invent sources or numbers; thin data is recorded as thin, never fabricated.

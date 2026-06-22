---
name: nmt-product-requirements
description: Turn a chosen segment + Core Jobs into a build-ready PRD (full functionality + edge cases) using Ivan Zamesin's AJTBD / Next Move Theory methodology. It consumes upstream work — segments from /nmt-market-research, value from /nmt-craft-value-proposition — and never re-derives them; with no research done it routes you upstream first, or takes a manually described segment + value for a fast run. Before writing requirements it runs a "challenge the build" gate that looks for a more effective way to hit the same business goal; if a better way wins, the PRD is written for that. Output — a single PRD — functionality mapped Core Job → Big Job → value mechanic → success criteria → Aha Moment on the Critical Chain of Jobs, plus edge cases covering ~90% of use cases. Use when the user says "write the PRD / product requirements" or wants to turn a segment+value or a feature idea into a build spec. Two modes — Quick (default, no internet) and Deep (subagents + web parity check). Plain language; defaults to English.
user-invocable: true
---

> **Update check — best-effort, ≤2s, never blocks.** Before the steps below, run
> `curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-product-requirements"`; on any error
> or timeout, skip silently. Compare `.nmt-version` (project root) with the feed's `latest`. If
> behind, print one line — the `<installed> → <latest>` gap, a one-line summary per newer entry,
> and "run /nmt-upgrade to update" — then continue. If it matches or `.nmt-version` is absent, continue.

# Product Requirements (PRD) v5 — English / US edition

> **v5 in one breath.** The skill no longer re-derives segments (that is `/nmt-market-research`) or invents value (that is `/nmt-craft-value-proposition`) — it **consumes** their output, and it runs **no research itself**. With no upstream artifact it does one of two things: **route** the user to run `/nmt-market-research` → `/nmt-craft-value-proposition` first (the proper path), or — if the user just wants requirements fast and already knows their segment and value — take the **segment + Jobs + value straight from the user's description** (the fast path) and skip research entirely. It then adds a **"challenge the build"** gate before any requirement is written — *is building this even the right move, or is there a more energy-efficient way to perform the business Job?* — and writes the PRD for whatever wins. The deliverable is a **single PRD in three reading depths**: **Layer 1** (what we're building, plain, forwardable) → **Layer 2** (the reasoning) → **Layer 3** (the full build spec — every feature laddered Core Job → Big Job → value mechanic → success criteria → Aha Moment on the Critical Chain of Jobs + ~90% edge cases). Canon citations are **fenced** into Layer-3 `▸ methodology trace` lines, never inline; internal `CLAUDE.md Rule N` references never appear in the output. Canon is **loaded progressively** — an eager core up front, staged files only at the stage that needs them. Landing/ad/GTM copy moved to `/nmt-craft-go-to-market`; analytics and a standalone unit-economics model are out of scope (unit economics survives only as a reasoning filter).

> **Producer contract (binding) — `../PRODUCER-CONTRACT.md`.** Six cross-cutting behaviors shared by all producer skills, from user feedback: (1) print a **helicopter-view** before the first question; (2) ask **Markdown or HTML** output; (3) treat **all** user input as hypothesis and emit a *"risks I see in what you gave me"* block; (4) print **validation debt** and write **`GO (to validation)`**, never bare `GO`; (5) accept a **custom output path**; (6) Deep mode runs an **evidence floor + self-critic loop** and offers a **web-MCP fallback**. The hooks below wire each into this skill; the contract is the source of truth for the wording. This skill is the **closest-to-build** artifact in the chain, so the validation-debt + *"validate before you build, don't build yet"* framing (§4) carries the most weight here — get it right.

## Where this skill sits in the chain

```
/nmt-market-research   →   /nmt-craft-value-proposition   →   nmt-product-requirements   →   /nmt-craft-go-to-market
(segment + Jobs +      (the value hypothesis +          (THIS SKILL:               (landing + ad +
 wedge + competitors)   §11 implementation spec)         the build spec)            GTM/growth comms)
```

This skill is the **build** step. It takes a chosen segment with its Core Jobs and a value direction, challenges whether building is even the right move, and produces the requirements engineers and designers build against. It **does not** re-run segmentation, re-invent the value proposition, or write any customer-facing copy — those are the skills around it. **Never regenerate what an upstream artifact already contains; load it and build on it.**

## What this skill produces

**One file — the PRD, in three reading depths linked top-to-bottom** (so one document serves the co-founder skim, the skeptical read, and the engineer/designer build):

1. **Layer 1 — What we're building** (~1 page, zero methodology words): what we're building, who it's for, the one moment that proves it works (in plain words), the single riskiest thing to validate before building, and what to build first — each line drilling down to its reasoning. Forwardable to a co-founder who's never heard of the methodology.
2. **Layer 2 — The Reasoning** (2–4 pages, plain English): *why this build and not something else* — the challenge decision, the core capabilities and why, the failure cases that matter, the riskiest assumption + cheapest probe — each linking down to the full spec.
3. **Layer 3 — The Full Work** (the build spec engineers and designers build against): the challenge gate, full functionality (every requirement laddered Core Job → Big Job → value mechanic → success criteria → Aha Moment on the Critical Chain of Jobs), the ~90% edge-case table, target users by Job, competitive parity, success metrics, risk handling, and an explicit out-of-scope.

**Not produced (this version):** landing/ad/GTM copy → `/nmt-craft-go-to-market`; analytics plan → out of scope; standalone unit-economics model → out of scope (unit economics is used only as a *filter* inside the challenge and ranking, never emitted as a document).

**Two modes:**
- **Quick (default, ~5–10 min):** one Claude, no internet, no subagents. Fills the PRD directly from the loaded artifacts + reasoning.
- **Deep (opt-in, longer):** subagents with web access refresh competitor parity and stress-test edge cases against real reviews. See "Deep mode" at the end.

---

## Methodology — source of truth (progressive loading)

The **only** source of methodology is the Next Move Theory canon, read at runtime (relative paths; the skill ships in the same repo). **Don't load all of it up front** — read the eager core first, then pull the staged files only when the run reaches the stage that needs them (the same progressive-disclosure pattern Claude skills use with `references/`). This keeps a Quick run light and lets each Deep-mode agent read only its slice.

**This is a public skill — it grounds only in the public canon.** Every file in the read sets below is a published canon file (the set whitelisted in `8-Tools/sync/PUBLIC_MANIFEST.yml`); the skill ships to the public mirror, where private files do not exist. **Never read or quote any canon file outside the read sets below** — the unit-economics theory, the full mechanics catalog, the product-strategy material, the worked cases, and the per-task algorithms are folded into the public files below; their deeper private and paywalled forms are out of bounds. This holds in **both** repos — even when running inside the Internal repo where those files exist on disk.

**Eager core (read before any analysis — every run):**

| File | What it powers | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | The chain the functionality is built on; **break sites = the edge-case source** (§5, §7) — the PRD's spine | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | The 8 Job elements; context→criteria (§3); criteria→metrics (§8); fidelity levels — the Job-grammar spine | ~5k |

**Staged — load only at the stage that uses it:**

| File | Load when | Used by | ~tokens |
|---|---|---|---|
| `Next-Move-Theory-Canon/Algorithms/the-algorithm.md` | reaching the challenge gate (S3) | **Step 1 — Challenge the business goal** (5 Whys, local-vs-global gate) is the challenge step's home | ~6k |
| `Next-Move-Theory-Canon/Next-Move-Theory/subtraction.md` | reaching the challenge gate (S3) | the subtraction-first question + invisible-product asymptote — the heart of the challenge | ~4k |
| `Next-Move-Theory-Canon/Next-Move-Theory/local-vs-global-optimum.md` | reaching the challenge gate (S3) | is this an additive local-optimum build when a global-optimum move returns more? | ~4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | reaching the functional-requirements stage (S4 §3) | value formula (§3), success criteria (§9), criteria→mechanics map (§11), Aha Moment (§12), the two dominant mechanics (§14), value-lives-outside-Core-Jobs (§17) | ~7k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | reaching the challenge gate (S3) + the functional-requirements stage (S4 §3) | the mechanics catalog — the menu for the challenge AND the feature→mechanic mapping | ~4.9k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md` | reaching the edge-case stage (S4 §4) | Tax / Orientation / Emotional / Viral Jobs — edge-case and functionality sources | ~5k |
| `Next-Move-Theory-Canon/Riskiest-Assumption-Test/rat-key-theses.md` | reaching the challenge gate (S3) + the risk stage (S4 §7) | risk handling; the drop-it exercise (used in the challenge); MVP = probe | ~6.5k |

**As-needed — load only when the condition fires:**

| File | When | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-graph.md` | when the Job-Graph slice needs care (level placement, many-to-many, directional moves) | ~6k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | Path D — sharpening a manually-described segment; confirming Core-Job level placement | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | Aha Moment placement, triggers, the seven behavior-change triggers | ~6k |
| `Next-Move-Theory-Canon/Next-Move-Theory/nmt-key-theses.md` | the unit-economics filter inside the challenge + ranking — §4 chain-to-profit (UE condition: LTV > CAC, payback, target margin per unit) and §5 Consequence 2 (segment budget supports the math). Filter only — not an output | ~5.4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md` | **only if the buyer is a company** — role-chain edge cases, two parallel Job Graphs | ~6k |

Quick mode (one Claude): read the eager core, then read each staged file the first time the run reaches its stage — not before. Deep mode: each agent reads **only** the files its wave needs (Critical Chain of Jobs builder → eager core + value-creation; Parity → eager core only; PRD designer → eager core + value-creation + value-creation-mechanics; Edge-case analyst → eager core + job-types-and-properties + b2b-if-B2B). Never have an agent load a file outside its slice.

> **Path note.** Use the paths above. If a file is not found there, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix that the public repo strips.

**This skill runs no research and performs no segmentation.** With no upstream artifact it either **routes** the user to `/nmt-market-research` → `/nmt-craft-value-proposition` (the proper path), or takes a **manually-described** segment + Jobs + value (the fast path) and writes the PRD directly. The canon files above are read to *build the PRD on* a segment+value that already exists — not to discover one.

**Do NOT use generic JTBD from the internet or prior training.** Ivan Zamesin's AJTBD diverges substantially. Five mis-defaults to never propagate (per project `CLAUDE.md`):
- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), in order to perform a higher-level Job. Not "a struggle for progress."
- **Value** is greater energy efficiency for the brain in performing a Job, measured against the brain's prediction. The **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. **Never use the abbreviations PPE / NPE** (Rule 22) — write *Aha Moment* / *Problem*.
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job. Each infinitive verb is a separate Job (Rule 7); parse multi-verb statements into the hierarchy.
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs.

**Methodological invariants — the PRD is invalid if any is violated:**
- **Every feature links Core Job → Big Job** AND names the **value mechanic** it implements (from `value-creation-mechanics.md`). A feature with no Big-Job ladder and no mechanic is not a requirement — it's feature thinking (`value-creation.md §1`).
- **The Aha Moment is a positive-prediction-error event**, never signup / login / "first action", placed as far left in the Critical Chain of Jobs as possible (`value-creation.md §12`).
- **The Critical Chain of Jobs is explicitly constructed per Core Job** (`critical-chain.md`) — functionality and edge cases are both read off it.
- **Success criteria are concrete** (direction + level) and translate into the success metrics (`job-structure.md §8`).
- **Segmentation is never re-derived here** — it is consumed (Core Jobs + success criteria as the root; Big Job is motivation context, not the segmentation cut).
- **The challenge step runs before any requirement is written** — and the PRD is written for the *winning* way to perform the business Job, not necessarily the originally-specified build.

Per `CLAUDE.md`: every named external source is a clickable Markdown link (Rule 2); US-context analogs and recognition test for examples (Rules 6, 19); two-part disclaimer at the top of the result (Rule 3).

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the user-facing document in the plain, everyday language the target segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label.

- ❌ *"Red Queen value-gap compression…"* · *"the Critical Chain of Jobs breaks at M4"* · *"load the Consideration Activators."*
- ✅ *"The free do-it-yourself option caught up, so your edge shrank even though you didn't get worse (in the methodology, a* Red Queen *effect)."*

**Who reads it** — the target segments (the essentials are inline here, so the skill stays self-contained and public-safe): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain of Jobs)* · the exact step where they get stuck *(a Critical Chain of Jobs break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and Layer 3 (the full work), where full methodology language is expected. The *lead the reader sees* is plain; the *parenthetical and Layer 3* carry the precise terms.

---

## Readability rules (the PRD is for a builder who doesn't know the methodology)

The PRD is **three reading depths in one file**, linked top-to-bottom like canon §-references. Most readers stop at Layer 1 (a co-founder skimming "what are we building"); a doubter drops one level to see *why this and not something else*; an engineer or designer goes to the bottom for the full build spec. The full template is in "PRD structure" below. The rules that make it work:

- **Three layers, escalating depth — state each conclusion once per layer, never twice at the same depth.** Layer 1 = what we're building (headline only). Layer 2 = the reasoning in plain English. Layer 3 = the full build spec (the challenge gate table, the full functional requirements with their Core Job → Big Job → mechanic → Aha mapping, the Critical Chain of Jobs diagram, the full edge-case table, metrics, risks). A conclusion is a headline in L1, a plain sentence in L2, and a full row/section in L3 — three depths, not three copies.
- **Drill-down links are mandatory.** Every Layer-1 line that a reader could doubt carries a `▸` link to its Layer-2 anchor; every Layer-2 claim links to the Layer-3 section that derives it. Use Markdown anchors: write `[the riskiest thing to validate ▸](#l2-risk)` and put `<a id="l2-risk"></a>` above the target. This is what makes the simple layers *trustworthy* — the reader can always click through to the build detail.
- **Layer 1 = minimal jargon, plain words lead.** Lead every line in plain product English a junior PM gets at a glance. A methodology term may appear **in parentheses** as a short plain gloss when it helps — but never *open* a line with a raw term, and keep jargon to a minimum. The one "moment that proves it works" is described in plain words. Short sentences — "explain it to a smart friend."
- **Layer 2 = plain language first, term glossed.** On first use, gloss a methodology term in 3–5 words in parentheses — e.g., *"the Big Job (the outcome the customer is really after)"*. Nested or repeated parenthetical glosses are fine — clarity beats purity. Link `references/glossary.md` once at the top of Layer 2. No big tables here — the full requirement, edge-case, and gate tables live in Layer 3.
- **No internal methodology citations in Layers 1–2.** Never write "per b2b.md §6", "per Rule 14", or any canon file path in the readable layers.
- **Layer 3 may carry methodology citations — but fenced, not inline.** Put canon references in a **methodology trace** at the end of a subsection, styled out of the reading flow, e.g.:
  > <sub>**▸ methodology trace.** Edge cases = Critical Chain of Jobs break sites × context variations (`critical-chain.md §7`; `job-structure.md §3, §11`); severity by importance (`critical-chain.md §5`).</sub>
  Never break a sentence of PRD prose with `(critical-chain.md §7)`, `(b2b.md §7)`, or `[the-algorithm.md §4]`. **Project-internal rule numbers (`CLAUDE.md Rule 7`, `CLAUDE.md Rule 12`) never appear in ANY layer of the output** — they are for your reasoning only, never the reader's PRD.
- **The Core Job → Big Job → mechanic → Aha mapping moves into the fenced trace — not the readable requirement.** A non-expert reads the `mechanic: {name}` tag on every requirement as framework-compliance theater, not "what to build." So the readable requirement carries only **what to build + acceptance criteria**; the `Core Job → Big Job · mechanic: {name} · Aha: {how it fires}` mapping drops into the requirement's `▸ methodology trace` line (kept — it is the audit trail for anyone who wants it — but out of the reading flow). Strip any canon file path from it (the mechanic *name* stays; `value-creation-mechanics.md §X` does not).
- **Disclaimers once.** The two-part disclaimer appears **once** (top of file), plus a one-line pointer in Layer 1. Do not repeat the full disclaimer block lower in the file. (Search the file before shipping — the disclaimer wording should hit at most twice.)
- **Keep source links** for external facts (Rule 2).

**Enforcement gate (these kept getting skipped in real runs — check each before writing the file; full version in `../READABILITY-CONTRACT.md`):**

- **Unique, resolving anchors.** Every `▸` drill-down link points to its own unique `<a id="…">` that exists **exactly once**; no two links share a target. Before shipping, list every `▸` target and confirm each resolves.
- **Inline-gloss opaque Layer-3 table headers.** A non-obvious column header (in the edge-case, requirement, or gate tables) carries a 3–6-word plain gloss right there. Don't rely on the glossary file.
- **The readable requirement is clean.** Per requirement, the reader sees what-to-build + acceptance criteria; the methodology mapping (`mechanic:` etc.) lives only in the fenced trace.

---

## Output file (one file per run — `CLAUDE.md` Rule 4)

The skill writes **exactly one** file. Default location (used unless the user gave a custom output path in intake — `PRODUCER-CONTRACT.md §5`), grouped under the product's folder in the project root (never `TMP/` or `.claude/`):

```
Skills-Results/{product-slug}/product-requirements/{YYYY-MM-DD_HH-MM}_{product-slug}-product-requirements-result.{md|html}
```

- **Extension follows the chosen output format** (`PRODUCER-CONTRACT.md §2`): `.md` (default) or a single self-contained `.html` (inline CSS, working in-page anchors for the How-to-read jumps + every `▸` drill-down link, `<details>` for Layer 3 and methodology traces, source links opening in a new tab). HTML carries the identical content — same attribution, disclaimers, three layers, tables, links — just in a more readable shell. Never write both; one file per run.
- If the user gave a custom output path (intake S0), write the one file there with the same filename pattern.

Everything internal — the normalized input, the challenge (business-goal ladder, subtraction-first, the more-effective ways and which won, the locked build subject), the Critical Chain of Jobs per Core Job, dropped alternatives, and the self-critic verdicts — **stays in-context**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

**Attribution (Rule 23).** The PRD opens with the attribution top-line (the very first content, above the disclaimers) and closes with the attribution block — `utm_source=nmt-product-requirements&utm_medium=skill-artifact`.

---

## The pipeline (S0 → S5)

```
S0  Intake & route ──────(human: language, mode, input path) ──► [no research path? → route OUT
     │                                                              to /nmt-market-research → /craft-value-
     │                                                              proposition, OR take a manual
     │                                                              segment+Jobs+value to write fast]
S1  Select segment + Core Jobs ─(human: pick segment → pick Core Jobs)
     │
S2  Business context ────(human: ≤4 batched Qs — only the fields not already supplied)
     │
S3  CHALLENGE THE BUILD ─(human: pick the build subject — the original, or a more-effective way)
     │
S4  PRD generation ──────(functionality on the Critical Chain of Jobs + ~90% edge cases — no questions)
     │
S5  Assemble + self-critic + summary ──(human: optional tweaks)
```

Question budget: **3–5 human touchpoints**, fewer when an upstream artifact already carries the segment/value/context. The skill never runs research inside itself — it routes out for it (S0) or takes a manual segment+value. Quick mode runs S4 in a single pass.

---

## S0 — Intake & route

### Orientation (helicopter view) — print first, before any question
**Print the orientation block** (`PRODUCER-CONTRACT.md §1`) before the first `AskUserQuestion`, in plain words, in the user's chosen document language:

> **What you'll get:** one build-ready PRD — what to build, who for, the moment that proves it works, the riskiest thing to validate first, and the full spec engineers and designers build against — in three reading depths.
> **The steps:** (1) a few questions about where you're starting from → (2) I pick up your segment + value (from upstream research, or from your description) → (3) I run a *"challenge the build"* gate — is building this even the right move, or is there a more efficient way to hit the same business goal? → (4) I write the PRD for whatever wins → (5) you get one document in three reading depths.
> **Where I work vs. where you decide:** I do the analysis, the challenge, and the spec. *You* pick the build subject and run the field validation — interviews, a fake door, a probe — before committing engineering time. I can't validate for you; I can only tell you what to check first.
> **Two modes:** *Quick* (default — no internet, ~5–10 min, reasoning only; good for a first spec from what you already know) · *Deep* (opt-in — subagents + web research, longer; refreshes competitor parity and stress-tests edge cases against real reviews; best on a top model with a web-research MCP).
> **Honest caveat:** this speeds up the *thinking*, not the *proving*. A PRD written in 10 minutes on guesses is a hypothesis to validate, not a green light to build — so before any requirement, validate the riskiest assumption.

End with *"Ready? First, a few questions."* and proceed to intake.

### Language
Default **English**. If the user writes in another language, offer to work in it (English / their language / Other). Hold the choice in context. The PRD uses the chosen language; canon files and source URLs stay as-is.

### One batched `AskUserQuestion`

```
Q1 "Where are you starting from?"
  - "I have a /nmt-craft-value-proposition result"   → Path A (best — segments AND value present)
  - "I have a /nmt-market-research result"            → Path B (segments present; value not yet crafted)
  - "I haven't done research and want to"         → Path C (ROUTE OUT — run the chain first)
  - "Skip research — I know my segment & value"   → Path D (fast path — I'll describe them)

Q2 "Mode?"
  - "Quick (default — fast, no internet)"
  - "Deep (subagents + web parity check)"

Q3 "Output format?"  (PRODUCER-CONTRACT.md §2)
  - "Markdown (default — faster to generate; opens anywhere)"
  - "HTML (a bit slower; easier to read — collapsible sections + working
     in-page navigation; all source and drill-down links stay clickable)"

Q4 "Where to save the result?"  (PRODUCER-CONTRACT.md §5)
  - "Default — Skills-Results/{project}/product-requirements/…"
  - "A folder / path to match your repo (e.g., docs/specs/)"  → free text
  (Skip = default. One file per run regardless of location — Rule 4.)

Q5 (Paths A/B only) "Path to the upstream result file?"  → free text; Read it.
```

### Resolve the input path

- **Path A — nmt-craft-value-proposition result.** Read it. Its **§11 Implementation spec** already carries the product shape, the feature table (Core Job / criterion / mechanic / Aha link), Critical Chain of Jobs & Aha placement, cost-to-build & cheapest probe, unit-econ direction, and anti-segment — **plus** the target segment, Big Job(s), competitors, proof, and RAT cards in the body. **This is the richest input — segments AND value are both present.** Most of S1/S2 is already answered; confirm rather than re-ask, then go to S3.
- **Path B — nmt-market-research result.** Read it. Parse the target segment(s) (✅/⚠️), their Core Jobs + success criteria, Big Jobs, competitors (direct/indirect/turnkey), the wedge, and the action-first RAT — **carry all of it forward, never regenerate it.** The value layer is *not yet crafted*, so say so: *"You have segments but no crafted value proposition. Strongly recommended: run `/nmt-craft-value-proposition` on the target segment first — the PRD is much sharper from a real value hypothesis. Run it now, or proceed using the nmt-market-research wedge as the value direction?"* If the user proceeds, use the wedge/differentiation hypothesis as the value direction; flag the reduced confidence at the top of the PRD.
- **Hand-off debt — ask what has since been validated (Paths A/B only — `PRODUCER-CONTRACT.md §4c`).** The upstream artifact carried its own validation debt (its RAT / risk rows — segment, willingness-to-pay, value, channel assumptions). Debt travels down the chain; it is *not* silently dropped. Because this PRD is the closest-to-build artifact, ask once before building: *"Your {nmt-market-research / value-proposition} result rested on these unvalidated assumptions: {list the upstream RAT rows}. Which of these have you since checked in the field, and what did you find?"* Re-tag anything still unvalidated — it carries into this PRD's risk section (§7) and counts toward this PRD's validation debt (Layer 1), with the cheapest probe pointed at it. Anything the user confirms was validated is marked as such and drops out of the debt count.
- **Path C — no research yet, wants it (ROUTE OUT — do not run research here).** Reply: *"The right order is `/nmt-market-research` → `/nmt-craft-value-proposition` → back here. Run `/nmt-market-research` first (it finds and scores the segments), then `/nmt-craft-value-proposition` (it builds the value hypothesis + a PRD-ready spec), then return and pick Path A. Want me to open the `/nmt-market-research` input prompt now?"* Hand off and stop — this skill does not size markets or discover segments.
- **Path D — fast path, manual segment + Jobs + value (no research).** For the user who already knows the segment and the value and just wants requirements. Collect, by description/dictation: product (1–2 sentences) + URL if any; target segment NAME + causal criteria (behaviour/characteristic, **not** demographics); Big Job(s) + criteria; top 1–3 **Core Jobs** in canonical `When … I want to {outcome} with success criteria {direction+level}, in order to {Big Job}` form; **the value** (what value we create + roughly via which mechanic — this stands in for `/nmt-craft-value-proposition`); ≥3 known alternatives (direct/indirect/turnkey if known); the business goal. Validate against the invariants — fix multi-verb Jobs (Rule 7), demographic "criteria", and adjective "value" before proceeding. Then go straight into S1→S5. Flag reduced confidence at the top of the PRD (*"generated from a manually-described segment + value, not a research-backed one"*).

### User materials, claims ledger, input-as-hypothesis gate, direction confirmation (all paths)

- **Materials.** Ask once: *"Any files or folders with material I should use — a Notion export (markdown), past research, interview notes, an existing spec, your current site?"* Read what's given; tag everything taken from it **[user data]** in-context — and **never silently carry a user's existing positioning, copy, or feature list into the PRD as a settled decision**: confirm first that it should carry over (it may be exactly what the challenge step should challenge).
- **User-claims ledger + input-as-hypothesis gate (`PRODUCER-CONTRACT.md §3`).** Collect every strong factual claim in the user's input — and every load-bearing input from the upstream artifact and the uploaded materials (a deck, a landing page, a codebase, the manually-described segment + value on Path D) — into an in-context ledger. **All of it is hypothesis, not fact** — a landing page is the team's belief about value, not proof customers want it; a stated segment + value can be the team's projection of the customer's Job rather than the customer's real one (the most expensive error). Tag each as **data** (measured / documented), **observation** (seen in interviews, sales), or **hunch** (belief, intuition — the default for anything from a deck / landing / the idea description). **Actively hunt the risks inside each load-bearing input** (don't just record it): is this customer-validated, or the team's belief about the customer? Does the stated Job / segment look like the customer's real Job, or the team's projection of it? Any internal contradictions, or guesses dressed as data? Hold the findings in context — they become the **"What you told me — and the risks I see in it"** block in Layer 2 (see the Layer-2 template), with the single worst one surfaced in Layer 1.
- **Hard gate (`PRODUCER-CONTRACT.md §3c`).** **No PRD scope, Core-Job selection, or challenge verdict may rest *primarily* on an unvalidated user input without the PRD saying so explicitly and pointing a RAT row at it.** If the build scope leans on a Job or value taken from the user's materials and not confirmed by customer evidence, that is named in §7 as the single most expensive risk, with the cheapest falsifying test attached — and it is the *"single riskiest thing to validate BEFORE building"* in Layer 1.
- **Direction confirmation.** Before S1, play the understanding back in one short block — *"Here's what I understood: {what we're building, for whom, the business goal, what's already decided vs open}"* — and confirm via one `AskUserQuestion` (Confirm / Correct).

**Hold** the normalized input in context.

---

## S1 — Select segment + Core Jobs

**If a single target segment arrives from Path A (or a clear ✅ target segment from Path B, or the one segment described on Path D)** — skip the segment pick; confirm it in one line and go straight to Core-Job selection.

**Otherwise** present the segments on the table and ask:

```
Q "Which segment do we build for?"
  - [Segment 1 — one line: who they are + their dominant criteria]
  - [Segment 2 — …]
  - …
  - "None of these"
```

If the user picks **"None of these"**, the skill does **not** go discover a new market itself — it offers the two real options: *describe a different segment now (continue on the fast path), or run `/nmt-market-research` to find and score better segments and come back.* Never force a segment.

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
- **Product type & monetization** — SaaS / mobile / service / marketplace / course; subscription / one-off / freemium / lead-gen. (B2B? → load `b2b.md` at the edge-case stage for the role-chain edge cases — not before.)

"Don't know" is fine — capture as a hypothesis (in context).

---

## S3 — Challenge the build (the gate)

**This runs before any requirement is written.** Source: `the-algorithm.md §4 Step 1`, `subtraction.md`, `local-vs-global-optimum.md`, `rat-key-theses.md §10`, `value-creation.md §1, §14, §17`. The point is not to talk the user out of building — it is to make sure the build is the **most energy-efficient way to perform the business Job**, because *the planning unit is the value hypothesis, not the feature.*

**Question the inputs taken as given (`PRODUCER-CONTRACT.md §3`).** The challenge is also where the segment + value + business goal handed to you get interrogated, not accepted. Before laddering, ask: *is the Job / segment / value I was handed the customer's real one, or the team's projection of it?* A build that is internally perfect but aimed at a Job the customer doesn't actually have is the most expensive failure — surface that doubt here, and feed it into the four moves below.

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

**Lock the winning build subject.** If a more-effective way wins, the PRD is written **for that** — re-anchor the Core Jobs / Critical Chain of Jobs on the chosen approach before S4. Hold the decision (and the alternatives not taken, with reasons) in context.

**The challenge verdict is "validate first, then build" — never "build now" (`PRODUCER-CONTRACT.md §4`).** Picking a build subject is *not* a green light to start engineering. By the methodology, the next step after locking the subject is to validate its riskiest assumption cheaply — interviews, a fake door, a concierge run — *before* committing build time; the MVP is a probe, not the product. If the run prints any GO-style verdict on the build decision, write it as **`GO (to validation)`**, never bare `GO`, and gloss it once: *"worth building toward — but the next move is to validate the riskiest assumption in the field, not to start the build."* Layer 1's *"single riskiest thing to validate BEFORE building"* and the validation-debt line carry this through to the reader.

> Keep this proportionate. For a small, well-validated feature on a working product the challenge may be one paragraph that confirms the build; for a from-scratch product it is the highest-leverage step in the run. Do not manufacture alternatives for symmetry — if the specified build genuinely is the most efficient way, say so and move on (`CLAUDE.md` Rule 12).

---

## S4 — PRD generation

Generate against the **locked build subject** for the **selected Core Jobs**. In Quick mode this is one pass; in Deep mode it is parallelized (below). Build the Critical Chain of Jobs first (held in context), then write **Layer 3** (the full build spec). **Compute Layer 2 and then Layer 1 LAST**, from the finished Layer-3 spec, wiring the `▸` drill-down links to the Layer-3 anchors.

### 4.0 The Critical Chain of Jobs per Core Job — consume from upstream, build only when absent
- **Path A (nmt-craft-value-proposition input):** the §11 implementation spec already carries the **Critical Chain of Jobs & Aha placement** — **consume it, don't rebuild it.** Extend it only with what the PRD needs on top: the **shape** of each chain segment (AND-parallel / OR-alternative / conditional) and the **break sites** (hand-offs, cycles, slowest link, external-interruption points). If the S3 challenge changed the build subject, re-anchor the inherited chain on the new subject instead of starting over.
- **Paths B / D (no value-prop chain):** construct the **Critical Chain of Jobs** from scratch per selected Core Job — the sequence of Micro Jobs that must all complete for the Big Job to land (`critical-chain.md §1–§2`) — with shapes, break sites, the **Aha-Moment position** and how far left it can be shifted.

Either way, this chain is the substrate for both functionality (Layer 3 §3) and edge cases (Layer 3 §4), and is rendered as the Critical Chain of Jobs diagram in Layer 3 §3.

### PRD structure — three layers in one file

Assemble the single output file as **three reading depths, linked top-to-bottom**: top-of-file attribution + disclaimers (once) → **How to read this (3 levels, with jump links)** → **Layer 1 (What we're building)** → **Layer 2 (The Reasoning)** → **Layer 3 (The Full Work)**. **Compute Layer 1 and Layer 2 LAST**, from the finished Layer-3 build spec, wiring drill-down links to the Layer-3 anchors.

#### Top of file (attribution + disclaimers, once)

```markdown
{attribution top-line — Rule 23}

<a id="disclaimers"></a>
> **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses, each with a runnable verification path. Validate before any major decision.
> **Hallucination disclaimer.** Generated by an LLM; may contain hallucinations in unknown places. For expensive decisions, run a full research pass; do not act on this document alone.
> ⚠️ {Path D → reduced-confidence flag; Path A/B → name the source artifact file path; if the challenge changed the build subject, say so in one line.}
```

#### How to read this — the three levels

Emitted once, right after the disclaimers and before Layer 1, so the reader sees the structure and can jump. Plain words only:

```markdown
## How to read this
Three levels — go as deep as you need:
- **Level 1 — What we're building** (1 page, plain words): what it is, who it's for, the moment that proves it works, the one thing to validate first, what to build first. Most readers stop here. [jump ▸](#layer-1)
- **Level 2 — The Reasoning** (plain English): why this build and not something else — the core capabilities and why, the failure cases that matter, the riskiest assumption. [jump ▸](#layer-2)
- **Level 3 — The Full Work** (the build spec): every requirement with acceptance criteria, the flow, the ~90% edge-case table, metrics, risks — what engineers and designers build against. [jump ▸](#layer-3)
```

#### Layer 1 — What we're building *(~1 page · minimal jargon · forwardable to a co-founder)*

```markdown
<a id="layer-1"></a>
# {Product / build subject} — what we're building
{date · {plain one-phrase who-it's-for} · stage}

> ⚠️ These are hypotheses, not facts — [full disclaimer ▸](#disclaimers)

> **Validation debt:** this PRD stands on **{N}** unvalidated assumptions — **{M}** of them fatal (would sink the build if wrong). Validate the fatal ones in the field *before* committing engineering time. [see them ▸](#l2-risk)
> <sub>N = risky assumptions in the §7 risk table (incl. any unretired upstream debt carried in via S0); M = those that kill the build if wrong. A Quick run on a manually-described segment + value has high debt — say so honestly (`PRODUCER-CONTRACT.md §4`). A PRD written fast on guesses looks as convincing as one built on 8 interviews; this line is what keeps it honest.</sub>

## What we're building
{One plain breath — what the product/feature does, in the customer's words. No jargon.} [why this and not something else ▸](#l2-build)

## Who it's for
{The target segment in one plain sentence — who they are, not a methodology label.} [who, and why them ▸](#l2-users)

## The one moment that proves it works
{The Aha — described in plain words: the moment the customer first feels it was worth it. Never "Aha Moment" or "positive-prediction-error" as a label here.} [where this moment lives in the flow ▸](#l2-capabilities)

## The single riskiest thing to validate BEFORE building
{The one assumption that, if wrong, sinks the build — in plain words + the cheapest way to check it.} [the full risk picture ▸](#l2-risk)

## What to build first
{The shortest first slice that delivers that moment — one or two plain sentences.} [the full build spec ▸](#l3-requirements)
```

**Layer 1 rule: minimal jargon, plain words lead** — a methodology term may appear in parentheses as a plain gloss, but never opens a line; short plain sentences ("explain it to a smart friend"). Each line links to its own unique anchor — never point two lines at the same target. Every line a reader could doubt ends with a `▸` drill-down link.

#### Layer 2 — The Reasoning *(2–4 pages · plain English · terms glossed once · no big tables)*

Plain English, one gloss per methodology term, `references/glossary.md` linked once at the top of this layer. **No big tables** (prose + at most one small table); the full tables live in Layer 3. Each subsection carries an `<a id="…"></a>` anchor that Layer 1 links to, and links down to its Layer-3 section.

```markdown
---

<a id="layer-2"></a>
# Why we're building it this way — the reasoning

*Plain-English walk-through of the logic behind the build above. The full spec, tables, and methodology are in the next layer. Methodology terms are defined in the [glossary](references/glossary.md).*

<a id="l2-input-risks"></a>
## What you told me — and the risks I see in it
*Everything you gave me — your idea, your deck, your existing spec, the segment and value, the upstream research — I treated as a hypothesis, not as fact. These are the inputs this PRD leans on, and what I'd check before trusting each. (`PRODUCER-CONTRACT.md §3`.)* (Omit this block only if the user provided no claims or materials at all.)

| What you provided / claimed | How I treated it | The risk I see in it | How to check it fast |
|---|---|---|---|
| {claim or material, tagged data / observation / hunch} | {used as hypothesis in {where — scope / Core Jobs / value / a requirement}} | {the specific risk — e.g., "this is your team's stated value, not customer-validated; the real Job may differ"} | {the cheapest falsifying test} |

{If any PRD scope, Core-Job pick, or the challenge verdict rests primarily on an unvalidated input, say so here in one bold sentence and point to the matching §7 risk row — this is also the Layer-1 "riskiest thing to validate before building".}

<a id="l2-build"></a>
## Is building this even the right move
{The challenge decision in plain words — we laddered the business goal up to what it's really for, asked what we could remove, and checked whether a bigger move would return more. State what we decided to build and what we decided NOT to build, and why. If the challenge changed the approach, say so plainly.} [the full challenge gate ▸](#l3-challenge)

<a id="l2-users"></a>
## Who it's for, and the moment that proves it
{Why this customer — what they're really trying to get done (the Big Job — the outcome they're really after), and the moment the product first beats what they expected (the plain description of the Aha). Where that moment sits in the path they walk.} [the target users + the flow ▸](#l3-overview)

<a id="l2-capabilities"></a>
## What the product must be able to do, and why
{The handful of core capabilities the product must have to deliver that moment — in plain words, not the full requirement list. One line each on why it's load-bearing. A small table is fine here; the full requirement table is below.} [the full functional requirements ▸](#l3-requirements)

<a id="l2-failures"></a>
## The failure cases that actually matter
{The few ways the customer's path breaks that would actually lose them — plain sentences, ordered by how badly each hurts. Note the rest live in the full table below.} [the full edge-case table ▸](#l3-edge)

<a id="l2-risk"></a>
## The riskiest assumption — and the cheapest probe
{The single assumption most likely to kill this, in plain words, + the cheapest way to find out before building. One line on why it's the one that matters.} [the full risk section ▸](#l3-risk)
```

#### Layer 3 — The Full Work *(the build spec engineers and designers build against)*

The detailed PRD below is the build spec. Add an HTML anchor above each part Layers 1–2 link into. Keep methodology citations out of the prose — fence them in a `▸ methodology trace` line per the readability rules; **never** put `CLAUDE.md Rule N` anywhere.

```markdown
---

<a id="layer-3"></a>
# The full build spec

<a id="l3-challenge"></a>
## 0. The build decision (challenge gate)
- The business goal laddered up (5 Whys) to the real business Job it serves.
- What we could remove, and the bigger-move check — local (improve the current thing) vs. a global move that returns more.
- The 2–4 more-effective ways generated, and **which one won** (the locked build subject), in a short table:

| Way considered | What it removes / adds | Cost vs. original | Riskiest assumption | Won? |
|---|---|---|---|---|
| Build as specified | … | — | … | {✅/—} |
| {more-effective way 1} | … | … | … | {✅/—} |

> <sub>**▸ methodology trace.** {fence the canon refs for the challenge here.}</sub>

<a id="l3-overview"></a>
## 1. Overview
- What we're building (the build subject locked in the challenge gate) and the **business Job** it serves.
- Target segment(s) + the selected Core Jobs (canonical form, with success criteria).
- **Aha Moment per segment** — the positive-prediction-error event, where it fires on the Critical Chain of Jobs, how far left it's shifted. (Never signup/login.)
- If the challenge changed the approach: one line on what was *not* built and why.

### 2. Target users (by Job, not demographics)
- Per segment: causal criteria; the Core Jobs they hire us for; their dominant success criteria (direction + level); the Big Job(s) above (motivation).
- B2B: business Job *and* personal Job per relevant role; the role chain.

> <sub>**▸ methodology trace.** {fence the canon refs — segmentation root, B2B role-chain — here.}</sub>

<a id="l3-requirements"></a>
## 3. Functional requirements *(the core)*
For each selected Core Job:
- **The Critical Chain of Jobs** (the Micro-Job sequence from §4.0, shape marked) — render the chain as a small diagram or ordered list with break sites marked.
- Requirements phrased from the user's side — *"User can {Micro Job}"* — each with **acceptance criteria = the success criteria (direction + level)**. This — what to build + acceptance criteria — is all the reader sees on the requirement itself.
- **The mapping moves into the fenced trace, not onto the requirement line.** The `Core Job → Big Job · mechanic: {mechanic name} · Aha: {how this requirement moves the customer toward the moment}` mapping is kept (it is the audit trail) but lives in the `▸ methodology trace` below, so the readable requirement stays "what to build," not framework bookkeeping. Name the mechanic; do **not** append any canon file path.
- **Onboarding → value activation:** the shortest path to the first Aha Moment; what to remove/simplify to shift it left; the Aha validity check (*what does the user predict here? what do they get? is the actual better than the prediction?* — if nothing is surprising, it isn't an Aha Moment).
- **No feature dilution:** every requirement serves the target segment, or is moved to §7 deferred.

> <sub>**▸ methodology trace.** The per-requirement `Core Job → Big Job · mechanic · Aha` mappings go here (one per requirement), plus the canon refs — value formula, criteria→mechanics, Aha placement.</sub>

<a id="l3-edge"></a>
## 4. Edge cases — ~90% of use cases across people, contexts, conditions
Edge cases in AJTBD are **where the Critical Chain of Jobs breaks or produces a Problem (a Negative Prediction Error)** under a real variation — not a generic QA checklist. Generate from five sources, then cover the standard technical/operational categories *as they hit the chain*:

- **(a) Context variations** — same expected outcome, different **context** → different success criteria → effectively a different Job. Enumerate the contexts the segment + adjacent users actually hit: new vs returning user; B2B roles; regulatory contexts (HIPAA / FERPA / state-by-state); locale / device / language; scale (0 items / 1 / many / 10,000); free vs paid tier; first-time (Orientation-Job-heavy) vs Nth-time.
- **(b) Critical Chain of Jobs break sites** — hand-offs (ownership ambiguity, latency, information loss), cycles (return-for-rework), the slowest link, external interruptions (a higher-priority Job bursts in; criteria change mid-walk; a competitor surfaces mid-walk).
- **(c) Tax Jobs** — work forced on the customer when a chain link fails; each is a Problem and a churn/abandonment trigger.
- **(d) Job-type branches** — Orientation Jobs for first-timers; Emotional Jobs (anxiety states); Viral Jobs (the Job performed for/with another person); conditional chain steps that exist only for a sub-context.
- **(e) B2B role-chain breaks** (if B2B) — breaks at role boundaries, mostly *personal-Job* failures (IT security veto, procurement/legal late stalls).
- **Standard categories, framed as chain-breaks:** empty/oversized/malformed input; no/slow/lost network; concurrency & conflicting operations; auth & permissions; payments (cancelled / partial refund / lapsed sub / double charge); security (injection, unauthorized access, rate limits).

Render as a table, sorted by **importance-driven severity** (high-importance break → same-day churn trigger; medium → silent churn; low → the customer drops the Job):

```
| # | Use-case / context | Where in the Critical Chain of Jobs | What breaks (the Problem / Tax Job) | Severity (Critical/High/Med/Low) | Requirement to handle it |
```

**Critical and High edge cases become core requirements in §3**; Medium/Low live in this section. Target ~90% coverage of the likely use cases; if you cap coverage, say what was dropped (no silent truncation).

> <sub>**▸ methodology trace.** {fence the canon refs — break sites, context→criteria, Tax Jobs, severity by importance — here.}</sub>

### 5. Competitive parity *(reused from upstream — do not re-mine in Quick mode)*
- Functionality that must at least match competitors (from the upstream competitor set).
- Functionality competitors close poorly = our wedge (the underserved success-criterion intersection).
- (Deep mode refreshes this against live competitor sites + reviews.)

### 6. Success metrics
- Per Core Job: the success criteria **translated into measurable activation / value-delivery metrics** (the criteria *are* the metric set).
- **Aha-Moment rate** (share of new users who reach it, and how far left it fires).
- North Star: the target segment performing the Core Job at criteria, repeatedly.

<a id="l3-risk"></a>
## 7. Risk handling & out of scope
- **Risks:** the RAT carried from upstream (or generated here) — for each, how the PRD minimizes/accounts for it, and **the single riskiest assumption to validate (cheaply) before the build** (kill the product, don't launch it; the MVP is a probe, name what it tests).
- **Anti-segment / out of scope:** who this is explicitly NOT for (2–3 groups); Jobs/segments deliberately subtracted to hold focus; features deferred to a later phase (the non-focal Jobs from §3).

> <sub>**▸ methodology trace.** {fence the canon refs — RAT, drop-it exercise, MVP-as-probe — here.}</sub>

### 8. Non-functional requirements *(only when relevant)* — performance, security, scalability, compliance, expressed against the chain where they bite.

<a id="checklist"></a>
### Verification & checklist
*Disclaimers are at the top of the file (once); not repeated here.*
*Disclaimers at the top of this file apply (not repeated here).* Then the verification checklist: validate the tagged user claims the PRD leaned on; run the riskiest-assumption probe from §7 before building; confirm the Aha fires where claimed; a source-link audit (every named external source is a live clickable link).
```

---

## S5 — Assemble, self-critic, summarize

Run the **self-critic** over the draft (Quick: a self-critique pass; Deep: a separate critic agent), fix in place, keep verdicts in-context. Then write the single result file and give the user a brief chat summary: what the challenge decided, what the PRD covers, the Aha Moment, the riskiest assumption to validate first, and the file path. Offer the handoff: *"Feed this PRD to `/nmt-craft-go-to-market` for landing + ad + GTM copy."*

### Self-critic criteria (methodology only — format is guaranteed by the template)
1. **No segment re-derivation** — the segment/Core Jobs were consumed from an upstream artifact or taken from the user's description; never discovered, sized, or scored inside this skill.
2. **Challenge ran first** — the business goal was laddered, subtraction-first asked, local-vs-global named, and the PRD is written for the *winning* build subject.
3. **Every feature ladders Core Job → Big Job AND names a value mechanic** — no bare features.
4. **Aha Moment is a real positive-prediction-error event**, placed as far left as the chain allows — not signup/login.
5. **The Critical Chain of Jobs is explicit per Core Job**, with shape and break sites marked.
6. **Edge cases are chain-break-driven and context-spanning**, ~90% coverage, severity by importance — not a generic QA list.
7. **Success criteria are concrete** (direction + level) and map to the success metrics.
8. **Out-of-scope names the anti-segment and the subtracted Jobs** — focus is visible.
9. **Disclaimers present; external sources are clickable links; US-context analogs; no PPE/NPE** (`CLAUDE.md` Rules 2, 3, 6, 19, 22).
10. **Step ledger ran** — every stage S0–S5 checked off by name; a skipped stage (e.g., the challenge collapsed to a one-line confirm) was declared, never silent.
11. **User claims stayed hypotheses** — ledger claims tagged (data / observation / hunch); no requirement or challenge-verdict rests primarily on a single unverified user hunch without saying so; nothing from the user's existing materials was carried into the PRD as a settled decision without confirmation.

- [ ] Plain-language-led — the PRD leads in the reader's own words; methodology terms only in parentheses (never jargon-first); Layer 3 may stay in full terms.
- [ ] **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses, forwardable), Layer 2 (plain reasoning, terms glossed), Layer 3 (the full build spec). No conclusion is repeated at the same depth across layers.
- [ ] **Drill-down links resolve and are unique** — every Layer-1 line links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l...`/`#disclaimers` target exists **exactly once** and no two links share a target.
- [ ] **Readable requirement is clean** — per requirement the reader sees what-to-build + acceptance criteria only; the `Core Job → Big Job · mechanic · Aha` mapping lives in the fenced `▸ methodology trace`. Opaque Layer-3 table headers carry an inline plain gloss.
- [ ] **Disclaimers once** — full two-part disclaimer at top only; Layer 1 has the one-line pointer; Layer 3 does not repeat the block.
- [ ] **Citations fenced** — no canon path or `Rule N` inline in Layers 1–2 or in Layer-3 prose; any canon reference sits in a `▸ methodology trace` line. **No `CLAUDE.md Rule N` appears anywhere in the output, in any layer.** The mechanic mapping carries the mechanic *name* but no canon file path.
- [ ] Step ledger ran — every stage S0–S5 checked off by name; any skip was declared, never silent.
- [ ] **Producer contract satisfied (`../PRODUCER-CONTRACT.md`)** — helicopter-view printed before the first question (§1); output-format and output-path asked in intake, and the file written in the chosen format at the chosen location (§2, §5); all user input + the upstream artifact treated as hypothesis, the **"What you told me — and the risks I see in it"** block present, and no scope rests primarily on an unvalidated input without saying so + a RAT row (§3); the **validation-debt line** present in Layer 1 and any GO-style build verdict written as **`GO (to validation)`**, framed as "validate first, then build" (§4); on Paths A/B the hand-off asked what upstream debt was retired and re-tagged the rest (§4c); in Deep mode each web leg met its evidence floor + passed its self-critic, with the web-MCP fallback offered when fetch was blocked (§6).

---

## Deep mode (subagents + web)

Same S0→S3 with the human; S4 parallelized and web-grounded. Agents are spawned with the `Agent` tool, `subagent_type: "general-purpose"`, `run_in_background: true`. Each agent reads **only the canon slice its wave needs** (per "Methodology — source of truth (progressive loading)"), **returns its result in its final message — no files**, keeps canon paths out of its prose (the orchestrator fences any that belong in Layer 3), and links every external source. The orchestrator holds all returns in context and writes the single output file.

```
Wave 1 (parallel):
  [PARITY]  Competitor-parity refresh — only if upstream parity is stale or absent. Reads eager core only.
            Given the upstream competitor set, confirm/extend the parity table from live sites + reviews; mark
            what competitors close poorly (the wedge). ≤8 fetches. → returns the parity table in-message.
  [CHAIN]   Critical Chain of Jobs builder — reads eager core (critical-chain.md + job-structure.md) + value-creation.md.
            Given the input + the challenge, consume the upstream chain (Path A §11 spec) and extend it with
            shapes + break sites; build from scratch only on Paths B/D (per §4.0). → returns the chain in-message.
Wave 2 (sequential): PRD designer — reads eager core + value-creation.md + value-creation-mechanics.md. Given the
            input + the challenge + the chain + the parity return, write Layer-3 functionality (§0–§3, §5–§8) — the
            readable requirement is what-to-build + acceptance criteria; the Core Job → Big Job · mechanic · Aha
            mapping goes in each requirement's fenced `▸ methodology trace`. → returns the Layer-3 body in-message.
Wave 3 (parallel):
  [EDGE]    Edge-case analyst — reads eager core + job-types-and-properties.md (+ b2b.md only if B2B). Given the
            chain + the PRD body + reviews (web), generate the ~90% edge-case table, chain-break-driven, severity
            by importance. → returns the table in-message.
  [CRITIC]  Adversarial self-critic — run the self-critic criteria incl. the layer/citation checks; return
            fix_instructions (≤2 rounds, then escalate).
Orchestrator: hold all returns in context; assemble Layer 3 (merge §3 with Critical/High edge cases); apply critic
            fixes; fence methodology citations into `▸ methodology trace` lines; **compute Layer 2 then Layer 1 LAST**
            from the assembled Layer-3 spec, wiring drill-down links to the anchors; write the single result file
            (top disclaimers once → Layer 1 → Layer 2 → Layer 3); chat summary.
```

Web caps: parity ≤8 fetches; edge-case review mining ≤8. Source links mandatory (Rule 2); never invent sources or numbers.

### Deep-mode QA — evidence floor + self-critic loop + web-MCP fallback (`PRODUCER-CONTRACT.md §6`)

- **Evidence floor (not just the cap).** Treat each web leg's lower bound as a *floor*, not only a ceiling: the PARITY leg and the EDGE review-mining leg may not return "done" until each has hit a real minimum of distinct sources for its task **or** explicitly reported *why* fewer were possible (blocked, none exist). "Made two queries and stopped" is a failure state, not a completion — the leg re-runs.
- **Self-critic loop on each leg.** After PARITY and EDGE return, the CRITIC runs a short pass on each: *enough distinct sources? are the load-bearing parity / edge-case claims actually verified against a source? any methodology error (a feature with no Core Job → Big Job ladder or no mechanic; an Aha set to signup/login; edge cases that are a generic QA list, not Critical Chain of Jobs breaks)? gaps left?* If a leg fails its critic, **re-run it with the gap named — up to 2 extra rounds**; don't assemble the PRD on a leg that failed its own critic.
- **Web-MCP fallback.** When the built-in fetch is blocked or thin on a needed source (G2, Capterra, local-market competitor sites), tell the user once and use a web-research MCP if one is connected:
  > Some sources (e.g., G2, Capterra) block the built-in fetch. For fuller Deep parity and edge-case mining, enable a web-research MCP — [Firecrawl](https://www.firecrawl.dev/) or [Exa](https://exa.ai/) (both ship MCP servers) — and I'll use it. Without it, I'll note where coverage was thin.

  If such an MCP is connected (discoverable via tool search), prefer it for blocked sources; otherwise proceed and flag thin coverage in the verification checklist.

---

## What this skill does NOT do

- **Does not re-derive segments or size markets** → `/nmt-market-research`.
- **Does not invent the value proposition or pick the target segment** → `/nmt-craft-value-proposition` (it consumes the §11 implementation spec).
- **Does not write landing, ad, or GTM/growth copy** → `/nmt-craft-go-to-market`.
- **Does not produce an analytics plan** (out of scope this version) or a **standalone unit-economics model** (unit economics is used only as a reasoning filter in S3/ranking).
- **Does not run interviews or execute the RATs** — it names the riskiest assumption to validate; the user runs it next.
- Quick mode: no internet, no subagents.

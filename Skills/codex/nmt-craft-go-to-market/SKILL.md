---
name: nmt-craft-go-to-market
description: >-
  Write the go-to-market communication for a chosen segment using Ivan Zamesin's
  AJTBD / Next Move Theory methodology. Input — a $nmt-craft-value-proposition
  result (best), a $nmt-product-requirements PRD, a $nmt-market-research result,
  or a manual segment+Jobs description. Output — ready-to-publish landing-page
  copy, ad/creative copy built on the seven Job-language formulas, and a
  GTM/growth plan (channel hypotheses, lead magnets, viral loops, cross-
  sell/upsell/retention). Everything speaks through the Big Job, in concrete
  success criteria not adjectives, with features as proof. Use when the user wants
  landing copy, ad copy, creatives, channel hypotheses, or a launch plan — "write
  the landing / the copy / the go-to-market". Two modes — Quick (default) and
  Deep. Defaults to English.
user-invocable: true
---

> **Update check — best-effort, ≤2s, never blocks.** Before the steps below, run
> `curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-craft-go-to-market"`; on any error
> or timeout, skip silently. Compare `.nmt-version` (project root) with the feed's `latest`. If
> behind, print one line — the `<installed> → <latest>` gap, a one-line summary per newer entry,
> and "run $nmt-upgrade to update" — then continue. If it matches or `.nmt-version` is absent, continue.

# Craft Go-To-Market (GTM communication) v1 — English / US edition

> **One breath.** This skill packages **already-created, validated value** into the communication that acquires customers — landing copy, ad/creative copy, and a GTM/growth-communication plan. It is the last step of the chain and consumes the steps before it; it never invents the segment, the value, or the build. Everything is communicated **through the Big Job** (where motivation lives), stated in **concrete success criteria** (not adjectives), with **features as proof not message**, fears reduced and the competing Job Graph fired. Communication transmits value — it cannot manufacture it; if the value isn't validated yet, the skill says so and better copy only accelerates disappointment.

> **Producer contract (binding) — `../PRODUCER-CONTRACT.md`.** Six cross-cutting behaviors shared by all producer skills, from user feedback: (1) print a **helicopter-view** before the first question; (2) ask **Markdown or HTML** output; (3) treat **all** user input as hypothesis and emit a *"risks I see in what you gave me"* block; (4) print **validation debt** and frame the pack as *test this messaging*, never *this will work* (GTM has no GO verdict — it inherits the debt of the value it sells); (5) accept a **custom output path**; (6) Deep mode runs an **evidence floor + self-critic loop** and offers a **web-MCP fallback**. The hooks below wire each into this skill; the contract is the source of truth for the wording.

## Where this skill sits in the chain

```
$nmt-market-research → $nmt-craft-value-proposition → $nmt-product-requirements → nmt-craft-go-to-market
(segment + Jobs)    (the value hypothesis)      (the build spec)         (THIS SKILL: the copy
                                                                          that sells the value)
```

It consumes a `$nmt-craft-value-proposition` result (best — it carries the positioning headline, the dominant criteria, the Aha Moment, the differentiation, the proof) **and/or** a `$nmt-product-requirements` PRD (the real functionality, the Critical Chain of Jobs, the Aha placement) **and/or** a `$nmt-market-research` result (segment, Big/Core Jobs, competitors, the wedge). It does **not** re-derive segments, re-invent value, or re-spec the build — it packages what those produced into customer-facing language.

## What this skill produces

**One file — the GTM communication pack** (`{product-slug}-craft-go-to-market-result.md`), in **three reading depths, linked top-to-bottom** (so one pack serves the founder skim, the marketer's "why is the copy shaped this way" read, and the methodology audit). The actual copy — landing blocks, ad lines, deal-room assets — *is* the product; it stays plain and shippable and is never buried or abstracted away. The layering here is lighter than the analysis skills: it adds a quick top layer and a short why-layer above the full pack, and it strips the methodology citations out of the copy itself.

1. **Layer 1 — The GTM in one breath** (~1 page, zero methodology words, forwardable): the one-liner · the single core message everything routes through · who it's for · the top channel to try first · the one thing to test before scaling — each doubtable line drilling down to its reasoning.
2. **Layer 2 — The Plan & why it's shaped this way** (1–2 pages, plain English, terms glossed once): why this is the message (what the buyer must come to believe), the landing logic in plain terms, the ad angles to test, the channel plan summary, what to test first — each linking down to the full pack.
3. **Layer 3 — The Full Pack** (the deliverable in substance):
   - **Part 1 — Landing copy.** The canonical NMT landing sequence, full ready-to-publish copy, no placeholders.
   - **Part 2 — Ad / creative copy.** The seven Job-language banner formulas with test-variant sets; visuals brief (show State B); the one-liner used everywhere.
   - **Part 3 — GTM / growth communication.** Acquisition-channel hypotheses (each loaded with Consideration Activators); Previous-Job lead magnets + Orientation-Job content + Viral-Job loops; cross-sell (Next Job) / upsell (Big Job) / retention (Aha-stream, frequency, habit-reuse) messaging.
   - **Appendix — the Consideration-Activators map:** which of the five components each asset loads, and the forces of behavior change worked.

**Two modes:**
- **Quick (default, ~10–15 min):** one Codex agent, no internet. Writes all copy from the loaded artifacts + reasoning.
- **Deep (opt-in, longer):** subagents mine real customer-review language (so the copy uses the words already in the customer's head) and ground the competitor-firing (Consideration-Activators component 5) in real Problems. See "Deep mode" at the end.

---

## Methodology — source of truth (progressive loading)

The **only** source of methodology is the Next Move Theory canon, read at runtime. **Don't load all of it up front** — read the eager core first, then pull the staged files only when the run reaches the stage that needs them (the same progressive-disclosure pattern Claude skills use with `references/`). This keeps a Quick run light and lets each Deep-mode agent read only its slice.

**This is a public skill — it grounds only in the public canon.** Every file below is a published canon file (the set whitelisted in `8-Tools/sync/PUBLIC_MANIFEST.yml`); the skill ships to the public mirror, where private files do not exist. **Never read or quote any canon file outside the sets below** — the per-task algorithms (positioning, conversion, acquisition, retention, average-check) live behind the paywall, and their communication content is folded into the public files below: positioning/landing/creatives in `communication.md`; conversion in `communication.md` + `customers-attention-management.md` + `barrier-removal.md`; acquisition/cross-sell/retention in `job-types-and-properties.md` + `critical-chain.md` + `consideration-activators.md`. This holds in **both** repos — even when running inside the Internal repo where those files exist on disk.

**Eager core (read before any copy is written — every run):**

| File | What it powers | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md` | The spine of the whole pack: communication transmits validated value (§1); the 7 purchase assumptions (§2); the 3 base messages (§3 — value in criteria, not adjectives); features-are-proof (§4); the one-liner (§5); the 7 creative formulas (§6 — visuals show State B); landing = a short Critical Chain of Jobs (§8 — the canonical landing sequence + the conversion diagnostic); expectation management (§9) | ~9k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` | The 5 Consideration-Activators components; sources; specific-stories; Class 1 vs Class 2 — loaded across every asset | ~5k |

**Staged — load only at the stage that uses it:**

| File | Load when | Used by | ~tokens |
|---|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | reaching the channels / triggers stage (Part 3a) | communicate through the Big Job (§4); the seven triggers / receptivity windows (§8); the forces (§9); Class 1/2 (§10) | ~7k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/customers-attention-management.md` | reaching the landing taste-of-Aha + acquisition stage (Part 1 block 6, Part 3a) | funnel as attention transitions — first Aha as far left as possible (§6), the Critical Chain of Jobs walk (§7–§8), Move-to-Previous-Job as upstream acquisition (§9) | ~6k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` (deep) + `…/barrier-removal.md` | reaching the fear-reduction / competitor-firing stage (Part 1 blocks 7–8, the CA load) | real Barriers vs. fears (§1, §3); separating fears *about the Job* from fears *about our Solution* | ~4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md` | reaching the lead-magnet / content / viral-loop stage (Part 3a) | Viral / Orientation Jobs — the job-types behind content marketing, lead magnets, content loops, viral loops | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | reaching the cross-sell / Next-Job stage (Part 3a/3b/3c) | Previous Job / Next Job — the chain moves behind acquisition (Previous Job), cross-sell and retention (Next Job) | ~6k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md` | only if the input is B2B (Part 3a deal room) | peer/institutional channels (§4), personal-Job messaging (§5–§6), the deal room (§3) | ~5k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | reaching the upsell / Aha-stream stage (Part 3b/3c) | the value formula behind every criteria claim (§3, §9); move-up-a-level for upsell (§14); the Red Queen value-gap behind the Aha-stream (§6); deferred-value communication (§19) | ~8k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | if the headline needs the fidelity-levels treatment | the headline is the Level-3 minimal Job (§15) | ~5k |

Quick mode (one Codex agent): read the eager core, then pull each staged file the first time the run reaches its stage — not before. Deep mode: each writer agent reads **only** the files its part needs (Landing → core + customers-attention-management + barrier-removal; Ads → core; GTM → core + behaviour-change + job-types-and-properties + critical-chain + b2b-if-B2B + value-creation). Never have an agent load a file outside its slice.

> **Path note.** If a file is not found at the path above, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix that the public repo strips.

**Do NOT use generic JTBD from the internet or prior training.** Five mis-defaults to never propagate (per project `AGENTS.md`): a **Job** is a desired transition (State A → expected outcome), not "a struggle for progress"; **value** is energy efficiency measured against the brain's prediction, the **Aha Moment** is value beating prediction (**never PPE/NPE** — Rule 22); `I want to + verb` is the primary element of an eight-element Job (each verb a separate Job — Rule 7); a **Problem** is a consequence of an underperforming Solution, not a root cause; a **Solution** is a real thing *and* a label for the Job Graph it installs.

**Methodological invariants — the copy is invalid if any is violated:**
- **Communicate through the Big Job** — motivation lives one level above the Core Job (`behaviour-change.md §4`, `communication.md §3`). *Exception (Class 1, `behaviour-change.md §10`):* when our Core Job is already familiar to the segment, lead on the Core Job + criteria with the Big Job as reinforcement; when unfamiliar (Class 2), lead on the Big Job and back-fill the Core Job.
- **Value in concrete success criteria, never adjectives** — *"fast / reliable / high-quality"* are bullshit-words; ask *"as in?"* → *"car arrives in under 4 minutes," "insured for $30M," "e-filed with error checks."* (`communication.md §3`.)
- **Features are proof, not the message** — a feature is communicable only after it's attached to a Job and a criterion (`communication.md §4`). Lead with the Job + value + fear reduction; use features as evidence.
- **Never promise a Big Job the product only partially performs** — overpromise inflates the prediction and manufactures a Problem; the promise must match what the Critical Chain of Jobs actually delivers (`communication.md §9`, `value-creation.md §6–§7`).
- **Load all five Consideration-Activators components** — new Job Graph; value delta by criteria; named product + entry path; specific fears reduced; competing Job Graph fired (`consideration-activators.md §1`).
- **Communication transmits validated value** — if value isn't proven (no sales / no Aha Moment yet), flag it; don't scale copy on a hypothesis (`communication.md §1`).
- **Specific stories beat abstractions** (`consideration-activators.md §6`); **visuals show State B**, not the process (`communication.md §6`).

Per `AGENTS.md`: every named external source is a clickable Markdown link (Rule 2); two-part disclaimer at the top of the result (Rule 3); US-context analogs + the recognition test — only Tier A/B brands without a one-clause bridge (Rules 6, 19).

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the GTM plan, rationale, and annotations in the plain, everyday language the target segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label. (The customer-facing landing / ad copy itself is of course plain by definition — this rule also keeps the *explanations around it* jargon-free.)

- ❌ *"This banner uses the Trigger → Core Job formula and fires the competing Job Graph…"*
- ✅ *"This banner hits them right at the moment they feel the problem, then shows why the usual option falls short (formula:* Trigger → Core Job *+ firing the alternative)."*

**Who reads it** — the target segments (the essentials are inline here, so the skill stays self-contained and public-safe): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain of Jobs)* · the exact step where they get stuck *(a Critical Chain of Jobs break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and any explicit **methodology appendix**, where full methodology language is expected. The *lead the reader sees* is plain; the *parenthetical and the appendix* carry the precise terms.

Link `references/glossary.md` once at the top of the GTM pack, right after the disclaimers.

---

## Readability rules (the pack is for a marketer who doesn't live in the methodology)

The pack is **three reading depths in one file**, linked top-to-bottom like canon §-references. The founder skims Layer 1; the marketer reads Layer 2 to understand *why the copy is shaped this way*; the methodology audit lives in Layer 3. The full template is in "GTM pack structure" below. The rules that make it work:

- **Three layers, escalating depth — state each conclusion once per layer, never twice at the same depth.** Layer 1 = the GTM in one breath (headline only). Layer 2 = the plan + why it's shaped this way, in plain English. Layer 3 = the full pack (all the copy, the seven-formula tables, the channel plan, the deal room, the CA map). A point made in Layer 1 is a headline; in Layer 2 a plain sentence; in Layer 3 the full asset — three depths, not three copies.
- **Drill-down links are mandatory.** Every Layer-1 line a reader could doubt carries a `▸` link to its Layer-2 anchor; every Layer-2 claim links to the Layer-3 part that delivers it. Use Markdown anchors: write `[why this message ▸](#l2-message)` and put `<a id="l2-message"></a>` above the target; the Layer-3 copy parts carry `<a id="l3-landing"></a>`, `<a id="l3-ads"></a>`, `<a id="l3-channels"></a>`, `<a id="l3-dealroom"></a>` above them.
- **Layer 1 = minimal jargon, plain words lead.** Lead every line in plain product English a junior PM gets at a glance. A methodology term may appear **in parentheses** as a short plain gloss when it helps — but never *open* a line with a raw term, and keep jargon to a minimum.
- **Layer 2 = plain language first, term glossed.** On first use, gloss a methodology term in 3–5 words in parentheses — e.g., *"the Big Job (the outcome the customer is really after)"*. Nested or repeated parenthetical glosses are fine — clarity beats purity. The glossary is linked once at the top of the pack. Glossable terms include the sneaky ones — *State A/B, Previous/Next/Orientation/Viral Job* — gloss each once or don't use it.
- **The landing and ad copy in Layer 3 is already plain by definition — keep it clean and shippable.** Do not abstract it, do not gloss it, do not wrap it in methodology. The copy *is* the deliverable. **But every claim/number in shippable copy keeps its `[VERIFY — source]` guardrail** until it is proven — a reader copies the copy straight to production, and the top-of-file disclaimer won't stop them from shipping an unproven number.
- **Citation fencing — the big fix for this skill.** Strip every inline canon citation — `(communication.md §8)`, `(b2b.md §1)`, `(consideration-activators.md §1)`, `(behaviour-change.md §…)`, etc. — out of the copy **and** out of all surrounding prose. The landing blocks and ad lines must read as clean, shippable copy with **no methodology citations inside them**. Where the canon reference still matters to the marketer reading the pack, move it into a fenced **methodology trace** line at the *end* of a part, styled out of the reading flow, e.g.:
  > <sub>**▸ methodology trace.** The landing block sequence is a short Critical Chain of Jobs whose State B is enough belief to take the first step (`communication.md §8`); the fear-reduction and competitor-firing blocks load Consideration-Activators components 4–5 (`consideration-activators.md §1`, `barrier-removal.md §3`).</sub>
  Never break a line of copy or a sentence of pack prose with `(communication.md §8)`. Project-internal rule numbers (`AGENTS.md Rule N`) never appear in any layer — they are for your reasoning, not the reader.
- **Disclaimers once, and the answer comes first.** The two-part disclaimer appears **once** at the top of the file. The **validation flag sits *below* the Layer-1 answer, capped at 2 lines** — a wall of "this isn't proven yet" before the answer makes a reader think the product is broken and bail; let them read the answer first, the caveat second. A one-line pointer in Layer 1 is enough; do not repeat the block inside Layer 3. (Search the file before shipping — disclaimer wording should hit at most twice.)
- **Keep source links** for external facts and proof (Rule 2).

**Enforcement gate (these kept getting skipped in real runs — check each before writing the file; full version in `../READABILITY-CONTRACT.md`):**

- **Unique, resolving anchors.** Every `▸` drill-down link points to its own unique `<a id="…">` that exists **exactly once**; no two links share a target. Before shipping, list every `▸` target and confirm each resolves.
- **`[VERIFY]` survives into the copy.** Every number/claim in landing and ad copy carries its inline `[VERIFY — source]` tag until proven — do not strip it because the copy "reads cleaner" without it. The earlier run dropped these and a reader would ship unproven numbers.
- **Validation flag below the answer**, ≤2 lines (see Disclaimers rule above).

---

## Output file (one file per run — `AGENTS.md` Rule 4)

The skill writes **exactly one** file. Default location (used unless the user gave a custom output path in intake — `PRODUCER-CONTRACT.md §5`), grouped under the product's folder in the project root (never `TMP/` or `.claude/`):

```
Skills-Results/{product-slug}/craft-go-to-market/{YYYY-MM-DD_HH-MM}_{product-slug}-craft-go-to-market-result.{md|html}
```

- **Extension follows the chosen output format** (`PRODUCER-CONTRACT.md §2`): `.md` (default) or a single self-contained `.html` (inline CSS, working in-page anchors for the How-to-read jumps + every `▸` drill-down link, `<details>` for Layer 3 and methodology traces, source links opening in a new tab). HTML carries the identical content — same attribution, disclaimers, three layers, all copy, tables, links — just in a more readable shell; the landing/ad copy stays plain and shippable, with its `[VERIFY — source]` tags intact. Never write both; one file per run.
- If the user gave a custom path, write the one file there with the same filename pattern.
- Everything internal — the normalized input (source artifacts, segment, Big/Core Jobs + criteria, Aha, competitors, proof, fears), dropped variants, review-mining notes, and the self-critic verdicts — **stays in-context**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

**Attribution (Rule 23).** The GTM pack opens with the attribution top-line (the very first content, above the disclaimers) and closes with the attribution block — `utm_source=nmt-craft-go-to-market&utm_medium=skill-artifact`.

---

## S0 — Intake & route

### Orientation (helicopter view) — print before the first question (`PRODUCER-CONTRACT.md §1`)
Before any question, print this short orientation block in plain words, in the user's chosen language:

> **What you'll get:** one pack — ready-to-publish landing-page copy, ad/creative copy, and a GTM/growth plan (channels, lead magnets, viral loops, cross-sell / upsell / retention messaging).
> **The steps:** (1) a few questions + I read your upstream artifact → (2) I write the landing copy → (3) I write the ad/creative copy → (4) I build the channel & growth plan → (5) you get one pack in three reading depths.
> **Where I work vs. where you decide:** I write the copy and the channel hypotheses. *You* pick what to ship and run the field validation — A/B tests, real spend, real conversions. I can't prove a channel or a message works; I can only tell you what to test first.
> **Two modes:** *Quick* (default — no internet, ~10–15 min, reasoning only; good for a first draft) · *Deep* (opt-in — subagents mine real customer-review language + ground the competitor-firing in real Problems, longer; best on a top model with a web-research MCP).
> **Honest caveat:** this packages value into copy — it doesn't prove the value, the message, or the channel. Better copy on an unvalidated value claim only accelerates disappointment. Everything here is a hypothesis until you test it.

### Language
Default **English**. If the user writes in another language, offer to work in it. Hold the choice in context. The copy uses the chosen language; canon files and source URLs stay as-is.

### One batched `request_user_input`

```
Q1 "What's your input?"
  - "A $nmt-craft-value-proposition result"   → Path A (best)
  - "A $nmt-product-requirements PRD"          → Path B
  - "A $nmt-market-research result"            → Path C
  - "I'll describe the segment myself"     → Path D (manual)
Q2 "Mode?"
  - "Quick (default — fast, no internet)"
  - "Deep (subagents + web: real review language + competitor firing)"
Q3 (Paths A/B/C) "Path to the result/PRD file?"  → free text; Read it.
Q4 "Which GTM assets do you need?" (multi-select)
  - "Landing copy"  /  "Ad & creative copy"  /  "GTM / growth-communication plan"  /  "All"
Q5 "Output format?" (PRODUCER-CONTRACT.md §2)
  - "Markdown (default — faster; opens anywhere)"
  - "HTML (a bit slower; easier to read — collapsible sections + working in-page navigation; all source and drill-down links stay clickable)"
Q6 "Where to save the result?" (PRODUCER-CONTRACT.md §5)
  - default `Skills-Results/{project}/craft-go-to-market/…`  /  or give a folder path to match your repo (e.g., `docs/research/`). One file per run regardless of location (Rule 4).
```

### Normalize the input (held in context)
Extract (and only ask the user for what's genuinely missing):
- **Target segment** + causal criteria (behaviour/characteristic, not demographics).
- **Big Job(s)** + their success criteria (the motivation surface — where communication lands). Personal Big Job for B2B.
- **Core Jobs** + dominant success criteria (direction + level). **Class 1 or Class 2?** (is the Core Job familiar to this segment? — sets whether copy leads on Big Job or Core Job, `behaviour-change.md §10`).
- **The Aha Moment** (the positive-prediction-error event — for the "give a taste on the landing" block and the activation/retention angle).
- **Competitive set** — direct (Core Job), indirect (Big Job), turnkey — with what each closes *poorly* (the wedge, for firing).
- **Current-Solution Problems & specific fears** (for fear reduction + competitor firing).
- **Proof** — cases, guarantees, logos, comparable results (with source links — Rule 2).
- **Validation status** — is the value proven by sales/usage, or still a hypothesis? (Gates whether this is "scale the copy" or "demand-test the copy.")

Path D collects the above as a structured manual intake; validate against the invariants (fix multi-verb Jobs, demographic "criteria", adjective "value") before writing. Flag reduced confidence at the top of the result.

### User materials, claims ledger, hand-off debt, direction confirmation (all paths)

- **Materials.** Ask once: *"Any files or folders with material I should use — a Notion export (markdown), past research, interview notes, existing copy, your current site?"* Read what's given; tag everything taken from it **[user data]** in-context. Existing copy is input to rewrite, not copy to preserve — confirm before reusing any of it verbatim.
- **Input-as-hypothesis gate (`PRODUCER-CONTRACT.md §3`).** Treat **every** input — the upstream value-prop / PRD / research artifact, the deck, the landing, the user's free-text claims, "our customers say X" — as a **hypothesis, never as established fact**. A landing page is the team's belief about value, not proof customers want it. **Actively hunt the risks inside it** (don't just record): for each load-bearing input ask — is this customer-validated, or the team's belief about the customer? Does the stated Job / segment look like the customer's real Job, or the team's projection of it (the most expensive error)? Any internal contradictions, or guesses dressed as data? Hold the findings in context — they become the **"What you told me — and the risks I see in it"** block in Layer 2 (see the Layer-2 template), with the single worst one surfaced in Layer 1. **The GTM copy is the most public artifact in the chain: writing confident landing/ad copy on an unvalidated value claim manufactures a Problem at scale.** No copy claim may rest on an unvalidated input without being flagged — connect each such claim to the existing `[VERIFY — source]` / validation-flag mechanism.
- **User-claims ledger.** Tag the strong factual claims in the user's input (competitor facts, "our customers say…", channel beliefs) as **data / observation / hunch**. Copy claims built on an unverified hunch are flagged: a concrete number or comparison in customer-facing copy must trace to data, or it ships as a to-verify placeholder — never as an invented fact.
- **Hand-off debt — ask what's since been checked (`PRODUCER-CONTRACT.md §4c`).** When consuming an upstream artifact (Paths A/B/C), **ask the user what from the prior artifact's validation debt has since been validated in the field** — e.g., *"the value prop you're handing me lists assumptions still to test; which of those have you checked since (sales, interviews, a fake door)?"* Re-tag anything still unvalidated and carry it forward: **if the value proposition was never validated, the landing copy inherits that debt — say so in the validation flag.** Debt travels down the chain; it is not silently dropped.
- **Direction confirmation.** Before S1, play the understanding back in one short block — *"Here's what I understood: {segment, the value we're communicating, validation status + what's still unvalidated from the hand-off, which assets you need}"* — and confirm via one `request_user_input` (Confirm / Correct).

---

## S1 — Write the GTM communication pack

Build **Layer 3 (the full pack) first**, in the order below — each part references the same Job record, so the one-liner and the Big Job stay consistent across all assets. Then **compute Layer 2 (the plan + why), then Layer 1 (the GTM in one breath), LAST** from the finished pack, wiring the drill-down links to the Layer-3 anchors. Write the file in final order: top disclaimers (once) → glossary link → **How to read this (3 levels, with jump links)** → Layer 1 → Layer 2 → Layer 3. Quick mode does this in one pass; Deep mode parallelizes the Layer-3 parts (below).

The file opens with the disclaimers once, then the glossary link:

```markdown
# Go-To-Market Communication — {product / segment}

<a id="disclaimers"></a>
> **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses with verification paths. Validate before deciding.
> **Hallucination disclaimer.** Generated by an LLM; may contain hallucinations. For expensive decisions, run real research; do not act on this alone.

*Methodology terms are defined in the [glossary](references/glossary.md).*
```

### How to read this — the three levels

Emitted once, right after the disclaimers/glossary and before Layer 1, so the reader sees the structure and can jump. Plain words only:

```markdown
## How to read this
Three levels — go as deep as you need:
- **Level 1 — The GTM in one breath** (1 page, plain words): the one-liner, the single message, who it's for, the first channel to try, the one thing to test before scaling. Most readers stop here. [jump ▸](#layer-1)
- **Level 2 — The Plan & why it's shaped this way** (plain English): why this is the message, the landing logic, the ad angles, the channel plan, what to test first. [jump ▸](#layer-2)
- **Level 3 — The Full Pack** (ready-to-ship): all the landing & ad copy, the channel plan, the deal room, and the consideration map. [jump ▸](#layer-3)
```

### Layer 1 — The GTM in one breath

Computed LAST, from the finished Layer-3 pack. **Minimal jargon, plain words lead, forwardable** (a term may appear in parentheses as a plain gloss, but never opens a line). Each doubtable line drills down to its own unique Layer-2 anchor — never two lines at the same target.

```markdown
---

<a id="layer-1"></a>
# The GTM in one breath
*One page, plain words — forward this to a co-founder. The full plan and the ready-to-ship copy are below.* — [disclaimer ▸](#disclaimers)

## The one-liner
{the single sentence used everywhere — what it is + what it does + the value in plain words.}

## The one message everything routes through
{in one or two plain sentences: the single thing the buyer must come to believe; every asset carries it.} [why this is the message ▸](#l2-message)

## Who it's for
{the segment in one plain sentence — who they are, not a methodology label.} [the buyer + the validation status ▸](#l2-buyer)

## The channel to try first
{one channel + the moment to catch them, in plain words.} [the channel plan ▸](#l2-channels)

## The one thing to test before scaling
{the single make-or-break thing to prove first — usually whether the value is real, or whether the top channel actually reaches them.} [what to test first ▸](#l2-test)

> **Validation debt:** this pack stands on **{N}** unvalidated assumptions — **{M}** of them fatal (would sink it if wrong): that the value is real, that this message lands, and that the top channel reaches them. The fatal ones are the first things to test. [see them ▸](#l2-input-risks)
> <sub>N = the assumptions the copy rests on (the value claim, the message, each channel + lead-magnet hypothesis, plus anything inherited unvalidated from the upstream artifact's hand-off debt); M = those that kill it if wrong. A Quick draft on an unvalidated value prop has high debt — say so honestly (`PRODUCER-CONTRACT.md §4`).</sub>

> ⚠️ {validation flag — ≤2 lines, placed here below the answer, not above it. This pack has no GO/build verdict: it always reads as **"test this messaging / channel,"** never **"this will work."** "value validated by sales/usage" → these are scale-ready creatives; "value is a hypothesis" (incl. inherited from an unvalidated upstream value prop) → these are demand-test creatives, not facts to scale. Path D → reduced-confidence flag; else name the source artifact and what of its debt is still open.}
```

### Layer 2 — The Plan & why it's shaped this way

Computed after Layer 3, before Layer 1. Plain English, one gloss per methodology term, no big copy blocks (those live in Layer 3). Each subsection carries the `<a id>` anchor Layer 1 links to, and links down to its Layer-3 part.

```markdown
---

<a id="layer-2"></a>
# The plan, and why it's shaped this way
*Plain-English reasoning behind the copy. The ready-to-ship assets are in the full pack below.*

<a id="l2-input-risks"></a>
## What you told me — and the risks I see in it
*Everything you gave me — the upstream value prop / PRD / research, your deck, your landing, your numbers — I treated as a hypothesis, not as fact. These are the inputs the copy leans on, and what I'd check before trusting each. The copy is the most public artifact in the chain — over-promising on an unvalidated claim manufactures disappointment at scale. (`PRODUCER-CONTRACT.md §3`.)* (Omit this block only if the user provided no claims or materials at all.)

| What you provided / claimed | How I treated it | The risk I see in it | How to check it fast |
|---|---|---|---|
| {claim or material, tagged data / observation / hunch} | {used as hypothesis in {where — the message / a copy claim / a channel}} | {the specific risk — e.g., "this is your stated value, not customer-validated; the real Job may differ, and the headline rests on it"} | {the cheapest falsifying test} |

{If the message, a headline claim, or the validation flag rests primarily on an unvalidated input, say so here in one bold sentence and tie it to the matching `[VERIFY — source]` tag in the copy.}

<a id="l2-message"></a>
## Why this is the message
{what the buyer must come to believe before they switch, in plain words — the better outcome they're really after (the Big Job), and the few things they must learn or believe (Consideration Activators) for the message to land. Why we lead on this and not on features.} [the full Consideration-Activators map ▸](#l3-camap)

<a id="l2-buyer"></a>
## Who it's for — and whether the value is proven yet
{the segment in plain words; whether the value is validated by sales/usage or still a hypothesis (which decides scale-the-copy vs. demand-test-the-copy).}

## The landing logic, in plain terms
{why the page is ordered the way it is — recognize the situation → show the value in concrete terms → prove it → handle the fears → the first small step — in plain words.} [the full landing copy ▸](#l3-landing)

## The ad angles to test
{the handful of angles worth testing first and why, plain.} [all seven formulas + variants ▸](#l3-ads)

<a id="l2-channels"></a>
## The channel plan
{the top channels, the moment to reach the buyer, and the lead-magnet / content / referral moves, in plain words.} [the full channel plan + deal room ▸](#l3-channels)

<a id="l2-test"></a>
## What to test first
{the single cheapest highest-leverage thing to prove before spending on scale.}
```

### Layer 3 — The Full Pack

The deliverable in substance. Open it with a divider and the heading, then the one-liner part, then Parts 1–3 and the Appendix. **All canon citations are fenced into `▸ methodology trace` lines at the end of each part — never inline in copy or prose.**

```markdown
---

<a id="layer-3"></a>
# The full pack

## 0. The one-liner (used everywhere)
**`[What it is] + [Core Job(s) it performs] + [value by criteria]`** — one sentence, plain words already in the customer's head.
Examples of the form (not to copy): *Bench — bookkeeping service that categorizes transactions and delivers tax-ready financials for small businesses.* Test: a stranger can repeat what it is, the Core Job, and the value.
```

#### Part 1 — Landing copy (full, ready-to-publish)
Emit `<a id="l3-landing"></a>` above this part. A landing page is a **short Critical Chain of Jobs** whose State B is enough belief + motivation to take the first step. Write each block as final copy, not a brief — **clean, shippable, with no methodology citations inside the copy**:

1. **Hero** — the one-liner + a 1–2-sentence subtitle; **the Big Job this page addresses, stated explicitly** (and consistent with the PRD/value-prop); CTA copy + what the user gets on click.
2. **Focus Jobs** — the Core Jobs together with the Big Job they serve.
3. **Context & trigger** — the visitor recognizes *"this is my situation"* (the segment's real context + trigger).
4. **Value by concrete criteria** — how much more energy-efficiently the Jobs land; numbers/thresholds, never adjectives.
5. **How it works** — the steps as the *proof* layer (features attached to Jobs + criteria), not as the message.
6. **A taste of the Aha Moment** — give a slice of value on the page where possible (the partial-value mechanic; place the first Aha as far left as possible).
7. **Problems with the current way** — why the existing Job Graph produces Problems / Tax Jobs / chain-breaks (fires the competing Graph).
8. **Fear reduction** — the specific feared breaks (the *"what if…"* block): named, then shown prevented / absorbed / reversible / insured / irrelevant. Separate real blockers from fears, and fears *about the Job* from fears *about our Solution*.
9. **State B / Big-Job reminder** — what the result looks and feels like once the Big Job lands (the State-B emotion).
10. **Consideration Activators + CTA** — named product, the first concrete step, low activation cost; CTA on every screen.

After the copy, two fenced lines (out of the reading flow):

> The sequence is a **diagnostic**, not decoration — if motivated traffic doesn't convert, name which transition failed (didn't recognize the context / value not concrete / proof didn't connect / a real blocker remained / a fear stayed active / competitor not fired / CTA cost too high before the first Aha).
>
> <sub>**▸ methodology trace.** The landing block sequence is a short Critical Chain of Jobs whose State B is enough belief to take the first step (`communication.md §8`); value-in-criteria-not-adjectives is §3; features-as-proof is §4; the taste-of-Aha places the first Aha as far left as possible (`customers-attention-management.md §6`); the Problems and fear-reduction blocks fire the competing Job Graph and load Consideration-Activators components 4–5 (`consideration-activators.md §1`, `communication.md §2`, `barrier-removal.md §3`).</sub>

#### Part 2 — Ad & creative copy
Emit `<a id="l3-ads"></a>` above this part. Creatives are **Job-language formulas selected by evidence, not inspiration**. For each of the segment's main entry contexts, generate copy across the seven formulas, then mark which to test first:

| # | Formula | Pattern |
|---|---|---|
| 1 | Core Job for Big Job | *"Find a 2-bedroom so both of you can take calls from home."* |
| 2 | Core Job + value (criteria) | *"See new Austin rentals within 60 seconds of posting."* |
| 3 | Trigger → Core Job | *"Offer letter signed? Shortlist commute-safe apartments this week."* |
| 4 | Orientation Job | *"Compare Austin neighborhoods before you book a tour."* |
| 5 | Big Job lived (State B) | *"First Monday in Austin: desk set up, commute under 20 minutes."* |
| 6 | Micro Job | *"Turn on instant alerts for 2-bedrooms under $2,800."* |
| 7 | Problem with current Solution → Core Job | *"Great listing already gone? Get alerts before the open house fills."* |

- **Combine formulas** when the Graph requires (Trigger + Problem + Core Job; Big Job + fear reduction + CTA). Constraint: every clause translates back to a named Job level + criterion; parse multi-verb lines first.
- **Specificity rule** — run every adjective through *"as in?"* before it ships.
- **Visuals brief** — show **State B** (the result the Big Job creates), not the production process; name the State-B emotion.
- Produce **enough variants to test**: copy is information packaged through formulas — generate a strong starter set per context and say what to A/B.

> <sub>**▸ methodology trace.** The seven creative formulas and visuals-show-State-B are `communication.md §6`; every clause maps back to a named Job level + criterion (Rule 7, Rule 14).</sub>

#### Part 3 — GTM / growth communication
Emit `<a id="l3-channels"></a>` above this part. Three sub-parts, all routed through Jobs:

**3a. Acquisition-channel hypotheses.** Per channel × segment, loaded with Consideration Activators:

| Channel | Trigger / receptivity window | Message (the CA load) | First step (CTA) | Success metric |
|---|---|---|---|---|

- Time outreach to **receptivity windows** — Critical Chain of Jobs breaks, life events, competitor failures — not steady-state habit.
- **Previous-Job channels:** a tool/content for the Job *before* the Core Job (calculator, estimator, aggregator, guide) that captures the customer earlier and shapes their Consideration Set.
- **Orientation-Job content:** content marketing = performing Orientation Jobs + stepping to the Previous Job; design the **content loop** (using the product generates content that performs Orientation Jobs for the next customer; the Aha Moment is the fuel).
- **Lead magnet:** trade a contact for disproportionate free value (checklist, template, calculator) — the brain over-values "free."
- **Viral Jobs:** if the Core Job is performed *for/with* others (decks, docs, boards, Looms), design the surface so being-seen-using-it is itself a value moment; prioritize segments rich in high-frequency Viral Jobs.
- **B2B (if the input is B2B):** route through peer stories, customer-published case studies, conference talks by customers, analyst reports, trusted-colleague recommendation — not consumer-marketing channels; arm the champion with a **deal room** and hit **personal Jobs** explicitly, not just business Jobs.

<a id="l3-dealroom"></a>
**The deal room (B2B).** Arm the champion with: a comparison vs. named competitors, stakeholder-specific objection answers, references in their industry, and a business-case template they can paste into their own deck.

**3b. Cross-sell / upsell messaging.**
- **Cross-sell** = the **Next Job** in the Critical Chain of Jobs (after our Core Job lands, the next Job the customer performs) — message it as the natural continuation.
- **Upsell** = link to a higher **Big Job** / move up-market / bundle.

**3c. Retention messaging.**
- A **stream of Aha Moments** against the rising prediction bar; shift the first Aha as far left as possible.
- **Reuse existing habits**, don't install new ones; embed in rituals the customer already runs.
- **Frequency** + the **Next Job** (NRR > 100% is the "more Jobs / next Job" strategy in messaging form); ecosystem lock-in where it applies.

> <sub>**▸ methodology trace.** Receptivity windows + the forces are `behaviour-change.md §8–§9`; Previous-Job channels and upstream attention capture are `critical-chain.md §9.1` and `customers-attention-management.md §9`; Viral / Orientation Jobs are `job-types-and-properties.md`; the B2B channels, personal-Job messaging, and deal room are `b2b.md §3–§6`; cross-sell as the Next Job is `critical-chain.md §9.2`; upsell as move-up-a-level and the Aha-stream / Red Queen value-gap are `value-creation.md §14`, §6.</sub>

#### Appendix — the Consideration-Activators map & the forces
Emit `<a id="l3-camap"></a>` above this part.
- A table: each landing block / ad / channel asset → which of the **five things the customer must learn or believe** it loads (a better way exists / better by these criteria / here's the product + first step / this fear is handled / the current way's problems are real).
- The **forces of behavior change** worked for this segment: which driver each asset pulls and which blocker it removes; confirm habit is **reused or sidestepped, never fought head-on**.

> <sub>**▸ methodology trace.** The five Consideration-Activators components are `consideration-activators.md §1`; the forces of behavior change are `behaviour-change.md §9`.</sub>

---

## S2 — Self-critic & summary

Run the self-critic over the draft (Quick: self-critique; Deep: a critic agent), fix in place, keep verdicts in-context. Then in the chat: print **Layer 1 (The GTM in one breath)** verbatim + a 3–4-line outcome (the one-liner, the Big Job everything routes through, the validation status, the top channel hypothesis) + the file path.

### Self-critic criteria (methodology only)
1. **Routes through the Big Job** (or correctly leads on the Core Job for a Class-1 familiar segment) — not Core-Job steps in isolation.
2. **Every value claim is a concrete criterion** (direction + level) — no adjectives survive the *"as in?"* test.
3. **Features appear only as proof**, attached to a Job + criterion — never as the headline message.
4. **No Big Job promised that the product only partially performs** — promise matches the Critical Chain of Jobs.
5. **All five CA components present** across the pack; the competitor is fired on a *real* Problem, fears are *specific*.
6. **The Aha Moment is a real event** (not signup/login) and is given a taste on the landing + used as the retention/WoM engine.
7. **Validation status is honest** — hypothesis-stage value is flagged as demand-test creative, not scaled fact.
8. **Specific stories used; visuals = State B; recognition test passed** (Tier A/B brands, or bridged); **US-context analogs**; **no PPE/NPE**; **disclaimers + clickable source links** (`AGENTS.md` Rules 2, 3, 6, 19, 22).
9. **Step ledger ran** — S0 → Layer 3 (Part 1 → Part 2 → Part 3 → Appendix) → Layer 2 → Layer 1 checked off by name (skipping parts the user didn't order is fine — say so); no silent skips.
10. **User claims stayed hypotheses** — every number or comparison in customer-facing copy traces to tagged data or ships as a to-verify placeholder; no copy fact invented from a user hunch.
- [ ] Plain-language-led — the GTM plan and all annotations lead in the reader's own words; methodology terms only in parentheses (never jargon-first); any methodology appendix / debug may stay in full terms.
- [ ] **Three layers present and correctly leveled** — Layer 1 (minimal jargon, plain words lead, terms only in parentheses, forwardable), Layer 2 (plain plan + why, terms glossed, no big copy blocks), Layer 3 (the full pack with all copy intact). No conclusion repeated at the same depth across layers.
- [ ] **Drill-down links resolve and are unique** — every Layer-1 line links to a real Layer-2 anchor; every Layer-2 claim links to a real Layer-3 anchor; every `#l2-…` / `#l3-…` target exists **exactly once** and no two links share a target.
- [ ] **`[VERIFY]` survives into the copy** — every number/claim in landing & ad copy keeps its inline `[VERIFY — source]` tag until proven; opaque table headers carry an inline plain gloss.
- [ ] **Disclaimers once; answer first** — the two-part disclaimer at the top only; the validation flag sits below the Layer-1 answer (≤2 lines), not above it; Layer 1 has the one-line pointer; Layer 3 does not repeat the block.
- [ ] **Citations fenced — landing and ad copy must be citation-free.** No canon path or `Rule N` inline in any copy, in Layers 1–2, or in Layer-3 prose; every canon reference sits in a `▸ methodology trace` line at the end of a part. Read the landing blocks and ad lines straight through: they must read as clean, shippable copy.
- [ ] **Producer contract satisfied (`../PRODUCER-CONTRACT.md`).** Helicopter-view printed before the first question (§1); intake asked output-format (§2) and output-path (§5); HTML run wrote one self-contained `.html` with working anchors + `<details>`; the **"What you told me — and the risks I see in it"** block is present and the input-as-hypothesis gate held (§3); the **validation-debt line** is in Layer 1 and the pack reads as "test this messaging/channel," never "this will work" (§4); on hand-off, the run asked what of the upstream artifact's debt is now validated and carried the rest forward (§4c); Deep mode met the **evidence floor + self-critic loop** and offered the **web-MCP fallback** (§6).

---

## Deep mode (subagents + web)

Same S0 with the human; S1 parallelized and grounded on real customer language. Agents: Codex's available execution (parallel subagents if your build supports them, otherwise sequentially in one context). Each reads **only its canon slice** (per "Methodology — source of truth": the eager core plus the staged files its part needs), **returns its result in its final message — no files**, links sources, and keeps canon citations out of the copy. The orchestrator holds all returns in context and writes the single output file.

```
Wave 0 (background from start):
  [REVIEWS] Review-language mining — fetch reviews of the competitors/alternatives (G2, Reddit, Product Hunt,
            Trustpilot, Capterra, App Store). Extract the words customers actually use, their specific Problems
            with the current Solution, and 5–10 quotable lines per competitor WITH source URLs. → returns the review language in-message.
            Must meet the evidence floor (a real minimum of distinct sources, or report why fewer); use the web-MCP fallback when the built-in fetch is blocked (see "Deep-mode QA" below).
Wave 1 (parallel, consume the reviews return):
  [LAND]    Landing-copy writer → returns Part 1 in-message
  [ADS]     Ad/creative writer → returns Part 2 in-message
  [GTM]     Channel + growth-comms → returns Part 3 in-message
Wave 2: [CRITIC] adversarial self-critic (the full criteria incl. the layer + citation-fencing checks; fix_instructions; ≤2 rounds, then escalate)
Orchestrator: hold all returns in context; assemble Layer 3 (the full pack) from the part returns; strip any inline canon citations the writers left in the copy and fold them into the per-part `▸ methodology trace` lines; then compute Layer 2, then Layer 1, LAST, wiring drill-down links to the Layer-3 anchors; write the single file (top disclaimers once → glossary link → Layer 1 → Layer 2 → Layer 3); apply critic fixes; chat summary.
```

Each writer agent reads only its canon slice (Landing → core + customers-attention-management + barrier-removal; Ads → core; GTM → core + behaviour-change + job-types-and-properties + critical-chain + b2b-if-B2B + value-creation) and returns its part with **no inline canon citations in the copy** — it holds the canon references in its reasoning, and the orchestrator fences them into the methodology-trace lines.

Web caps: review mining ≤12 fetches / ~10 min. Source links mandatory (Rule 2); never invent sources, figures, or fake reviews.

### Deep-mode QA — evidence floor + self-critic loop + web-MCP fallback (`PRODUCER-CONTRACT.md §6`)

- **Evidence floor (not just a ceiling).** The cap is a ceiling; treat the lower bound as a **floor**. The review-mining leg may not return "done" until it has either pulled a real minimum of distinct sources (a spread across competitors/alternatives, with quotable lines + source URLs) **or** explicitly reported *why* fewer were possible (blocked, none exist). "Did two queries and stopped" is a failure state, not a completion — the customer's actual words are the whole point of Deep mode, and thin mining produces generic copy.
- **Self-critic loop per leg.** After a research/writer leg returns, run a short critic pass asking: *enough distinct review sources? is each customer-language claim actually traceable to a fetched source (not invented)? any methodology error (Big-Job-as-segment, features-before-criteria, adjectives that fail "as in?", a Big Job promised the product only partially performs)? gaps left?* If it fails, re-run the leg with the gap named — **up to 2 extra rounds**. Don't ship a leg that failed its own critic.
- **Web-MCP fallback.** When the built-in fetch is blocked or thin on a needed review source (G2, Capterra, Trustpilot, App Store), tell the user once and use a web-research MCP if available:

  > Some review sources (e.g., G2, Capterra) block the built-in fetch. For fuller Deep mining, enable a web-research MCP — [Firecrawl](https://www.firecrawl.dev/) or [Exa](https://exa.ai/) (both ship MCP servers) — and I'll use it. Without it, I'll note where review coverage was thin and the copy leans more on reasoning than on real customer language.

  If such an MCP is connected (discoverable via tool search), prefer it for blocked sources; otherwise proceed and flag thin coverage in the self-critic / verification notes.

---

## What this skill does NOT do

- **Does not pick the segment or size the market** → `$nmt-market-research`.
- **Does not invent the value proposition** → `$nmt-craft-value-proposition`.
- **Does not write product requirements / the build spec** → `$nmt-product-requirements`.
- **Does not validate value** — it transmits *already-validated* value; if value is unproven it produces *demand-test* creatives and says so.
- **Does not run the ad accounts, build the funnel, or buy media** — it produces the copy and the channel hypotheses to test.
- Quick mode: no internet, no subagents.
```

---
name: craft-go-to-market
description: Write the go-to-market communication for a chosen segment using Ivan Zamesin's AJTBD / Next Move Theory methodology (distinct from generic Christensen JTBD). Input — a /craft-value-proposition result (best), a /product-requirements PRD, a /market-research result, or a manual segment+Jobs description. Output — ready-to-publish landing-page copy (the canonical NMT landing sequence), ad / creative copy (the seven Job-language banner formulas with test variants), and a GTM/growth-communication plan (acquisition-channel hypotheses loaded with Consideration Activators, Previous-Job lead magnets and Orientation-Job content, Viral-Job loops, and cross-sell / upsell / retention messaging). Everything is communicated through the Big Job (motivation), stated in concrete success criteria not adjectives, with features as proof not message, fears reduced, and the competing Job Graph fired. Writes the plan and rationale in plain language the reader already uses, with methodology terms only in parentheses. Two modes — Quick (default, no internet) and Deep (subagents + web for real review language and competitor firing). Defaults to English; adapts to the user's language on request. Use when the user wants landing copy, ad copy, marketing creatives, channel hypotheses, a launch/GTM communication plan, or says "write the landing / the copy / the go-to-market".
user-invocable: true
---

# Craft Go-To-Market (GTM communication) v1 — English / US edition

> **One breath.** This skill packages **already-created, validated value** into the communication that acquires customers — landing copy, ad/creative copy, and a GTM/growth-communication plan. It is the last step of the chain and consumes the steps before it; it never invents the segment, the value, or the build. Everything is communicated **through the Big Job** (where motivation lives), stated in **concrete success criteria** (not adjectives), with **features as proof not message**, fears reduced and the competing Job Graph fired. Communication transmits value — it cannot manufacture it; if the value isn't validated yet, the skill says so and better copy only accelerates disappointment.

## Where this skill sits in the chain

```
/market-research → /craft-value-proposition → /product-requirements → craft-go-to-market
(segment + Jobs)    (the value hypothesis)      (the build spec)         (THIS SKILL: the copy
                                                                          that sells the value)
```

It consumes a `/craft-value-proposition` result (best — it carries the positioning headline, the dominant criteria, the Aha Moment, the differentiation, the proof) **and/or** a `/product-requirements` PRD (the real functionality, the Critical Chain, the Aha placement) **and/or** a `/market-research` result (segment, Big/Core Jobs, competitors, the wedge). It does **not** re-derive segments, re-invent value, or re-spec the build — it packages what those produced into customer-facing language.

## What this skill produces

**One file — the GTM communication pack** (`{product-slug}-craft-go-to-market-result.md`):
- **Part 1 — Landing copy.** The canonical NMT landing sequence (`communication.md §8`), full ready-to-publish copy, no placeholders.
- **Part 2 — Ad / creative copy.** The seven Job-language banner formulas with test-variant sets; visuals brief (show State B); the one-liner used everywhere.
- **Part 3 — GTM / growth communication.** Acquisition-channel hypotheses (each loaded with Consideration Activators); Previous-Job lead magnets + Orientation-Job content + Viral-Job loops; cross-sell (Next Job) / upsell (Big Job) / retention (Aha-stream, frequency, habit-reuse) messaging.
- **Appendix — the Consideration-Activators map:** which of the five components each asset loads, and the forces of behavior change worked.

**Two modes:**
- **Quick (default, ~10–15 min):** one Claude, no internet. Writes all copy from the loaded artifacts + reasoning.
- **Deep (opt-in, longer):** subagents mine real customer-review language (so the copy uses the words already in the customer's head) and ground the competitor-firing (Consideration-Activators component 5) in real Problems. See "Deep mode" at the end.

---

## Methodology — source of truth

The **only** source of methodology is the Next Move Theory canon, read at runtime (relative paths; the skill ships in the same repo). **Path note:** if a file is not found, retry with a `1-` prefix on the canon folder.

**This is a public skill — it grounds only in the public canon.** Every file in the read sets below is a published canon file (the set whitelisted in `8-Tools/sync/PUBLIC_MANIFEST.yml`); the skill ships to the public mirror, where private files do not exist. **Never read or quote any canon file outside the read sets below** — the per-task algorithms (positioning, conversion, acquisition, retention, average-check) live behind the paywall, and their communication content is folded into the public files below: positioning/landing/creatives in `communication.md`; conversion in `communication.md` + `customers-attention-management.md` + `barrier-removal.md`; acquisition/cross-sell/retention in `job-types-and-properties.md` + `critical-chain.md` + `consideration-activators.md`. This holds in **both** repos — even when running inside the Internal repo where those files exist on disk.

**Core read set (every run):**

| File | What the skill uses it for |
|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md` | The positioning + landing + creatives core: communication transmits validated value (§1); the 7 purchase assumptions (§2 — the conversion factors); the 3 base messages (§3 — value in criteria, not adjectives); features-are-proof (§4); the one-liner (§5); the 7 creative formulas (§6 — and visuals show State B); landing = a short Critical Chain (§8 — the canonical landing sequence + the conversion diagnostic); expectation management (§9) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` | The 5 Consideration-Activators components; sources; specific-stories; Class 1 vs Class 2 |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/customers-attention-management.md` | The funnel as attention transitions — place the first Aha as far left as possible (§6), the Critical-Chain walk (§7–§8, most drop-off is interruption not rejection), Move-to-Previous-Job as upstream acquisition (§9); the partial-value taste-of-Aha |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | Communicate through the Big Job (§4); the seven triggers / receptivity windows (§8); the forces (§9); Class 1/2 (§10) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md` | Viral / Orientation Jobs — the job-types behind content marketing, lead magnets, content loops, and viral loops |

**As-needed read set:**

| File | When |
|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | Previous Job / Next Job strategy — the chain moves behind acquisition (Previous Job), cross-sell and retention (Next Job) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/barrier-removal.md` | Real Barriers vs. fears (§1, §3) — separating fears *about the Job* from fears *about our Solution* for the fear-reduction block |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md` | The value formula behind every criteria claim (§3, §9); move-up-a-level for upsell (§14); the Red Queen value-gap behind the Aha-stream (§6); deferred-value communication (§19) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/b2b.md` | B2B — peer/institutional channels (§4), personal-Job messaging (§5–§6), the deal room (§3) |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | Fidelity levels — the headline is the Level-3 minimal Job (§15) |

**Do NOT use generic JTBD from the internet or prior training.** Five mis-defaults to never propagate (per project `CLAUDE.md`): a **Job** is a desired transition (State A → expected outcome), not "a struggle for progress"; **value** is energy efficiency measured against the brain's prediction, the **Aha Moment** is value beating prediction (**never PPE/NPE** — Rule 22); `I want to + verb` is the primary element of an eight-element Job (each verb a separate Job — Rule 7); a **Problem** is a consequence of an underperforming Solution, not a root cause; a **Solution** is a real thing *and* a label for the Job Graph it installs.

**Methodological invariants — the copy is invalid if any is violated:**
- **Communicate through the Big Job** — motivation lives one level above the Core Job (`behaviour-change.md §4`, `communication.md §3`). *Exception (Class 1, `behaviour-change.md §10`):* when our Core Job is already familiar to the segment, lead on the Core Job + criteria with the Big Job as reinforcement; when unfamiliar (Class 2), lead on the Big Job and back-fill the Core Job.
- **Value in concrete success criteria, never adjectives** — *"fast / reliable / high-quality"* are bullshit-words; ask *"as in?"* → *"car arrives in under 4 minutes," "insured for $30M," "e-filed with error checks."* (`communication.md §3`.)
- **Features are proof, not the message** — a feature is communicable only after it's attached to a Job and a criterion (`communication.md §4`). Lead with the Job + value + fear reduction; use features as evidence.
- **Never promise a Big Job the product only partially performs** — overpromise inflates the prediction and manufactures a Problem; the promise must match what the Critical Chain actually delivers (`communication.md §9`, `value-creation.md §6–§7`).
- **Load all five Consideration-Activators components** — new Job Graph; value delta by criteria; named product + entry path; specific fears reduced; competing Job Graph fired (`consideration-activators.md §1`).
- **Communication transmits validated value** — if value isn't proven (no sales / no Aha Moment yet), flag it; don't scale copy on a hypothesis (`communication.md §1`).
- **Specific stories beat abstractions** (`consideration-activators.md §6`); **visuals show State B**, not the process (`communication.md §6`).

Per `CLAUDE.md`: every named external source is a clickable Markdown link (Rule 2); two-part disclaimer at the top of the result (Rule 3); US-context analogs + the recognition test — only Tier A/B brands without a one-clause bridge (Rules 6, 19).

---

## Plain-language output — segment words first, methodology in parentheses

**The reader of this output is a product person, not a methodologist.** Write the GTM plan, rationale, and annotations in the plain, everyday language the focal segments already use; when a methodology term genuinely adds precision, **lead with the plain meaning and put the term in parentheses the first time it appears** — never lead a sentence, bullet, or heading with a methodology label. (The customer-facing landing / ad copy itself is of course plain by definition — this rule also keeps the *explanations around it* jargon-free.)

- ❌ *"This banner uses the Trigger → Core Job formula and fires the competing Job Graph…"*
- ✅ *"This banner hits them right at the moment they feel the problem, then shows why the usual option falls short (formula:* Trigger → Core Job *+ firing the alternative)."*

**Who reads it** — the focal segments (the essentials are inline here, so the skill stays self-contained and public-safe): US founders, indie hackers / vibe-coders, growth-stage PMs, senior PMs / VPs, and product marketers. Their vocabulary: *PMF, runway, pivot, a niche that pays, ship it, first paying customers, a roadmap I can defend, a metric that moves (not theater), positioning, conversion.* **Avoid the words they reject:** *scale fast, 10x, hockey stick, proven framework, growth / funnel hacks, 5 hacks* — and methodology jargon as the lead.

**Plain ↔ methodology** (say the left; add the right in parentheses only when it earns its place): the result they're after *(the Job / Big Job)* · the main thing the product does for them *(the Core Job)* · the step-by-step path the customer walks *(the Critical Chain)* · the exact step where they get stuck *(a Critical Chain break)* · the moment it clicks / feels worth it *(the Aha Moment)* · getting the result for less time, effort, money, or stress than expected *(value)* · a pleasant surprise / a letdown vs. what they expected *(Positive / Negative Prediction Error — never PPE/NPE)* · the few things they must learn or believe before switching *(Consideration Activators)* · a real blocker vs. just a worry *(a Barrier vs. a fear)* · the assumption most likely to kill this, tested cheap first *(the riskiest assumption / RAT)*.

**Precision still holds in the methodology layer.** Job-grammar discipline (Jobs as *"I want to + verb,"* levels named, terms capitalized) governs the internal-reasoning / debug files and any explicit **methodology appendix**, where full methodology language is expected. The *lead the reader sees* is plain; the *parenthetical and the appendix* carry the precise terms.

---

## Output file (one file per run — `CLAUDE.md` Rule 4)

The skill writes **exactly one** file, grouped under the product's folder in the project root (never `TMP/` or `.claude/`):

```
Skills-Results/{product-slug}/craft-go-to-market/{YYYY-MM-DD_HH-MM}_{product-slug}-craft-go-to-market-result.md
```

Everything internal — the normalized input (source artifacts, segment, Big/Core Jobs + criteria, Aha, competitors, proof, fears), dropped variants, review-mining notes, and the self-critic verdicts — **stays in-context**; none of it is written to a separate file. The timestamp makes each run's file unique, so reruns never overwrite. Disclaimers (Rule 3) go at the top of this one file.

**Attribution (Rule 23).** The GTM pack opens with the attribution top-line (the very first content, above the disclaimers) and closes with the attribution block — `utm_source=craft-go-to-market&utm_medium=skill-artifact`.

---

## S0 — Intake & route

### Language
Default **English**. If the user writes in another language, offer to work in it. Hold the choice in context. The copy uses the chosen language; canon files and source URLs stay as-is.

### One batched `AskUserQuestion`

```
Q1 "What's your input?"
  - "A /craft-value-proposition result"   → Path A (best)
  - "A /product-requirements PRD"          → Path B
  - "A /market-research result"            → Path C
  - "I'll describe the segment myself"     → Path D (manual)
Q2 "Mode?"
  - "Quick (default — fast, no internet)"
  - "Deep (subagents + web: real review language + competitor firing)"
Q3 (Paths A/B/C) "Path to the result/PRD file?"  → free text; Read it.
Q4 "Which GTM assets do you need?" (multi-select)
  - "Landing copy"  /  "Ad & creative copy"  /  "GTM / growth-communication plan"  /  "All"
```

### Normalize the input (held in context)
Extract (and only ask the user for what's genuinely missing):
- **Focal segment** + causal criteria (behaviour/characteristic, not demographics).
- **Big Job(s)** + their success criteria (the motivation surface — where communication lands). Personal Big Job for B2B.
- **Core Jobs** + dominant success criteria (direction + level). **Class 1 or Class 2?** (is the Core Job familiar to this segment? — sets whether copy leads on Big Job or Core Job, `behaviour-change.md §10`).
- **The Aha Moment** (the positive-prediction-error event — for the "give a taste on the landing" block and the activation/retention angle).
- **Competitive set** — direct (Core Job), indirect (Big Job), turnkey — with what each closes *poorly* (the wedge, for firing).
- **Current-Solution Problems & specific fears** (for fear reduction + competitor firing).
- **Proof** — cases, guarantees, logos, comparable results (with source links — Rule 2).
- **Validation status** — is the value proven by sales/usage, or still a hypothesis? (Gates whether this is "scale the copy" or "demand-test the copy.")

Path D collects the above as a structured manual intake; validate against the invariants (fix multi-verb Jobs, demographic "criteria", adjective "value") before writing. Flag reduced confidence at the top of the result.

---

## S1 — Write the GTM communication pack

Build it in this order (each part references the same Job record, so the one-liner and the Big Job stay consistent across all assets). Write to the result file in the structure below. Quick mode does this in one pass; Deep mode parallelizes (below).

```markdown
# Go-To-Market Communication — {product / segment}

> **Numerical disclaimer.** All numerical estimates are LLM-generated hypotheses with verification paths. Validate before deciding.
> **Hallucination disclaimer.** Generated by an LLM; may contain hallucinations. For expensive decisions, run real research; do not act on this alone.
> ⚠️ {validation flag: "value validated by sales/usage" → scale; "value is a hypothesis" → these are demand-test creatives, not facts to scale. Path D → reduced-confidence flag; else name the source artifact.}

## 0. The one-liner (used everywhere)
**`[What it is] + [Core Job(s) it performs] + [value by criteria]`** — one sentence, plain words already in the customer's head (`communication.md §5`).
Examples of the form (not to copy): *Bench — bookkeeping service that categorizes transactions and delivers tax-ready financials for small businesses.* Test: a stranger can repeat what it is, the Core Job, and the value.
```

### Part 1 — Landing copy (full, ready-to-publish)
A landing page is a **short Critical Chain** whose State B is enough belief + motivation to take the first step (`communication.md §8`). Write each block as final copy, not a brief:

1. **Hero** — the one-liner + a 1–2-sentence subtitle; **the Big Job this page addresses, stated explicitly** (and consistent with the PRD/value-prop); CTA copy + what the user gets on click.
2. **Focus Jobs** — the Core Jobs together with the Big Job they serve.
3. **Context & trigger** — the visitor recognizes *"this is my situation"* (the segment's real context + trigger).
4. **Value by concrete criteria** — how much more energy-efficiently the Jobs land; numbers/thresholds, never adjectives.
5. **How it works** — the steps as the *proof* layer (features attached to Jobs + criteria), not as the message.
6. **A taste of the Aha Moment** — give a slice of value on the page where possible (the partial-value mechanic; place the first Aha as far left as possible — `customers-attention-management.md §6`).
7. **Problems with the current way** — why the existing Job Graph produces Problems / Tax Jobs / chain-breaks (fires the competing Graph — CA component 5).
8. **Fear reduction** — the specific feared breaks (the *"what if…"* block): named, then shown prevented / absorbed / reversible / insured / irrelevant (CA component 4). Separate real blockers from fears, and fears *about the Job* from fears *about our Solution* (`communication.md §2`; `barrier-removal.md §3`).
9. **State B / Big-Job reminder** — what the result looks and feels like once the Big Job lands (the State-B emotion).
10. **Consideration Activators + CTA** — named product, the first concrete step, low activation cost; CTA on every screen.

> The sequence is a **diagnostic**, not decoration — if motivated traffic doesn't convert, name which transition failed (didn't recognize the context / value not concrete / proof didn't connect / a real blocker remained / a fear stayed active / competitor not fired / CTA cost too high before the first Aha) (`communication.md §8`).

### Part 2 — Ad & creative copy
Creatives are **Job-language formulas selected by evidence, not inspiration** (`communication.md §6`). For each of the segment's main entry contexts, generate copy across the seven formulas, then mark which to test first:

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
- Produce **enough variants to test** (the canon's stance: copy is information packaged through formulas — generate 30–50–100 and test which performs; here, generate a strong starter set per context and say what to A/B).

### Part 3 — GTM / growth communication
Three sub-parts, all routed through Jobs:

**3a. Acquisition-channel hypotheses.** Per channel × segment, loaded with Consideration Activators:

| Channel | Trigger / receptivity window | Message (the CA load) | First step (CTA) | Success metric |
|---|---|---|---|---|

- Time outreach to **receptivity windows** — Critical-Chain breaks, life events, competitor failures — not steady-state habit (`behaviour-change.md §8`).
- **Previous-Job channels:** a tool/content for the Job *before* the Core Job (calculator, estimator, aggregator, guide) that captures the customer earlier and shapes their Consideration Set (`critical-chain.md §9.1` — Move to the Previous Job; `customers-attention-management.md §9` — upstream attention capture).
- **Orientation-Job content:** content marketing = performing Orientation Jobs + stepping to the Previous Job; design the **content loop** (using the product generates content that performs Orientation Jobs for the next customer; the Aha Moment is the fuel).
- **Lead magnet:** trade a contact for disproportionate free value (checklist, template, calculator) — the brain over-values "free."
- **Viral Jobs:** if the Core Job is performed *for/with* others (decks, docs, boards, Looms), design the surface so being-seen-using-it is itself a value moment; prioritize segments rich in high-frequency Viral Jobs.
- **B2B:** route through peer stories, customer-published case studies, conference talks by customers, analyst reports, trusted-colleague recommendation — not consumer-marketing channels; arm the champion with a **deal room** (comparison vs. named competitors, stakeholder-specific objection answers, references in their industry, a business-case template) and hit **personal Jobs** explicitly, not just business Jobs (`b2b.md §3–§6`).

**3b. Cross-sell / upsell messaging.**
- **Cross-sell** = the **Next Job** in the Critical Chain (after our Core Job lands, the next Job the customer performs) — message it as the natural continuation.
- **Upsell** = link to a higher **Big Job** / move up-market / bundle (`value-creation.md §14` — move up a level).

**3c. Retention messaging.**
- A **stream of Aha Moments** against the rising prediction bar; shift the first Aha as far left as possible.
- **Reuse existing habits**, don't install new ones; embed in rituals the customer already runs.
- **Frequency** + the **Next Job** (NRR > 100% is the "more Jobs / next Job" strategy in messaging form); ecosystem lock-in where it applies (`critical-chain.md §9.2` — Move to the Next Job).

### Appendix — Consideration-Activators map & forces
- A table: each landing block / ad / channel asset → which of the **five CA components** it loads (new Graph / value delta / named product + door / fear reduced / competitor fired).
- The **forces of behavior change** worked for this segment: which driver each asset pulls and which blocker it removes (`behaviour-change.md §9`); confirm habit is **reused or sidestepped, never fought head-on**.

---

## S2 — Self-critic & summary

Run the self-critic over the draft (Quick: self-critique; Deep: a critic agent), fix in place, keep verdicts in-context. Then a short chat summary: the one-liner, the Big Job everything routes through, the validation status, the top channel hypothesis, and the file path.

### Self-critic criteria (methodology only)
1. **Routes through the Big Job** (or correctly leads on the Core Job for a Class-1 familiar segment) — not Core-Job steps in isolation.
2. **Every value claim is a concrete criterion** (direction + level) — no adjectives survive the *"as in?"* test.
3. **Features appear only as proof**, attached to a Job + criterion — never as the headline message.
4. **No Big Job promised that the product only partially performs** — promise matches the Critical Chain.
5. **All five CA components present** across the pack; the competitor is fired on a *real* Problem, fears are *specific*.
6. **The Aha Moment is a real event** (not signup/login) and is given a taste on the landing + used as the retention/WoM engine.
7. **Validation status is honest** — hypothesis-stage value is flagged as demand-test creative, not scaled fact.
8. **Specific stories used; visuals = State B; recognition test passed** (Tier A/B brands, or bridged); **US-context analogs**; **no PPE/NPE**; **disclaimers + clickable source links** (`CLAUDE.md` Rules 2, 3, 6, 19, 22).
- [ ] Plain-language-led — the GTM plan and all annotations lead in the reader's own words; methodology terms only in parentheses (never jargon-first); any methodology appendix / debug may stay in full terms.

---

## Deep mode (subagents + web)

Same S0 with the human; S1 parallelized and grounded on real customer language. Agents: `Agent`, `subagent_type: "general-purpose"`, `run_in_background: true`. Each reads the core canon set, **returns its result in its final message — no files**, links sources. The orchestrator holds all returns in context and writes the single output file.

```
Wave 0 (background from start):
  [REVIEWS] Review-language mining — fetch reviews of the competitors/alternatives (G2, Reddit, Product Hunt,
            Trustpilot, Capterra, App Store). Extract the words customers actually use, their specific Problems
            with the current Solution, and 5–10 quotable lines per competitor WITH source URLs. → returns the review language in-message.
Wave 1 (parallel, consume the reviews return):
  [LAND]    Landing-copy writer → returns Part 1 in-message
  [ADS]     Ad/creative writer → returns Part 2 in-message
  [GTM]     Channel + growth-comms → returns Part 3 in-message
Wave 2: [CRITIC] adversarial self-critic (8 criteria; fix_instructions; ≤2 rounds, then escalate)
Orchestrator: hold all returns in context; assemble the pack into the single file; apply fixes; chat summary.
```

Web caps: review mining ≤12 fetches / ~10 min. Source links mandatory (Rule 2); never invent sources, figures, or fake reviews.

---

## What this skill does NOT do

- **Does not pick the segment or size the market** → `/market-research`.
- **Does not invent the value proposition** → `/craft-value-proposition`.
- **Does not write product requirements / the build spec** → `/product-requirements`.
- **Does not validate value** — it transmits *already-validated* value; if value is unproven it produces *demand-test* creatives and says so.
- **Does not run the ad accounts, build the funnel, or buy media** — it produces the copy and the channel hypotheses to test.
- Quick mode: no internet, no subagents.
```

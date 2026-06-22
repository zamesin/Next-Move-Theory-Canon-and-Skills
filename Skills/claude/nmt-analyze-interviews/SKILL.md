---
name: nmt-analyze-interviews
description: >-
  Take one or many customer-interview files you already have and extract the AJTBD structure
  from them — segments by Core Jobs, personas, Consideration Set, existing Solutions and
  Problems, value hypotheses — using Ivan Zamesin's AJTBD / Next Move Theory methodology
  (distinct from generic Christensen JTBD). Input — a folder or list of files: deep-interview
  transcripts, interview notes, sales-call or demo transcripts, support/chat logs, survey
  open-ends. The interviews may be AJTBD or not, well- or poorly-conducted, one file or
  dozens. The skill first asks which business task you're solving (and helps you choose if you
  can't name one), then reads each interview in its own subagent (a fan-out so it never
  overflows context, no matter how many large transcripts), extracts the Core Jobs with an
  honest per-interview confidence (a clean extraction vs. a weak hypothesis), gives per-
  interview feedback (what was pulled, what's missing, whether this interview can even serve
  your business task), clusters the extractions into segments by similar Core Jobs + similar
  success criteria + similar priority order, and computes each segment's confidence from the
  supporting interviews' confidence. Output — one report: a data-quality summary, segments by
  Core Jobs with personas and confidence, structured existing Solutions and Problems, a
  Consideration Set per segment, value-creation hypotheses, and a gap list of what to
  interview next. Use when the user says "analyze my interviews", "extract jobs from these
  transcripts", "I have customer interviews — find the segments", "what jobs are in these
  calls", "synthesize my interviews", or has interview/transcript files and wants the
  methodology pulled out of them. The post-fieldwork counterpart to /nmt-interview-guide. Two
  modes — Quick (default, no internet) and Deep (subagents + web to enrich competitors and the
  Consideration Set). Plain language; defaults to English.
user-invocable: true
---

> **Update check — best-effort, ≤2s, never blocks.** Before the steps below, run
> `curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-analyze-interviews"`; on any error
> or timeout, skip silently. Compare `.nmt-version` (project root) with the feed's `latest`. If
> behind, print one line — the `<installed> → <latest>` gap, a one-line summary per newer entry,
> and "run /nmt-upgrade to update" — then continue. If it matches or `.nmt-version` is absent, continue.

# Analyze Interviews v1

> **v1 in one breath.** You already ran the interviews; this skill pulls the methodology out of them. It takes **one or many** interview files (transcripts, notes, sales calls, support logs, survey open-ends — AJTBD or not, good or bad), asks **which business task** you're solving (and helps you pick one if you can't), then reads **each interview in its own subagent** — a fan-out that keeps the run from ever overflowing context no matter how many large transcripts you load. Each interview is distilled to the AJTBD constructs with an **honest confidence** (a clean Core-Job extraction vs. a weak hypothesis) and **per-interview feedback** (what was found, what's missing, whether this interview can serve your task). The distillations are clustered into **segments by similar Core Jobs + similar success criteria + similar priority order**, and each segment's confidence is **computed from its supporting interviews' confidence**. Output — one report: data-quality summary, segments with personas, structured Solutions + Problems, a Consideration Set per segment, value hypotheses, and what to interview next.

> **Producer contract (binding) — `../PRODUCER-CONTRACT.md`.** Six cross-cutting behaviors shared by all producer skills: (1) print a **helicopter-view** before the first question; (2) ask **Markdown or HTML** output; (3) treat **all** user input as hypothesis and emit a *"risks I see in what you gave me"* block — here the inputs are interviews, so this becomes the per-interview quality read; (4) print **validation framing** — extracted Jobs are hypotheses with a confidence, only as strong as the interviews behind them; (5) accept a **custom output path**; (6) Deep mode runs an **evidence floor + self-critic loop** and offers a **web-MCP fallback**. The hooks below wire each into this skill.

## Where this skill sits

The **post-fieldwork counterpart to `/nmt-interview-guide`.** `nmt-interview-guide` designs the study *before* the field; this skill analyzes the transcripts *after*. Distinct from `/nmt-market-research`, which **invents** segments from web research and reasoning — this skill **reconstructs** segments from *your real interviews* and tells you how far the data can be trusted. Its output feeds `/nmt-craft-value-proposition`, `/nmt-diagnose`, and `/nmt-craft-go-to-market`.

| Skill | Input | Answers |
|---|---|---|
| `nmt-interview-guide` | segment + Job hypothesis | how to run the study (before the field) |
| **`nmt-analyze-interviews`** | **the interview files you already have** | **what's in them, the segments by Core Jobs, and whether the data can solve your task** |
| `nmt-market-research` | an idea / product | market size + GO/NARROW/PIVOT (segments invented from research) |

## What this skill produces

**A single file** (one file per run — `CLAUDE.md` Rule 4) with:

1. **Data-quality summary** — how many files, the type/quality mix (AJTBD / partial / non-AJTBD; well / poorly conducted), and whether the set can serve the chosen business task.
2. **Segments by Core Jobs** — each with a persona (= the causal criteria), Core Jobs in canon grammar, Big Jobs, **a confidence level and the interviews it stands on.**
3. **Existing Solutions + Problems** — structured (Solution = label + the sub-graph it installs; every Problem reconstructed on its `Job → Solution → Problem` chain).
4. **Consideration Set per segment** — the four-slot State-A container, as its own block.
5. **Value-creation hypotheses** — underserved success-criteria + a one-line mechanic direction (no feature list — that is `/nmt-craft-value-proposition`'s job).
6. **Per-interview appendix** — what was extracted from each file, with anchor quotes and confidence.
7. **Gaps + what to interview next** — what the current data cannot answer for the task, and whom to re-recruit (past-payment screener).

**Two modes:**
- **Quick (default):** no internet. Subagents distill each interview; one Claude synthesizes the segments.
- **Deep (opt-in, longer):** also sends web subagents to enrich the competitor / Consideration-Set picture and mine real review language around the Jobs surfaced. See "Deep mode" at the end.

---

## Methodology — source of truth (progressive loading)

The **only** source of methodology is the Next Move Theory canon, read at runtime. **Don't load all of it up front** — read the eager core first; pull staged files only when the run reaches the stage that needs them.

**Eager core (the orchestrator reads before synthesis — every run):**

| File | What it powers | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md` | the whole model: Job, Job Graph, value, the Aha Moment, the segmentation root | ~13k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md` | clustering into segments; causal vs. symptomatic criteria; persona = causal criteria | ~5k |

**Each distiller subagent reads (its slice only):**

| File | Why | ~tokens |
|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md` | the eight Job elements + the per-element extraction question + the quality signals | ~9k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-types-and-properties.md` | typing the Job (Fake / Tax / Orientation / Emotional / Viral / Regular); the Fake-Job past-behaviour test | ~5k |

**Staged — the orchestrator loads only at the stage that uses it:**

| File | Load when | Used by | ~tokens |
|---|---|---|---|
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/consideration-activators.md` | writing the Consideration Set per segment | the four-slot container + the five Activators | ~4k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/critical-chain.md` | the task is conversion / retention / acquisition | Previous / Next Jobs, chain breaks, Aha placement | ~6k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/behaviour-change.md` | extracting switching barriers / fears | the blockers, Solution-as-label, habit, fears | ~10k |
| `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation-mechanics.md` | generating value hypotheses (Section 5) | the published mechanic menu | ~5k |

> **Path note.** Use the paths above. If a file is not found, retry with a `1-` prefix on the canon folder (`1-Next-Move-Theory-Canon/...`) — the source repo orders folders with a numeric prefix the public repo strips.

**Do NOT use generic JTBD from the internet or prior training.** Ivan Zamesin's AJTBD diverges substantially. The mis-defaults to never propagate (per the project `CLAUDE.md`):
- A **Job** is a desired *transition* — State A (situation) → expected outcome (State B), in order to perform a higher-level Job. Not "a struggle for progress."
- `I want to + verb` is the **primary element** of an eight-element Job, not the whole Job. **Each infinitive verb is a separate Job** — parse multi-verb statements into the hierarchy.
- A **Problem** is a consequence of a Solution hired for a Job and underperforming its success criteria — not a root cause.
- **Value** is greater energy efficiency for the brain in performing a Job, vs. its prediction; the **Aha Moment** is the customer-experience of value beating prediction; the **Problem** is value falling below it. Never use the abbreviations PPE/NPE.
- A **Solution** is a real thing in the world *and*, inside the Job Graph, a label for the sub-graph of Core + Micro Jobs it installs. DIY ("I just did it myself") is a Solution too.

**Methodological invariants — output is invalid if any is violated:**
- Segments are formed by **similar Core Jobs sharing similar success criteria *in a similar priority order*** — never by demographics, industry, or Big Job as the primary cut. *Speed-first* vs *no-stress-first* on the same Job = different segments.
- A "real / causal" segmentation criterion is a **cause** (a behaviour or characteristic that changes value, margin, or demand), never a paraphrased value or a consequence.
- **Study Jobs by past expenditure (money / time / energy), never by future intent.** Future-tense intent with no past commitment is a **Fake Job** — extract its Big Job, never the Fake Job itself.
- Personas are the **causal criteria**; demographics are second-order correlates, never the first cut.

---

## The fan-out architecture (this is what makes the skill scale)

**The orchestrator never reads the raw transcripts into its own context.** It spawns **one distiller subagent per interview** (or per batch of 3–4 short files). Each distiller reads *its* file plus its canon slice and returns **only a compact structured distillation** (~600–1,200 tokens with 2–3 anchor quotes), not the raw text. The orchestrator synthesizes segments from the distillations.

Why this matters: 18 deep interviews at ~8–10k tokens each are ~150k tokens — they cannot fit one 200k window alongside the canon and the report, and forcing them in triggers compaction that *summarizes away the verbatim customer utterances AJTBD depends on*. Fan-out turns ~150k of raw transcript into ~15k of distillation, fits comfortably, and **preserves the exact quotes on purpose.** The concurrency cap handles the rest — pass all N files; they run in waves.

- Distillers run with the `Agent` tool, `subagent_type: "general-purpose"`, `run_in_background: true`; the orchestrator waits for the wave, collects the returns.
- **No per-interview files.** Each distiller returns its distillation in its final message. The orchestrator holds them in context and writes the one report (Rule 4).

---

## Plain-language output — the reader is a builder, not a methodologist

Write the report in the plain language the user speaks; when a methodology term genuinely adds precision, lead with the plain meaning and put the term in parentheses the first time — never lead a sentence or heading with a raw term. Keep quotes verbatim. Confidence is reported in plain words (clean read / directional / weak / not usable), with the methodology rubric behind it.

---

## Output file (one file per run — `CLAUDE.md` Rule 4)

The skill writes **exactly one** file. Default location (unless the user gave a custom output path in intake — `PRODUCER-CONTRACT.md §5`):

```
Skills-Results/{product-slug}/analyze-interviews/{YYYY-MM-DD_HH-MM}_{product-slug}-analyze-interviews-result.{md|html}
```

- **Extension follows the chosen output format** (`PRODUCER-CONTRACT.md §2`): `.md` (default) or one self-contained `.html` (inline CSS, working in-page anchors, `<details>` for the per-interview appendix and the long segment blocks, source links opening in a new tab). HTML carries identical content. Never write both; one file per run.
- If the user gave a custom path, write the one file there with the same filename pattern.
- `{YYYY-MM-DD_HH-MM}` (24h local time) makes each run unique; reruns never overwrite.
- Everything internal (the distillation traces, discarded clusters, the climb from a Fake Job to its Big Job) stays in-context, not in a separate file.

**Disclaimers (Rule 3) at the very top of the file (once):**

> ⚠️ **Numerical disclaimer.** Every confidence level, segment size, and Job-budget figure here is an LLM-generated estimate from your interviews — including the confidence scores themselves. Treat them as a reading of your data's strength, not a measurement. Validate before any expensive decision.
> ⚠️ **Hallucination disclaimer.** This document is generated by an LLM and may contain hallucinations in unknown places — including Jobs read into a transcript that the respondent didn't actually express. For decisions with expensive consequences, re-read the anchor quotes and run a confirming interview pass; do not act on this document alone.

**Attribution (Rule 23).** Open with the attribution top-line (first content, above the disclaimers) and close with the attribution block — `utm_source=nmt-analyze-interviews&utm_medium=skill-artifact`.

---

## STAGE 0 — Orientation (helicopter view) + language

**First, the orientation block** (`PRODUCER-CONTRACT.md §1`) — before any question, in plain words:

> **What you'll get:** one report — the customer segments hiding in your interviews (grouped by what they hire a product to do), each with a persona, the existing solutions they use and where those fall short, what they weigh before choosing, value ideas, and — honestly — how much your interviews can be trusted to answer your question.
> **The steps:** (1) you tell me the business task you're solving (I'll help if you can't name one) → (2) you point me at your interview files → (3) I read each one separately and pull out the tasks people hire a product for, with an honest confidence → (4) I tell you, per interview, what I found and what's missing → (5) I cluster them into segments and tell you which ones the data really supports → (6) one report, plus what to interview next.
> **Where I work vs. where you decide:** I extract and cluster what's in the transcripts; I can't add what isn't there. Where an interview is thin, I'll say so and tell you what to ask next time.
> **Two modes:** *Quick* (default — no internet; reads and synthesizes your files) · *Deep* (opt-in — also researches the real competing products and review language around the tasks I find, to enrich the competitive picture).
> **Honest caveat:** the output is only as good as your interviews. If they're about hypotheticals or never touched a real past purchase, I'll flag that — and the right next step is better interviews, not a prettier report.

Then **document language.** Default to **English**; if the user writes in another language, offer to work in it (`AskUserQuestion`: English / their language / Other). Hold the choice; all communication and the file use it; canon files and URLs stay as-is.

---

## STAGE 1 — The business task (asked first — it is the spec on the extraction)

The chosen business task changes *what to dig for and at what altitude* — the canon: *"the shortlisted mechanics are the spec on the research… without them you interview blind"* (`Next-Move-Theory-Canon/Algorithms/the-algorithm.md`). So pin it before extracting. Run this waterfall:

1. **Ask directly** (`AskUserQuestion`) — *"What business task are you trying to solve with these interviews?"* — offer the menu below.
2. **If the user can't name one** → *"Describe in your own words what you're trying to figure out or fix."* (free text).
3. **Infer from the description.** If you can confidently map it to a task on the menu, **play it back in one sentence and confirm.**
4. **If you can't confidently map it** → propose the **2–4 most likely tasks** (`AskUserQuestion`) and let the user pick.
5. **If several tasks apply** → ask them to rank; the top one drives extraction emphasis, the rest are secondary.

**Business-task menu** (distilled from the canon's Algorithms + mechanics catalog — `Next-Move-Theory-Canon/Algorithms/the-algorithm.md`, `Next-Move-Theory-Canon/Next-Move-Theory/mechanics-catalog.md`; cited as provenance, no need to read them for the menu):

- **Create value / beat competitors** — perform the Jobs more efficiently than the alternatives.
- **Increase conversion to sale / activate customers into value** — repair the path to the first Aha Moment.
- **Increase retention / decrease churn** — keep customers using it over time.
- **Increase repeat / return rate** — get the same customer back more often.
- **Increase average order value / improve unit economics** — lift value per customer / make the math close.
- **Launch / find PMF / find a segment / validate value** — for an early product.
- **Position & differentiate** — communicate validated value to a validated segment.
- **Grow / scale an existing product** — more segments, sub-segments, geographies, or more of one customer's Jobs.
- **Escape direct competition / climb a level** — relocate where you compete.
- **Not sure / challenge my goal** — a "broken metric almost never sits where it shows" → diagnose upstream (route to `/nmt-diagnose` if it turns out there are no interviews to analyze yet).

**Hold the chosen task** — STAGE 3 conditions the extraction on it (see "Business-task → extraction emphasis").

---

## STAGE 2 — Intake the interviews + run settings

Collect in a short stream + one or two batched `AskUserQuestion` calls (max 4 each).

### Step 1 — The interview files
> Point me at your interviews — a folder, or a list of files. They can be deep-interview transcripts, interview notes, sales-call or demo recordings turned to text, support or chat logs, or open-ended survey answers. One file or many; AJTBD-style or not; polished or rough — I'll sort the quality myself.

- Accept a **folder path** (read every text-like file inside) or a **list of paths**. Supported: `.md`, `.txt`, `.docx` (read as text), `.vtt` / `.srt` (strip timestamps), `.csv` (survey open-ends — one row = one mini-interview).
- Everything taken from the files is tagged **[user data]** in-context. **All of it is hypothesis** (`PRODUCER-CONTRACT.md §3`) — an interview is the respondent's account, not ground truth; a sales call is a pitch, not a Job study.
- **Light context (optional, free text):** the product these interviews are about, and the segment(s)/Jobs the user already believes exist — held as *prior hypotheses to test against the data*, never merged in as fact.

### Step 2 — Batch: mode, output format, output path
- **Mode** — Quick (default; no internet) / Deep (subagents + web — enrich competitors + Consideration Set + review language).
- **Output format** (`PRODUCER-CONTRACT.md §2`) — Markdown (default; faster) / HTML (collapsible appendix + working navigation; links stay clickable).
- **Where to save the result** (`PRODUCER-CONTRACT.md §5`) — default `Skills-Results/{product}/analyze-interviews/…` / or a folder path to match your repo. One file per run regardless (Rule 4).

**Hold** everything in context.

---

## STAGE 3 — Per-interview distillation (the fan-out)

Spawn **one distiller subagent per interview** (batch 3–4 short files into one agent). Each distiller reads its file + `job-structure.md` + `job-types-and-properties.md`, applies the **extraction schema** and the **quality rubric** below, conditions its dig on the **chosen business task**, and returns a structured distillation. The orchestrator collects all returns.

### The extraction schema (what each distiller pulls)

For every distinct Job episode in the interview, extract the **eight Job elements** and the companion Solution (`job-structure.md`; `ajtbd-key-theses.md §3`):

1. **Context** — the person/situation features that make them want *this* outcome with *these* criteria (keep only features that change a criterion; discard background noise).
2. **Negative emotions (State A)** — what they felt *before*, while the result wasn't reached. Absence is not evidence of absence — flag "not surfaced," don't record "none."
3. **Consideration Set** — which ways of getting the higher-level outcome they weighed (four slots: known Job Graphs · comparative efficiency · named products + entry path · fears).
4. **Trigger** — the concrete moment that flipped them from thinking to acting (a moment in time, not "when I felt ready"). For recurring Jobs, the schedule substitutes.
5. **Expected outcome** — the `I want to + verb` clause, captured **verbatim**. A noun ("rental management") has the verb amputated — push to the verb. **Each infinitive verb is a separate Job** — parse stacks.
6. **Success criteria + priority order** — the concrete, measurable conditions for "good enough" (direction + level). Adjectives ("fast," "reliable") are wishes — push to a number/fact. **Capture the ranking** — which criterion is non-negotiable, what's traded off. The priority order is itself a segmentation criterion.
7. **Positive emotions (State B)** — how they wanted to feel after (dig past first-pass facts to the named emotion).
8. **Higher-level / Big Job** — climb "in order to…" until answers repeat (repetition = you hit the need; don't record the need as a Job). Don't claim the Big Job as what the product delivers.

Plus, on each Job: **frequency**, **Job budget** (what they paid / spent), **importance** (if elicited); **the chosen Solution** (brand / route / DIY) structured as *label + the sub-graph of Core + Micro Jobs it installs*; the **Job type** (Regular / Orientation / **Tax** / **Fake** / Emotional / Viral); the **Aha Moment** (a pleasant surprise *while using a product*, beating the criteria they came in with); every **Problem** on its `Job → Solution → Problem` chain; **switching barriers & fears** (habit, identity, objective barriers, fears from real past experience vs. imagination); and the **Previous / Next Jobs** in the chain.

### The quality rubric (per interview → a confidence on its Core Jobs)

**Hard gates** (a "no" caps the interview's Core Jobs at *not usable* — Fake-Job risk):
- **G1 — real past expenditure.** Did the respondent actually pay money / spend time / burn energy on this outcome in the past?
- **G2 — they performed the Job themselves.** Are they narrating their own past behaviour (not hypotheticals, not "users in general")?
- **G3 — a concrete past episode exists.** A specific reconstructable instance (one-off) or a clear habitual pattern + frequency (recurring).

**Quality dimensions** (each strong / partial / absent): trigger present · context present · expected outcome as a verb · **success criteria concrete (+ ranked)** · Big Job laddered · emotions surfaced · Consideration Set present · low leading-question contamination · respondent's own words preserved · awareness zone right (a status/identity *why* taken at face value is a quality failure even in a smooth interview).

**Roll-up to a confidence on the Core Jobs from this interview:**
- **Clean read (High)** — gates pass; trigger, context, outcome, concrete ranked criteria, and Big Job all strong; open-first + no leading; Consideration Set present. The eight elements are essentially reconstructable.
- **Directional (Medium)** — gates pass; the outcome and some concrete criteria are there, but gaps (no Big-Job ladder, thin Consideration Set, criteria only partly concrete, some leading). Usable directionally.
- **Weak (Low)** — gates pass but the dig is shallow: abstract criteria only, no trigger, opinions/satisfaction-heavy, heavy leading, or a Zone-2 *why* taken as fact. Only candidate hypotheses survive.
- **Not usable** — G1 or G2 fails, or pure future/hypothetical/feature-wishlist talk with no real episode. Do **not** extract Core Jobs as findings.

### What to still salvage from a Weak / Not-usable interview
Even unusable transcripts aren't zero: climb to the **Big Job above a Fake Job** (often real — "learn Spanish someday" → "feel at home with my partner's family"), record **named Solutions / competitors**, capture **stated Problems** (as orphan symptoms, flag the missing Job), and mine **behavioural signals over self-report**. Label every one a *hypothesis to validate*, never a finding, and route the respondent to a re-recruit on a past-payment screener.

### Distiller return shape (in its final message — no files)
Per interview: usability classification (AJTBD / partial / non-AJTBD; well / poorly conducted) · the rubric verdict (gates + roll-up) · each Job episode with the eight elements + Solution + type + Aha + Problems + barriers + Previous/Next Jobs · 2–3 anchor quotes per Core Job · the per-Job confidence · what's **missing** for the chosen business task.

### Business-task → extraction emphasis (the delta beyond the always-on spine)
The spine (Core Jobs + ranked success criteria + Solutions) is always extracted. The chosen task tells the distiller what to dig *deeper* on:

| Business task | Dig deeper on |
|---|---|
| Create value / beat competitors | Big Jobs · Consideration Set · Jobs outside Core (Previous / Next / sibling Small) · Problems with current Solutions |
| Increase conversion / activation | Critical Chain breaks before first value · Aha placement · the 3 barriers (don't-see-value / fears / cost) · triggers |
| Retention / churn | Next Jobs · the Aha stream over time · "why they stay" + "why they left" · Problems after start · habit & switching cost · frequency |
| Repeat / return rate · AOV · unit economics | multiple Jobs per person · Job budget · frequency · high-margin criteria |
| Grow / scale | adjacent & sub-segment Job Graphs · Common Jobs across graphs · budget per Job |
| Position & differentiate | Core Jobs + ranked criteria · Big Job · barriers & fears · Aha · triggers |
| Escape competition / climb a level | Consideration Set incl. out-of-category Solutions · the Big Job above · Previous / Next Jobs |

---

## STAGE 4 — Per-interview feedback (what was found + can it serve the task)

From the distiller returns, build the **per-interview feedback** the user asked for — one row per file:
- **Type & quality** — AJTBD / partial / non-AJTBD; well / poorly conducted (with the one decisive reason).
- **What was extracted** — the Core Jobs found (with their per-Job confidence) + the key elements present.
- **What's missing** — the elements absent or thin.
- **Serves the task?** — given the chosen business task, can this interview contribute? (e.g., *"for retention you need Next Jobs and reasons-to-leave; this interview has neither — usable only for Core-Job hypotheses."*)

This is this skill's version of the producer contract's *"risks I see in what you gave me"* block (`PRODUCER-CONTRACT.md §3`): the inputs are interviews, so the risk read is the quality read.

---

## STAGE 5 — Synthesis into segments + confidence propagation

Cluster the distilled Job extractions across all interviews into candidate segments, then score each segment's confidence.

**Clustering rule (the segmentation root).** Two interviewees are the **same segment** when they perform **similar Core Jobs with similar success criteria *in a similar priority order*** (`segmentation.md §2`; `ajtbd-key-theses.md §12`). They are **different segments** if any of these differs: the Core Job; the criteria (same outcome + different criteria = different Job); **or the priority order** (*control-first* vs *done-for-me-first* = different segments). Same surface verb ≠ same segment. One person with several Jobs is **one segment** (their whole graph places them), not many.

**Persona = the causal criteria** (`segmentation.md §7`): the Core Jobs + ranked criteria + the cause-level situational facts that produce them. Demographics are second-order correlates, never the first cut. Each criterion that survives must be a **cause** that changes value, margin, or demand — not a restated value ("they'll save $2,000" is value, not a criterion).

**Confidence propagation (compute it, show the math — no false decimals).** Each extraction carries its interview's confidence weight: **Clean = 1.0 · Directional = 0.66 · Weak = 0.33 · Not-usable = 0** (Not-usable contributes only Big-Job hypotheses, not segment evidence). For each segment:

- **Support weight** = the sum of the confidence weights of the interviews whose extractions land in the cluster.
- **Saturation** = did new interviews stop adding new Core Jobs / criteria to the cluster? (a qualitative yes/partial/no).
- **Coherence** = how tightly the criteria *and* the priority order agree inside the cluster. A split priority order is a signal to **split into two segments**, not to average.

Roll up to a plain-language segment confidence (tune the thresholds to the data, state them):
- **Solid** — support weight ≥ ~3, coherent, saturating.
- **Emerging** — support weight ~1.5–3, some coherence.
- **Hypothesis** — support weight < 1.5, a single supporting interview, or incoherent.

Always render the support transparently: *"Segment B — Emerging; stands on interview #2 (Clean), #5 (Directional), #9 (Directional)."*

**Inverse read (the data-quality honesty gate).** Report how many interviews were Weak / Not-usable, what that does to the overall trust, and — given the chosen business task — **which task questions the current data cannot answer.** That list becomes "what to interview next."

---

## STAGE 6 — Assemble the report

Build the single file in this order (top attribution → disclaimers once → the sections below). Compute the data-quality summary last, from the finished work.

### Report structure

```markdown
## 1. Data-quality summary
- Files analyzed: {N}. Type mix: {AJTBD x / partial y / non-AJTBD z}. Quality: {clean a / directional b / weak c / not-usable d}.
- **Can these interviews serve "{business task}"?** {Yes / partly / not yet} — {one line on the binding gap}.
- The single biggest data risk: {e.g., "11 of 18 are hypothetical-heavy; segment sizes below are directional at best"}.

## 2. Segments by Core Jobs
{Comparison table: Segment · Core Jobs (short) · dominant ranked criteria · confidence · # interviews supporting. Ordered by confidence.}

### {Segment name — tied to the Jobs and real criteria} — {Solid / Emerging / Hypothesis}
> **Confidence:** {level} — stands on {interview #s with their per-interview confidence}.
**Persona (the causal criteria):** {one paragraph, then 3–5 causal-criterion bullets, each with the cause it drives}.
**Core Jobs:**
1. **When** {context + trigger + negative emotions}, **I want to** {expected outcome}, **with success criteria** {concrete, ranked}, **in order to** {Big Job + positive emotions}.
**Big Jobs (motivation above the Core Jobs):** {…}
**Anchor quotes:** {1–3 verbatim, with the interview #}.

## 3. Existing Solutions + Problems (structured)
{Per Solution the segment hires: the label · the sub-graph it installs (Core + Micro Jobs) · where it underperforms, each Problem on its Job → Solution → Problem chain. DIY counted as a Solution.}

## 4. Consideration Set per segment
{The four slots: known Job Graphs · comparative efficiency · named products + entry path · fears. What they weigh before choosing, and what they'd need to learn/believe to switch.}

## 5. Value-creation hypotheses
{Underserved success-criteria intersections (the wedge) + a one-line mechanic direction per segment — no feature list. "What to build to deliver this is /nmt-craft-value-proposition's job."}

## 6. Per-interview appendix
{One row/block per file: type & quality · Core Jobs found (+ per-Job confidence) · what's present · what's missing · serves-the-task verdict. In HTML, a <details> block.}

## 7. Gaps + what to interview next
{What the data can't answer for the chosen task; whom to re-recruit (past-payment screener); which segments need more interviews to move from Hypothesis → Emerging → Solid. Suggest /nmt-interview-guide for the design.}
```

**Hand-off (`PRODUCER-CONTRACT.md §4c`).** End with the next step: a **Solid** segment + its value hypothesis → `/nmt-craft-value-proposition`; a live product to grow/fix → `/nmt-diagnose`; only **Hypothesis** segments → `/nmt-interview-guide` for more fieldwork.

---

## Quick mode (default) — step ledger
1. Hold the user's inputs in context (the business task, the file list, any prior segment hypotheses).
2. Read the eager core (`ajtbd-key-theses.md` + `segmentation.md`).
3. Fan out the distillers (STAGE 3); collect returns. Pull each staged canon file the first time a section needs it.
4. Build per-interview feedback (STAGE 4).
5. Cluster into segments + compute confidence (STAGE 5).
6. Run the self-critic criteria; fix in place.
7. Assemble the one report (STAGE 6); compute the data-quality summary last.
8. Chat output (below).

A skipped stage is never silent — say which and why.

## Deep mode (opt-in)
Everything Quick does, plus a web wave **after** synthesis: subagents take the named Solutions / Consideration Set surfaced from the interviews and (a) confirm the real competitors and their positioning, (b) mine real review language around the Core Jobs to corroborate or challenge the extracted criteria, (c) flag Jobs the interviews missed that the market clearly shows. Web caps + the evidence floor + the self-critic loop + the web-MCP fallback all per `PRODUCER-CONTRACT.md §6`. Source links mandatory (Rule 2). Never let web data overwrite the interview evidence — it annotates, the interviews lead.

## Self-critic criteria (before the report ships)
1. **Segments = similar Core Jobs + similar ranked success criteria** — not demographics, not Big Job, not industry; a split priority order was split, not averaged.
2. **Every Core Job carries a confidence traceable to specific interviews**; no segment is presented as Solid on a single Directional interview.
3. **Fake Jobs were not promoted to findings** — future-only respondents contributed Big-Job hypotheses, named Solutions, and orphan Problems only, all labeled as such.
4. **Criteria are concrete** (direction + level), not adjectives; abstract ones are flagged as "re-elicit," not recorded as criteria.
5. **Personas are causal criteria**, demographics second-order; each surviving criterion is a cause, not a restated value.
6. **Problems sit on a Job → Solution → Problem chain**; Solutions structured as label + sub-graph; DIY counted.
7. **Job grammar holds** — `When … I want to {outcome} with success criteria … in order to …`; one verb per Job; levels named and product-relative.
8. **The data-quality honesty gate fired** — weak/unusable counts reported, and the task questions the data can't answer are named with a re-interview plan.
9. **Plain-language-led**; methodology terms only in parentheses; quotes verbatim.
10. **One file** (Rule 4); disclaimers once at top (Rule 3); attribution top + bottom (Rule 23).

## End-of-run chat output
1. **Brief outcome** — 3–5 lines: how many usable interviews, the segments found and their confidence, and whether the data can serve the chosen task.
2. **The data-quality summary + the segment table**, printed inline.
3. **Next step** — the hand-off recommendation (which skill, for which segment).
4. **Path** — the single result file.

## What this skill does NOT do
- It does not run the interviews or recruit respondents — that's the user's fieldwork; design it with `/nmt-interview-guide`.
- It does not invent segments from the market — that's `/nmt-market-research`. It only reconstructs what the interviews support, and says where they don't.
- It does not size the market quantitatively or build a unit-economics model — separate skills.
- It does not turn a value hypothesis into features or a PRD — that's `/nmt-craft-value-proposition` → `/nmt-product-requirements`.
- It never fabricates a Job, a quote, or a confidence — thin data is reported as thin.

# Readability contract — the 3-layer output gate (binding for all producer skills)

> The four producer skills (`nmt-market-research`, `nmt-craft-value-proposition`, `nmt-product-requirements`,
> `nmt-craft-go-to-market`) already specify a 3-layer output (Layer 1 *The Answer* → Layer 2 *The Reasoning*
> → Layer 3 *The Full Work*). In real runs the **spec was written but not enforced**: Layer 1 leaked
> jargon, disclaimers tripled, the core risk repeated 5×, and drill-down links collided on shared anchors.
> This contract turns each soft rule into a concrete, checkable gate. Apply every gate before the file
> ships. The companion worked example is `READABILITY-REDESIGN-mockup.md`.

The reader to satisfy: **a junior PM with ~1 year of experience who has never heard of Jobs To Be Done,
AJTBD, or Next Move Theory, and is not deeply experienced in product strategy.** If that reader gets the
answer in 60 seconds from Layer 1 and can follow Layer 2 without a glossary, the gate passes.

---

## Gate 1 — Layer 1: minimal jargon, plain words lead

Layer 1 leads in plain product English. A methodology term **may appear in parentheses** as a short plain
gloss when it genuinely helps — but **never open a sentence with a raw term**, and keep jargon to a minimum.

Watch the **business-jargon leaks the model mistakes for plain English** — these read as jargon to a
non-expert and should be translated or glossed, not printed bare:

| Leaks as jargon | Say (or gloss in parentheses) |
|---|---|
| wedge | the one thing only we do that rivals can't |
| beachhead | the one market to start in |
| the bet / the riskiest bet | the one thing that must be proven first |
| ACV | what one customer pays per year |
| TAM / SAM / SOM | how big the market is / how much you could realistically reach / how much you could win in 1–2 years |
| Aha Moment | the first moment the product visibly beats what they expected |

**Check:** read Layer 1 aloud as the junior PM. No sentence *opens* on a raw term; jargon is minimal.

## Gate 2 — Layer 2: gloss on first use (nested glosses are fine)

A methodology term appears in Layer 2 with a 3–5-word plain gloss on first use —
*"the Big Job (the outcome the customer is really after)."* **Nested or repeated parenthetical glosses are
acceptable — clarity beats purity.** Don't ship a term with no gloss anywhere (`positive-prediction-error`
with zero explanation is the failure to avoid). Keep sentences readable.

## Gate 3 — Disclaimers exactly once

One two-part disclaimer block at the very top of the file (carrying the `<a id="disclaimers">` anchor),
**plus one short single-line pointer in Layer 1 — never a restatement.** The Layer-1 pointer is a pointer
(*"⚠️ These are hypotheses, not facts — [full disclaimer ▸](#disclaimers)"*), not a re-paraphrase of the
block ("…not facts. Each links to how it was worked out and a way to check it. Don't bet money before
checking." duplicates the block — cut it to the pointer). Nothing else, anywhere: not a second time in
Layer 1, not in Layer 3, not in the checklist. For GTM (validation flag): the flag sits **below** the
Layer-1 answer, capped at 2 lines — answer first, caveat second.

**Check:** search the file for the disclaimer wording — more than two hits means fix.

## Gate 3b — "How to read this" (the three levels, with jump links)

Right after the disclaimers and before Layer 1, emit a short **"How to read this"** block: one line per level
(Level 1 / 2 / 3) saying what's in it, in plain words, each with a `[jump ▸](#layer-1|2|3)` link. Each layer's
heading carries the matching `<a id="layer-1">` / `layer-2` / `layer-3` anchor. This gives the reader the map
up front so they choose their depth instead of discovering the structure by scrolling.

## Gate 4 — Unique, resolving anchors

Every `▸` drill-down link points to its **own unique anchor id**; no two links share a target; every link
resolves to a real `<a id="…">` present exactly once. (Live failures: two Layer-1 links both at `#l2-bet`;
`l3-value`+`l3-segment` stacked on one heading.) Before shipping, list every `▸` target and confirm each
resolves to one place.

## Gate 5 — Inline-gloss opaque Layer-3 table headers

A non-obvious column header in a Layer-3 table carries a 3–6-word plain gloss **right there**:
*"Job budget (what one customer spends a year on this)," "Switchable demand (how many are unhappy enough to
switch)," "Reachability (how easily you can get in front of them)."* Do not rely on the separate
`references/glossary.md` — a casual reader never opens it.

## Gate 6 — Segment depth across layers *(nmt-market-research)*

The target segment is **partially profiled in Layer 2** — who they are, what they're trying to get done,
what they care about most, why they'd switch — plus a **brief strategic recommendation** (1–2 sentences:
focus here / how to enter / what to lead with). The other top candidate segments get a light touch in
Layer 2. The **full Map of Segments at depth lives in Layer 3.**

## Gate 7 — Validation plan across layers *(nmt-market-research)*

The hypothesis-validation plan runs across all three depths:
- **Layer 1** — a light touch (the make-or-break risk + the next action).
- **Layer 2** — the **focused list: every risky assumption paired with how we'd check it** (one plain sentence
  each, ordered riskiest-and-cheapest-to-falsify first). This is the list the reader acts on.
- **Layer 3** — the **detailed step-by-step plan per assumption**, canon-grounded (RAT): Method (the right
  test + why it fits) · Steps (who/how many/what to measure) · Kill criterion (the result that falsifies it,
  with the threshold stated up front) · Cost/time.

## Gate 8 — Skill-specific

- **GTM:** every number/claim in landing & ad copy keeps its inline `[VERIFY — source]` guardrail until
  proven — a reader copies the copy straight to production; the top disclaimer won't stop them.
- **PRD:** the per-requirement `mechanic:` / `Core Job → Big Job → Aha` mapping is **internal bookkeeping** —
  it lives in the fenced `▸ methodology trace`, not the readable requirement. A reader sees *what to build +
  acceptance criteria*; the mapping is the audit trail.

> **Not a gate:** absolute file length. The 3-layer doc may run longer than the old single report — that is
> fine. The plain layers earn their length by giving the casual reader an exit after one page; we do **not**
> trade substance to hit a line count.

---

## Ship checklist

- [ ] **Gate 1** — Layer 1 leads in plain words; no sentence opens on a raw term; jargon minimal.
- [ ] **Gate 2** — every Layer-2 term glossed on first use; no un-glossed term.
- [ ] **Gate 3** — disclaimer wording appears at most twice (top block + L1 pointer); GTM flag below the answer.
- [ ] **Gate 4** — every `▸` link resolves to a unique, real anchor; no two links share a target.
- [ ] **Gate 5** — opaque Layer-3 table headers carry an inline plain gloss.
- [ ] **Gate 6** *(MR)* — target segment profiled + strategic rec in Layer 2; full Map of Segments in Layer 3.
- [ ] **Gate 7** *(MR)* — validation plan touched in L1, listed in L2, detailed per-assumption in L3.
- [ ] **Gate 8** — GTM copy keeps `[VERIFY]`; PRD mechanic-mapping is fenced, not on the readable requirement.

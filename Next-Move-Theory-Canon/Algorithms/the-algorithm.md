# The Algorithm: How to Know What to Do

## 1. Context: Next Move Theory, the meta-framework

> See [Next Move Theory key theses](../Next-Move-Theory/nmt-key-theses.md) for the root treatment.

Next Move Theory is the integrative meta-framework. It combines Advanced Jobs To Be Done, Unit Economics, Riskiest Assumption Test, ABCDX segmentation, and Theory of Constraints. OKR (Objectives & Key Results) is a supporting methodology.

The unit of analysis is the Chosen Company Strategy. That is a sequence of cross-function actions toward an expected outcome, across Discovery, Delivery, Marketing, Sales, Support, R&D, and Finance. It is anchored on the choice of Jobs of segments: which Jobs of which people will we compete for, why these, and why will we win?

**The goal is to align every function around one Chosen Company Strategy, in one shared language: the language of Jobs.** The product is a single organism, so you can't change marketing in isolation from the product and the segment.

Subtraction is the meta-operator running through every step. The highest-leverage move is usually to remove, not to add. You remove a Job from the customer's graph, a non-target segment, a risky assumption, or a feature (see [Subtraction](../Next-Move-Theory/subtraction.md)).

The algorithm is a loop, not a one-shot run. Every action produces new data for the next pass.

## 2. The cause-and-effect chain to profit — the diagnostic spine

> Full treatment in [Next Move Theory key theses §4](../Next-Move-Theory/nmt-key-theses.md) and [AJTBD key theses §14](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md).

The chain is sequential up to value. Then it branches into three conditions that must hold at the same time. Then it converges into conversion, retention, and profit. Every step inherits the quality of the step above it. So the diagnostic runs top-down: investigate the upstream node first.

```
Market with money
  → Segment + Job          (one analytical entity, not two steps)
  → Added Value
  → ┌─ Business model & Unit Economics — positive per-unit math
    ├─ Ability to create demand & acquire customers — at target CAC and lead quality
    └─ Ability to scale, incl. customer service — without quality decay
  → Unit Economics keeps closing at scale — conversion + retention + repeat
  → Target Profit
```

- Market with money is defined in Job terms. Not *"the EdTech market"* but *"the sum people spend to learn a skill in order to switch careers."*
- Segment + Job is one entity. A segment is defined by its Job Graph: similar Core Jobs with similar success criteria. The Big Job above is motivational context, not the segmentation cut (see [Segmentation](../Advanced-Jobs-To-Be-Done/segmentation.md)).
- The three conditions after value are tested in parallel, not in sequence. This is why RAT (Step 8) treats its baseline risks as simultaneous tests.
- **A broken metric almost never means a problem at that metric.** Low conversion, high CAC, and high churn are usually upstream. The cause is a wrong Segment+Job, value that doesn't beat the alternatives, or one of the three parallel conditions failing.

## 3. Architecture — ten steps, three phases, one loop

```
  ┌─►  I.  FRAME & HYPOTHESIZE — in your head / expert / LLM (fast, cheap)
  │       1  Challenge the business goal — 5 Whys + "is this even the right goal?"
  │       2  Diagnose the current state — segments, Job Graphs, decisions, owners, data
  │       3  Assemble the layer — Map of Segments · Job Graph · Consideration Sets
  │       4  Shortlist candidate mechanics — where the solutions could in theory live
  │
  │       II. RESEARCH & GENERATE — in the field (real time and money)
  │       5  Field research, scoped by the shortlisted mechanics
  │       6  Apply the surviving mechanics to the REAL Job Graph
  │       7  Rank by RICE — unit-economics gate · opportunity cost
  │
  │       III. DE-RISK & SHIP — the biggest spend, only after value is proven
  │       8  RAT — kill the riskiest assumptions cheaply (or pivot)
  │       9  Validate value — sales first, then UX 4/4
  └────── 10 Ship the top bet  →  new market data  →  back to 1
```

Gate logic:

- **Challenge the goal before anything else.** The goal you were handed is very often the wrong one. Analyzing how to hit a mis-set goal is the most expensive early waste. Steps 1–2 frame the right goal, then diagnose the state.
- Every step is a gate. If it doesn't hold up, pivot, which means swapping the set of risky assumptions. Don't move forward.
- If at step N you find that an assumption from step N−K was false, go back and rebuild from the point of error. Don't fake progress on a broken upstream node.
- Cost rises by phase. Phase I is fast and cheap: head, expert, or an LLM drafts the layer in an hour. Phase II costs real research time and money for recruiting, interviews, and surveys. The big build spend comes only in Phase III, after the riskiest assumptions are killed and value is proven.

## 4. The ten steps

### Step 1. Challenge the business goal

> See [Local vs Global Optimum](../Next-Move-Theory/local-vs-global-optimum.md), [Focus & Attention Management §7](../Next-Move-Theory/focus-as-company-attention-management.md).

**Start here, because the goal you were handed is very often the wrong one.** *"Lift this metric"* or *"ship this feature"* is frequently not the goal worth pursuing. Analyzing how to hit a mis-set goal is the most expensive early waste.

Run 5 Whys up the goal. Ask why we are doing this, and why that matters, and what the real outcome is. Climb 3–5 levels, from feature to conversion to sales to margin to profit to the strategic goal. At each level, look for a more effective way to hit the higher goal than the one you were just handed.

Local vs. global optimum is an explicit gate. Local means improving the current product, segment, or model: low risk, low ceiling, delegable, additive. Global means changing the segment, business model, market, or Core Job: high risk, multiplicative upside, subtractive. Only the founder or C-level has the authority to override the team's addition bias and call it (see [Subtraction §4](../Next-Move-Theory/subtraction.md)). The two are not opposites. They are two parallel investment tracks, funded together. Full treatment in [Local vs Global Optimum](../Next-Move-Theory/local-vs-global-optimum.md).

Artifact: a Focus Goal at the right level, an explicit local-vs-global choice, and the alternatives you cut, with reasons.

### Step 2. Diagnose the current state

**Don't jump to solutions before you understand the situation.** This is the strategist's main mistake (Rumelt, *Good Strategy, Bad Strategy*).

Pull together everything that bears on this business goal:

- the Map of Segments and the Job Graphs of the target segments;
- the decisions already taken against this goal, and how they played out;
- ownership and constraints. Is there a directly responsible person? Are there resources? Are there conflicting goals? Are there stakeholders backing the initiative?
- the research already run, and the customer feedback, analytics, cohorts, and unit economics, gathered, structured, and read for what they say.

Define the context: new product vs. existing, and PMF stage (none, weak, strong, or ripped-out-of-customers'-hands). This sets how you walk the rest of the algorithm.

For an existing product, run ABCDX on the paying base. Find the 20% of customers giving 80% of margin. Run switch interviews with churned users. Ask *"why do they stay?"* before *"why do they leave?"*

Artifact: a structured picture of the current state, plus an explicit context (PMF stage, new vs. existing).

### Step 3. Assemble the layer — data first, then hypothesis

> See [Segmentation](../Advanced-Jobs-To-Be-Done/segmentation.md), [Job Graph](../Advanced-Jobs-To-Be-Done/job-graph.md).

**Don't just hypothesize. Start from the structured data you already have — analytics, prior research, customer reviews — and hypothesize only the gaps.** An LLM drafts the hypothesis parts fast. It's still a hypothesis to test in the field, so aim for enough material to scope the research, not for accuracy.

- 3.1. Map of Segments. Extract it from your existing structured data and customer reviews first. Where it's missing or incomplete, hypothesize. The root is similar Core Jobs with similar success criteria. The Big Job above is motivational context, not the cut, and demographics are a secondary correlate.
- 3.2. Job Graph for the target segment. Same rule: from existing data and reviews first, then hypothesize the gaps. It runs Big Job → Core Jobs → Small / Micro Jobs plus the Critical Chain of Jobs.
- 3.3. Consideration Set per Core Job. List 3–5 current Solutions, including DIY and *"do nothing"* (both are Job Graphs), and how our Graph differs.

### Step 4. Shortlist candidate mechanics

> Catalog: [Value-Creation Mechanics](../Advanced-Jobs-To-Be-Done/value-creation-mechanics.md).

Walk the catalog and flag the mechanics that could in theory solve this business goal on the layer. This is where the ways to solve it might live.

Keep the handful you most strongly believe in. That is your expert call.

Artifact: a shortlist of mechanics, each with the unknowns you must learn in the field to judge whether it applies.

### Step 5. Field research, scoped by the mechanics

> See [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md).

**The shortlisted mechanics are the spec on the research. They tell you exactly what to learn and where to look.** *"Move to the Previous Job"* becomes *"walk me step by step through everything you did from the moment the Big Job appeared up to buying your current Solution."* *"Kill a Job"* becomes *"what in the current process do you hate or always put off?"* *"Lower fears and barriers"* becomes *"when did you last almost buy but didn't, and what stopped you?"* Without the mechanics in hand, you interview blind.

Tools: AJTBD interviews, switch interviews with churned or migrated users, expert interviews, product analytics (if the product exists), and a quantitative survey to size the segments. Recruit only past-payers. That is the cheapest filter against Fake Jobs.

Research exists to get the raw material for the mechanics you'll actually apply. That material is the real Job Graphs, success criteria, Critical Chains of Jobs and their breaks, barriers, habits, fears, Consideration Activators, and Aha Moments.

### Step 6. Apply the surviving mechanics to the real Job Graph

> See [Value Creation §17](../Advanced-Jobs-To-Be-Done/value-creation.md).

Run the surviving mechanics against the Map of Segments, the real Job Graph, and the Critical Chains of Jobs.

**The real value usually sits outside the current Core Jobs.** It sits in the Previous and Next Jobs, the Big Jobs, an adjacent segment's Small Jobs, emotional and Orientation Jobs, and Critical Chain of Jobs repairs.

Each hypothesis is `segment × Job × mechanic → a concrete action`. For example:

- *Kill a Job* × the onboarding Critical Chain of Jobs → *"auto-import the customer's existing data so they never re-enter it — the setup Job disappears."*
- *Move to the Previous Job* × the lead-gen segment → *"build the free estimator they use before they're ready to buy — we capture them earlier than competitors."*
- *Take the Job off the customer* × the done-for-me segment → *"run the whole workflow as a service; the customer only approves."*
- *Create a link to a new Big Job* × the status-first segment → *"tie the Core Job to 'signal who I am,' raising willingness-to-pay without changing the product."*
- *Repair a Critical Chain of Jobs break* × a new sub-segment → *"the chain breaks at compliance review for enterprise; own that Job and the segment unlocks."*

**A hypothesis only counts if it makes the Big Job land better by the segment's own success criteria** (see [Behaviour Change §4](../Advanced-Jobs-To-Be-Done/behaviour-change.md)). A Core-Job criterion that doesn't ladder up to a Big-Job criterion the customer cares about won't carry the switch, however true it is.

### Step 7. Rank by RICE

Score each hypothesis on RICE:

- R — Reach: the share of the target segment the hypothesis creates value for.
- I — Impact: an expert estimate of the value added, defined separately for each business goal. What *"impact"* means differs for a conversion goal, a retention goal, an AOV goal, and an exit-competition goal.
- C — Confidence: the evidence hierarchy, from opinion to analytics to survey to interview to MVP to sales. The higher the level behind the estimate, the higher the Confidence.
- E — Effort.

Apply the unit-economics gate. Can the hypothesis in principle deliver the target margin per paying customer on the target segment? If not, bin it, however beautiful.

Write down the opportunity cost: what you give up by picking this over the next few hypotheses.

Artifact: a ranked list, plus the top few to test next.

### Step 8. RAT — Riskiest Assumption Test

> See [Riskiest Assumption Test](../Riskiest-Assumption-Test/rat-key-theses.md), [Subtraction](../Next-Move-Theory/subtraction.md).

Write a list of positively-stated risky assumptions under each top hypothesis. It is a cause-and-effect chain rooted in Segments and Jobs, each item falsifiable by a single experiment. Use the positive form: *"the segment pays at our price,"* not *"customers might not pay."*

The five baseline risks (a real RAT has many more, and the killing one usually hides in product-specific custom risks):

1. Market — a market exists, is large enough, is growing, and is free of regulation that would block us.
2. Segments and Jobs — segments performing similar Core Jobs exist, are large enough and reachable, and the Core Jobs we chose to compete on are the most attractive (economically viable, and we can create substantial value for them). This is the root. More product cycles die here than anywhere else, because a wrong choice cascades down the whole chain.
3. Value — customers from those segments buy our product to perform those Core Jobs.
4. Unit economics — average margin per paying customer hits target.
5. Acquisition channels — repeatable channels exist that fit inside the unit-econ budget and scale.

Add product-specific custom risks. This is usually where products actually die. Talk to a competitor's salesperson. Walk the operating model actor by actor.

The priority formula is `(P(risk hits) × cost if it hits) / cost of validation`. The formula orders the risks. Go validate whatever sits at the top right now.

**The goal of a new initiative is to kill it or pivot it, not to launch it.** The work is buying knowledge cheaply. A run that kills the initiative before the build is a successful RAT.

The MVP is a probe, not a product. Its success criterion is *"did the risk reveal itself,"* not *"did it sell."* Name every assumption the probe is built to test.

**Survival is multiplicative.** Seven risks at 40% each give roughly 3% joint survival. The highest-leverage move is the drop-it exercise: remove a risky assumption so it no longer needs to be true. Loading a product with risks is the guaranteed way to kill it.

A pivot is a change in the set of risky assumptions. Change the highest-priority un-validated one first, and keep what's already validated. The segment-Job pivot is usually the highest-leverage.

Gate: a key assumption falsified means stop and pivot.

### Step 9. Validate value — sales, then UX 4/4

> See [Value Creation §12](../Advanced-Jobs-To-Be-Done/value-creation.md).

**The best validation of value is sales.** The more live sales, the cleaner the signal. Communicate at the Big-Job level, where motivation lives, but promise only what the chain actually delivers. Over-promising manufactures a Problem.

Run solution interviews in iterations of 6. If about 5 iterations produce no sales, there's a fundamental error in segment, Job, or value, so pivot rather than run *"one more round."* The segment is the highest-leverage pivot.

Once sales start, run UX tests on the 4-of-4 rule (RITE). Four of four users must complete the Core Job without critical errors. If even one fails, fix it, then run another four, and repeat until 4/4. Ask four questions at every step: what do you see, what are you thinking, what are you feeling, what do you want to do.

Place the first Aha Moment as far left in the Critical Chain of Jobs as possible. Every step before it is an abandonment window.

Only after 4/4 sales and 4/4 UX should you invest in full-scale development.

### Step 10. Execute + loop

> See [Job Graph §13](../Advanced-Jobs-To-Be-Done/job-graph.md), [Focus & Attention Management §7](../Next-Move-Theory/focus-as-company-attention-management.md).

Ship the top hypothesis and get data from the market.

Return to Step 1 with what you learned. Re-challenge the goal, update the diagnosis, then rebuild or continue.

A pivot swaps the set of risky assumptions, not just one. Change the most leveraged thing, most often the segment, not everything at once.

**Value is simplification of the Job Graph over time.** Keep the Graph as a time series: which Jobs died, which appeared, and where the market is moving.

Hold focus on the current segment and also fund a second track for the global-optimum move. A team that funds no second track drifts into the Innovator's Dilemma in 3–5 years.

## 5. Contextual branches

### By PMF stage

- PMF = 0. The main business goal is Go-to-Market: first find the paying segments, then prove the value. Don't scale a product that doesn't exist yet.
- PMF weak. Grow value, position and differentiate from competitors, and bring margin up to target.
- PMF strong. A wide field opens: scale, launch new products, retention, grow average order value, scale further inside the current segments, and fund new high-risk initiatives.

### By product type

- New product. Full cycle from Step 1. The main risk is picking a rare or low-frequency Job for a small audience, or a Fake Job (a future-tense fantasy no one paid for).
- Existing product. The fundamental risks (segment, value) are already reduced, so focus shifts to efficiency and scaling. The field is still wide: you can launch new products and sub-products, enter adjacent segments, or change the business model. Start with ABCDX plus switch interviews. The constraints are customer expectations and habits, internal politics, and a PM's limited zone of responsibility. Big changes are possible but must be argued: a bigger segment, materially more value, or a suboptimal model. The *"if it ain't broke, don't fix it"* trap is the Innovator's Dilemma, escaped through the Job Graph.

## 6. The broken vs. the right value-creation process

**The broken process: came up with a feature, ran customer interviews to check whether it has value, then decided to build or not.** It fails for three reasons. First, cognitive bias: you go looking for confirmation the feature is needed. Second, you start from the feature, not the Job, so you are blind to the rest of the Graph. Third, of 100+ mechanics you guessed your way to one, so you don't see the whole graph or the other ways to create value.

**The right process: challenge the goal (5 Whys), diagnose the state, assemble the layer, shortlist mechanics, research, build the real graph, apply mechanics, rank, RAT, validate by sales and UX 4/4, execute, loop.** The planning unit is the value hypothesis, not the feature (see [Value Creation §1](../Advanced-Jobs-To-Be-Done/value-creation.md)). When you see the graph, do the research, apply the mechanics, and rank them, the probability that an investment creates value rises by orders of magnitude.

## 7. Fractality of strategies

The same mechanic works at every level. *Move to the Next Job* is a button in the UI or a company strategy (design → design + renovation). **Level of application equals scale: at the Big Job it's strategy, at the Micro Job it's micro-optimization.** Once you understand the mechanics, you apply them everywhere, from copywriting to picking a market.

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

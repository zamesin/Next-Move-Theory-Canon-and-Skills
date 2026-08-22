# Critical Chain of Jobs

This file is the canon page on Critical Chains of Jobs in AJTBD. A Critical Chain of Jobs is the sequence of lower-level Jobs that must all be performed for a higher-level Job to land. It expands [AJTBD key theses §10](ajtbd-key-theses.md) (Critical Chain as operational delivery) and [§11](ajtbd-key-theses.md) (Critical-Chain scaling).

The Critical Chain is the Job Graph projected onto a time axis at a chosen Solution ([Job Graph](job-graph.md)). Strategic moves operate on the Job Graph. Operational moves operate here, on the chain: value delivery, communication, activation, retention, churn diagnosis. The term is borrowed from Goldratt's *Critical Chain* (see [Scientific Foundations §20](scientific-foundations.md)). In project management the chain is tasks. In AJTBD it is Jobs, and three properties carry across: the throttle by the slowest link, the catastrophic effect of a single break, and the dominance of cycles.

---

## 1. A Critical Chain is the sequence of necessary Jobs for a higher-level Job to land

**A Critical Chain of Jobs is the sequence of necessary lower-level Jobs that must all complete for the level-above Job to land.** *Necessary*, not *typical* — only Jobs whose failure breaks the result. The structure recurs at every level of the Job Graph.

Quick illustrations, each at a single zoom level:

- TurboTax (Micro-Job zoom): *answer income questions → enter W-2 fields → enter 1099 fields → confirm deductions → review → e-file.*
- Instacart (Micro-Job zoom): *open app → pick items → confirm address → place order → wait → receive at door.*
- Uber home from dinner (Core-Job zoom): *pay the check → request the ride → ride → step out at the door.*

The Big Job behind each lands only when the last Job in the chain completes.

**Not every chain runs in a straight line — three shapes recur.** In an AND-parallel shape, several Jobs run side by side and all must finish before the chain continues. Tax filing waits for W-2s, 1099s, and K-1s before it can e-file. In an OR-alternative shape, several Jobs are substitutes, and the chain continues as soon as any one completes. Book Southwest or Delta, then fly. In a conditional shape, a Job appears only when a condition holds. TurboTax's K-1 step exists only for LLC owners. Map the actual shape before treating the chain as a single line.

---

## 2. A Critical Chain is the Job Graph projected onto a time axis — only the lowest-level Jobs appear

The Job Graph is hierarchical (`Super Big > Big > Core/Small > Micro` — see [AJTBD key theses §9](ajtbd-key-theses.md)). **The Critical Chain is that same graph projected onto a time axis.** Only the lowest-level Jobs at the chosen zoom appear as nodes. Higher-level Jobs aren't act-able at a single moment. They emerge when the atomic acts beneath them complete.

| Axis | Job Graph | Critical Chain |
|---|---|---|
| **Structure** | Hierarchy | Sequence on a time axis |
| **What is a node** | Every level | Only the lowest-level Jobs at the chosen zoom |
| **What it drives** | Strategy — which Core Jobs and segments to compete on | Design & engineering — flows, hand-offs, latency, cycles |

Worked example. Take the Big Job *"get to my client meeting at 10 a.m. downtown."* At Core-Job zoom the chain is `leave the house → get from A to B → walk into the meeting`. The Big Job lands the moment the last node completes, and only if every node before it did. If `get from A to B` breaks, the chain stops there and the Big Job doesn't land.

Now zoom into one node, `get from A to B`, the Core Job Uber performs. At this deeper zoom it opens into a chain of its own: `open the app → enter the destination → confirm the pickup → wait for the driver → ride to the door`. **Zoom is relative: a single node at one zoom is the whole chain at the next zoom down.**

Choose zoom by the analytical question. Strategy points to Core. Design and engineering point to Micro. Activation points to the Micro Jobs up to and including the activation moment (the first Aha). Sub-segment failures point to whichever zoom surfaces the break.

---

## 3. Chain choice is dominated by predicted completability — the probability term in the value formula

**Completability is the Probability term in the value formula.** The brain scores each candidate chain with `Value ≈ Probability of the Outcome × Outcome − Cost` ([Value Creation §3](value-creation.md)). *Outcome* is how well the Core Jobs land at the customer's criteria. The Probability of the Outcome is whether the chain runs end-to-end without a break. They multiply, so a brilliant Outcome behind a foreseeable break still scores near zero. Teams over-invest in Outcome and underweight the Probability term. Customers don't. They discount any chain they can foresee breaking, including at a Job we don't perform.

**Trust and social-status signals are how the customer estimates a Probability they can't measure directly.** Brand, reviews, customer logos, and peer recommendations stand in for the completability forecast (see [Scientific Foundations §24](scientific-foundations.md)). This is why a vendor with weaker Core Jobs but strong trust signals beats a better one without them.

Loss aversion sharpens the Probability term. A broken chain delivers nothing, and the predicted loss outweighs an equal-sized Outcome gain ([Value Creation §7](value-creation.md)). A serious break forecast can sink an otherwise strong chain.

Worked example: Vercel vs. raw AWS. AWS had better primitives and lower cost, but shipping a React app meant chaining compute → security groups → load balancer → build → deploy → CDN → monitoring, with multiple foreseeable breaks. Vercel guaranteed the chain: connect the repo, `git push`, the rest runs automatically. Lower Outcome per Job, far higher Probability of the Outcome. Vercel owned early-stage front-end teams for years.

Operational consequences:

- Preemptive avoidance is invisible from inside your customer base, because everyone there already entered. Surface it in lost-deal interviews: *"Which chain did you trust to run end-to-end? What made you doubt the others?"*
- Acquisition's job is to raise the predicted Probability of the Outcome before the customer enters. Brand, reviews, comparisons, and partner logos are completability signals.

---

## 4. Drop-off is a Solution switch — the Big Job often remains

**When a customer drops off, the Big Job above the Solution they were using often remains.** It motivated them. It didn't vanish when they stopped using the product. They didn't stop performing the Big Job. They switched to a competing Solution: a competitor, a manual workaround, an old habit, or the *null Solution* of enduring the consequence.

The diagnostic question is therefore not *"why didn't they like the product?"* but *"which Solution did they switch to, and which Big-Job criterion did it hit that we missed?"* Two refinements:

- They dropped off at a specific step, so fix that step, not one downstream. Most psychotherapist-matching services lose people at *find a therapist*. But the larger drop is earlier, at *understand I need therapy* and *decide to look*. Unblocking the earliest broken step pushes the most motivated customers through.
- They switched to "nothing", the null Solution. No competitor captured them. The blocker is habit, fear, or the cognitive cost of evaluating anything at all. The lever isn't competitor-comparison messaging. It is lowering the energy to start any chain (the Orientation Job — see [Behaviour Change §10](behaviour-change.md)).

---

## 5. The chain must not break — when it does, a cascade fires inside the customer

The cascade works like this. When a single Job isn't performed, the higher-level result is at risk, but nothing is forced on the customer yet. **A Tax Job appears only if the Big Job matters enough that the customer still wants it.** Then, to rescue it, they take on work they never signed up for: *perform the broken Job themselves this time*, and find *a different solution that won't break next time* ([Value Creation §8](value-creation.md)). The brain registers a Problem, the customer-experience side of a Negative Prediction Error ([Behaviour Change §7](behaviour-change.md)). Irritation and frustration follow. How far they go depends on the importance of the higher-level Job:

- High-importance: pays plus searches. The customer performs the broken Job once and launches an Orientation Job to find a replacement. The broken chain exits consideration. A competing one is about to enter — one of the canonical behavior-change triggers (§6).
- Medium-importance: pays once, stays for now. The Job is important enough to absorb the extra work, not enough to go looking today. Trust degrades silently. Retention metrics look healthy but aren't. The detection signal is support tickets that close as *"resolved"* but say *"I figured it out myself," "I did it manually this time," "we just worked around it"*. Each is a paid Tax Job, and the weekly rate is the leading indicator of silent churn.
- Low-importance: refuses. The result was never worth the extra work, so they exit the Big Job.

**Severity sets the speed.** A single severe break — data loss, money loss, public embarrassment — fires the Orientation Job same-day. Minor breaks accumulate over weeks. *"This only affects N% per week"* hides the cumulative damage to the medium-importance cohort.

Canonical illustration. Movers packed your stuff, drove it cross-country, and unloaded it on the sidewalk in the rain, without carrying it up. The earlier Jobs still hold value, but *"settle in by Sunday"* didn't land. Two Tax Jobs drop on you: *carry every box up tonight* and *find a different mover next time.* Months later, when a friend asks for a recommendation, this mover isn't the one you name. Other single-link breaks: TurboTax missing a K-1 (non-negotiable, so switch to H&R Block); Teladoc when video fails (serious symptom means an in-person clinic same day, minor means dropping the visit); Instacart when the order never arrives (mid-importance, so re-order, or cook what's in the fridge).

**Chains also leak value continuously, not only at catastrophic breaks.** At every step the customer arrives with a prediction. Reality beats it (a micro-Aha Moment) or falls short (a micro-Problem). The accumulated balance is the leading indicator of completion. A chain leaking micro-Problems leaks motivation step by step and ends in drop-off or a muted final Aha. Per-step CSAT, latency, and abandonment are proxies for this balance.

Operational consequences:

- Map the chain explicitly before scaling. Implicit chains always omit the link about to break. Treat a single broken link as the default failure mode when a metric drops on a sub-segment, before suspecting value or messaging.
- Reliability beats brilliance. One severe break undoes months of accumulated Aha Moments ([Value Creation §7](value-creation.md) on Problem asymmetry). Removing one negative-emotion micro-step is often worth more than any new feature. Square's tip screen, TurboTax's *"we'll catch the missed deduction,"* and Apple Pay's no-swipe-no-signature each delete a single micro-Problem from a chain the customer already wanted to walk.

---

## 6. A chain-break is a behavior-change trigger — receptivity to Consideration Activators spikes at the break

**When the current chain breaks, the brain registers a Problem and an Orientation Job fires: *"what else can I use?"*** The customer leaves steady-state habit, enters evaluation mode, and becomes receptive to Consideration Activators. This is one of the seven canonical behavior-change triggers (full taxonomy in [Behaviour Change §8](behaviour-change.md)).

Products that exploit this window: Wealthfront and Robinhood load Consideration Activators when the bank chain breaks (surprise fees, hidden minimums); Notion when Google Docs chains break (lost docs, version chaos); Slack when the email chain breaks (long threads, lost attachments).

**The window closes within days-to-weeks.** After that the customer re-stabilizes on a substitute or builds a workaround. A product outside the broken chain catches the moment two ways. First, trigger-event ads on surfaces where the break leaves a public trace (G2 one-star reviews, Reddit complaint threads, support forums). Second, adjacent-product partnerships that see the break first. A tax-filing tool sees the bookkeeping tool fail a step before anyone downstream does.

**Operational consequence: the cheapest moment to acquire is the chain-break, not steady-state habit.** Map the predictable break moments in your sub-segment — tax season, year-end audit, new-role onboarding, post-merger integration, regulatory deadline — and time outreach to them.

Two related modes the canon names elsewhere: first-time vs Nth-time entry into the Big Job, and competing through the Big Job when our Solution is unfamiliar. Both are treated in [Behaviour Change §10](behaviour-change.md) (Class 1 vs Class 2).

---

## 7. Where chains break — structural sites you own, and interruptions you don't

A chain breaks from two directions. **Three structural sites sit inside the chain you built — yours to fix.** Diagnose them in order: hand-offs first (where breaks originate), cycles second (how breaks convert to abandonment), slowest link third (where throughput is throttled). A fourth source comes from outside the chain: an external interruption you can't prevent, only design for (§7.4). Whatever cascade fires inside the customer when any break lands is §5. This section is about *where* breaks originate.

### 7.1 Hand-offs cluster breaks

**A chain smooth inside one role's hands shatters the moment the Job passes to the next role.** Hand-offs account for the majority of multi-role breaks. Three pathologies accumulate, and fix in this order. First, ownership ambiguity: whose Job is it now? Both assume the other. Ask both *"whose Job is this the moment it arrives?"* — divergent answers are the signal. Second, latency: work sits in the receiver's queue past their own SLA. Third, information loss: context clear to the sender is gone in the artifact passed forward.

Hand-offs happen between systems too (API ↔ API, CSV ↔ EDI ↔ JSON, CRM ↔ billing ↔ warehouse). Canonical role chains: B2B sales runs SDR → AE → CSM; the B2C funnel runs ad → landing → checkout → onboarding → first-Aha; marketplaces run buyer → intermediary → service → buyer (the intermediary is the most common break point); healthcare runs GP → lab → patient → GP.

### 7.2 Cycles amplify breaks into abandonment

A cycle is a customer-visible return-for-rework. The customer reaches Job N, hits a Problem, and is sent back to an earlier Job. (Internal-process loops — sprints, code review, QA — don't count.) Cycles arise wherever a Job's output fails the next Job's input. Most often that is at a hand-off the receiver rejects, but it also happens inside a single role from late-firing validation. A TurboTax user fills W-2 and 1099 fields, then the deductions screen flags a missing K-1 from earlier.

**Cycles convert breaks into abandonment because the second pass feels like a Tax Job.** The first pass is paid for by the expected outcome. The second pass through the *same* Job feels like energy without progress. The customer's prediction of the remaining chain darkens, and abandonment spikes. Canonical cycles: mortgage approval (lender asks for doc A → then B → then C *that could have been asked at A*); prior authorization (submit → denial → resubmit → call); insurance claims (file → photos → different angle → receipt).

Fix: front-load requirements. Plaid's instant account-linking killed the mortgage-doc cycle for digital lenders. When the cycle can't be killed, make the return cheap (auto-save state, pre-fill what was collected).

### 7.3 The slowest link throttles the whole chain

**A chain runs at the speed of its slowest Job.** This is a direct application of Goldratt's TOC: adding capacity anywhere else only inflates the queue in front of the bottleneck. The slowest link isn't static. Fix today's and the next slowest Job becomes the constraint. Chains also break on *quality*, not just speed. A Job completes "on time" but produces output the next Job can't use, and that diagnostic lives at the hand-off output spec (§7.1).

Canonical examples. DoorDash early days: kitchen prep was the slowest link and couriers idled, so restaurant tablets compressed prep. Tax prep: faster e-filing didn't move median completion, because source-document gathering was the bottleneck, and TurboTax's Auto-fill compressed it. Healthcare diagnosis: the slowest link isn't the 15-minute exam, it's lab results (days) or specialist appointments (weeks).

**Operational consequence: diagnose the slowest link before adding capacity, and re-diagnose after every fix.** Most teams optimize the link they own, but the throughput-blocker is almost always elsewhere. A faster overall chain is sometimes a *slower* local Job. Asking for documents upfront slows the first step but speeds the chain end-to-end. End-to-end metrics rank moves correctly. Local metrics mis-rank them.

### 7.4 External interruptions stall the chain from outside it

The first three sites sit inside the chain you built. This one comes from outside it — events you can't prevent, only design the chain to survive:

- A higher-priority Job bursts in: a sick kid, a prod outage, the boss's emergency email. The walk pauses and may not resume. **Most one-step abandonment is interruption, not rejection.** Diagnose a drop-off by asking *"what could have interrupted them here?"* before *"why didn't they like this step?"*
- The customer's criteria change mid-walk: budget cut, deadline moved up. The walk may finish mechanically but won't satisfy, because the criteria they ended with differ from the ones they started with.
- A competitor surfaces mid-walk: the §6 receptivity window arriving in-flight. This is the hardest interruption to defend against, because the comparison and your chain's friction are both fresh.

**Operational consequence: resilience to interruption is a design property.** Every step that forces the customer to rebuild context on resume is where an interruption ends the walk. Save state aggressively, resume where they left off, and deliver the Aha early so the State-B emotion is already installing before any competitor can.

---

## 8. Mechanics for fixing chain-breaks

Each move is a subtraction or substitution on the chain (see [Subtraction §1](../Next-Move-Theory/subtraction.md) for the meta-operator):

- Repair the broken Job in place. Stripe Checkout for local merchants; Plaid for mortgage docs.
- Kill the Job entirely. Face ID killed *"type my password"*; AirPods killed *"untangle my headphones"* ([Value Creation §14.2](value-creation.md)).
- Take the Job off the customer. Belong for rental management; Wealthfront for rebalancing; DoorDash for *"go to the restaurant."*
- Route the broken Job to a recommended partner. When the chain breaks at a Job you don't perform and don't want to, route the customer to a reliable vendor at the right moment. Apple's App Store keeps *"get any Job done on my phone"* running; Salesforce's AppExchange does it for *"run my revenue stack"*; a realtor's preferred-vendor network for *"buy this home."*
- Reduce hand-offs. Collapsing two roles removes a break-boundary. Tesla owns sales plus service; Warby Parker owns prescriptions, frames, and retail.
- Kill cycles. Front-load requirements; persist customer state (§7.2).
- Reduce time-gaps between Jobs. On-demand delivery, instant approval, real-time integration. A faster chain reads to the brain as a different Job entirely.

Which mechanic fits depends on whether the broken Job is structurally necessary (repair, take off, route to a partner) or optional (kill). Collapsing the whole chain — move-up-a-level — is a strategy move (§9.3).

---

## 9. Strategy moves on the Critical Chain

Strategy operates on the Job Graph. These are where it reaches down onto the chain.

### 9.1 Move to the Previous Job — capture earlier than competitors

Zillow's Zestimate captures *"estimate the home's value"* upstream of *"list for sale"*. Mortgage calculators sit upstream of *"apply for a mortgage."* Capture the customer at the Previous Job and you shape the Consideration Set they bring into the Core Job.

### 9.2 Move to the Next Job — retention and AOV growth

Figma → Dev Mode (*implement the design*); Carfax → finance through a partner (*pay for the car*).

### 9.3 Move up a level — collapse the entire chain into a new, higher Core Job

Squarespace collapsed *buy hosting → install WordPress → manage plugins → renew SSL* into *publish*. Uber collapsed *own a car* into *get a ride*. This is the most powerful move when applicable (full treatment in [Value Creation §14.1](value-creation.md)).

### 9.4 Repair the chain when scaling to a new sub-segment

**A product that runs fine in its launch sub-segment hits an invisible break the first time it pushes into an adjacent one.** Same product, same value, same team, and a chain that ran clean in segment A breaks at a link nobody can see from inside segment A. The context, regulator, buy-side role, data format, or criteria changed.

Two failure modes (mirror of [Value Creation §1 Problem 3](value-creation.md)). Mode A: added value doesn't overcome the new segment's gravitational forces (habit, switching cost, fears), and the fix is re-applying value mechanics to *this* segment. Mode B: value exists, but the chain breaks before the segment reaches it. Mode B is the common one and is invisible from inside the base, because every current customer already passed through the part that breaks. Tell them apart in the field. Mode A is conversation-shaped: prospects engage politely and quietly don't convert. Mode B is funnel-shaped: they sign up, get blocked at a specific step, and ghost or file a support ticket.

The unlock is a chain repair, not a new feature. Stripe Checkout (launch segment was YC startups with engineers; for local merchants the chain broke at *"I don't know what an API key is"*); Notion Enterprise (the enterprise chain broke at SSO/SAML/SCIM/audit-log); Zoom for Education (broke at FERPA, waiting rooms, locked meetings).

**Operational consequence: when conversion craters on a push into a new sub-segment, default to *"the chain broke"* before *"messaging is wrong"* or *"value is insufficient."*** The cheapest source of break knowledge is customers from the new sub-segment who *tried and abandoned*. Budget for it. These repairs are cheap *per unlocked value*, not cheap absolute (Stripe Checkout took years; SOC 2 / SAML is multi-quarter).

Which move, when:

| When to apply | Move | Lever |
|---|---|---|
| Acquisition cost is high | Previous Job | CAC |
| Retention / AOV is the lever | Next Job | LTV |
| Too many breaks to repair piecemeal | Move up a level | Category shift |
| Conversion craters on a new sub-segment | Chain repair | Sub-segment unlock |

---

## 10. The Critical Chain in B2B — personal-Job failures at role boundaries

A B2B sale is rarely one role performing one Job. It is a chain spanning several roles — champion, decision-maker, budget holder, IT, security, legal, end users — each with their own business *and* personal Jobs. The chain breaks at the boundaries between them, and chain length scales with deal size. SMB is 1–2 roles, enterprise is 7+.

**Most B2B chain-breaks are personal-Job failures, not business-Job failures.** The IT director's *"don't let an un-audited tool into our perimeter"* blocks a deal the business Job *"reduce tooling cost"* would have closed. Canonical breaks: IT security review (champion wants it, budget is approved, IT blocks on missing SSO/audit-log — the most common reason mid-market deals stall above $50K ACV); clinical integration (CMO approves, clinicians refuse because it doesn't write back to Epic — a Tax Job the buyer never saw).

**Operational consequence: map the B2B chain as *roles × Jobs per role*, not a linear path, and fix breaks with role-specific evidence — not a better core product.** The IT director needs a SOC 2 report and a one-pager to defend the choice internally, not a new feature. (Full B2B treatment in [B2B](b2b.md).)

---

## 11. How to research the Critical Chain in an interview

Goal: surface every Job, hand-off, cycle, and time-gap, for a *specific* sub-segment performing a *specific* higher-level Job.

The anchor question varies its expected outcome by the higher-level Job: *"Walk me through, step by step — what tasks did you need to get done, in the past, to reach {the expected outcome}?"* Ask for *tasks* (Jobs), not raw actions. *"Screen the applicants," "collect the deposit"* are Jobs. *"I clicked the button"* is an action one level below. **Anchor on past performance, never on what *should* or *would* be done.** The chain you want is the one the customer really walked, not a hypothetical one.

Follow-ups against the chain:

- Break-points: *"Where did things go wrong? What did you have to redo, skip, or work around?"*
- Cycles: *"Were there any steps you went back to more than once? Why?"*
- Hand-offs: *"Was anyone else involved? Where did things pass from one person to another?"*
- Time-gaps: *"How long did each step take? Where did you wait, and for what?"*
- Hidden prerequisites: *"What had to be true before you could even start?"*

The output is a written chain: one Job per node, every hand-off named, every cycle marked, every time-gap measured. Without it, every fix is a local optimum. Method: [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md).

---

## 12. Critical Chain is the ultimate form of Customer Journey Map

Practitioners using CJM rigorously — extending past touchpoints, surfacing what the customer is *aiming to achieve*, mapping cross-vendor hand-offs — converge on the Critical Chain. **Critical Chain is what CJM is trying to be at its limit.** It is built on the right unit (Jobs, not touchpoints), the right frame (the customer, not the product), and pinned to a specific higher-level Job.

| Axis | CJM | Critical Chain |
|---|---|---|
| **Unit** | Touchpoint (a product-event) | Job (a motivational act) |
| **Frame** | Product-centric | Customer-centric |
| **Boundary** | Inside the product | Extends past the product's edges |
| **Blind spot** | Customers who never made it through | Micro-friction inside an individual step |

Touchpoints vanish with redesigns; Jobs survive. Jobs your product doesn't touch are first-class nodes, exactly where breaks hide and where Previous-Job and Next-Job growth lives (§9). And because CJM is built from existing-customer behavior, the customers who never completed the chain never appear on it.

Concrete contrast: buying running shoes for *"start running consistently."* The CJM is *see ad → browse → add to cart → checkout → receive → try on → keep or return* — six touchpoints, all inside the store. The Critical Chain is *decide to start running → ask friends what shoes work → compare brands → buy → receive → try around the block → keep or return → break in → integrate runs into the weekly schedule* — ten Jobs, most outside the store. The chain most often breaks at *integrate runs into the schedule* (the customer never starts running), no matter how flawless the checkout was.

CJM keeps its value downstream of a validated chain, at the UX-polish layer, surfacing micro-friction that Critical Chain at Micro zoom can underweight. To migrate: (1) replace each touchpoint with the customer's terminal Job at the chosen zoom; (2) extend left and right past your product's edges; (3) re-read every "pain point" as a chain pathology — break, cycle, Tax Job, or hand-off failure.

---

## Cross-references

- [AJTBD key theses §10](ajtbd-key-theses.md) — short form of the Critical Chain thesis; [§11](ajtbd-key-theses.md) — Critical-Chain scaling discipline
- [AJTBD key theses §23](ajtbd-key-theses.md) — move-up-a-level; [§25](ajtbd-key-theses.md) — business + personal Jobs in B2B chains
- [Job Graph](job-graph.md) — the Job Graph the chain is projected from; directional and structural moves
- [Value Creation §3](value-creation.md) — the value formula (`Probability of the Outcome × Outcome − Cost`); [§7](value-creation.md) — Problem asymmetry; [§14](value-creation.md) — kill-a-Job, move-up-a-level
- [Value Creation §1 Problem 3](value-creation.md) — Mode A vs Mode B when scaling; [§10](value-creation.md) — criteria-priority orders that gate the §3 completability thesis
- [Behaviour Change §7](behaviour-change.md) — Problem neurobiology; [§8](behaviour-change.md) — the seven behavior-change triggers; [§10](behaviour-change.md) — Class 1 vs Class 2, First-time vs Nth-time
- [Consideration Activators](consideration-activators.md) — the five Activators and Loading
- [Scientific Foundations §20](scientific-foundations.md) — Goldratt's Critical Chain; [§24](scientific-foundations.md) — social proof / trust as completability proxies
- [B2B](b2b.md) — full B2B treatment (roles × Jobs, personal-Job dominance)
- [Subtraction](../Next-Move-Theory/subtraction.md) — the subtraction meta-operator
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — interview methodology

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

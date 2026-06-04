# Value Creation

This file is the detailed canon page on **value** in AJTBD: what value is, how it is detected inside the customer's brain, the structure of a value-creation move, the catalog of mechanics that produce value, and how to apply them. It expands the short version in [AJTBD key theses §6](ajtbd-key-theses.md) and connects directly to [Behaviour Change](behaviour-change.md) (every value-delivery event is mechanistically a behavior-change event) and to [Job Graph](job-graph.md) (value mechanics are moves *in* the Job Graph).

> This page is plain-English methodology. The underlying neuroscience (allostasis, neural common currency, reward prediction error, loss aversion, dopamine as a learning signal, etc.) lives in [Scientific Foundations](scientific-foundations.md); when this page references a brain-based mechanism, it links there rather than re-explaining the science inline.

---

## 1. The problems with feature thinking

Defining value starts with the four ways feature thinking misses it.

### Problem 1 — feature thinking adds entities; the brain's drive is to remove them

When teams think in features, the default move is *additive* — a new screen, a new button, a new toggle. Over years this accumulation has a well-known industry name: **feature creep.**

The customer's brain is doing the opposite. Under the brain-as-investor framework (§2), it constantly seeks to perform Jobs with *less* — cheaper, less time, less actions, fewer decisions, fewer cognitive load. **The two highest-leverage mechanics in the 100+ catalog — *move up a level* and *kill a Job* (§14) — both *remove* parts of the Job Graph.** The most powerful direction in the methodology is *subtractive* — and the same operator runs across all four Next Move Theory pillars (see [Subtraction](../Next-Move-Theory/subtraction.md)).

**Feature thinking points the opposite direction from where customer value lives.** Features can themselves be subtractive (Face ID killed *type my password*; Tesla's Full Self-Driving killed *drive the car myself*) — but subtractive winners require teams that fight the additive default deliberately, every roadmap cycle.

### Problem 2 — we fall in love with our features

The cursed feature-shipping cycle starts with an *idea* disconnected from the focus segment's Jobs. **In most products there isn't a focus segment and Jobs at all** — or it sits defined so abstractly (*"SMB owners,"* *"product managers,"* *"creators"*) that the Core Jobs the team is competing for never get named. The moment a person becomes attached, identity activates: the feature stops being *"a hypothesis about value"* and becomes *my* feature. **The probability of real customer value drops sharply.** Criticism reads as personal attack; contradicting research gets reinterpreted; kill-it conversations turn into *"we need to message it better."* Identity scales up the org chart — a VP commits in a public roadmap review; killing means walking back the commitment; the team ships it knowing it's wrong.

**The most common failure mode isn't "shipped despite the evidence" — it's "evidence never collected."** A team in love doesn't run the research that would *kill* the feature; they run the one that would *validate* it.

### Problem 3 — feature thinking eats the resources that should go into scaling

For a product past initial product-market fit, **the highest-leverage value-creation work is rarely another feature for current customers — it is work aimed at segment or sub-segments not yet scaled into.** Two failure modes:

- **Mode A — value for the new sub-segment doesn't exist yet.** Added value is *insufficient to overcome the gravitational forces holding the customer on their current way* (habit, switching cost, identity, fears; see [Behaviour Change §9](behaviour-change.md)). *Fix:* apply the mechanics from [Value-Creation Mechanics](value-creation-mechanics.md) to *their* Job Graph, *their* criteria. (Notion → enterprise: individuals' *"organize my thinking"* ≠ enterprise's *"govern team knowledge with compliance"*; missing SSO/SAML, audit log, admin roles.)
- **Mode B — value exists, but the Critical Chain breaks before the new sub-segment can reach it.** Invisible from inside the existing base (every current customer already passed through that part of the chain). *Fix: repair the chain* ([Critical Chain](critical-chain.md)). (Stripe Checkout: *accept money turnkey* already existed; for a local bakery the chain broke at *"I don't know what an API key is."* The no-code drop-in repaired it.)

### Problem 4 — feature thinking ignores the de-risking process

Every new feature is a bundle of risky assumptions. Five independent risky assumptions at 60% survival each combine to 0.6⁵ ≈ 8% survival for the feature as a whole. **The highest-leverage move on a new feature is not to ship it; it is to remove a risky assumption from the set as cheaply and quickly as possible** — the asymmetric arithmetic that makes subtraction beat addition almost regardless of the move ([Subtraction §2(b)](../Next-Move-Theory/subtraction.md)).

The Next Move Theory pillar **Riskiest Assumption Test** (see [Riskiest Assumption Test](../Riskiest-Assumption-Test/rat-key-theses.md)) operationalizes this: list the riskiest assumptions, rank by `(probability of being wrong × cost if wrong) / cost to test`, test the top one cheaply, **kill the feature if the test fails.** The motto: *"kill the product, don't launch it."* Feature thinking inverts this — it treats the feature as valid by default and runs post-hoc validation; by then the budget is spent.

### The four problems compound, and the reframe

The four failure modes are different cuts of the same defect: **the planning unit is the feature.** Problem 1 sets the direction wrong; Problem 2 corrupts evaluation through identity; Problem 3 misallocates resources; Problem 4 inverts the goal. Ronny Kohavi [reports](https://www.abtasty.com/blog/1000-experiments-club-ronny-kohavi/) that roughly **one in three A/B-tested features produces positive lift, one in three is neutral, and one in three is actively *negative*** — destroys value the team was already delivering. **The planning unit must be the value hypothesis, not the feature.**

**The reframe at its limit: the most valuable product is the one the customer doesn't have to use at all** — the Job is performed, no product to interact with ([AJTBD key theses §23](ajtbd-key-theses.md)). The rest of the page works toward that limit: what value *is* (§§2–7), the cost structure (§8), success criteria (§9), segment-specific priorities (§10), the criteria→mechanics map (§11), the Aha Moment (§12), and the mechanics framework (§§13–18).

---

## 2. The definition: value is energy efficiency for the brain in performing a Job — outcome over cost

A product creates value when it lets the brain perform a Job it cares about with **less spent, more gained, or both.** *Less spent* means **cheaper** — less time, fewer decisions, less cognitive load, less monetary cost, fewer negative emotions, fewer Tax Jobs along the way. *More gained* means a better, more reliable outcome against the customer's success criteria, or more Jobs handled at once. **The success criteria are where outcome lives operationally** — they specify, for each Job element, what *"good enough"* looks like. Value is the energy-efficiency of the resulting Solution × Job pairing: *outcome per cost.* The scientific anchor — the canon's working axiom that this energy-efficiency account *is* what the brain computes as value — sits in [Scientific Foundations §2](scientific-foundations.md), built on allostasis (§1) and the common-currency valuation register (§3).

**The process underneath:** *the brain is an investor of its own energy.* It commits attention, mental effort, body resources, money, and time only when it predicts a return *larger* than the spend — in resources the body or psyche needs (food, safety, status, autonomy, future opportunity). Value is the return delivered: outcome in hand per unit of resources spent on the Job. Whatever the methodology calls value — *added value, status uplift, aesthetic delight, peace of mind* — every label reduces to this calculus.

**Value vs behaviour change.** Value is the *absolute* property of a Solution × Job pairing: iPhone 6 retains value (you can still place a call) even when no alternative is available. The *delta* between delivered value and the customer's prior prediction is a separate construct — what drives **behaviour change**: adoption (the *Aha Moment*, §12), switching, retention drift (Red Queen, §6), and learning (Aha Moment / Problem teaching signals, §5). §4 unpacks the predict-and-compare mechanism that produces the delta; §5–§7 unpack what the brain does with it. Conflating value and the delta was the most common pre-AJTBD framing error — the canon explicitly separates them.

**Every value-creation move in product history follows this algorithm.** TurboTax replaced *read IRS instructions, identify forms, do the arithmetic, mail the envelope* with a guided Q&A — same outcome (correct return), much less cognitive spend. Stripe's *"accept payments in 9 lines of code"* — smaller engineering spend for the same outcome. Venmo collapsed *write a check, find a stamp, mail it, wait for it to clear* into a tap — same outcome (money sent), seconds instead of days. **Next Move Theory has the catalog of ~100 mechanics (around two dozen of them are foundational + ~80 more for different business goals). This canon page links the foundational two-dozen in [Value-Creation Mechanics](value-creation-mechanics.md).**

## 3. The value formula

The brain's energy-efficiency calculation takes the operational shape:

`Value ≈ Probability of the Outcome × Outcome − Cost`

- **Probability of the Outcome** — the chance the Solution actually performs the Job at the customer's success criteria.
- **Outcome** — magnitude of the energy-efficiency gain when the Job lands.
- **Cost** — money, time, effort, cognitive load, negative emotions, Tax Jobs (full structure in §8).

**Probability and Outcome combine multiplicatively; Cost enters via subtraction.** Three independent levers — raise the Probability of the Outcome (guarantee, money-back, reliability proof), raise Outcome via move-up-a-level (kills the chain of lower-level Jobs, scaling the gain side multiplicatively — §14.1), or lower Cost (subtract money, time, effort, cognitive load, negative emotion). Dropping Cost to exactly zero triggers a discontinuous affective bonus — why free trials and money-back guarantees consistently out-pull comparably-sized price cuts.

**Why this shape — multiplicative on `Probability × Outcome`, subtractive on Cost (not pure `Benefit − Cost`, not `Benefit / Cost`) — and the two anchoring studies live in [Scientific Foundations §2](scientific-foundations.md).**

## 4. The predict-and-compare mechanism — how the brain drives behaviour change

Value (§2-§3) is the *absolute* energy-efficiency of a Solution × Job pairing. This section is about the *separate* signal the brain produces when value lands — the signal that drives **behaviour change**: adoption, switching, retention, and learning.

**The customer's brain — automatically, continuously, unconsciously — predicts reality.** For every interaction with a product, it predicts **both** the **costs** that getting a specific outcome will require **and** whether that **outcome will actually arrive** at the quality the customer expected. When the experience happens, the brain *compares* its predictions against what actually arrived and produces a delta on each term. **Those deltas — not value itself — are what the brain registers as a Positive Prediction Error, a Negative Prediction Error, or no signal.**

The mechanism implies:

- **A product that performs the Job genuinely well, but only at the level the customer already expected, delivers value but produces no behavior-change signal.** The prediction caught up. The customer keeps using the product (value is still being delivered), but no fresh teaching, no fresh adoption signal — just baseline.
- **The same product, delivered to a customer with lower predictions, drives strong positive behaviour change.** Performance hasn't changed; the prediction has. **You cannot drive fresh behaviour change in a vacuum** — communication, brand, competitor framing, your previous version, every adjacent product the customer has touched, all shape the prediction the customer arrives with.
- **Predictions rise constantly.** The brain adjusts to whatever level it just experienced; yesterday's positive delta is built into today's prediction. To keep driving positive behaviour change you have to keep delivering above the rising bar. (Full treatment in §6.)

The underlying neuroscience is unpacked in [Scientific Foundations §11](scientific-foundations.md). For this file: the brain is a predict-and-compare engine; *behaviour change is driven by the delta — value itself is the absolute energy-efficiency the Solution delivers (§2).*

## 5. Positive and Negative Prediction Errors — the brain's re-learning loop

The predict-and-compare engine of §4 produces a signed delta. The sign matters: each sign triggers a *different teaching signal* in the brain, and behavior reshapes accordingly. This section stays at the logic level — for the underlying neurobiology (dopamine as the teaching signal, the goal-directed vs. habit shift inside the striatum) see [Scientific Foundations](scientific-foundations.md) and [Behaviour Change §7](behaviour-change.md).

**Positive Prediction Error — the *Aha Moment*.** Reality is more energy-efficient than predicted — the Core Job (and the Big Job above it) gets performed faster, cheaper, with less cognitive load, and/or with the outcome beating the customer's success criteria. The brain registers the positive delta as a teaching signal and forms the association *"this Job Graph performs the Big Job well — repeat it."* A window opens (§12) in which the new behavior can take root *if reinforced*; without reinforcement, habit reasserts and the customer reverts.

**Negative Prediction Error — the *Problem*.** Reality is *less* energy-efficient than predicted — the Core Job is performed below criteria, or worse, *not performed at all*, forcing the customer into a Tax Job they didn't sign up for. Negative emotions fire (irritation, anxiety, anger). The teaching signal inverts: *"this Job Graph performs the Big Job worse than I thought — avoid it next time."* **The word the customer uses for this experience is *Problem* — Problem is the human-language label for the Negative Prediction Error.** Underneath sits a structural cause: a Solution hired for a Job performed below that Job's expected success criteria ([AJTBD key theses §7](ajtbd-key-theses.md), [Behaviour Change §6](behaviour-change.md)). Severe or repeated Problems send the customer back to the old Job Graph.

**The mechanism is why expectations rise constantly — by design.** Each Aha Moment doesn't just fire once; it *re-trains the brain's prediction* upward. Yesterday's Aha Moment is built into today's baseline; tomorrow the same delivery produces no Aha Moment at all (though value continues to be delivered — the customer still uses the product). **This is the target state, not a failure mode.** The Tesla owner whose first month of Full Self-Driving felt magical and whose sixth month feels normal has *adopted* the product — the new Job Graph has installed. **And if that same owner gets back into a regular car a year later, they don't experience neutral — they experience a Problem against the now-raised baseline.** Re-learning runs only one way: once the prediction bar has climbed, going back to the old way is felt as under-delivery, not as "nothing." §6 unpacks the Red Queen consequence.

**The implication for product strategy.** Engineering the *first* Aha Moment (the Aha Moment, §12) is necessary but not sufficient. Durable value design requires a *stream* of Aha Moments as the customer's prediction climbs — and especially, ruthless avoidance of Problems, because the brain's negative-learning rate is faster than its positive-learning rate (§7). Activation = first engineered Aha Moment; retention = an Aha Moment-stream against the rising bar — reinforced by the habit and switching cost that can hold a customer even when fresh Aha Moments thin out ([Behaviour Change §9](behaviour-change.md)); churn = accumulated Problems overwhelming all three.

## 6. The Red Queen mechanic — to stay in place, value delivery must accelerate

§5 showed every successful Aha Moment re-trains the customer's prediction upward. The same brain absorbs every other product in the customer's diet, and the prediction bar climbs from every direction at once. **Holding today's value-delivery flat doesn't hold market position flat — it loses it.** Product-market fit is a perishable good ([Zamesin, *Product-Market Fit Is a Perishable Good — Here's the Operating Manual*, Hackernoon, 2026](https://hackernoon.com/product-market-fit-is-a-perishable-good-heres-the-operating-manual)): advantages that once took years to build now evaporate within quarters.

- **The prediction bar is set by everything the customer touches, and yesterday's wow becomes today's baseline.** When iPhone has Face ID, every other phone is expected to have Face ID. When ChatGPT generates a full draft in seconds, every other writing tool is expected to. The substrate is *hedonic adaptation* — the prediction adjusts toward whatever new level of efficiency the customer just experienced. **The bar is set by the best-in-class your customer encounters across their whole product diet — not by the alternative they compare you against at the buying moment.** "We're better than competitor X" is rarely enough; the bar has already moved past competitor X.
- **The Red Queen consequence: to stay in place, you have to keep running — faster every cycle.** A product that holds today's value-delivery flat will, in 12–24 months, still be delivering value — but no *behaviour change* against the now-raised prediction bar. No fresh Aha Moments, no positive switching deltas from competitors, no retention pull. The customer experiences your product as baseline; the market experiences you as a non-option. Constant work on value isn't strategic ambition; it is the *floor*.
- **The vibe-coding era raises that floor.** AI has collapsed the cost of building. A Big Job that took a team-quarter to perform a step better in 2022 takes a small AI-assisted team weeks today. **The question isn't *whether* a competitor can deliver the next Aha Moment — it is *how fast* they can.** Holding the old cadence (annual majors, quarterly increments) means falling behind a now-faster prediction climb. Keep working on value continuously, *and* accelerate the cadence at which value lands in front of the customer. The risk on the other side: mistaking *shipping velocity for learning velocity*; throughput without rigor produces noise. **Ship faster *and* validate harder.**
- **Managing expectations is itself a value lever.** Inflated expectations + real value below them → manufactured Problem → disappointment despite real value. Deflated expectations + real value above them → strong Aha Moment → activation. Communication has to set a prediction the product can actually beat. (See §1 on features-as-promises.)

## 7. Negative prediction errors weigh more than positive ones

The brain doesn't learn symmetrically from Aha Moments and from Problems. **A negative delta against prediction registers faster, lasts longer, and updates the customer's prediction downward harder than a comparable positive delta updates it upward.** A single bad release can undo months of accumulated positive deltas; a single great release rarely earns back what a string of bad ones lost. This is the *negativity bias* — robust across four decades of psychology and behavioral-economics research (loss aversion, asymmetric memory, fragile trust; see [Scientific Foundations §13](scientific-foundations.md)) — applied to the predict-and-compare engine of §4.

**This is also why removing a problem from the customer's experience creates more value AND stronger behaviour change than adding a benefit of the same size.** Two mechanisms reinforce each other: (1) **on the value-side** — cost reduction directly raises the energy-efficiency ratio (`Value ≈ Probability × Outcome − Cost`; §3); (2) **on the behaviour-change side** — the customer's brain registers the removal as roughly twice the positive delta it would register from an equivalent feature add (loss aversion on the delta). Delete a Tax Job, end a friction, kill an anxiety, repair a chain-break — both mechanisms fire. Full methodology treatment in [Subtraction §2(d)](../Next-Move-Theory/subtraction.md).

The asymmetry shows up across every metric a product team cares about:

- **Activation.** A first session with a negative delta installs a *worse* prediction than the customer arrived with. Recovering from *"I tried it and it sucked"* is much harder than starting from *"I never tried it."* First-session experience design carries disproportionate weight.
- **Retention.** A long stretch of mild positive deltas can be undone by a single severe negative delta. **Reliability beats brilliance:** a product that delivers above-prediction 90% of the time but below-prediction 5% of the time often loses to one that delivers slightly above prediction 98% of the time.
- **Word of mouth.** A single negative experience hits each listener harder than a single positive one — the per-event asymmetry. **The widely-quoted "negative WoM reaches 10× the audience of positive" is folklore, not research** — recent data finds positive WoM is often *more* frequent in many categories (see [Scientific Foundations §13](scientific-foundations.md)). Plan for asymmetric *per-event impact*, not asymmetric *reach*.
- **Trust.** Trust accumulates on positive deltas and collapses on negative ones, but not at the same rate. Months of small positive deltas can be wiped out by a single major negative one.

Operational consequences:

- **Don't manufacture negative deltas through overpromise.** Communication that sets a prediction the product can't beat is a manufactured-Problem machine — trust collapses faster than the value built it.

The mechanism is detailed in [Behaviour Change §7](behaviour-change.md).

## 8. The structure of cost — which dimensions matter, and by how much

§2 named *less spent* as one half of value creation. This section unpacks the structure of *spent* into six dimensions and names which ones carry the most leverage in which contexts.

The dimensions:

- **Money.** Price, subscription, fee, transaction cost — the most visible dimension and *frequently the dominant one*. Price sensitivity dominates for commodity goods, replacement purchases, lower-income segments, and any category where alternatives are roughly equivalent on the other dimensions. Underestimating money is as common a product mistake as ignoring it.
- **Time.** Active time *and* waiting time (delivery, scheduling, paperwork-in-flight, queue time between Jobs in the chain). Time cost rises non-linearly for time-poor segments.
- **Effort.** Energy spent to get the result — physical *and* mental. Carrying boxes up three flights is effort; sustained attention on a tax form is effort; learning a new tool is effort. Distinct from cognitive load: cognitive load is *deciding*; effort is *doing*. Products that turn high-effort Jobs into low-effort ones (robot vacuum vs mop; dishwasher vs hand-washing; AI assistant vs writing from scratch) often command durable premiums.
- **Cognitive load.** Choosing between options, holding state in your head, comparing alternatives, remembering instructions — each spends real mental work. The most underweighted dimension by product teams. (Why ChatGPT crushed Word for first drafts: Word made the writer carry the structure-and-content load in their head; ChatGPT moved it into the model.)
- **Negative emotions.** Anxiety, doubt, irritation, shame, embarrassment, fear of failure. Each is a real cost paid during the Job. TurboTax removed the dominant emotional cost of filing taxes (*"am I doing this wrong? will the IRS catch a mistake?"*) — same outcome (correct return), dramatically less emotional cost → strong Aha Moment.
- **Tax Jobs.** Sub-Jobs the customer didn't expect to perform but is forced into — extra forms, calls, steps that exist only because the system requires them. **Each Tax Job is a Negative Prediction Error in human form** (a Problem): the customer arrived predicting a certain set of Jobs and is being asked for more. They compound effort and emotional costs through the chain.

*(Switching cost is a **composite** of effort, cognitive load, and negative emotions paid to leave the current Solution — see [Behaviour Change §9](behaviour-change.md) for treatment as a force blocking behavior change.)*

Operational consequences:

- **Which dimension dominates depends on the segment, not on a universal rule** — the brain doesn't differentiate *"$5 saved"* from *"20 minutes saved"* from *"a worried hour saved";* all convert to the same value-signal, but *which one drives the buying decision* differs. A Walmart shopper and a Wealthfront subscriber both have all six dimensions in play, but rank them very differently. Figuring out the cost-priority ranking *your* focus segment actually uses is itself a value-design activity. The common mistake: a team projects its own cost priorities — what *the team* would care about — onto the customer's segment, instead of investigating what the segment actually cares about.
- **Turnkey services charge a money premium to remove effort, cognitive load, and emotional cost — and win for segments where those dominate.** Belong vs DIY rental management; Wealthfront vs DIY rebalancing; DoorDash vs cooking. For segments where money dominates (lower-income, commodity, infrequent purchases), the trade-off inverts: customers DIY because money saved exceeds effort/cognitive/emotional cost spent.

## 9. Success criteria are where value lives operationally

The neurobiology of value (§§2–7) is the *why*. Success criteria are the *what* — the operational level at which you specify what "more energy-efficient" actually means for this segment performing this Job.

**What success criteria are, structurally.** Success criteria are one of the eight elements of a Job (see [Job Structure](job-structure.md)), tied directly to another element — the *expected outcome*. The expected outcome is *what* the customer wants; the success criteria are the *measurable conditions* by which the customer decides the outcome was delivered well enough — the operational specification of *"good enough."* Typical dimensions: speed, accuracy, completeness, cost, comfort, predictability, privacy, ergonomics, status, absence of negative emotion. Different segments weigh the same dimensions differently — and the priority order over criteria is what makes them different segments (§10 unpacks the recurring orders).

**The diagnostic question for surfacing criteria in an interview:**

*"By what criteria did you decide you got the expected outcome well enough?"*

This is the anchor question — criteria live downstream of the *expected outcome*, so the question has to ask explicitly *against that outcome*. Generic *"was it good or bad?"* questions miss the structural tie.

Canonical treatment in [AJTBD key theses §5](ajtbd-key-theses.md); this section expands the value-creation-specific implications.

- **Same expected outcome + different success criteria = different Jobs — which may belong to different segments, or to the same segment in different moments.** Uber's tariffs are the canonical illustration. Same A and B, same verb (*get from A to B*), but the criteria differ — *cheap+fast* (UberX), *quiet driver, clean cabin, recent-model car* (Uber Comfort), *6+ seats, room for suitcases* (Uber XL), *luxury vehicle, driver in formal attire* (Uber Black). The same person may hire UberX on a weekday commute and Uber Black for a client dinner — two different Jobs, same person; two different Jobs, different segments altogether is also common.
- **Criteria are the lever of differentiation for commodity products.** When the Core Job is the same as 50 competitors, detailed criteria are the *only* lever a small player can pull. Brand and distribution cost orders of magnitude more capital.
- **Without criteria, value is a wish.** *"More effective"* with no criteria attached is a slogan, not a spec. You cannot design for it, test for it, or communicate it.
- **Criteria are the precondition of designing an Aha Moment (§12), and the prediction line for the *negative* sign (§7).** Customers do not get angry against an absolute baseline — they get angry against the criteria they came in with. A B+ delivery against B-criteria reads as a Aha Moment; the same B+ against A-criteria reads as an Problem. Criteria are what the formula's `Probability` and `Outcome` resolve to in practice (§3).

**Concrete examples:**

- *Wealthfront's criteria for "manage my retirement turnkey":* asset allocation rebalanced quarterly without my involvement; tax-loss harvesting fires automatically; the dashboard shows projected balance at age 65 in plain English; monthly statement is one page. *Generic robo-advisor:* unstated criteria → customer compares on fees alone.
- *Stripe's criteria for "accept online payments turnkey":* integrate in one afternoon with 9 lines of code; dashboard shows revenue/refunds/disputes in one view; failed payments retried automatically; chargebacks handled by Stripe by default. *Generic gateway:* unstated criteria → customer compares on processing-fee percentage and stops.
- *Belong's criteria for "rent out my duplex without consuming my evenings":* one 2-hour onboarding walkthrough; guaranteed monthly payment regardless of vacancy; tenant placement/repairs/leasing handled end-to-end; year-end 1099 and Schedule E inputs ready to drop into TurboTax. *Generic property manager:* unstated criteria → customer compares on monthly fee percentage alone.

## 10. Different segments value different criteria — work on what yours values

Every Big Job decomposes into many criteria the customer could use to evaluate "well-performed." Different segments weight those criteria differently — and **which criteria dominate** is what makes them different segments in the first place. **Value design starts with the criteria the focus segment actually cares about, not the criteria the team finds interesting.**

**A segment is defined by *one or several* priority criteria** — sometimes a single dominant dimension (commodity buyers' *price-first*, power users' *control-first*), sometimes a combination of two or three that compound (*speed AND no-stress*, *reliability AND status*, *price AND control*). Both configurations are valid; the segment is what it is. Eight recurring priority orders show up across product categories:

- **Speed-first.** Lawyers under filing deadline; ER patients; on-demand-food customers at 11 PM. The Big Job is performed at any reasonable cost — but lateness loses the Job entirely. *Lever:* turnaround, latency, reliable timing.
- **Price-first.** Walmart shoppers; commodity buyers; subsistence-budget segments. The Big Job is performed adequately at the lowest dollar cost available. *Lever:* unit price, transparent pricing, volume discount.
- **Done-for-me first.** Time-poor affluent professionals; Wealthfront / Belong / DoorDash subscribers; corporate executives. The Big Job is performed *by someone else* with the customer's only role being approval. *Lever:* turnkey delivery, zero customer-side Job decomposition (the *Take the Job off the customer* mechanic).
- **No-stress first.** Anxious patients picking surgeons; first-time founders hiring lawyers; risk-averse retirees. The Big Job is performed *predictably*, with negative emotions held to zero throughout. *Lever:* hand-holding, transparent process, removal of anxiety-inducing steps (the *Remove negative emotions* mechanic).
- **Reliability-first.** Enterprise IT picking Microsoft / AWS over a newer vendor; risk-averse SMB picking ADP over a Series-A payroll startup; cautious investors choosing Fidelity over a new robo-advisor. The Big Job is performed *predictably at scale* — no failure modes, no surprises, no platform risk. *Lever:* track record, SLA commitments, established certifications, big-customer logos. (*"Nobody got fired for buying X."*)
- **Control-first.** Notion power-users; mechanical-keyboard enthusiasts; DIY home renovators; Vim / Linux users; Bloomberg Terminal traders. The opposite of *done-for-me*: the Big Job is performed *the customer's specific way*, with every parameter accessible. *Lever:* deep configurability, extension APIs, exposed defaults, ceiling > floor.
- **Status-first.** Tesla / Porsche / Patek-Philippe buyers; first-class flyers; "old-money" wealth-management clients. The Big Job is performed at a level that *visibly* signals status to peers. *Lever:* aesthetics, exclusivity, brand history, conspicuous price tag (the *Create new connections to higher-level Big Jobs* mechanic — link to the Big Job *"signal who I am"*).
- **Privacy-first.** Apple iOS / iMessage users; Signal / ProtonMail customers; DuckDuckGo searchers; cash-only buyers. The Big Job is performed *without* the platform monetizing the customer's data, communications, or behavior. *Lever:* end-to-end encryption, on-device processing, transparent data practices.

**Identifying the priority criterion (or criteria) of your focus segment is what tells you which mechanic from [Value-Creation Mechanics](value-creation-mechanics.md) to lead with.** Segmentation by Job-Graph similarity (see [Segmentation](segmentation.md)) routes through *priority orders over criteria*, not through demographics. Two segments with identical demographics can have inverted criteria orders — same product strategy wins one, loses the other.

**The diagnostic question:** *"Which one or several criteria are priority for this segment — and is my product designed against those, or against the one I find most interesting?"*

## 11. Mapping criteria-priorities to mechanics — which mechanic to lead with for which segment

§10 named the recurring priority orders. The full catalog of foundational value-creation mechanics — with detailed descriptions and example clusters for each — lives in [Value-Creation Mechanics](value-creation-mechanics.md). The pragmatic question every product team faces: given my segment's priority criterion (or criteria), which mechanic should I lead with? The mapping below is a starting heuristic — real product situations layer mechanics, but the *lead* mechanic is the one to test first.

| Segment's priority criterion | Lead mechanics from [Value-Creation Mechanics](value-creation-mechanics.md) |
|---|---|
| **Speed-first** | Reduce time-gaps between Jobs; Take the Job off the customer (done-for-you); Kill cycles in the Critical Chain; Reduce role-to-role hand-offs |
| **Price-first** | Lower the price; Bundle multiple products / services; Perform the Core Job at the level of expectations (don't overspend on extras) |
| **Done-for-me first** | Take the Job off the customer; Perform more Jobs with one Solution; Perform the Next Job in the Critical Chain; Reduce role-to-role hand-offs |
| **No-stress first** | Remove negative emotions; Fix the Problems; Adjust expectations; Take the Job off the customer |
| **Reliability-first** | Perform the Core Job at the level of expectations; Better meet success criteria; Fix Critical Chain breaks between different people; Kill cycles in the Critical Chain |
| **Control-first** | Perform more Jobs with one Solution; Better meet success criteria (on the control-related dimensions the segment tunes for); Perform Small Jobs for additional Big Jobs |
| **Status-first** | Perform Jobs while satisfying deeper needs (status); Create new connections to higher-level Big Jobs (*"signal who I am"*); Exclusive value — only available here |
| **Privacy-first** | Remove negative emotions (tracking anxiety); Better meet success criteria (on the privacy dimension); Exclusive value (privacy as a moat) |

The mapping is a starting point, not the answer. Real value-design sessions: (1) name the segment's top criteria (use the §9 interview question); (2) pick 1–2 lead mechanics from the row above; (3) generate concrete moves; (4) de-risk through [Riskiest Assumption Test](../Riskiest-Assumption-Test/rat-key-theses.md) before building.

**Common mistakes the table prevents:**

- Designing for *speed* when the segment is *reliability-first* — speed gains don't compensate for missing track-record.
- Designing for *price* when the segment is *status-first* — lowering the price destroys the status link.
- Designing for *done-for-me* when the segment is *control-first* — automation that hides controls is felt as removal, not gift.

## 12. The Aha Moment — engineering the first positive prediction error

**What the Aha Moment is.** The Aha Moment is the customer's *positive prediction error* against the success criteria they came in with — *"WOW — this is actually doing it"* sentence. Biologically the brain's teaching signal fires (*"this Job Graph performs the Big Job better than expected — repeat it"*). Operationally, the Aha **opens the window** for the new Job Graph to take root — but the window may close if the experience isn't reinforced ([Behaviour Change §7](behaviour-change.md)).

**The Aha Moment is a specific past event, not a vague feeling.** When studying loyal customers, ask:

*"At what specific moment were you pleasantly surprised by this product's value?"*

The answer is usually concrete and detailed. That specific event is what you re-engineer for every new user as early as possible.

**Canonical Aha Moments — what loyal customers actually report:**

- **Dropbox:** *"My file synced across my laptop and my desktop without me doing anything."*
- **Slack:** *"I sent one message and got three replies inside a minute — the whole team was in the channel."*
- **Stripe:** *"I pasted 9 lines of code and the test payment cleared in the dashboard."*
- **Wealthfront:** *"My deposit landed, the allocation auto-rebalanced, and the projected balance at 65 showed up — no spreadsheet, no advisor call."*
- **ChatGPT:** *"I asked for a marketing email; the model returned a usable draft in 10 seconds."*
- **Belong:** *"The first rent payment landed on the 1st even though the unit had been vacant for two weeks. The guarantee was real."*

**Position the Aha Moment as far leftward in the customer's Critical Chain as possible.** In the [Critical Chain](critical-chain.md) of Jobs leading up to the Big Job, every step *before* the Aha Moment is a step where habit, fear, or distraction can pull the customer back to the old Job Graph. The earlier the Aha Moment fires, the smaller the abandonment window. Dropbox famously rebuilt their entire onboarding around delivering the file-sync Aha Moment inside the first session. **The more customers who reach the Aha Moment, the higher the conversion to the next Job in the Critical Chain — and the larger the cumulative economic effect.** Each step before the Aha Moment is a funnel stage that loses some fraction of the cohort; moving the Aha Moment leftward both shrinks the abandonment window per customer *and* raises the proportion of customers who ever experience it.

**New-category products are a special case.** When the customer has no prior prediction against which to measure, any positive experience produces a strong Aha Moment — there is no bar to beat. Structural advantage *and* structural difficulty: without Consideration Activators the customer never tries it (Class 2 in [Behaviour Change §10](behaviour-change.md)).

**One Aha Moment is the start, not the end.** The window the Aha Moment opens closes if subsequent sessions don't deliver more Aha Moments. Activation = first Aha Moment; retention = a stream of Aha Moments over time against the rising bar (§6) — reinforced by the habit and switching cost that can hold a customer even when fresh Aha Moments thin out ([Behaviour Change §9](behaviour-change.md)); churn = accumulated Problems overwhelming all three.

## 13. Where added value comes from — three sub-sources on the Job-Graph side

§2 said value is *less spent, more gained, or both.* §8 unpacked the *less spent* side. This section unpacks the *more gained* side — the deeper of the two sources, because it comes from changing **which Jobs the customer performs**, not just the cost of performing them.

Job-Graph optimization has three sub-sources:

- **(a) Optimize the graph itself.** Kill Jobs in the chain; perform more Jobs with one Solution; expand into Previous or Next Jobs; fix breaks in the Critical Chain; remove cycles. Most of the 100+ catalog operates here.
- **(b) Perform the Core Jobs to the segment's success criteria (§9).** The most-skipped move. Until criteria are nailed, every mechanic stacked on top is leverage on nothing. (The *Perform the Core Job at the level of the segment's expectations* mechanic.)
- **(c) Find a categorically different way to perform the Big Job — i.e., *move up a level* (§14.1).** Rarest and highest ceiling; full treatment in §14.1.

The mirror source — *less spent* via cost reduction — is unpacked in §8. Both sides feed the same value formula (§3).

## 14. The two dominant mechanics: move up a level, and kill a Job

Across the whole 100+ catalog, two mechanics dominate the rest in raw leverage whenever they are applicable. Both have the same structural property: **they don't add features, they remove Jobs.** They are the AJTBD-side projection of the cross-pillar subtraction operator ([Subtraction §1](../Next-Move-Theory/subtraction.md)).

### 14.1 Move up a level

Climb one level in the Job Graph: turn a Big Job that sits above your current Core Jobs into your new Core Jobs, and in the process kill many of the lower-level Jobs that the customer previously had to perform. (See [AJTBD key theses §23](ajtbd-key-theses.md).)

- **Uber climbed above owning a car** — became the Core Job for *"get from A to B around the city, on demand."* All car-ownership Jobs (buy / finance / insure / park / refuel / DMV / service / sell) stopped being performed by the rider.
- **Squarespace climbed above hiring a developer to build a small-business site** — became the Core Job for *"have a website live for my business."* All lower Jobs (hire a developer, brief the build, review iterations, buy hosting, manage plugins, renew SSL) collapsed into *"drag, drop, publish."*

This is the methodology-level explanation for the AI-product wave: every fast-growing neural-net product (Claude Code, Codex, Cursor, OpenClaw) is climbing above some Big Job in knowledge work and deleting the entire class of lower-level Jobs. Move-up-a-level produces the largest possible Aha Moment because added value scales with how much of the old graph the new Solution deletes — and AI products delete more of it than any prior product class.

**The check question (threat from above):** *Are there players today doing my Big Job turnkey while I deliver only an element of it?* If yes and they can scale → existential threat; you are forced to climb too. The small-business web-development agency market shrank dramatically over a decade because Wix / Squarespace / Webflow climbed above it; **the same dynamic is now playing out in every category where AI can climb above a previously manual Big Job.**

### 14.2 Kill a Job

Lower-level Jobs disappear *as a class*. The customer doesn't have to perform them anymore.

- **AirPods killed *"untangle my headphones"*** — a Tax Job nobody enjoyed.
- **Face ID killed *"type my password"*** — across every iPhone unlock and every app login.
- **Zoom killed *"buy a plane ticket, get to the airport, fly to the meeting"*** for the entire class of meetings that used to require physical presence.

Move-up-a-level *is* Kill-a-Job applied to many lower-level Jobs at once. Both move toward the invisible-product limit — §20 closes the file with the full treatment.

## 15. When you don't know what to do, look up to the Big Job

The most reliable heuristic in product when the team is stuck: **stop asking *"what feature should we add to our Core Jobs?"* and go re-read the segment's Big Jobs with their success criteria.** Big Jobs carry the motivation; Core Jobs are merely what the product does. The Big Jobs + their criteria are the design brief; everything below is implementation. The operational question becomes *"how can we perform these Big Jobs more energy-efficiently against the success criteria the customer actually uses?"*

**Worked example.** A financial audit firm operating only at the Core-Job level *"do a financial audit"* differentiates on price and turnaround time — and converges with every other audit firm. Looking up to the Big Job *"don't lose money to fines and tax penalties,"* a new value hypothesis appears: *"our audit is insured by a major carrier for up to $30M of liability."* Same Core Job, new link to the Big Job above, born by climbing one level in the graph (the *Create new connections to higher-level Big Jobs* mechanic).

## 16. The Big Job is the compass; the Core Job is what your product does

Big Jobs carry the customer's motivation. Core Jobs are what your product actually performs. The relationship between the two is the single most important framing for value design — §15 gave the look-up heuristic; this section names two structural moves that fall out of it.

- **Create an additional link to a Big Job that wasn't connected before.** A premium bottled water that costs $10 still performs the Core Job *"hydrate"* — but it also creates a new link to the Big Job *"create aesthetics at my dinner table."* Apple's MacBook performs *"get my creative/knowledge work done"* and links to *"signal status and aesthetic taste."* Both raised willingness-to-pay enormously without dramatic changes to our Cores Job.
- **Find unexpected competitors via the Big Job.** Your direct competitors share your Core Job; your *real* competitive set is everything serving the same Big Job. A mattress competes with coffee, melatonin, and a white-noise machine (all serve *"stay functional on insufficient sleep"*). A weekend-getaway booking competes with Netflix (both serve *"escape my weekly routine"*). A CRM competes with a paper notebook.

## 17. The unique value usually lives *outside* your current Core Jobs

The largest available value is rarely a better version of your current Core Jobs. It is usually a Job you don't perform yet — Previous, Next, fixing Critical Chain for our Core Jobs, or one level up.

- **Slack.** Original Core Job: *"chat with my team asynchronously."* Each expansion performed a new Job adjacent to the original — *"keep a focused side-conversation alongside the main channel"* (threads); *"jump on a quick voice call with a teammate without scheduling"* (huddles); *"capture team-shared knowledge in one place"* (Canvas); *"work with external partners inside our chat"* (Slack Connect); *"catch up on what I missed in 30 seconds"* (AI summaries).
- **Figma.** Original Core Job: *"design an interface together with my team."* Each expansion performed a Job adjacent to the original and defended the Core Job by raising switching cost — *"give and receive design feedback in context"* (comments); *"show stakeholders how the design will behave before any code is written"* (prototyping); *"hand off the design to engineering with specs and tokens"* (Dev Mode); *"present my design work to the team or to a client"* (Slides).
- **Notion.** Original Core Job: *"write and share my notes and documents."* Each expansion absorbed a Job the same user was performing in another app — *"organize structured information in one place"* (databases); *"track what I'm working on"* (tasks); *"keep team knowledge findable"* (wikis); *"collect input from teammates or customers"* (forms); *"generate, summarize, or restructure what I'm writing"* (AI).

The pattern: once you perform your Core Jobs to their criteria, the next unit of value is rarely inside your current Core Jobs. It is across the boundary — in the Previous Job (lead-gen, capture earlier in the chain), the Next Job (cross-sell, retention), the sibling Small Job (a Job at the same level as yours, serving the same Big Job, performed by the customer themselves or by another Solution — performer-agnostic; see [Job Graph §2](job-graph.md)), or one level up (move-up-a-level, §14). **Or — equally valid — go create value for the *Core Jobs of a different segment* entirely.** Once your current segment's Core Jobs land at criteria, scaling to an adjacent segment's Core Jobs is often a larger value pool than further expanding within the current segment's Job Graph.

## 18. The mechanics catalog

**The canonical catalog of value-creation mechanics — with detailed descriptions, example clusters, Russian translations, and cross-refs to deeper canon — lives in [Value-Creation Mechanics](value-creation-mechanics.md).** That file is the entry-level slice every product person should know cold; the broader 100+ Next Move Theory catalog (including go-to-market, retention, pricing, scaling, exit-from-direct-competition) lives in [Mechanics Catalog](../Next-Move-Theory/mechanics-catalog.md) — internal-only.

> **Each mechanic, without exception, grounds out into one of three things** — a coarser grouping of the six foundations in [AJTBD key theses §22](ajtbd-key-theses.md):
> 1. Creating value — performing the Jobs of a focus segment more energy-efficiently against the Big Job's success criteria.
> 2. Communicating value that has already been delivered — making the customer aware that the more energy-efficient way exists for them.
> 3. Upstream segment-and-Job work that lets us know *whom* to create value for next.

§11 picks the lead mechanic(s) from this catalog for each segment's priority criterion.

## 19. Deferred value and the future-discounting problem

Value that arrives *in the future* is systematically underweighted by the brain — the temporal-discounting / hyperbolic-discounting literature (see [Scientific Foundations §14](scientific-foundations.md)). It shapes how the customer evaluates products and creates a specific kind of communication problem.

- **Mechanism.** Cost is felt with present-tense weight; the Outcome side is discounted hyperbolically when deferred. Net: in the §3 shape `Probability × Outcome − Cost`, `Probability × deferred-Outcome` collapses far faster than `present-Cost` does — the subtraction registers as net-negative long before rational analysis would call it so. *"No breach next year," "no penalty next April," "no health problem in five years"* all face this collapse.
- **Implication.** Products with deferred value — information security, insurance, preventive health, tax planning, retirement saving, asset protection — face structural difficulty in communication. The benefit is real but the brain doesn't fully credit it.
- **Communication strategy.** Rewrite the deferred benefit as a present-tense experience the brain credits immediately: peace of mind tonight; the auditor signing the same day; three weeks of release-blocker review saved on the next launch. (Detailed examples and copy patterns in [Communication](communication.md).)
- **Operational connection:** this is the *Remove negative emotions* mechanic ([Value-Creation Mechanics](value-creation-mechanics.md)) applied to a deferred value. Sell *the elimination of present-tense anxiety* about a future loss, not the future loss itself.

## 20. The invisible product is the North Star — the asymptote the whole catalog approaches

§1 introduced the limit case; §14.2 named it as the natural endpoint of *kill-a-Job* and *move-up-a-level*. This section closes the file by naming it as the North Star the entire §18 catalog points at. **The invisible product is the limit at which the Job is performed and the customer never has to interact with a product at all** — *the apartment is clean and there was no cleaning product; the meeting happened and there was no trip; the federal return was filed and there was no tax product.*

**The asymptote works because it is unreachable.** Higher-level Jobs always exist — when the current Big Job's chain collapses, a new Big Job at the level above enters the customer's attention with its own chain of lower-level Jobs underneath (see [Job Graph §14](job-graph.md)). The customer's prediction bar keeps rising (§6); yesterday's invisible product is today's baseline. Holding the same subtraction level over time produces a falling perceived-value curve; staying near the asymptote requires subtracting more, continuously.

**The compass question for every team and every feature review:** *"What would it look like for the customer to reach this outcome with no product to interact with at all?"* The answer is rarely shippable as it stands. What it surfaces is the direction the next mechanic should point — toward more subtraction, not more addition. Teams that can't produce an answer have, by default, drifted back into additive feature-thinking (§1).

**Two independent traditions converge on this limit.** AJTBD arrives at the invisible product from Job-and-value logic. Genrikh Altshuller's TRIZ arrived at the same limit case from engineering theory in the 1950s — the *Ideal Final Result*, where the function is performed *without a system to perform it* (see [Scientific Foundations §21](scientific-foundations.md)). The cross-pillar treatment — invisible product as the asymptote of the meta-operator across all four NMT pillars — lives in [Subtraction §3](../Next-Move-Theory/subtraction.md).

---

For deeper unpacks of specific topics referenced above:

- [Job Graph](job-graph.md) — the Job Graph, levels, moves
- [Critical Chain](critical-chain.md) — critical chains, breaks, cycle removal
- [Behaviour Change](behaviour-change.md) — full mechanism of how Aha Moment/Problem rewires customer behavior
- [Consideration Activators](consideration-activators.md) — the Consideration Activators construct that makes Class-2 (unfamiliar Core Job) switches possible
- [Scientific Foundations](scientific-foundations.md) — AJTBD's key hypothesis of value (§2), neural common currency (§3), purchase-decision neuroscience (§4), the AJTBD need taxonomy (§5), status as rank-position motivation (§6), identity-based motivation (§7), Jobs as need-serving goal representations (§8), habit physiology (§15), Immunity to Change (§16), variable-ratio reward loops (§18)
- [Communication](communication.md) — how to convey delivered value, formulas, landing-page structure
- [Subtraction](../Next-Move-Theory/subtraction.md) — subtraction as the meta-operator across all four NMT pillars; the four-way ROI asymmetry that makes removing beat adding; the invisible-product asymptote; the structural team bias against subtraction
- [Create Value](../Algorithms/create-value.md) — step-by-step algorithm for applying these mechanics to a real product situation

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

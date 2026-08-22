# Job Structure — Under the Microscope

This page is the per-element deep-dive on the structure of a single Job. The canonical framing lives in [AJTBD key theses §2](ajtbd-key-theses.md) and [AJTBD key theses §3](ajtbd-key-theses.md): what a Job is (the specification of a desired transition — the person's situation, State A; the transition process; and the expected outcome, State B), why it is the right unit of analysis, and how the Critical Chain of Jobs delivers it. This page does not restate that. It adds a worked walkthrough of all four phases of one US Job, an extended treatment of each of the eight elements that fully specify it (with interview questions, anti-patterns, and operational consequences per element), the analytical pair `Job + chosen Solution`, and the practitioner discipline (abstract→concrete, fidelity levels, interview moves) needed to produce Jobs accurate enough to design against.

Cross-page boundaries:

- Job *Graph* (how Jobs relate at multiple levels, Critical Chains of Jobs, cycles) → [Job Graph](job-graph.md).
- Interview mechanics → [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md).

---

## 1. Why *the Job* — and not the *need* — is the right unit of analysis

[AJTBD key theses §2](ajtbd-key-theses.md) carries the canonical antitheses (*Job ≠ need, ≠ problem, ≠ feature*) and the operational consequences. This page adds the scientific grounding — the part that explains why the Job sits at the right level for design and research.

Need theories make the case. Maslow, Self-Determination Theory, Grawe, Dweck, belongingness research, and adjacent social-motive work converge on a stable applied point. Humans carry durable needs: physiological integrity, safety and predictability, relatedness, competence, autonomy, plus recurring market-relevant extensions like status, growth, and coherence (see [Scientific Foundations §5](scientific-foundations.md)). Those needs fail as a working unit on two grounds. They are too abstract to design against — a banner cannot be written from *"this segment has a need for safety and autonomy."* And direct questioning about them returns confabulation rather than data (see [Scientific Foundations §10](scientific-foundations.md)).

**The brain bridges from needs to action by forming concrete goals in concrete contexts, and those concrete goals are Jobs.** Working under metabolic constraints (allostasis — see [Scientific Foundations §1](scientific-foundations.md)), the brain produces *"buy round-trip tickets to Cabo before the PTO date is locked,"* *"open a Wealthfront account this weekend,"* *"get the AC installed before the next heat wave."* These formulations are specific enough that a researcher can interview against them, a designer can target them, a marketer can communicate to them, and a pricing team can anchor on them.

**AJTBD is not invented vocabulary — it operates on the structure of motivation that already exists in the human brain.** The methodology's contribution is not the invention of Jobs. The brain forms them either way. The contribution is the discipline of extracting them accurately and the operating logic built on top.

Operational consequence: researching needs directly is a category error — the wrong grain, with no reliable customer report. Research the Jobs and the emotions instead. The customer can name both when interviewed against a concrete past performance.

---

## 2. The four phases of a Job's transition — walked on one concrete US example

[AJTBD key theses §10](ajtbd-key-theses.md) places the Critical Chain of Jobs as the operational core of AJTBD — the time-projection of the Job Graph at a chosen Solution, where predictions, prediction errors, interruptions, and the lived walk happen. This section walks all four phases through one fully-fleshed US Job. It is dense enough that the operational shape becomes visible, so the per-element sections below (§§3–10) can refer back without re-introducing the example.

The Job: a parent of two in Austin wants to fly the family to Cabo for spring break. *"Buy round-trip tickets for four — under $1,800 total, layovers no longer than 2 hours and no overnight stays, all four seats together, checked-bag fees included in the displayed price."*

- State A — the current situation. The parent's *context* (two kids 6 and 9, work-from-home flexibility, Austin → Cabo route, holiday-week pricing pressure). Their *past experience* (a prior overnight stuck in Mexico City — *"never again"* — which drove the *no overnight stays* criterion). The *Consideration Set* they hold (Google Flights, Kayak, Costco Travel, the Chase Sapphire portal — each candidate Solution carries predicted costs, benefits, fears, and the Job Graph it would install; a friend's recommendation that bundling through one site beats DIY has already been loaded into the Set). And the *negative emotions* while the result isn't yet in hand (anxiety the seats won't be together, mild frustration about holiday surcharges). State A also holds the *prediction*: before acting, the brain has a forecast of how the booking will go and how it will feel once it lands. The prediction is brain-side mechanism — the predict-and-compare engine ([Value Creation §4](value-creation.md)) — not a ninth element of the Job. We don't ask for it in interviews and don't record it in the Job, because it already lives implicitly in the success criteria (§8) and the Consideration Set (§5) the customer carries.
- Trigger — the event that kicks off action. Internal (*"I'm anxious enough now to handle this tonight"*) or external (*"my manager just approved the PTO dates"*). Before the trigger, the parent is contemplating the Job. After the trigger, they are performing it.
- Action — the path toward State B. The customer picks a specific Solution from the Consideration Set. That pick installs a Critical Chain of Jobs of lower-level Jobs (the chain the chosen Solution proposes for the Big Job above). The customer walks the chain — open Kayak, search dates, compare itineraries, hold seats, pay, receive confirmation. During the walk, the brain compares each step's reality to its prediction. Full operational dynamics of the walk — predictions, prediction errors, interruptions, drop-offs, Solution switches — live in [Critical Chain of Jobs](critical-chain.md).
- State B — the desired result. The expected outcome with its success criteria, the *positive emotions* once it lands (relief, anticipation of the trip, quiet pride at having handled it cleanly), and the *higher-level Job* this Job was performed *in order to* perform (*"give the family a great spring break"*).

The eight elements of this Job are unpacked one section at a time below: context (§3), negative emotions (§4), Consideration Set (§5), trigger (§6), expected outcome (§7), success criteria (§8), higher-level Job (§9), positive emotions (§10). The canonical eight-element list, and the worked Uber Comfort SF example, lives in [AJTBD key theses §3](ajtbd-key-theses.md).

---

## 3. Element 1 — Context: features of the person and situation that produce exactly these criteria

**Context is the features of the person and the situation that make this person want exactly this outcome with exactly these criteria.** It is the upstream variable that explains the criteria. Change the context meaningfully and the criteria can shift, and therefore the Job, and therefore the segment.

The diagnostic test is whether it influences the outcome and the criteria. If yes, it is context. If no, discard it. *"It was Friday"* is not context unless Friday-ness changes a criterion. Context is not background information. It is the *cause* of the criteria.

B2C examples:

- psychological features (anxious vs. calm)
- past experience that conditioned a specific criterion (the Mexico-City overnight that produced *no overnight stays* in §2)
- life-stage features (parent of young kids, recent transplant, no car)
- current situation (holiday-week pricing pressure, recently confirmed PTO)

B2B examples:

- role features (Director of Engineering at a 50–200-engineer SaaS company hiring against a Q4 ship deadline)
- past role experience (*"the last vendor fell over at 100k req/sec"* drives *must hold at production load*)
- company features (Series-B, ARR $10–30M, no in-house security team)
- industry features (HIPAA-regulated healthcare, requires BAA)
- situational features (audit in 30 days, board pressure, Q4 budget freeze)

Same expected outcome (*"book a hotel"*), two contexts, two Jobs. *Vacation* (close to attractions, on-site pool, search speed doesn't matter) vs. *business trip* (fast Wi-Fi, gym, quiet room, search speed *does* matter). Different criteria sets, two different Jobs. If the *same* person performs both on different days, that's two Jobs in one person's graph — one segment, not two ([AJTBD key theses §12](ajtbd-key-theses.md)). Two *segments* would mean different *people* performing the surface verb under different criteria.

Operational consequences:

- Use context as a segmentation criterion only when it changes criteria. If a context feature produces different success criteria, it can separate Jobs and segments. If it doesn't, it is background noise.
- A respondent who states a Job without context is incomplete data. Dig it with the context question — *"What situations did you find yourself in when you decided to use {solution} to get {expected outcome}?"* — not with a trigger question (the triggering event is a separate element, §6). Without context you cannot tell whether this is one Job or several.

Interview question: *"What situations did you find yourself in when you decided to use {solution} to get {expected outcome}?"* — regular-Job variant: *"What situations do you usually find yourself in when you decide to use {solution} to get {expected outcome}?"*

---

## 4. Element 2 — Negative emotions in State A: what the customer feels while the result is not yet reached

**Negative emotions are the brain's signal that the customer is not where they need to be.** Anxiety, irritation, doubt, shame, frustration, fear — they are the brain's affect-and-appraisal signal. They fire *before* the conscious thoughts and rationalizations that sit on top of them (see [Scientific Foundations §9, §10](scientific-foundations.md)). The emotion is what motivates the customer to act.

Avoiding the State-A negative emotions is itself motivation — the *avoid* direction running alongside the *approach* toward State B (§10). The two don't simply add. They integrate into one net valuation, and the avoid term weighs heavier (negativity bias — [Scientific Foundations §13](scientific-foundations.md)).

**Eliminating a negative emotion is one of the highest-leverage value-creation mechanics** (see the *Remove negative emotions* mechanic — [Value-Creation Mechanics](value-creation-mechanics.md)). Square's tipping screen removed the negative emotion of choosing a tip while the barista watched. TurboTax removed *"am I doing this wrong; will the IRS catch a mistake?"* Insurance sells *"I sleep at night,"* not *fewer break-ins*. Each engineers the same operation — drop a unit of anxiety from State A.

Operational consequences:

- A Job record missing its emotions is incomplete. Without the State-A negative emotions, and the State-B positive ones (§10), you don't know the *pressure* the customer is under or the *destination* they're moving toward, and your messaging misses both.
- Communication in the customer's emotional language increases ad and funnel conversion. *"Stop worrying about whether your IRS return is right"* moves the State-A-anxious customer. *"File your taxes accurately"* doesn't.

Interview question: *"Until you got {expected outcome}, did you feel any negative emotions?"* — the reply must surface emotions felt *before* using the Solution, not problems that arose during use.

**A respondent not naming a negative emotion is not evidence there isn't one.** Most people under-report here, for predictable reasons. The emotion is *weak* and was never consciously registered. Or you haven't built enough rapport and emotional safety for them to be vulnerable with you. Or they don't realize you're asking about *emotions* specifically and need an example to model the answer. Or they simply aren't fluent in the language of emotions, which is normal, not a signal of absence. Treat a flat *"no, nothing"* as a cue to build safety and offer an example, not as a finding.

---

## 5. Element 3 — Consideration Set: what the customer's brain compares at the moment of choice

**The Consideration Set is the customer's existing knowledge of how to perform the higher-level Job efficiently — held in State A as four slots the brain compares when the trigger fires.** It is what the customer carries into the choice moment. It is not a separate unit of analysis. It lives inside the Job ([AJTBD key theses §1, §2, §3](ajtbd-key-theses.md)).

**Loading Consideration Activators is the operation that writes into this Set.** *Consideration Activators* names the *content* we inject (five pieces — see [Consideration Activators](consideration-activators.md) and [AJTBD key theses §18](ajtbd-key-theses.md)). *Loading Consideration Activators* names the *act* of putting that content into the customer's head through communication, content, peer story, demo, or first-hand trial. Each Solution awakens its own Job in the customer's head. Load Consideration Activators about Wealthfront and the customer's *"manage my retirement"* Job acquires Wealthfront-shaped success criteria. Load Consideration Activators about Belong (turnkey rental management) and *"rent out my duplex"* acquires Belong-shaped criteria. Same higher-level motivation, different loads, different awakened Jobs.

The four slots of the Consideration Set are the canonical model. The *five* Consideration Activators components write into these *four* slots — the two fear-related components both land in slot 4 (see [Consideration Activators §1](consideration-activators.md)).

1. Awareness of available Job Graphs for the higher-level Job — which ways exist to perform the Big Jobs, and which Core, Small, and Micro Jobs each candidate Solution would have you perform.
2. Comparative energy-efficiency of the Big Jobs across Solutions — how efficiently each candidate Solution's Core Jobs (each a different graph) perform the Big Jobs, by which concrete success criteria each graph is better or worse.
3. Named products with entry paths — brand plus first concrete step (download, sign up, book a call, ask the bank teller).
4. Fears about the alternatives, and what reduces them. For each way (ours *and* competitors'), the customer's prediction that the Big Jobs won't be performed well — a Critical Chain of Jobs break, Problem, Tax Job, personal risk, or irreversible loss — together with whatever prevents, absorbs, reverses, insures, or makes it irrelevant. In Consideration Activators this is two acts (reduce the fear about our way, fire the fear about the competing way), but in the customer's head it is one slot.

A compact Job record can store a compressed version, but the underlying four slots are the canonical model. In practice the full four-slot Set is usually left out of the Job record. Digging it in detail is slow and attention-expensive, so teams reconstruct it fully only when a specific task demands it — most often *choosing which segments to compete for,* also win/loss analysis and competitive positioning. It is always present in State A. It just isn't always worth surfacing or showing. The full mechanism — how Loading Consideration Activators populates the Set, fires alternatives out, and updates predictions across multiple touches — lives in [Consideration Activators §8](consideration-activators.md).

Operational consequences:

- Loading Consideration Activators is how a team awakens the *specific* Job they want the customer to perform — ours, not a competitor's. Without Consideration Activators loaded into the Consideration Set, the customer either doesn't know our Job exists or has it framed in some other Solution's shape. The trigger (§6) then fires in the wrong direction.
- Loading Consideration Activators is what makes radically unfamiliar products sellable at all. Without it, an innovative product fails not because the value isn't there but because the customer never learns the new Big-Job-and-Graph pairing exists at all (see [AJTBD key theses §18](ajtbd-key-theses.md)).

Questions to reconstruct the full Consideration Set:

- Awareness: *"Between which ways of getting {Big Job's expected outcome} were you choosing?"*
- Comparative value: *"Comparing those ways for {Big Job's expected outcome} — what did each do better or worse, and which came out ahead for you?"*
- Named product plus door: *"Which exact products did you have in mind, and did you know how to start with each?"*
- Fears plus reductions: *"What fears did you have that these ways wouldn't perform {Big Job's expected outcome} well — and did anything reduce those fears?"*

---

## 6. Element 4 — Trigger: the event that flips the customer from contemplation to action

**The trigger is the internal or external event that flips the customer from *thinking about* the Job to *spending energy on it.*** Even external triggers register through an internal psychological process. The mechanism is at the brain level. The *cause* of that switch can sit outside (a manager's approval, a price drop, a heat wave) or inside (an accumulated anxiety crossing a threshold).

The defining feature is that the customer can be in context, with the Job in their head, for a long time without acting. The Austin parent of §2 has been thinking about the Cabo trip for months. The booking happens the day the manager approves the PTO dates. The Phoenix homeowner has been thinking about installing AC for a year. The call happens the first day temperatures cross 105°F. The CTO has known about the security gap for two quarters. Procurement starts the week the legal team forwards a fresh data-breach industry report.

A useful taxonomy — two axes, four cells:

| | **External** | **Internal** |
|---|---|---|
| **Planned** | A scheduled SOC-2 audit deadline; a renewal date; quarter-end budget cycle | A scheduled review of personal goals; a planned re-evaluation of one's tooling stack |
| **Unexpected** | A breach announcement; a sudden price hike; a friend's recommendation; a manager's approval | An accumulated frustration crossing a threshold; an anxiety spike; a flash of curiosity |

Operational consequences — the trigger is one of the few elements where a team can act before, at, *and* after the event:

- You can *be* the trigger. Loading Consideration Activators (§5) into the customer's head awakens the Job in the first place, and the moment of Consideration Activators-load itself functions as a trigger for the new way (see [Behaviour Change §8](behaviour-change.md) for the trigger-as-receptivity-window framing).
- You can *time* outreach to triggers already firing. The same message at the moment of contextual pressure (the heat wave, the breach headline, the manager's approval) lands ~10× harder than in a steady-state habit moment.
- You can *embed* in triggers via partners. Place the rental-car kiosk at the airport baggage claim. Place the kid-sized car-seat promo on the route a parent's GPS shows after landing. Place the Wealthfront ad on the Robinhood account-export page. The partner's surface owns the trigger; you position your Solution where the customer is already in motion.
- You can *build* trigger-to-brand associations through advertising. This is the Coca-Cola mechanic: heat → Coca-Cola; popcorn at a movie → Pepsi; drive-thru hunger → McDonald's. Repeated pairing of a trigger with a brand re-trains the customer's brain to reach for that brand the moment the trigger fires next. Slow and expensive, but it compounds over decades.

Two further distinctions:

- For regular Jobs (a weekly cleaning, a daily commute, a monthly bill-pay), the trigger can be non-obvious or absent — the Job runs on a recurring schedule. The *schedule itself* substitutes for a trigger. Surface it as *"how often does it happen and on what cadence?"*
- Necessary conditions are not triggers. *"Being home"* is necessary for the cleaner to clean, but it is not what triggered today's clean. The trigger is the scheduled day arriving, the houseguest announcement, the spilled coffee. Necessary conditions sit in the context; triggers sit in time.

Interview question: *"At what point did you start doing something to get the {expected outcome}? What was the trigger?"* The answer is a concrete moment in time, not a vague *"when I felt ready."*

---

## 7. Element 5 — Expected outcome: `I want to + infinitive verb (+ object when the verb takes one)`

**The expected outcome is the primary element of the Job — the part that begins with `I want to + infinitive verb` (with its object, when the verb takes one).** Everything else in the eight-element structure (§§3–10) is grouped around this one phrase. The full Job can be shortened to it in conversation, on a slide, in ad copy, but never in the source-of-truth record.

A Job's outcome is `I want to` plus a verb, plus an object when the verb needs one. Add the object when the bare verb leaves *"verb what?"* open: *learn → learn how to code; hire → hire a senior engineer; file → file my tax return.* Drop it when the verb is already complete on its own: *I want to sleep, to rest, to relax.* For a feeling it's *feel + a state:* *I want to feel safe, to feel calm.* What pins down *"good enough"* is not the noun. It's the success criteria (§8). *"I want to sleep"* is a Job. *"Sleep 8 hours uninterrupted, asleep within 15 minutes"* is one you can build against. Each verb is a different Job. The same verb with different criteria is also a different Job (§8, §11). Several verbs in one statement are a stack — parse them (§13).

Three operational rules on outcome formulation:

- A Job statement is a verb-phrase, not a noun-phrase. *"Rental management,"* *"retirement management,"* *"tax filing"* are not Jobs — they are category labels that collapse the verb out. The verb is what carries the motivation. Lose the verb and the Job disappears.
- A Job looks from the present into the future. Wrong: *"I want to have figured it out"* (one-shot past result). Right: *"I want to understand"* (a future state). The infinitive form encodes the future-orientation.
- The Job-grammar rule applies at every invocation, not just at first definition — canon, skill outputs, design briefs, landing copy. Everywhere the Job appears, the verb form is preserved.

**The minimum-viable Job description is `I want to {expected outcome} with {main success criteria}` (§8).** Compress further and the actionable specification of *good enough* is lost; the Job becomes unusable for design. Anything else (context, emotions, Consideration Set, trigger, higher-level Job) can in principle be reconstructed from interviews. Criteria cannot.

Interview question: *"What outcome did you want to get from using {solution}?"* The answer is a verb-phrase with a noun. Push for the verb if the respondent gives a noun.

---

## 8. Element 6 — Success criteria: concrete, measurable, with two components — direction and level

**Success criteria are the operational specification of "good enough" for the expected outcome.** Not adjectives the team finds appealing — the *measurable conditions* the customer uses to decide the outcome was reached well enough. Without criteria, "value" is a wish. With criteria, it's a spec the team can engineer against (see [Value Creation §9](value-creation.md)).

The rule is concreteness, not numerical-ness. Qualitative criteria are fine as long as they are concrete:

- ❌ *"fast"* → ✅ *"the car arrived in under 4 minutes."*
- ❌ *"reliable"* → ✅ *"the payment cleared on the first attempt, every time this month."*
- ❌ *"high-quality"* → ✅ *"the cabin was clean — no food smell, no sticky seats"* (qualitative, but concrete).
- ❌ *"safe"* → ✅ *"door-to-door drop-off, no walking alone at night."*
- ❌ *"good UX"* → ✅ *"booked in three taps, no form to fill in."*

Every criterion has two components, direction and level, and the team needs both to operate on it:

- Direction — *what axis* the value is being created on. Price? Layover comfort? Seat layout? Bag policy? Each named direction tells the team *which axis to invest engineering, design, or ops effort on,* and which axes to ignore.
- Level — *the threshold above which the customer feels value, below which they feel a problem.* *"Under $1,800"* — at $1,750 the customer feels value, at $1,850 they feel a problem. The level produces the *sign* of the prediction error in the customer's brain (see [Value Creation §5](value-creation.md)). The direction tells you which axis the sign is being read off.

Operational consequences:

- Criteria are downstream of the expected outcome, never floating. They are *the criteria of this particular outcome,* not generic preferences. Anchor every interview question to the named outcome.
- Criteria translate directly into activation and value-delivery metrics. *"Booked round-trip under $1,800 with no overnight layover"* is a Job criterion *and* an activation metric for the booking flow. The team that writes down the segment's criteria has, in the same act, written the metric set the product should be measured on. The reverse is a quality check: if the segment's criteria can't be cleanly translated into measurable outcomes, they aren't concrete enough yet, so go back to interviews.
- The Aha Moment is engineered against the criteria the customer arrived with (see [Value Creation §12](value-creation.md)). Without criteria, you cannot design value that beats the customer's prediction. The product lands as *"another one of those,"* not as a wow.

Interview question: *"Thinking about {expected outcome}, what specific criteria tell you you've achieved it well enough?"*

---

## 9. Element 7 — Higher-level Job: where motivation and meaning live

**The Higher-level Job is the Job for the performance of which the current Job is being performed.** It is the *motivation* and *meaning* layer — the level above which the customer's reasons live, and the level below which the actions sit. The Job-Graph hierarchy that organizes higher-level Jobs into a structure lives in [Job Graph](job-graph.md). This section covers the operational uses of *one* Higher-level Job for the Job under analysis.

**The recurring trap to avoid is confusing a Higher-level Job with the Job your product performs.** Your product performs the Core Job (the four levels — Core, Big, Small, Micro — are defined in [Job Graph §2, §5](job-graph.md)). The Higher-level Job is one or more levels above. Wealthfront performs *"manage my retirement portfolio"* (Core); the Higher-level Job is *"have enough money at 65 to retire how I want to."* DoorDash performs *"deliver prepared food to my apartment"* (Core); the Higher-level Job is *"feed my family well tonight without cooking."* Don't claim the Higher-level Job as your deliverable. That sets up inflated expectations and manufactured Problems (see [Value Creation §6](value-creation.md)).

Interview question: *"Why did you want to {expected outcome}?"* — then keep laddering up (*"and that, in order to do what?"*). Usually you stop once the answers reach the Big Jobs and Super Big Jobs. That's where motivation lives and where the answers become useful for positioning and value design. You *can* keep climbing toward the underlying needs; just know the ceiling signal. The respondent stops adding anything new and *repeats the previous answer*. The repetition means you've reached the need — it sits below conscious access (see [Scientific Foundations §10](scientific-foundations.md)), so there's nothing higher they can articulate.

---

## 10. Element 8 — Positive emotions in State B: what the customer expects to feel after

**Positive emotions are the brain's signal that the result has been reached.** Calm, satisfaction, pride, relief, joy. The brain's message: *"you arrived; remember the path that got you here and repeat it."*

The positive emotion expected at State B carries motivational weight, but it isn't a channel added on top of a "rational" pull. Anticipated emotion *is* how the brain represents the value of reaching State B. Functional, emotional, and social value are scored on one common register ([Scientific Foundations §2–§3](scientific-foundations.md)), and affect is part of that valuation, not an add-on (somatic-marker hypothesis, appraisal theory — [Scientific Foundations §9](scientific-foundations.md)). Two directions operate at once: *approach* the desired State B (and the higher-level Job whose payoff this emotion anticipates), *avoid* the State-A negative emotion (§4). They integrate into one *net* value, asymmetrically — the avoidance term weighs harder than an equal-sized approach term (loss aversion — [Scientific Foundations §13](scientific-foundations.md)). They don't simply "stack."

The State-B emotion is also the *image* the team loads in advertising. When a Wealthfront ad shows the customer calm at their kitchen table reviewing a one-page statement, the image is the State-B emotion *(calm)* visually rendered against the Higher-level Job *(retirement set)*. When a Belong ad shows the homeowner getting a guaranteed payment notification on the 1st of the month, the image is *relief* against *predictable monthly income.* Loading State B with the matching positive emotion raises conversion because the customer's brain prefers transitions toward emotions it has already imagined feeling.

Operational consequences:

- The State-B emotion is the headline-craft anchor in landing copy. Name the destination feeling explicitly and the headline lands harder than feature descriptions. *"Sleep well at night knowing your data is safe"* beats *"end-to-end encryption."* (Record-completeness for the State-B emotion is covered in §4.)
- Don't promise State-B emotions you can't deliver — same risk as overpromising the Higher-level Job (§9). Inflated expectations lead to under-delivery, a manufactured Problem, then trust collapse (see [Value Creation §7](value-creation.md)).

Interview question: *"How did you want to feel after getting {expected outcome}?"* Most respondents return facts or metaphors first. Dig past them to the actual named emotion.

---

## 11. Same expected outcome + different criteria = different Jobs

**The same surface verb-and-noun (*"get from A to B"*) with different success criteria is not the same Job — the criteria split it into different Jobs** (see [AJTBD key theses §12](ajtbd-key-theses.md), [Segmentation](segmentation.md)). Whether those different Jobs are also different *segments* depends on *who* performs them. Different *populations* means different segments. The *same* person across different contexts means one segment with several Jobs in its graph. The Uber tariffs — *cheap* vs *Comfort* vs *6+ seats with luggage* vs *luxury with formal driver* — are four criteria sets and four Jobs. They split into four *segments* only insofar as different people hire different tiers. One affluent rider may take UberX to commute and Black to a client dinner — four Jobs, one person.

---

## 12. The three confusables — Trigger ≠ Consideration Set ≠ Aha Moment

These three elements get confused with each other constantly because all three are *learning-or-event-shaped*. The distinctions are sharp once named.

- Consideration Set (§5) is the customer's existing knowledge held in State A — what their brain compares at the moment of choice. *Loading Consideration Activators* is the *operation* that writes into it before action begins.
- Trigger (§6) is the *event in time* that flips the customer from contemplation to action. It is the boundary between State A and Action.
- Aha Moment is a positive prediction error during *first-hand experience* of our product. The brain registers *"this beat my prediction"* and installs a new association (see [Value Creation §12](value-creation.md), [Behaviour Change §7](behaviour-change.md)). It is an event during Action, after the trigger, with a Solution already in hand.

**The temporal order ties all three together.** Consideration Activators load first, sometimes years before the trigger fires — writing into the Consideration Set. The trigger fires. The customer acts. The Aha fires the *first* time the product beats the prediction. The trigger is downstream of a loaded Consideration Set. The Aha is downstream of both, plus the Solution being in the customer's hands.

The operational rule that falls out: a trigger without loaded Consideration Activators is noise. A *"book your cleaning now"* push converts nothing if the customer doesn't yet know a better way exists. Worked examples of both classic confusions (paper-map frustration vs the Google Maps Aha; the manufactured trigger that doesn't convert) live in [Consideration Activators §3](consideration-activators.md).

---

## 13. Each `I want to + verb` is a separate Job — parsing multi-verb statements

§7 established that each infinitive verb names a different Job. **When a Job statement chains multiple infinitive verbs with *"and," "in order to," "so that,"* or any connector, it names a *stack* of Jobs — parse it into the level hierarchy before using it.**

A concrete parse:

- ❌ *"Rent out my duplex and generate predictable monthly income."* — two infinitive verbs (*rent out · generate*); not one Job.
- ✅ Parsed:
  - **Super Big Job:** *"Generate predictable monthly income from my real estate."*
  - **Big Job:** *"Rent out my duplex,"* performed *in order to* perform the Super Big Job.
  - Constraints that survive across the hierarchy (*"without consuming my evenings"*) belong in success criteria, not inside the Job statement.

The parse prevents three downstream errors at once. Segmentation-by-Job-Graph-similarity collapses if you treat *"rent out my duplex AND generate income"* as one Job. Consideration Activators targeting at the Big-Job level fails because you don't know which is the Big Job. The *"in order to do what?"* check returns garbage because the answer is already in the original sentence. Multi-verb statements quietly mis-shape the entire methodology.

The parse rule applies at every invocation, not just at first definition — canon, skill outputs, design briefs, landing copy. Everywhere a Job appears, parse multi-verbs first.

---

## 14. An abstract Job becomes concrete once a Solution is hired

**Before a customer commits to a specific Solution, their Job is abstract.** *"I want to buy a 2-bedroom condo"* is abstract — no neighborhood, no building, no developer, no agent. Once the customer commits to a specific Solution, the Job becomes concrete, and a new set of lower-level Jobs appears underneath it.

*"I want to buy a 2-bedroom condo at The Rise in Austin"* is concrete. Underneath it: *"meet with The Rise's sales agent"; "tour unit 3B on Saturday"; "review the HOA documents"; "secure a 7% mortgage pre-approval"; "wire the earnest-money deposit."* These Micro Jobs did not exist while the Job was abstract. They appeared the moment the customer locked in on the Solution.

Operational consequences:

- A Job in interview is usually abstract; a Job in funnel analytics is usually concrete. This explains why the same customer's "Job" looks different in interview transcripts versus product analytics — they are different stages of the same Job, before and after Solution-commitment.
- The concrete-Job stage is where most product UX work lives. *"Buy a 2-bedroom condo at The Rise"* is the abstract framing; the product team designs against the concrete *"tour unit 3B on Saturday at 11 AM with agent Mark"* — context, time, role, and Solution-specific Micro Jobs all bound.
- Different Solutions for the same abstract Job produce different concrete Job Graphs. *"Buy a 2BR at The Rise"* and *"buy a 2BR at The Independent"* share the abstract Job but have different concrete Micro Jobs (different agents, different document sets, different walkthrough schedules). Treating them as one Job collapses two operating realities into one.

---

## 15. Three levels of fidelity for archiving a Job — pick by downstream use

Once captured, a Job can be archived at three levels of detail. Pick the level the downstream use actually needs. Don't compress past what the use demands, but don't carry the full eight-element record into a slide deck either. Canonical treatment in [AJTBD key theses §4](ajtbd-key-theses.md). The levels are:

- Level 1 — full. All eight elements with every field fleshed out, plus Job Frequency, Budget, and Importance. Use for: research notes, value-prop design, Job-Graph mapping, RAT cards. Loses nothing.
- Level 2 — intermediate (one prose sentence in the template `When {context} + {trigger}, I want to {expected outcome} with {main success criteria}, in order to {expected outcome of the higher-level Job}`). Compresses the full Job into one sentence preserving context, expected outcome with main criteria, and the higher-level Job. Use for: design briefs, side-by-side comparison across segments, sales-playbook one-liners.
- Level 3 — minimal (`I want to {expected outcome} with {main success criteria}`). Just the primary element with the most distinctive criteria — the minimum-viable Job description (§7). Use for: landing-page headlines, ad copy, internal labels.

The three levels worked end-to-end on one Job (Uber Comfort) live in [AJTBD key theses §4](ajtbd-key-theses.md).

Operational consequences:

- The source-of-truth record is Level 1. Levels 2 and 3 are derived artifacts. They should reference the Level-1 record and re-derive on demand, not float independently. When Levels 2 and 3 stop matching Level 1, the artifact has drifted and is no longer trustworthy.
- Headlines, ad copy, and sales scripts written *from* a Level-1 record consistently outperform those written without one. The Level-1 record is what supplies the concrete criteria, the context, and the Big-Job framing the headline needs to land for the segment.

---

## 16. B2B — every role carries two graphs of Jobs: business and personal

In B2B, the Job structure of every role in the deal has two parallel graphs. A graph of *business Jobs* (what's in the role's KPIs — hit the plan, reduce cost, deliver on time, pass audit). And a graph of *personal Jobs* (what the person gets out of the deal — job security, bonus, recognition, career growth, avoiding blame).

**B2B motivation is usually dominated by personal Jobs, not business Jobs.** This is the single most counter-intuitive finding for teams trained on B2C. Business Jobs are the *frame* in which the deal happens. Personal Jobs are *why* the human in the seat actually moves. (Detailed canon: [B2B](b2b.md), [AJTBD key theses §25](ajtbd-key-theses.md).)

Operational consequences:

- Every Job-structure write-up for a B2B role contains *both* graphs. A record that names only the business Jobs is incomplete, and the missing personal-Job side is exactly where the deal stalls.
- Two interview questions actually surface the personal Job. Direct *"what are your personal motivations?"* almost never works, because the respondent doesn't have ready language for it. Two questions reliably do:
  - *"And personally, why do you need this?"* — strips the business-Job framing and forces the respondent to answer as a human, not as a role-holder. The answer is usually a sentence the respondent has never said out loud before.
  - *"What personal result, as a human, will you get from performing this business Job?"* — anchors the personal Job to the business Job they're already explaining, so the respondent can ladder up from familiar ground into the unspoken layer (*"I'll get a promotion," "I won't get fired," "I'll get to tell that story at the next conference," "I'll finally feel competent"*).
- Personal Jobs are also surfaced through *"what could go wrong?"* questions, and through indirect probes (*"how will this be perceived by your CEO?"*).

The five recurring Decision-Maker personal Jobs — a starter checklist of hypotheses, not universal truths — live in [B2B §6](b2b.md).

---

## 17. The analytical pair: Job + chosen Solution

When analyzing a real customer (an interview, a churn analysis, a win/loss review), the Job specification travels with one companion — the chosen Solution. Two artifacts together capture the customer's choice:

- Card 1 — the Job. The eight-element spec from §§3–10, including the Consideration Set in State A (§5): the candidate Solutions the customer's brain compared at the moment of choice, each with predicted costs, benefits, fears, and the Job Graph it would install. *What* the customer wanted, *in what context*, *with what criteria*, *against which alternatives*, *for what higher-level Job*.
- Card 2 — the chosen Solution. *Which* candidate the customer actually hired out of that Consideration Set.

**The Job without the chosen Solution names the destination but not which path through the Job Graph was selected; the Solution without the Job names a brand pick without the motivation that drove it.** The Consideration Set is not a third artifact. It lives inside Card 1, in State A (per §5), as the operational consequence of Consideration Activators. Once the customer picks, the chosen Solution installs the Critical Chain of Jobs they then walk ([Critical Chain of Jobs](critical-chain.md)). The pair `Job + chosen Solution` is the static analytical artifact; the Critical Chain of Jobs is the dynamic execution.

Operational consequences:

- Every customer interview reconstructs both — the eight-element Job (with the Consideration Set at the moment of choice) and the chosen Solution. Asking only about the Job misses where you sat in the customer's competitive comparison.
- Win/loss analysis runs on the Consideration Set and the pick. *Why did this Solution beat ours at the moment of choice? What was in the customer's Consideration Set we didn't know about? Which criterion did the winning Solution hit that we missed?*
- Acquisition strategy targets the Consideration Set at the State-A stage. Inserting our Solution into the Consideration Set (Consideration Activators loading) is upstream of every funnel metric. If we're not in the set when the trigger fires, no amount of in-funnel optimization recovers the customer.

---

## Cross-references

- [AJTBD key theses §2](ajtbd-key-theses.md) — canonical Job definition, antitheses, operational consequences, and the State A → trigger → action → State B framing.
- [AJTBD key theses §3](ajtbd-key-theses.md) — the canonical eight-element list with the worked Uber Comfort SF example and the interview-question table.
- [AJTBD key theses §8](ajtbd-key-theses.md) — the Job Graph as the surface where Value, Problem, Solution, behavior change, and Consideration Activators all live.
- [AJTBD key theses §10](ajtbd-key-theses.md) — the Critical Chain of Jobs as operational delivery.
- [Critical Chain of Jobs](critical-chain.md) — detailed canon on the Critical Chain of Jobs: chain pathologies (breaks, cycles, hand-offs), predictions during the walk, interruptions, drop-offs, Solution switches, per-step emotions, knows-how vs first-time path.
- [AJTBD key theses §5](ajtbd-key-theses.md) — Success Criteria as the segmentation root.
- [AJTBD key theses §18](ajtbd-key-theses.md) — Consideration Activators in canonical five-component form.
- [Job Graph](job-graph.md) — how Jobs at different levels relate; the Job Graph as a unit of analysis.
- [Value Creation](value-creation.md) — the predict-and-compare mechanism, success-criteria-as-design-spec, the Aha Moment, the 20 foundational value-creation mechanics.
- [Behaviour Change](behaviour-change.md) — triggers as moments of receptivity; Consideration Activators as the loading mechanism; Aha Moment/Problem neurobiology.
- [Consideration Activators](consideration-activators.md) — what Consideration Activators is, how it loads, the five components.
- [Barrier Removal](barrier-removal.md) — Barrier Removal as the work that makes the new Job Graph executable in reality.
- [Segmentation](segmentation.md) — segments defined as sets of similar Core Jobs with similar success criteria.
- [B2B](b2b.md) — full treatment of B2B Job analysis (role-by-role business + personal Jobs, the integrator model, common B2B mistakes).
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — interview mechanics for surfacing each element.
- [Scientific Foundations](scientific-foundations.md) — the neuroscience underneath emotions, needs, and the brain-as-investor framework (allostasis, RPE, Jobs as need-serving goal representations, status as rank-position motivation).

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

# Job Graph

This file is the canon page on the **Job Graph** in AJTBD — the *structure*-type unit of analysis that organizes individual Jobs into the hierarchy a segment performs to land its higher-level Jobs.

**The Job Graph is one of the three units of analysis in AJTBD** (see [AJTBD key theses §1](ajtbd-key-theses.md)) — each a different lens on the same Job substrate:

- **The Job** — the *atomic* unit: the structure of a single Job, paired with the chosen Solution when analyzing a real customer. Use [Job Structure](job-structure.md).
- **The Job Graph** — the *structure* unit: how Jobs relate in a hierarchy of motivation. **This file.** It contains the **Critical Chain** as a sub-concept — the Graph projected onto a time axis at a chosen Solution, where the operational dynamics live (predictions, prediction errors, drop-offs, Solution switches, per-step emotions). Use [Critical Chain](critical-chain.md) when *sequence in time* matters; use this file when *relationships among Jobs* (parent-child, sibling, many-to-many) matter.
- **The Map of Segments** — the *strategic* unit: which segments to compete for. Use [Segmentation](segmentation.md).

This page owns what is uniquely the Graph's: the level vocabulary (§2), the two-choice formation rule (§4), the three gradients along the levels (§5–§7), the many-to-many edges that make it a *graph* (§9–§10), the segmentation surface (§11), value-creation-as-simplification (§13–§14), the competitive set (§15), and how to study and validate a Graph (§17–§18). Adjacent mechanics are cross-referenced, not restated.

---

## 1. Modify the Graph and you modify what the customer performs

**The Job Graph is the hierarchy of Jobs a specific segment performs to land its higher-level Jobs — and most of the strategic moves a product can make is a change to this Graph.** Move up a level, kill a Job, capture a Previous or Next Job, link to a new Big Job — each is *a change in the Graph the customer walks* (catalogued in §19). **The better the team understands how the Graph forms and how it can be modified, the more strategic moves are available.** A handful of moves act on the *Map of Segments* instead — up-market / down-market, adjacent-segment expansion, B2B↔B2C — and for those the Graph isn't the lens (see [Segmentation](segmentation.md)).

Each node in the Graph is a Job ([Job Structure](job-structure.md)). Edges come in two kinds:

- **Vertical edges (between levels) are *"in order to"*** — the lower-level Job is performed *in order to* land the higher-level Job. Motivation rides the vertical edge upward. In research you walk the edge with two questions — up with *"Why do you want this? In order to do what?"* (surfaces the Big Job above), down with *"Step by step, which tasks did you do to get this one done?"* (surfaces the lower-level Jobs beneath). Full six-direction question set in §17.
- **Horizontal edges (within a level, between siblings under the same higher-level Job) are sequence connectors** — either *positional* (Previous → Next in a Critical Chain, when siblings must be performed in order — see [Critical Chain](critical-chain.md)) or *alongside* (parallel siblings, each independently contributing to the same parent).

**It is a *graph*, not a *tree*, because the edges are many-to-many.** One lower-level Job can serve several higher-level Jobs at once (§9); one Solution can be hired for several Jobs of the same person *and* of different people (§10). Trees enforce one-parent-per-node; the real motivational structure doesn't — call it a tree and the many-to-many mechanics behind most strategic moves collapse. The Solution the customer hired sits downstream of the Graph (per [Behaviour Change §2](behaviour-change.md), a Solution is a label for a Job Graph).

---

## 2. The four levels — Big / Core / Small / Micro, defined relative to your product

**The level names attach to Jobs by their position relative to your product's Core Job — they are not absolute positions on the customer's life-Graph.** Two products competing for adjacent territory will label different Graph levels as their Core, and both are correct.

- **Core Job** — the highest-level Job your product performs *fully*, and that you cannot climb above with the product's current shape. **Operational test: most of the Micro Jobs underneath are performed inside your product**, by your team, or by automation you own. (Customer-side *association rules* can stretch this — the brain may treat a Job as fully performed even when a few low-level Micro Jobs sit outside the product; out of scope here.) The placement procedure is §3.
- **Big Job** — one level *above* your Core Job. Carries the motivation; your product contributes to it but doesn't fully perform it. A single set of Core Jobs typically serves several Big Jobs at once.
- **Small Job** — a *sibling* of your Core Job (same level, same Big Job above) that your product *doesn't* perform. **Performer-agnostic** — the customer does it, another product does it (as *its* Core Job), a partner does it, or no one does yet; the only test is whether *our* product performs it. **Small Jobs are siblings of Core, not below it** — the level one below Core is Micro. They are the primary source of growth moves (§19).
- **Micro Job** — one level *below* your Core Job and Small Jobs. The fine grain where customer experience lives.
- **Super Big Job** — one level above Big. Often near the customer's life-level motivation, but not guaranteed — it depends on how broad your product is.

**A product normally has several Core Jobs at the same level — the plural is normal.** They come from one surface verb splitting under different success criteria (§11). Uber's *get from A to B* splits into distinct Core Jobs by context — *get there fast when I'm in a hurry; get there with my dog; get there with room for four suitcases* — each one Uber performs fully. TurboTax's *file my return correctly* splits the same way — *file a simple W-2 return; file with a side business (Schedule C, 1099s); file as an LLC owner (K-1, Schedule E).* Each passes the placement test (§3). The steps beneath them — *request the ride, pay the fare; import the W-2, e-file the return* — are Micro Jobs one level down, not Core.

**The levels are relative because the customer's full Graph runs 10+ levels deep** — from the deepest Micro (*hit the right key at this moment*) up to life-level Super Big Jobs (*live a life I'm proud of*). Your Core Job sits *somewhere* on it; you never need the whole thing — only the slice around your Core: the Big Job(s) above, the sibling Small Jobs, the Micro Jobs below (how much to map is §12). A consultant who delivers *"build your personal brand"* turnkey has *that* as a Core Job; an agency that only *"writes your LinkedIn posts"* has the same Job two levels lower — both placements are correct for their actual reach, because the vocabulary is product-relative, not universal.

**The recurring error: putting Small Jobs *below* Core Jobs.** They are siblings (same level, same Big Job). Confusing a Small Job with a Micro Job collapses two distinct moves — *cross-sell into a sibling Core Job* (the growth move) versus *improve fine-grain UX* (the activation/retention move).

---

## 3. Placing the Core Job at the right level — the climb test

**Placing the Core Job at the right level is the prerequisite for every Graph-based decision** — segmentation, positioning, mechanic selection, communication, retention, growth. Place it too high and the product can't actually perform the Job it claims, manufacturing a Problem in communication; place it too low and the segments, mechanics, and growth moves all come out wrong.

**The procedure** (long-form, with worked cases, in [Place Core and Big Jobs](../HowTos/place-core-and-big-jobs.md)):

1. **Ask paying customers: *"What tasks do you solve with our product?"*** Their answers are candidate Core Jobs. Recruit only customers who have actually paid for and used the product.
2. **Run the climb test on each candidate.** *(a) "Does our product fully perform this Job — every sub-Job inside our product, end-to-end?"* If **no** → too high; drop one level and retry. If **yes** → *(b) "Can we climb one level higher and still fully perform that higher Job?"* If **yes** → climb and retry from (a). Stop when (a) is yes and (b) is no — **that level is the Core Job.**
3. **Climb as high as you can.** Every level higher pulls closer to where motivation lives (§5), where communication leverage lives (§7), where the value-creation surface widens (§13). The right level is the highest you can reach *right now,* not a fixed position to defend: as the product covers more sibling Small Jobs or kills more Micro Jobs, the Core Job climbs. Squarespace's Core Job today (*publish a website turnkey*) was a Big Job a decade ago.

**Run the procedure whenever a Core Job claim anchors a decision or leaves the team** — choosing the strategy, choosing the segment and Jobs to compete for, mapping the competitive set, a positioning or value-prop session, a design brief, landing copy, a sales script.

---

## 4. The Graph is formed by two choices — the maker proposes, the customer accepts or refuses

**Two parties produce every Job Graph the customer walks.** The **maker** decides, in the Solution's design, which Job Graph the customer must traverse to land the higher-level Job — what gets onboarded, which Jobs the product performs end-to-end, which Jobs the customer is left to perform, which roles get involved, how long each step takes. The **customer** looks at the proposed Graph — usually implicitly, through marketing, reviews, peer stories, a free trial — and either *accepts it* or *refuses and picks a Solution whose Graph reads better.* The acceptance is rarely conscious; the refusal usually shows up as *they didn't buy.*

**Treat the Graph the team designed as a hypothesis about which Graph the segment will accept — not as a fact.** We can raise the probability of acceptance but can't control it until the customer buys; the veto is invisible until conversion data comes in.

**Worked example — *"file my federal return on time and accurately"* (a US W-2 earner with a side business).** Same Big Job, three Solutions, three Graphs offered:

- **DIY on paper / IRS Free File** — a 10+ Micro-Job Graph the filer walks alone: *gather W-2s and 1099s → read the instructions → pick forms → enter line by line → compute Schedule C and SE → check arithmetic → print → sign → mail.* Cost: $0 and an evening.
- **TurboTax self-service** — a 4-Job Graph: *log in → answer guided questions while it auto-imports forms → review → e-file.* Cost: ~$100 and 1–2 hours.
- **Hire a CPA** — a 2-Job Graph: *send the documents → sign the return.* Cost: $300–1,500 and 30 minutes.

Three different segments accept different proposals — control-first DIYs the paper return; speed-and-accuracy-first picks TurboTax; done-for-me hires the CPA. The Graph each filer walks is *the maker's proposal that this filer accepted.* The total value each experiences is the time + money + effort + cognitive load spent across every node, weighted against the benefit at the top (formalized in [Value Creation §2–§4](value-creation.md)).

---

## 5. Three gradients run along the levels — the first is motivation vs. mechanism

**Three properties shift as you move up or down the Graph's levels, all relative to your product's Core Job: motivation vs. mechanism (this section), stability over time (§6), and emotion vs. product-specificity (§7).** Read together, they tell the team where to climb, what to expect to change underfoot, and where communication versus UX work belongs.

**Higher-level Jobs carry the *motivation;* lower-level Jobs are the *mechanism* that delivers it.** Above your Core Job sits the result the customer actually wants — the need at the edge of consciousness that pulls them through the whole sequence. Below it sits the concrete how-it-gets-done the customer tolerates only because no more efficient route to the higher Job exists yet.

**The lower-level Jobs are a necessary evil.** Nobody *wants* to *untangle my headphones, type my password, search the IRS instructions, refuel a gas car, hail a taxi by waving at the street* — each is endured only until a more energy-efficient way to land the higher Job appears. The customer replaces the mechanism the moment a more efficient Graph reaches their awareness *and* the forces blocking the switch are overcome — habit of the current Graph, fears of the new one, switching costs (full treatment in [Behaviour Change §8–§9](behaviour-change.md)). AirPods, Face ID, TurboTax, Squarespace, Uber each displaced a whole layer of necessary-evil Jobs once enough of the segment crossed that threshold.

---

## 6. The second gradient — higher Jobs are stable across decades; lower Jobs change fast and disappear

**The higher up the Graph, the more stable the Job.** *"Get from where I live to where I need to be"* has been a Job for millennia; *"have a safe home," "feed my family," "earn a living from my craft"* are Big Jobs unchanged for centuries. The success criteria evolve — faster, cheaper, lower-carbon — but the Job itself holds.

**The lower down, the faster Jobs change — and they routinely disappear as a class.** *Untangle my headphones* was a daily Job for two decades until AirPods deleted it; *type my password* until Face ID; *carry a folded paper map* until smartphone navigation; *find the right printer driver* — gone.

**The gradient is a strategic indicator.** A team competing on a high-level Big Job inherits decades of customer-mind stability; a team competing on a Micro Job lives on borrowed time until the next deletion event. Why the deletion engine matters is §13; why the Graph never empties even as deletion runs is §14.

---

## 7. The third gradient — emotion intensifies upward; product-specificity intensifies downward

**Emotion intensifies upward.** Emotions are the brain's signal for how Jobs are being performed — the closer to the need, the stronger the signal (see [Scientific Foundations §9](scientific-foundations.md)). A poorly-styled settings button doesn't move the customer; *"the tax return I owe Monday didn't file"* does. The higher-level the Job you own end-to-end, the more emotion every break and every success carries — TurboTax owns *"file my federal return on time,"* so a rejected e-file at 11 PM on April 15 lands as panic, not annoyance.

**Product-specificity intensifies downward.** Higher-level Jobs are spoken in customer language, free of your product's particulars — *"settle into life in San Francisco," "file an accurate return on time."* Lower-level Jobs absorb product-specific verbs and nouns — *"when OBS reset my camera profile, recover it without re-recording the intro," "when Stripe declines my card with no reason code, retry through a different rail."* The verb binds to the Solution; the criteria reference the Solution's mechanics.

**Operational consequences:**

- **Communication lives at high-level Jobs; UX detail lives at low-level Jobs.** Landing copy that names the Big Job (*"sleep at night knowing your data is safe"*) outperforms copy that names the Core Job (*"encrypt customer data with AES-256"*); a fix for *"when OBS resets my profile…"* belongs in the next release, not in marketing.
- **In research, the Job's *level* is readable off the language.** *"I want my CRM to stop losing the email thread when I forward it"* is a low-level product-saturated Job; *"I want to feel on top of my pipeline"* is the Big Job above it. Catch both; file each at its level.

---

## 8. The Graph is fractal — the same patterns recur at every level

**From the deepest Micro Job to the highest Super Big Job, the same structural properties hold:**

- **The same eight-element internal structure** — context, expected outcome, success criteria, trigger, Consideration Set, emotions before, emotions after, higher-level Job ([Job Structure §1](job-structure.md)). A Big Job has the same anatomy as a Micro Job; only the criteria, emotions, and time-scale differ.
- **The motivation-vs-mechanism gradient (§5) runs at every level.** Every Job has Jobs above it (its motivation) and below it (its mechanism); the Job that is *mechanism* from one level is *motivation* from the level below.
- **The many-to-many edge property (§9, §10) holds at every level.**
- **A Solution is a label for a sub-Graph at every level** — any cluster of Jobs in service of a higher-level Job is itself a Job Graph, and a Solution for that Job is a label for it (per [Behaviour Change §2](behaviour-change.md)).

---

## 9. One lower Job can serve many higher Jobs — and motivation rises with each Big Job above it

**The first many-to-many direction.** When a single Job at the chosen level serves several higher-level Jobs at once, the customer's motivation to perform it rises with each additional Big Job above. *Learn vibecoding* serves *ship the side project nights and weekends, hand off boilerplate at work to an AI assistant, prototype ideas in hours instead of weeks, qualify for higher-paying roles where AI fluency is becoming table stakes* — one Core Job, four Big Jobs above it. The brain weighs the combined upside, and the verdict on whether to invest comes back stronger than if only one Big Job were served.

**The strategic move: load Consideration Activators for the Big Jobs the customer didn't realize were served.** The person who showed up to *learn vibecoding to ship the side project* discovers, through the team's messaging, that the same Job also helps them ship faster at work and qualify for better roles. The Job didn't change; the count of Big Jobs above it did — the *create a new link to a higher-level Big Job* mechanic ([Value Creation §16](value-creation.md)).

---

## 10. One Solution can be hired for many Jobs — same person (retention) and different people (scaling)

**The second many-to-many direction.** A Solution can be hired for several Jobs of *one person* (retention, repeat purchase, AOV) *and* several Jobs of *different people* (segment scaling) — the same edge produces both growth paths:

- **Jobs inside one person → grow LTV, AOV, frequency.** A customer hires DoorDash to get a restaurant dinner delivered, then groceries, then convenience-store items — three different Core Jobs, one Solution, rising frequency and spend.
- **Jobs across different people → grow market size.** The same added Job is also held by people who were never our customers — *get groceries delivered* belongs to households that never ordered a restaurant meal from us. The moment we start performing that Job, we begin competing for them: people who already had the Job but whom we weren't serving. Performing the new Job pulls in *new people* — not just more spend from the ones we already have.

**Concrete one-Solution-many-Jobs cases:** **Notion** (*organize my thinking* → docs → databases → tasks → wikis → AI), **Square** (*accept a card payment in person* → invoicing → online checkout → banking → payroll), **Stripe** (*accept payments on my website* → subscription billing → fraud → tax → corporate card). Each earned more frequency from existing customers *and* opened adjacent segments — the two scaling directions reading off the same many-to-many edge.

---

## 11. The Job Graph is the segmentation surface

**Segments in AJTBD are sets of customers performing similar Core Jobs — the same expected outcomes — with similar main success criteria.** Those two are the segmentation root; the Big Jobs above are motivational context, *not* a segmentation criterion. The Job Graph is the surface where the root *and* that context become visible together; demographics and firmographics describe the outside of segment members, not the inside. (The root — similar Core Jobs with similar success criteria, Big Job as motivational context only — is owned by [AJTBD key theses §12](ajtbd-key-theses.md) and [Segmentation](segmentation.md); this section is the *why it lives on the Graph* angle.)

---

## 12. Don't map the whole Graph — map the slice the business task needs

**The full Graph for one customer runs hundreds of Jobs; across a market, millions. Never enumerate it.** The methodology asks only for the *slice* that matches the business task — and the slice has two tiers of need:

**Graph mandatory** (the task can't be done well without it):

- **Segment search and strategy.** The researcher walks the Core Jobs, the Big Jobs above, and the sibling Small Jobs (sometimes a Super Big Job too) — the slice that surfaces segment-vs-segment differentiation (§11).
- **Creating value.** The mechanics catalog ([Value Creation §18](value-creation.md)) operates *on* the Graph; without it in front of you the mechanics have no surface to apply to.

**Graph highly useful** (doable without it, but with measurably worse outcomes):

- **Retention, repeat purchase, conversion.** These are the sequences the customer actually walks; for their operational dynamics — predictions, interruptions, drop-offs, Solution switches — zoom into the **Critical Chain**, the Graph's time-projection at a chosen Solution ([Critical Chain](critical-chain.md)).
- **Onboarding and activation.** Only the first 5–10 Jobs matter — the ones through which the customer hits the first Aha Moment ([Value Creation §12](value-creation.md)). Downstream Jobs matter for retention, not activation.

**Pick the depth by the task, not the Job's absolute height.** Strategy → Core + Big + Small. Activation → the first 5–10 Micro Jobs, in order. UX and engineering → Micro-Job zoom: *why does the shoehorn live in this hotel room?* → *put my shoes on without bending → leave the room → go to dinner → enjoy my vacation* — many levels between the shoehorn and *"have a great trip."*

---

## 13. Value creation *is* simplification of the Graph over time — products climb, lower Jobs disappear

**The deepest engine of value creation is Graph simplification.** A Solution that delivers the same Big Job through fewer lower-level Jobs is, by definition, more energy-efficient — the brain registers the simplification as an Aha Moment ([Value Creation §5](value-creation.md)). The two dominant mechanics — move-up-a-level and kill-a-Job — are both simplification operators ([Value Creation §14](value-creation.md)); the meta-mechanic is the **subtraction principle** ([Subtraction](../Next-Move-Theory/subtraction.md)).

**The pattern, across every product generation: the team that lands the same Big Job through fewer lower-level Jobs captures the segment.** The old product's Core Jobs collapse into Micro Jobs (or vanish) inside the new Solution; the old Big Job becomes the new Solution's Core Job. The Big Job stays; the Graph underneath simplifies:

- **Elevator vs. stairs.** Big Job *get to the upper floor:* walk up several flights → press a button. *Climb the stairs* disappeared as a Core Job.
- **Google Maps vs. paper map.** *Get from where I am to where I'm going:* buy a map, unfold, locate, plan, refold, drive-while-checking → open the app, accept the route, drive.
- **Squarespace vs. hire-a-developer.** *Have a website live for my business:* find a developer → brief → quote → buy hosting → install → maintain plugins and SSL → *pick a template, drag, publish.*
- **ChatGPT vs. write the first draft yourself.** *Produce a finished document:* outline → research → write → edit → iterate → *prompt, review, polish.*

**The counterweight is §14: the Graph never fully empties** — new Big Jobs keep appearing at the top even as old Jobs disappear at the bottom. Hold both halves together.

---

## 14. But the Graph never empties — new Big Jobs appear at the top as old Jobs disappear at the bottom

**§13's engine runs at the bottom (Jobs get deleted); at the top, new Jobs continually appear.** As people develop psychologically, technologically, and culturally, context expands and Big Jobs become legible that weren't a generation ago:

- *"Manage my digital identity across dozens of accounts"* — not a Big Job in 1990.
- *"Protect my data from being used to train AI"* — not a Big Job in 2020.
- *"Save for retirement with an algorithm instead of an advisor"* — not a Big Job in 2000.
- *"Replace routine knowledge work with AI automation"* — emerging now.

Each new Big Job grows its own subtree of Core / Small / Micro Jobs. **The bottom is being deleted (§13); the top is being extended upward.** Yesterday's effortful Micro gets deleted; tomorrow's Big Job becomes routine; the day after, a Big Job not yet articulated becomes the strategic horizon.

---

## 15. The real competitive set is at the Big Job — direct vs. indirect competition

**Direct competitors share your Core Job; indirect competitors share one or more of your Big Jobs.**

- **Direct competition = same Core Job,** head-to-head on the same verb-and-noun, same success criteria. *Lyft vs. Uber* on *"get a ride across the city now;"* *Slack vs. Teams* on *"keep my team's chat in one place;"* *Notion vs. Confluence* on *"keep our docs accessible."*
- **Indirect competition = overlap on one or more Big Jobs, with *different* Core Jobs.** The customer solves the same higher-level Job with a different Core-Job class — on a single Big Job (a mattress vs. coffee for *"function on insufficient sleep"*) or on several at once (Notion vs. Google Docs + Slack + email + Asana, overlapping each on a different Big Job).

**Your real competitive set is the union of both — and most teams underestimate the indirect side by an order of magnitude.** Same surface verb produces a small direct set (other mattress brands, other CRMs); the same Big Job produces a much larger one — and that's the set the customer's brain actually evaluates against.

**Indirect sets teams usually miss:**

- **A mattress competes with coffee, melatonin, white-noise machines, and quitting the job** — Big Job *"keep functioning on insufficient sleep."* The mattress is the *last* candidate the burnt-out customer considers; the campaign that surfaces it: *"a better mattress for the price of a cup of coffee a day."*
- **A warehouse-management SaaS competes with Excel, a paper notebook, and a whiteboard** — Big Job *"know what we have on hand so we don't ship empty boxes."* The real set is dominated by the customer's existing improvisation, not other inventory tools.
- **A weekend-getaway booking competes with Netflix** — Big Job *"escape my weekly routine."* The customer prices the trip against staying home with three new releases, not against another trip.
- **Notion competes with Google Docs + Slack + email + Asana across *multiple* Big Jobs at once** — consolidating *"keep shared knowledge accessible" + "track who's doing what" + "communicate decisions."* Its competitive set is the *union* of all four at the Big-Job level, even though each is a stronger direct competitor on its own narrow Core Job.

---

## 16. The Solution is sometimes the customer's own action — DIY is a Job Graph too

**Often the Solution hired for a Job is no product at all — it's the customer's own activity.** *I'll figure it out myself, google it, watch a YouTube video, improvise, fail and retry.* This DIY Graph is structurally identical to a vendor-hired Graph — same nodes, same edges, different label. Three reasons it shows up as the hired Solution: the customer's budget is small; the customer doesn't know an alternative exists (Consideration Activators never landed — [Consideration Activators](consideration-activators.md)); or the customer knows it exists but doesn't credit its value (sees the price, can't predict the energy efficiency).

**Operational consequences:**

- **In research, count DIY as a competitor — because it is one.** *"I just do it myself"* is a Graph competing for the same time, money, and attention as your product. Map it the way you'd map a competitor's.
- **Against DIY: segment the DIY users by Core Jobs and success criteria, create value that beats DIY on those criteria, *then* load Consideration Activators — in that order.** Some DIY only because the alternative never landed — for them, loading the *more energy-efficient way exists* component ([Consideration Activators](consideration-activators.md)) is the move. But others DIY because, against *their* success criteria, no Solution — ours included — beats doing it themselves; there the move is to create real value that clears their criteria first, then communicate it. Price cuts dislodge neither.

---

## 17. How to study a Graph — every question anchors on the expected outcome of the higher-level Job

**Study Jobs by studying what the customer has actually done** — paid money, spent time, invested energy. **Future intent is not data;** asking *"would you ever do X?"* and treating the answer as evidence is a category error ([Job Structure §15](job-structure.md), [Job Types and Properties §8](job-types-and-properties.md) on Fake Jobs).

**The single anchoring principle: every Graph-research question anchors on the *expected outcome of the higher-level Job.*** *"For what?"* (upward) is the only direction whose anchor sits at the current node; every other direction (sideways, downward) carries the parent's expected outcome already in the frame. That anchor is what keeps the answer inside the Graph instead of drifting into unrelated Jobs of the respondent's day.

Six question forms, one per Graph direction (substitute `{curly braces}` with the respondent's own outcome wording). The running example: a PM who set up a **feature-flag and experimentation platform** for their team.

- **Up — to the parent: *"For what? In order to do what?"*** *"I set up the experimentation platform → in order to ship features without breaking production → in order to hit the quarter's roadmap commitments → in order to get promoted to Group PM."* Four upward edges in a minute of interviewing.
- **Sideways, Previous Job in the chain: *"Step by step, what did you do for {expected outcome of higher-level Job} *before* you got {expected outcome of the current Job}?"*** *"…to ship safely before the platform? Hand-rolled config flags → shipped a bad one that took down checkout → started evaluating platforms."*
- **Sideways, Next Job in the chain: *"Step by step, what did you do for {expected outcome of higher-level Job} *after* you got {expected outcome of the current Job}?"*** *"…after the platform cut incidents in the pilot squad? Rolled it to all squads → added gradual rollouts → wired flags into the analytics pipeline."*
- **Sideways, siblings *not* in the chain: *"What other tasks do you do for {expected outcome of higher-level Job}, besides {expected outcome of the current Job}?"*** *"…to ship without breaking prod, besides the platform? Code review, a staging environment, canary deploys, on-call runbooks."*
- **Down, sequential: *"Step by step, what did you do to get {expected outcome of the Job we're zooming into}?"*** *"…to roll the platform out across squads? Vendor eval → security review → SDK integration → migrate existing flags → train the squads."*
- **Down, parallel: *"What are your usual usage scenarios with {Solution}?"*** *"…with the platform? Gradual rollouts, kill-switches during incidents, A/B experiments, permission-gating beta features."*

**The recurring failure mode** is asking sideways or downward *without* the expected outcome in the frame. *"What did you do before the platform?"* — unanchored — invites drift (*"I joined the company two years ago"*); the anchored version (*"…to ship safely before the platform?"*) keeps the answer inside the Graph.

**Operational consequences:**

- **Recruit by past-performance proof, not self-reported intent.** Ask at the screener: *"when did you last pay for X? what did you pay? what did you do as a result?"* — filters Fake Jobs and low-motivation respondents in one pass.
- **A single respondent's past action can reconstruct an entire Graph** by cycling through the six forms from one anchor point. Interview methodology: [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md); this section names only the Graph-specific moves.

---

## 18. Validate the Graph by asking *"For what?"* at every node

**The highest-leverage quality check on a composed Graph: apply *"for what? / in order to do what?"* to every node in succession** — not just the suspect ones. The question forces the formulator to name the next-higher Job out loud; the answer (or its absence) exposes whatever is wrong with the node's level, edge, or existence.

Four failure modes the sweep surfaces, in declining frequency:

- **Skip-a-level (most common).** *"For what?"* returns an answer that doesn't connect — the formulator invents an intermediate Job mid-sentence to bridge the gap. *That invention is the missing level.* Insert it; re-ask both nodes.
- **Wrong parent.** The *"in order to"* line, under questioning, doesn't actually motivate the Job for this segment — the parent was inferred, not heard from interviews. Rewire the edge to the honest parent.
- **Multi-verb Job.** The *"for what?"* answer is already inside the original statement — *"rent out my duplex **and** generate predictable monthly income"* → "for what?" → "to generate predictable monthly income." The Job is two stacked Jobs; parse into the hierarchy ([Job Structure §14](job-structure.md)).
- **Fake Job.** The answer is a fantasy *"to do X someday,"* with no past-performance anchor ([Job Types and Properties §8](job-types-and-properties.md)). Cut it or move it to a future-hypothesis bucket — never leave it in the operational Graph.

The question is productive because it can only be answered by naming a real, level-correct, motivating parent — *or* by admitting one of the four errors. There is no third option.

---

## 19. Most strategic moves are movements in the Graph — but not all

**Most strategic moves are movements in the Graph — but not all.** The exceptions are moves on the *Map of Segments*: which Big Jobs and segments we compete for in the first place (the closing block below). Every Graph move is either *directional* (where to go relative to your current Core Job) or *non-directional* (transform the Graph's structure without moving the Core Job). Each is treated in full elsewhere; this is the index.

**Directional moves:**

- **Up — move up a level.** Turn the Big Job above your Core Job into your new Core Job. Uber climbed above *own a car;* Squarespace above *buy hosting → install WordPress → renew SSL.* The most powerful move when applicable ([Value Creation §14.1](value-creation.md)).
- **Sideways — capture a sibling Small Job.** The *Previous Job* in the chain (acquisition, lead-gen — Zillow's Zestimate upstream of *list for sale*); the *Next Job* (retention, AOV — Figma → Dev Mode); or a *parallel sibling* not in a chain (Notion: *organize docs* → *manage tasks* → *run wikis*). See [Critical Chain §9](critical-chain.md).
- **Outside — link to a new Big Job.** Create a Big-Job edge that didn't exist — premium water links *"hydrate"* to *"create aesthetics at my table;"* Apple links *"do my creative work"* to *"signal taste."* ([Value Creation §16](value-creation.md)).

**Non-directional moves** (transform the structure, Core Job stays put):

- **Kill a Job** — delete it as a class (AirPods killed *untangle my headphones*). [Value Creation §14.2](value-creation.md).
- **Take a Job off the customer** — the Job stays, *you* perform it (Wealthfront rebalances; DoorDash cooks). [Value-Creation Mechanics](value-creation-mechanics.md).
- **Start performing a Job no one performs well** — introduce a new Core Job (Bench: *do my bookkeeping for me as a small-business owner*, into a previously DIY-or-CPA-only Graph). [Value-Creation Mechanics](value-creation-mechanics.md).
- **Add Orientation Jobs** — guide the decision process (Stripe's docs, HubSpot Academy). [Job Types and Properties §6](job-types-and-properties.md).
- **Route a Job to a partner** — when a chain-critical Job isn't yours (Apple's App Store; a realtor's preferred-vendor network). [Critical Chain §11](critical-chain.md).
- **Repair the Critical Chain** — unblock break-points, reduce hand-offs, kill cycles, compress time-gaps. [Critical Chain §6–§11](critical-chain.md).
- **Consolidate** — perform more of the customer's Jobs in one Solution. [Value-Creation Mechanics](value-creation-mechanics.md).

**Many moves don't operate on the Graph at all** — and the diagnostic when stuck is *which Graph move, or which off-Graph move, has the team not yet considered?* Most teams default to tuning the existing Core Job (improve, add features) when a step-change lives elsewhere:

- **Change *how* the Core Job is performed** without changing the Graph — lower the price, raise one quality dimension, remove a negative emotion, lower cognitive cost, guarantee the result. [Value Creation §18](value-creation.md).
- **Move on the *Map of Segments*** — up-market / down-market, adjacent segment, B2B↔B2C, opinion-leader segments. [Segmentation](segmentation.md).
- **Moves from the other three NMT pillars** — Unit Economics, RAT, ABCDX. [Next Move Theory key theses](../Next-Move-Theory/nmt-key-theses.md); the subtraction meta-operator runs across all four ([Subtraction](../Next-Move-Theory/subtraction.md)).

---

## Cross-references

- [AJTBD key theses §1](ajtbd-key-theses.md) — the three units of analysis; Graph as the *structure* unit.
- [Job Structure §11](job-structure.md) — the four-level hierarchy and Job-level placement.
- [Critical Chain](critical-chain.md) — the Graph projected onto a time axis at a chosen Solution: where the operational dynamics of chain-walking live (predictions, prediction errors, interruptions, drop-offs, Solution switches, per-step emotions); chain pathologies (cycles, hand-offs, time-gaps, breaks); Previous-Job / Next-Job strategy.
- [Job Types and Properties](job-types-and-properties.md) — types (Regular, Orientation, Tax, Fake, Emotional, Viral) and properties every Job can carry. The Tax Job framing covers Jobs that spawn mid-execution.
- [Value Creation §14](value-creation.md) — move-up-a-level and kill-a-Job as Graph-simplification operators; §16 — link to a new Big Job; §18 — the mechanics catalog.
- [Subtraction](../Next-Move-Theory/subtraction.md) — the subtraction meta-mechanic behind Graph simplification (§13).
- [Behaviour Change §2](behaviour-change.md) — Solution as a label for a Job Graph; §5 — Consideration Activators as the upstream loader of new Graphs; §9 — Forces of Behavior Change.
- [Segmentation](segmentation.md) — segments as sets of similar Core Jobs with similar success criteria; Graph similarity as the segmentation root (§11 here).
- [Consideration Activators](consideration-activators.md) — how a new Graph gets installed in the customer's head.
- [Place Core and Big Jobs](../HowTos/place-core-and-big-jobs.md) — long-form Core-Job / Big-Job placement procedure, with worked cases.
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — interview methodology for reconstructing a Graph from past-performance anchors.
- [Riskiest Assumption Test](../Riskiest-Assumption-Test/rat-key-theses.md) — past-performance recruiting discipline.

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

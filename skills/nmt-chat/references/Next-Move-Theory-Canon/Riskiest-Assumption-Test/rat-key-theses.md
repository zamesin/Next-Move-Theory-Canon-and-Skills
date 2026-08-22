# Riskiest Assumption Test (RAT) key theses

RAT is the Next Move Theory discipline for validating product ideas, feature ideas, and strategic-initiative ideas before the resources of a build are spent on them. Every new initiative is a stack of assumptions — beliefs about who the customer is, what they will pay for, whether the channel will scale, whether the unit economics close, whether the regulator allows it. **RAT is the practice of surfacing every assumption, ranking them by how lethal they are if wrong, and buying the cheapest possible evidence against the most lethal ones first.**

Most of what a product team will ever decide is downstream of running RAT well. Whether to start an initiative, whether to pivot it, whether to kill it, what to test next — all of it. It is among the most consequential disciplines in the methodology, and the operational backbone of every product decision under uncertainty.

> **Authorship.** The name *Riskiest Assumption Test* was introduced by Rik Higham, then a Senior Product Manager at Skyscanner, in [*The MVP is dead. Long live the RAT*, HackerNoon, 2016](https://hackernoon.com/the-mvp-is-dead-long-live-the-rat-233d5d16ab02). The underlying instinct — that an early-stage product is a stack of risky beliefs that must be tested, not built around — runs back to Steve Blank's Customer Development and Eric Ries's [*The Lean Startup*, 2011](https://www.amazon.com/Lean-Startup-Entrepreneurs-Continuous-Innovation/dp/0307887898). Higham's contribution was the inversion in framing: the MVP is not the answer, the riskiest-assumption test is. This page extends Higham's name with the Next Move Theory operating logic on top.

---

## 1. RAT is a written list of positively-stated risky assumptions — a cause-and-effect chain rooted in Segments and Jobs

Every new initiative is a chain of cause-and-effect-linked risky assumptions. Any product, any feature, any market entry, any pricing change, any new channel, without exception. The chain is rooted in Segments and Jobs: the segments we serve and the Core Jobs we choose to compete on (per [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)).

**The RAT is a *written* list of positively-stated risky assumptions on which the initiative's success depends.** Every link of the chain appears in a form falsifiable by a single experiment. The form is positive: *"the market is large enough"* not *"the market might be too small,"* *"the segment pays at our price"* not *"customers might not pay."* The positive form tells the team what to confirm, not what to worry about.

The main risky assumptions in the chain (a real RAT usually contains many more; see §5 on the product-specific custom layer):

- Market. *A market exists, is large enough to support the business, is growing, and is free of regulation that would prevent us from operating in it.*
- Segments and Jobs. *Specific segments of people performing similar Core Jobs exist inside the market, are large enough, and are reachable — and the Core Jobs we have chosen to compete on are the most attractive Jobs of those segments: economically most viable and we're able to create substantial value for these Core Jobs*
- Value. *Customers from those segments buy our product to perform those Core Jobs.*
- Unit economics. *Average margin per paying customer hits target.*
- Acquisition channels. *Repeatable channels exist that work in tight coupling with the unit-economics shape — channel CPA fits inside the unit-econ budget; channels scale; lead flow is predictable.*

**Get the Segments-and-Jobs assumption wrong and every assumption below it collapses with it.** That happens when you pick a non-existent segment, or pick the wrong Core Jobs to compete on. The reverse is not true. A failure in channels does not invalidate a working Segments-and-Jobs choice. Segments-and-Jobs is almost always the highest-leverage decision in a product cycle, and the most common location of the killing mistake (detail in §2; chain-break propagation in §9). We compete on the Jobs we picked, for the segments we picked. Get either side wrong and the rest of the chain has nothing to stand on.

**Survival across the stack is multiplicative.** Each assumption is an independent bet. The probability the initiative survives is the product of the per-assumption survival probabilities. Take a worked example with three of the main risky assumptions: segments with the Core Jobs we want to compete on exist, customers in those segments buy our product to perform those Jobs, unit economics close. At a per-assumption survival rate of 20% (empirically optimistic; see [Ronny Kohavi interview, AB Tasty](https://www.abtasty.com/blog/1000-experiments-club-ronny-kohavi/), *"over two-thirds of ideas actually fail to move the metrics they were designed to improve"*), combined survival is `0.2³ = 0.8%`, roughly one in a hundred and twenty-five. Every additional risky assumption multiplies the death rate. Every dropped assumption multiplies survival by `1/p`. **The highest-leverage move on a new initiative is rarely to add anything — it is to remove a risky assumption from the stack** (drop-it exercise; detailed examples in §10).

Operational consequences:

- Every assumption must be visible, the comfortable ones and the painful ones equally. Most teams unconsciously work on a sub-list — market, segment, value, maybe demand — and skip unit economics, regulatory risk, founder-team risk, and the operational assumptions that will actually kill them. The skipped ones bet against the team silently and win silently. Write down every belief the product depends on before the first dollar is spent on the build.
- The killing assumption often hides in product-specific custom risks, not in the main chain. The chain above is the universal layer that every initiative has. The custom layer (§5) is where the assumptions specific to *this* product live.
- The default direction on a new initiative is subtractive, not additive. When the team cannot decide whether to add or remove a complication, the math says remove (compare with [Value Creation §1 Problem 1](../Advanced-Jobs-To-Be-Done/value-creation.md), where the brain's drive is to remove entities).

A worked example — Claude Code at launch. A real RAT, in rough reconstruction (the actual one belongs to the team):

1. *The TAM is not the AI-coding-tools market — it is the market for writing software (global engineering labor and tooling spend). Enormous, growing fast, free of regulation that would block the product.*
2. *A segment of decision-makers — CTOs, VPs of Engineering, Heads of Platform / Developer Productivity — at companies with engineering teams exists, is large enough, and is reachable. The Core Jobs we have chosen to compete on are *"allocate the engineering-AI / developer-tools budget,"* *"pick an AI coding tool to standardize on across the team,"* and *"increase shipping velocity per engineer per dollar."**
3. *Decision-makers in that segment buy enterprise / corporate Claude Code subscriptions for their developers — i.e., when performing the Core Job of allocating their engineering-AI budget, they choose Claude Code.*
4. *Unit economics close — per-seat enterprise pricing produces target margin after per-task token costs at the developer-usage levels we anticipate.*
5. *Acquisition is led primarily by PR, reinforced by the team appearing on podcasts and interviews, distributed through Anthropic's own social channels, amplified by viral spread among developers who recommend Claude Code upward to their decision-makers, with direct sales for the largest enterprise accounts.*

---

## 2. Most product cycles die at the Segments-and-Jobs choice — verify the people exist and the Jobs are right before anything else

The chain in §1 has a root: Segments and Jobs. **More product cycles die from a wrong Segments-and-Jobs choice than from any other single cause.** The choice sits at the top of the cascade, and every assumption below it inherits the error. A team that picks the right Segments and Jobs with the wrong product can iterate the product into value. A team that builds the right product for the wrong Segments-and-Jobs cannot — every iteration runs further from a value hypothesis that will never land.

The choice has two halves, each individually fatal:

- Segments — do the people exist? Do people performing the Core Jobs we want to compete on exist, in numbers large enough to support the business, and are they reachable? A non-existent segment kills every downstream assumption immediately.
- Jobs — are these the right Core Jobs to compete on? Of the Core Jobs those segments perform, did we pick the most attractive — most central to the segment's motivation, most economically viable for our product to compete on? Picking a peripheral Core Job kills value and unit economics together. The segment exists, but won't pay for our solution against this Job.

The asymmetry: a wrong Segments-and-Jobs choice cascades downstream into every link of the chain. A wrong channel does not invalidate a working Segments-and-Jobs choice. The team that gets Segments-and-Jobs wrong loses every iteration. The team that gets it right and channel wrong loses only this channel cycle. The leverage is disproportionate.

Operational consequences:

- Before committing any build budget, verify that the people performing the Core Jobs you want to compete on actually exist. Not as team intuition, but as evidence from customer interviews against the actual segment definition. Existence is the cheapest assumption to validate, and failing to validate it is the most expensive miss in product work.
- Segment by Core Jobs and success criteria, not by Big Jobs and not by demographics. Segmentation in this methodology runs through sets of similar Core Jobs with similar success criteria and similar expected outcomes. **The success criteria *are* the segmentation criteria** — not demographics, not firmographics, not Big-Job similarity. Two groups of people with identical demographics and the same Big Job can have inverted Core-Job sets and are different segments. (Canon treatment: [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md), [Segmentation](../Advanced-Jobs-To-Be-Done/segmentation.md).)

The downstream consequence. Most of the rest of this page is a methodology for making wrong-Segments-and-Jobs decisions cheaper to detect and faster to recover from. The single most leveraged hour the team spends on RAT, however, is the hour before any of that — when Segments and Jobs are being chosen for the first time.

---

## 3. The goal of a new initiative is not to launch it — it is to kill it or to pivot it. The work is buying knowledge.

The default mental mode in product work is *we are building a thing and then launching it.* Every dollar spent in that mode is spent on the build. Every status meeting tracks how far along the build is. Every team conversation is about what to add next. The mode is so default it is invisible. The alternative does not occur to most teams until they have written off their second or third dead product.

**The correct mental mode is the opposite — the most likely outcomes of a new initiative are killing it or pivoting it, not launching it.** The product you are imagining is, with high probability, already carrying the gene that will end its current form. You do not yet know which gene, only that one is most likely there. The work is buying knowledge. Every dollar spent buys a unit of evidence that tells the team either to kill this part of the plan, to pivot the set of assumptions, or to proceed to the next risk.

Three possible outcomes for any new initiative, in descending order of probability:

- Kill the initiative. The most lethal risk hits: segment does not exist, unit economics never close, regulation kills the model, demand cannot be created. The team shuts the initiative down. This is a successful run of RAT, not a failure. The team bought the knowledge cheaply, before the build, and reallocated the capital to the next bet.
- Pivot the initiative. Some risky assumptions failed, some survived. The team changes the set (see §7 — a pivot is a change in the set of risky assumptions) and continues. Most products that eventually reach PMF have pivoted several times along the way.
- Proceed. The initiative survives validation and scales on the first assumption set. This is the rare path, and the best outcome a product cycle can produce. If you arrive here, congratulations; you do not bet on it. The default mental mode treats this as the only outcome. In reality it is the long-tail one, and the team's plan must assume the other two.

In all three, the team's job is the same: spend the next dollar on the unknown whose answer would change the most about whether this initiative should exist at all. In this mode the team is a cold-blooded breeder — drowning the kittens that cannot survive, recognizing the one that can.

Three operational consequences:

- Plan for kill-or-pivot, not for launch. Spend on finding where and how the death will happen, or on finding the smaller working subset inside the larger broken plan. Don't spend on delaying the moment of discovery.
- The fastest-learning team wins. Cycle time on evidence-per-dollar against the top risk is the operational metric, not features-shipped-per-quarter. If a team needs three months to falsify what a faster team falsifies in three days, the problem is not the product. It is learning velocity.
- The team designs experiments, not product. Each experiment is a probe at a single risky assumption. It is designed to come back either *the risk is real — kill or pivot this part of the plan* or *the risk is mitigated — proceed to the next risk.* §8 covers which probe to run first.

The launch mode and the knowledge mode use the same calendar, the same headcount, the same budget. They spend them on entirely different things.

---

## 4. The MVP is not a product — it is a probe

The most damaging word in the product lexicon is the *P* in *MVP.* A "Minimum Viable Product" is not a product. **It is a probe — a way of testing the set of risky assumptions the team has explicitly packaged into it, as fast and as cheaply as possible.** The set is usually small, one to a few of the top-priority assumptions from §8's formula. But it *is* a set, and every assumption in it must be named in advance, in §1's positive form. Higham's [original 2016 framing](https://hackernoon.com/the-mvp-is-dead-long-live-the-rat-233d5d16ab02) made the same correction by abandoning the name entirely: MVP is dead, what you build is the Riskiest Assumption Test. The replacement name is less catchy. The surgical clarity it forces is what matters.

Teams that read "Minimum Viable Product" hear *build a small version of the product you want to ship.* The mistake compounds at every step. The team scopes a small version of the wrong product, the one whose risks were never inventoried. It ships to nobody, because the segment was never confirmed. It iterates, because identity has now attached (see [Value Creation §1, Problem 2](../Advanced-Jobs-To-Be-Done/value-creation.md)). And it only kills the product after the budget is gone. The *M* and the *V* both did their job. The *P* killed the team.

Three operational consequences:

- The MVP's success criterion is *did the risk reveal itself,* not *did the product sell.* A perfectly designed probe whose answer is *"the segment doesn't exist"* is a success. You bought the most expensive piece of knowledge for the cheapest possible price. A probe that sold for one cycle and then collapsed is a failure regardless of revenue, because it answered nothing.
- The probe's design is dictated by the risk you are testing, not by the product you want to ship. Risk *the segment will not pay* gives a price-anchored landing page to Stripe Checkout. Risk *drivers will sabotage the product* (§5 example below) gives a phone call to a driver. Risk *enterprise will not buy without SOC 2* gives a customer-interview call to the buyer, not an audit. The shape of the probe is downstream of the shape of the risk.
- An MVP must name every risky assumption it is built to test. A single MVP can test more than one assumption. But if the team cannot list which assumptions this MVP is probing, by name and in §1's positive form, the MVP has drifted back into small-version-of-the-product mode and is no longer RAT.

(The concierge MVP — founders performing the Job manually for the first cohort — is RAT's logic on the value side: buy the can-we-deliver-the-Job-at-criteria knowledge before building the system. Maps to mechanic #4 in [Value Creation §18](../Advanced-Jobs-To-Be-Done/value-creation.md).)

---

## 5. Custom risky assumptions — usually where products actually die

The risks in §1's chain are universal. **The actual cause of death is almost always a custom risk specific to *this* product.** A custom risky assumption is one specific to the product's mechanics, not its category. It is a belief about how the real world — drivers, suppliers, regulators, integrations, internal staffing, distribution partners — will behave at a specific point in the operating model.

Custom risks beat base risks in three ways. They are invisible from category-level analysis. They are invisible to the founders themselves until they hit the wall. And they are uniquely positioned to kill a product after significant capital has gone in.

Four canonical custom-risk failures, each turning on a single missed assumption:

- Quibi (2020) — *"people will pay $5–8/month for premium mobile-only short-form video."* Jeffrey Katzenberg and Meg Whitman launched Quibi in April 2020 with [$1.75B raised, A-list talent, and a mobile-only design](https://news.crunchbase.com/startups/quibi-shutting-down/) — no casting to TVs, no clip sharing to social platforms. Each constraint was a custom risky assumption never stress-tested against real customer behavior. Quibi shut down in December 2020, eight months after launch, with ~500K subscribers. The content library sold to Roku for under $100M.
- Google Glass (2013) — *"consumers will wear always-on cameras in public."* The custom risk that killed the consumer launch was social: *"glasshole"* backlash, bars and restaurants banning the device, third-party privacy concerns. The consumer product was withdrawn in 2015 after two years. Only the enterprise variant (warehouse-pick, healthcare-imaging) survives.
- Juicero (2017) — *"the $400 connected press is essential to the value."* Premium pouch-and-press juicer with a $5–8/pouch subscription. Nobody had stress-tested one custom risk: Bloomberg reporters revealed in April 2017 that the pouches could be [squeezed by hand to yield the same juice](https://www.bloomberg.com/news/features/2017-04-19/silicon-valley-s-400-juicer-may-be-feeling-the-squeeze). The $400 machine became visibly unnecessary overnight. The company shut down within five months.
- The Excel-switching custom risk — *"target users will abandon Excel and adopt our tool."* This is the canonical custom risky assumption for every B2B SaaS competing with spreadsheets. Users have years of muscle memory, embedded macros, and established workflows, so the switching cost is enormous. Many *"Excel-killer"* tools have died here because they tested the wrong risk first (*build the app*) instead of the right one (*will users actually switch, and what would it take?*). The survivors — Airtable, Smartsheet, Anaplan — won by not positioning as Excel-replacement. They offered different primary value (relational database, project workflow, enterprise planning) and let users keep Excel for what Excel wins at.

Two operational consequences for inventorying custom risks:

- Talk to a competitor's salesperson before you build. People who tried to launch in this market and failed have the custom-risk knowledge nobody on your team has. ROI on expert interviews is among the highest in product work. A single market expert can kill a six-month engineering plan in a 45-minute call.
- Walk the operating model, every actor, every step. The driver — what do they hear when they tap that button? The restaurant — who picks up the tablet? The regulator — what filing do they require? The reseller — what commission split? Custom risks live at the joins between actors. Inventory them at the joins.

---

## 6. A risky assumption is concrete when it names the specific segment, product, price, and channel that make it falsifiable

A risky assumption is an assertion specific enough that a single experiment could falsify it. **A slogan is not an assumption.** *"The market is growing"* is not falsifiable; it is a feeling. *"There is a segment"* is not falsifiable; it is an aspiration. The bold elements below are what makes the assumption concrete — the specific segment, the specific price, the specific channel, the specific geography. Strip them out and the assumption collapses back into a slogan.

A real risky assumption for Stripe at launch (2010) looks like this (rough reconstruction; the actual one belongs to the team):

- ❌ *"The market is growing."* → ✅ *"The US online-payments market for **SaaS startups under 50 employees** processing **under $1M/year in card volume** is large enough to support a $100M-ARR business and has grown **at ≥10% per year for the last three years**."*
- ❌ *"There is a segment."* → ✅ *"A US segment of **solo founders and 2-to-3-person engineering teams at YC-stage B2B SaaS startups** exists — currently spending **weeks of engineering time integrating PayPal or Authorize.net** — and would pay **2.9% + $0.30 per transaction** for an API-first integration deliverable in **an afternoon**. The segment is reachable through **Hacker News, developer mailing lists, conference talks, and YC's portfolio network**."*
- ❌ *"The segment buys our product."* → ✅ *"Among the segment above, with **a 9-line-of-code Ruby/Python SDK at the published pricing**, reached through **developer-marketing channels (docs.stripe.com, HN, conference talks)**, purchase rate is **≥10% per qualified developer** who completes a first test-mode checkout, within **30 days of landing on stripe.com**."*
- ❌ *"There is no regulatory risk."* → ✅ *"Across **all 50 US states**, our partnership with **Wells Fargo as the acquiring bank** lets us process at scale without requiring a state-level Money Transmitter License of our own; **PCI-DSS Level 1 compliance** is achievable inside our planned engineering cycle."*

The hard part of writing risky assumptions is that the abstract version feels right. *"The market is growing"* reads as a true statement, so the team moves on. The concrete version forces the team to bind the assumption to the specific product, segment, channel, price, and geography. At that point the assumption either becomes visibly testable or visibly absurd. **Most "validated" assumptions in real product work are abstract assumptions that nobody bothered to make concrete.**

---

## 7. Pivot is a change in the set of risky assumptions

A pivot is not a copy change, a re-skin, a price test, or a channel swap. **A pivot is a change in one or more of the product's risky assumptions.** On most product cycles, several pivots happen before product-market fit lands.

The taxonomy:

- One-assumption pivot. Only one of the chain's risky assumptions changes; the rest are held constant. *eBay → Japan (2000–2002)* is canonical. eBay replicated its winning US auction model exactly, kept the same product, segment definition, value framing, and business model, and changed only the market. [Yahoo Japan's locally-built free auction service captured ~95% of the market](https://www.icmrindia.org/casestudies/catalogue/Business%20Strategy/BSTR312.htm) while eBay relied on brand alone. eBay exited Japan in March 2002. The product was right; the market alone was wrong.
- Multi-assumption pivot. Three or four of the chain's risky assumptions get re-bet at once. Instagram is canonical. Kevin Systrom and Mike Krieger started with *Burbn*, a Foursquare-style location check-in app with photo features. They observed that customer interviews kept circling back to the photo feature, and pivoted segment, value, product surface, and channel simultaneously to a single-purpose photo-sharing app in October 2010. PMF arrived within months. Facebook acquired Instagram in April 2012 for $1B.
- Whole-set pivot. Every link of the chain re-bet, sometimes multiple times across a founder's career. Stewart Butterfield's arc is canonical. *Game Neverending* (online game, 2002–2004) pivoted to *Flickr* (photo-sharing, acquired by Yahoo in 2005 for ~$35M). Years later, *Glitch* (massively-multiplayer browser game, 2009–2012) pivoted to [Slack](https://buildingslack.com/the-death-of-glitch-the-birth-of-slack/) (team chat, sold to Salesforce in 2020 for $27.7B). Two whole-set pivots, both born from gaming products that did not reach PMF, each preserving only an incidental internal tool the team had built for itself.

Three operational principles for pivoting:

- Change the assumption with the highest risk priority first. If §8's formula has ranked the assumptions, the pivot starts at the top of the ranking, not at whatever the founder feels strongest about.
- Prefer changing un-validated assumptions; keep what is already validated. A confirmed segment, a working channel, a measured Aha Moment — these are paid-for evidence. Burning them in a pivot wastes the cost of the prior validation. **The segment-Job pivot is usually the highest-leverage move when both segment and value are in question.** Segment changes cascade into changes in value, communication, channels, and business model; value changes do not cascade back into segment.
- Change one set per iteration when possible. Changing segment, value, channel, and business model simultaneously means the team cannot tell what worked and what didn't — it is running an un-blocked experiment. Sometimes everything has to flip at once. When it doesn't, don't make it.

Why most product founders resist pivoting: because they are launching a product, not building a business. The product becomes identity, and pivoting becomes admitting failure. The cold-blooded-breeder framing (§3) is the antidote. The team is not launching the AI productivity app. The team is spending capital to find a working business, and the AI productivity app was a hypothesis that returned negative evidence.

---

## 8. The RAT formula — what to validate first

`Risk priority = (P(risk hits) × Cost if risk hits) / Cost of validation`

What floats to the top is the assumption with the highest probability of being wrong, the most expensive consequences if it is wrong, and the cheapest experiment that would tell us so. **The formula's job is not to score risks; it is to order them.** You go validate whatever is at the top right now.

Three operational consequences:

- Put Segments-and-Jobs validation at the top of nearly every new-product priority list. The assumption is upstream, usually high-risk, catastrophic when wrong, and cheap to test through 15–25 [AJTBD interviews](../HowTos/basic-ajtbd-interview-guide-and-principles.md) before build budget is committed.
- Delegation by risk level. Risky assumptions with expensive consequences and high probability are top-management work. Cheap-and-low-probability risks are delegated down. New products are launched by senior people; features are shipped by juniors. The asymmetry of the formula is the reason. A feature whose worst case is *"nobody uses it"* is not a top-management problem. A market entry whose worst case is *"$5M and three years gone"* is.
- The denominator changes the answer. Take two assumptions equally risky and equally expensive — the one with the cheaper validation comes first. This is why concierge MVPs, fake-door tests, smoke-test landing pages, and partner phone calls beat building. A cheaper denominator means revisiting the assumption sooner with new evidence.

The diagnostic question, when the team cannot decide what to do this week: *"What is the single riskiest assumption right now, and what is the cheapest experiment that would falsify it?"* Whatever answers that question is what gets done.

---

## 9. Breaking the chain — once a link fails, downstream effort is decorative

§1's chain is a chain, not a set. **A break anywhere upstream renders every dollar spent downstream meaningless.** This is the failure mode that kills the most corporate product cycles, and the easiest one to prevent.

The pattern:

- *Committed to a Segments-and-Jobs choice that turned out wrong* (§2). Every dollar spent on MVP, brand, channel, funnel, team is meaningless. Start over from Segments-and-Jobs.
- *Committed to a value hypothesis that does not produce a positive prediction error.* Every dollar spent on optimization, retention, scaling is meaningless. Start over from value.
- *Committed to unit economics that do not close* — leads too expensive, no acquisition channel, no margin per customer. Every dollar spent on growth is meaningless. Start over from business model.

A team that does not internalize the chain logic spends downstream while upstream is broken. **The chain logic is the single largest determinant of how much of a product cycle is wasted.** It is also the easiest defect to fix. Write the chain, run §8's formula against it, validate the top assumption, and only then spend downstream.

---

## 10. The guaranteed way to kill a product — stack more risks. The antidote — strip them.

The fastest method to guarantee a new product dies is to load it with as many risky assumptions as possible. The math is in §1: every added risky assumption multiplies the death rate.

The antidote — *what can we drop?* — is the most under-used exercise in product strategy. Ask at kickoff and at every milestone:

> *Which risky assumption can we drop entirely without breaking the product's essential proposition? Which idea? Which integration? Which partnership? Which hire? Which line in the budget?*

Examples of dropping things:

- *Drop the in-house dev team.* Build the MVP on Bubble or Webflow + Airtable; ship in 3 weeks.
- *Drop the marketplace component.* Run the supply side as a concierge service for the first 50 transactions.
- *Drop the integrations.* Pretend the integration exists; ask the customer to email the data manually for the first cohort.

The default disposition is *drop it unless we can show the product cannot exist without it.* (This is the methodological inversion of feature thinking; compare [Value Creation §1](../Advanced-Jobs-To-Be-Done/value-creation.md).)

Sequencing principle. A broader, scrappier version first; a narrower one next. When the broad version finds traction, the team has validated other risky assumptions along the way — segment, channel, unit-economics direction. A narrower version can then be built on top of the validated evidence. Starting narrow with everything custom multiplies risk by stacking specificity on top of unknowns.

---

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

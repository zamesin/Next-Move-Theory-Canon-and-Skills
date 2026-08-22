# ABCDX segmentation key theses

*ABCDX segmentation was created by [Ilya Krasinsky](https://www.linkedin.com/in/ikrasinsky/).*

**ABCDX sorts your paying customers into five groups, then moves resources to the ones worth keeping.** You rank current customers on two things: how much per-unit margin each one earns, and how satisfied each one is. Those two axes give four groups — A, B, C, and D. A fifth group, X, is everyone who touched the product but fits none of the four.

The move is simple. Put more into the profitable, satisfied customers (A and B). Stop spending on the unprofitable, unhappy ones (C and D). Automate them down or let them go. Watch X closely. These are people whose real Jobs sit outside what the product does today, and they point to where new markets might be.

ABCDX is the methodology's main **local-optimum** move. You work the customers you already have into a more profitable, more focused shape — without changing the product's Core Jobs or the business model. The **global-optimum** moves are different: enter a new segment, climb to a higher-level Core Job, or change how you make money.

How this page connects to the rest of the canon:

- [Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md) — segments and Jobs sit at the root of every product bet.
- [Value Creation §10](../Advanced-Jobs-To-Be-Done/value-creation.md) — a segment's priority order over its success criteria is the real segmentation root.
- [Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md) — moving up a level, the structural answer to C and D customers who can never become A or B on this product.
- [Barrier Removal](../Advanced-Jobs-To-Be-Done/barrier-removal.md) and [AJTBD key theses §15](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) — the *too hard* vs. *not important enough* drop-off diagnostic.
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — the interview protocol you run inside A and B once you've found them.

---

## 1. ABCDX is a local-optimum move: hold the product steady, change who you serve

**ABCDX splits your paying customers into five groups — A, B, C, D, and X.** A, B, C, and D come from two things: per-unit margin and satisfaction with your product (§3). X is the fifth group. These customers touched the product but fit none of the four, because their real Jobs sit outside what it does today (§4). Once everyone is sorted, you shift resources from the unprofitable groups (C and D) to the profitable ones (A and B), and you treat X as a place to scout for bigger bets (§6).

**Two things stay fixed, and one thing changes on purpose.** The Core Jobs the product performs stay the same. The business model stays the same. What changes is the segment you actually serve. When you fire C and D and aim acquisition at A and B, the slice of the market you sell to narrows. That narrowing *is* the ABCDX move — not a side effect of it.

In any paying base, some customers sit well above breakeven. They pay, they barely touch support, they refer others. The rest sit at breakeven or below. The natural pull for a team is to spend the next dollar on whoever complains loudest, and the loudest customers are usually C and D. **C and D often eat most of the team's time while producing about a fifth of revenue and almost none of the margin.** A and B are quiet; the budget follows the noise.

Kidkin (~2020) shows the trap. It was a mobile app for parents looking for local kids' activities — swim, dance, music. A parent found a studio, took a free first class, then paid for the classes after that, and Kidkin earned a commission on the paid ones. The team got 113 support tickets a week: *"not enough studios near me," "the filter is broken," "these phone numbers are out of date."* Most of those tickets came from people who never paid. They had learned to use Kidkin to find *free* first classes all over the city and never converted. **Fixing what the loud group asked for would have spent the whole engineering budget on customers who would never produce revenue.** (US analog: an [ActivityHero](https://www.activityhero.com)- or [Sittercity](https://www.sittercity.com)-style marketplace where free-trial shoppers crowd out paying parents.)

Three things to get right before you start:

- **Count paying customers inside a time window — not the whole base, not all-time.** All-time margin tilts the picture toward whoever has been around longest. Pick a 6-, 9-, or 12-month window so customer age doesn't dominate the ranking.
- **Use per-unit margin, not company margin.** ABCDX works on contribution margin per customer, or per order if that is your unit. Company-level revenue and profit are downstream and answer a different question.
- **ABCDX doesn't build a new product — it reallocates the one you have.** The product, the team, and the channels don't change. What changes is who gets the next dollar of acquisition, the next engineering cycle, the next support upgrade — and who gets let go (§13).

---

## 2. Apply your segmentation cuts in a deliberate order — each cut costs you part of the market

**Swap the order of two segmentation criteria and you get a different target segment and a different strategy.** Most teams cut their data one criterion at a time without noticing it. When you layer two or more criteria, each later criterion runs only on the slice the earlier ones already produced, not on the whole market. That is normal, and often the only practical way to work. But every cut throws away part of the market, and you should know what you give up before you make it. It feels like math; it behaves like a tree.

**For an existing product with enough paying customers, the first criterion is one of two paths: ABCDX (fast) or full market research (slow and broad).** Both are below.

Before any new cut, hold three questions in mind:

- **Why this criterion now?** What does it tell you that the earlier cuts didn't?
- **What slice are you cutting away?** Are the customers who fail this criterion truly not your focus? Or are you discarding a profitable segment by accident, because an earlier cut already removed them from the data in front of you?
- **What error are you taking on?** Each criterion's reliability depends on the cuts above it. A bad early cut quietly corrupts every conclusion downstream.

Take the funnel-investigation reflex. A team with a monthly subscription sees customers churn after the first month. The instinct is *"let's interview the people who dropped off and find out what they needed."* **That instinct has already segmented the market — by the criterion "paid once, then churned."** When the team then runs AJTBD interviews on this group and clusters them by Core Jobs, the result is the Jobs of the people who churned. That is a slice of an already-shrunk market, and it may be unprofitable or small in the first place. The Jobs are real, but nobody asked whether that slice is the target segment at all.

**Reverse the order and the answer changes.** Segment first by Job-Graph similarity and economic attractiveness — which Core Jobs of which segments are profitable for us. Then, *inside* the profitable target segment, look at who churned. Now the churn is worth fixing, because fixing it moves a profitable segment instead of an unprofitable one. Same data, different order, different answer.

The two paths, picked by available time and ambition:

- **ABCDX first — the fast path (~1–3 months).** Use it when the paying base is large enough to give a real signal (§9) and you want a visible result fast. Rank current customers by margin and satisfaction, find A and B, fire C and D, refocus acquisition. The whole pass turns into revenue inside a quarter. By construction it is the local-optimum move (§6): it works the customers you already have, and the segments it produces are limited to the slice already paying. For most existing products with enough paying customers, it is the highest-leverage opening move and almost always worth running. It is not mandatory.
- **Full market research — the slow, broad path (~6+ months).** Use it when you have time and no urgent need for an operational lift. You map the whole market: segments paying you, segments paying competitors, segments nobody serves yet. The deliverable is a complete picture of who exists, what they pay for, and which Jobs they perform. The cost is time. The payoff is a target-segment decision made against the full picture — including segments outside your current base (the X direction, §4). That lets you choose a global-optimum bet (§6), not just the local one ABCDX produces by construction.
- **Sequencing still applies inside both paths.** On the fast path, ABCDX is criterion #1 and Job-Graph similarity inside A and B is criterion #2 (§5). On the broad path, criterion #1 is Job-Graph similarity across the whole market, with profitability and current-paying status as later refinements. Neither path collapses the two criteria into one.

**For a new product with few or no paying customers, this question doesn't apply.** ABCDX needs a paying base big enough to produce a signal (§9). A product with eight paying customers is searching for a segment from scratch ([Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md)). There, criterion #1 is Job-Graph similarity across the market; ABCDX comes later, once a paying base exists.

Operational consequences:

- **State the order of your cuts before you run the segmentation.** Every page of a segmentation deck should answer one question: which slice of the market is this, and which criterion produced it? If it can't, the segmentation is unanchored.
- **The "let's interview the drop-offs" reflex is an order-of-criteria mistake.** It's not always fatal — sometimes the churners *are* in the target segment — but you have to verify that, not assume it.
- **Pick the path by your time horizon.** Need revenue this quarter? ABCDX. Have six months and want to see what's outside your base first? Full market research. Have nine months and capital? Run both in parallel (§15). This is a sequencing choice, not a strategy choice.

---

## 3. The four groups: per-unit margin against satisfaction

**Two independent axes define the groups: per-unit margin (high or low) and satisfaction with your product (high or low).** Together they give four groups — A, B, C, and D.

- **A — your best customers.** Highest per-unit margin, fully satisfied. They buy quietly, rarely need support, and refer others. This is the group you reallocate toward.
- **B — one step from A.** A solid fit, but not fully satisfied yet, and the margin sits a notch below A. The product does some of their Core Jobs well and leaves one or two just outside its reach. Close that gap and B becomes A. B is the cheapest source of next quarter's A customers.
- **C — bought by mistake.** A poor fit for their actual Core Jobs. They're unhappy, they complain, and they ask for features A and B don't need. The headline margin may look fine, but once you count support it is breakeven or worse.
- **D — dead weight.** Off-target on every measure. Unprofitable, support-heavy, draining for the team. Fire them, or move them to a service tier that costs you nothing.

**Both axes are real, and they are independent.** A high-margin customer can still be a bad fit (a high-margin C). A satisfied customer can still earn thin margin (a low-margin B). Ranking on margin alone hides the unhappy high-margin customer. Ranking on satisfaction alone — the Sean Ellis test (§14) — hides the money-loser who loves you. ABCDX treats margin and satisfaction as equally important, and that is its whole contribution.

Operational consequences:

- **A and B are where you grow; C and D are drag.** Every lever — acquisition, activation, retention, expansion, support staffing, pricing — should pull in more A and B and push C and D toward automation or the door.
- **Turning B into A usually beats pushing A to A-plus.** B customers already pay and are already in the door. What's missing is one or two Core Jobs the product underperforms. A diagnostic interview ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) surfaces them, and closing the gap is ordinary value-creation work ([Value Creation §18](../Advanced-Jobs-To-Be-Done/value-creation.md)). Pushing A to A-plus runs into the rising prediction bar ([Value Creation §6](../Advanced-Jobs-To-Be-Done/value-creation.md)): each extra improvement registers as less.
- **C is not D, and you treat them differently.** C can sometimes move to A or B under a different product or business model (§13). D rarely can — D is off-target no matter how you reshape the offer.

---

## 4. X — the customers who fit no group, and what they tell you

**X is the group whose real Jobs sit outside what your product does today.** The four groups (§3) describe customers who fit the product's current Core Jobs. They either succeeded (A and B) or failed (C and D) at the Jobs your product is built to perform. X is different. These customers touched the product — visited the site, signed up, started a trial, sometimes paid once — but they don't sit cleanly in any group. There are three kinds:

- **Tried and bounced.** They visited and abandoned the funnel, or signed up and never activated. Their Core Jobs sit *outside* the product's current scope. They are not C (a poor fit on the Jobs the product does); they are a good fit for a Job the product doesn't perform yet.
- **Bought and refunded.** They paid once, then asked for a refund or stopped using it. They thought their Job matched and found out it didn't. From the inside this looks like C. From the outside it's X, because their Job was never on the product's roadmap.
- **Bought, but using it for something else.** They pay every month, but the Job they hire the product for is *not* one of your stated Core Jobs. Quiet, profitable, hidden — and a strong sign that an adjacent Core Job exists with real demand.

**X is the cheapest market research you will ever get.** A, B, C, and D are the local-optimum view: they describe the segment-Job-product setup you have today. X is what spills past the edge — evidence that segments exist outside what the product is currently built for. These people walked up to the door even though the door wasn't built for them.

Operational consequences:

- **Instrument X on purpose.** A team that tracks only A, B, C, and D loses the X signal entirely. Bounced visitors disappear into funnel metrics, refunds into churn, off-label use into anecdote. Tag X customers in the CRM and interview a sample.
- **Don't try to convert X with funnel tweaks.** X is a scouting surface, not a local-optimum target. The mismatch is in the Core Jobs, not the messaging. The right move is to map X's Jobs and ask whether building a product for those Jobs would produce its own A and B.
- **The "using it for something else" group is the most actionable.** They already pay for value the product delivers as a side effect. Naming that off-label use as a first-class Core Job often unlocks a new segment with no new engineering, because the product already does the Job — it just wasn't sold for it. [Slack](https://www.slack.com) grew out of internal tooling at a game studio this way, and [Loom](https://www.loom.com) out of async feedback among remote teammates.

---

## 5. Inside A and B, cluster by Jobs before you scale

**The second criterion, applied inside A and B, is Job-Graph similarity.** You cluster those customers into segments that perform similar Core Jobs with similar success criteria (see [Segmentation](../Advanced-Jobs-To-Be-Done/segmentation.md) and [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)). The two criteria run in sequence (§2), not as alternatives. ABCDX tells you *which customers to focus on*; the Job clustering tells you *which Jobs to compete on for them*. The output of both steps is your **target segment** — the real goal of the work. A and B were just the group that got you to a clear signal fast.

The flow:

1. **Run ABCDX** to produce the A-and-B group and the causal criteria that define it (§8).
2. **Run AJTBD interviews** ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) with 15–25 A and B customers. Surface the Core Jobs they hire the product for, the success criteria they judge it by, the Big Jobs above, the barriers they overcame, and the Aha Moment that activated them.
3. **Cluster the interviews into segments** — groups inside A and B performing similar Core Jobs with similar criteria.
4. **Pick the target segment.** Rebuild communication, funnels, content, ads, sales scripts, landing pages, and onboarding around it.

The interviews surface four things:

- The Core Jobs A and B customers actually hire the product for — often different from what the team assumed.
- The success criteria they judge by — the spec for value design ([Value Creation §9](../Advanced-Jobs-To-Be-Done/value-creation.md)).
- The Big Jobs above, where communication and motivation hooks live ([Value Creation §15](../Advanced-Jobs-To-Be-Done/value-creation.md)).
- The barriers they overcame and the Aha Moment that converted them — both are templates for activating the next cohort.

Two research designs, depending on the question:

- **Acquisition-focused.** Map the Critical Chain of Jobs ([Critical Chain of Jobs §11](../Advanced-Jobs-To-Be-Done/critical-chain.md)) from the moment the Big Job appears in the customer's head to the moment they hire a Solution. This shows where to load Consideration Activators, where competitors enter the consideration set, and when receptivity windows open ([Behaviour Change §8](../Advanced-Jobs-To-Be-Done/behaviour-change.md)).
- **Activation-focused.** Map the Critical Chain of Jobs of Micro Jobs leading to the Core Job. This shows where the chain breaks ([Critical Chain of Jobs §5](../Advanced-Jobs-To-Be-Done/critical-chain.md)), where the Aha Moment could fire earlier ([Value Creation §12](../Advanced-Jobs-To-Be-Done/value-creation.md)), and where small Problems pile up.

Operational consequences:

- **ABCDX without AJTBD on A and B is half the move.** ABCDX tells you the customers; AJTBD tells you their Jobs. Work at the Job level — value design, messaging, channel choice — needs the second layer.
- **AJTBD without ABCDX risks chasing a segment that doesn't pay.** A segment with strong Core Jobs but C-and-D unit economics is a global-optimum bet, not a local-optimum scaling opportunity.

---

## 6. Local optimum vs. global optimum — ABCDX is the local one

Every product investment falls into one of two classes.

- **Local optimum — optimize what already works.** Hold the Core Jobs and the business model constant. Tune conversion, activation, retention, expansion, and value delivery for the customers already paying. The segment you serve narrows through the work — you fire C and D and refocus on A and B — but the Jobs the product performs and the way it makes money don't change. The hypotheses are lower-risk, because every link of the [RAT chain](../Riskiest-Assumption-Test/rat-key-theses.md) is already validated by past payment. The return is bounded by the size of the current A-and-B segment. This work goes to less senior staff: feature work, conversion-rate optimization, support automation, lead qualification.
- **Global optimum — re-bet one or more links of the RAT chain.** Enter a new segment, climb to a higher-level Core Job ([Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md)), change the business model, or expand to a new country. The hypotheses are higher-risk, because every link you re-bet is a place the initiative can die. The return ceiling is larger: a segment 10× bigger, a different unit-economics curve, a market only you can reach. This work goes to the most senior people — the founders and highest-judgment people on the team.

**ABCDX is the canonical local-optimum move.** It accepts the segment-Job-product setup as given and asks the narrow question: of the customers in that setup today, which deserve the next dollar? X (§4) is the methodology's pointer *out* of the local optimum — it is what you see first when scouting a global-optimum bet.

Operational consequence:

- **Local-optimum work is fine — as long as you know it's local.** The failure isn't running local optimum; it's running it while believing it's the best option available, when a global-optimum move would return far more for the same six months. Name the choice. The default mindset is *"we're working on what's in front of us."* The right one is *"we picked local because we considered global and chose otherwise."*

---

## 7. ABCDX is product-specific — the same person is an A here and a D there

**Move to a different product and the same person can flip from A to D, or the reverse.** ABCDX segments through the lens of one specific product, at one specific moment. This is what makes it non-obvious. The team's intuition is that *"high-margin customer"* is a property of the customer. It is actually a property of the customer paired with this product.

Worker.ru (~2018) is the clearest case. It was a mobile app where candidates applied for low-skill jobs — couriers, fast-food cooks, taxi drivers — and the company earned a fee each time a hired candidate showed up for a shift. The team's first guess was *"A = university students: easy to acquire, digitally native, motivated."* ABCDX inverted it. **A turned out to be local working-class candidates, not students.** A working-class candidate stays inside the platform's pay range for years. They earn $45K today, $45K next year, $50K two years out, and stay relevant to the listings shift after shift. A student earning $45K today is at $55K next year and $65K the year after, so within about two years they exit the pay range. Same person, different products: a student is a D for Worker.ru and an A for a tech-internship marketplace, and a working-class candidate is the reverse. (US analog: a [Wonolo](https://www.wonolo.com)- or [Snagajob](https://www.snagajob.com)-style shift-work marketplace, where the pay band runs below where [Indeed](https://www.indeed.com)'s white-collar listings start.)

Three more cases of the same property:

- A custom-millwork shop cutting an unusual laminate grade on Italian machines. **Local interior-design studios were A; walk-in homeowners were C and D.** The studios learned the material, ordered correctly, and produced few re-cuts. The homeowners ordered incorrectly, forced re-cuts, and ate the shop's margin. Same product, same material, opposite groups. (US analog: a custom kitchen-cabinet shop where contractors are A and DIY homeowners are D.)
- A boutique HR-consulting practice with three high-margin clients. **Naming the A pattern and shifting the offer toward it produced +60% revenue in 3–4 months.** A was executive-search clients with ~$450K/month budgets, not the ~$150K mid-market clients. Same consultant, same delivery; the choice of which client to chase was the whole difference.
- A specialty dental practice. **Focusing on full-mouth restoration patients instead of single-procedure walk-ins produced +40% conversion and +37% revenue.** ABCDX on the patient base surfaced that A group, and the practice aimed acquisition and clinical positioning at it. (US analog: an aesthetic-dentistry practice positioned on full-mouth implants rather than routine fillings.)

Operational consequences:

- **Don't import ABCDX from a competitor in your category.** Two companies with similar products can have opposite A-and-D assignments, because they serve subtly different Core Jobs. Run ABCDX on your own base.
- **Universal markers cut across industries, but only at the property level, not the demographic level.** *"High SKU count"* may be A for one analytics platform and D for another, because one handles 50K SKUs and the other crashes above 5K. The cut is whether our product fits their shape, not industry or company size.

---

## 8. Real segmentation criteria are causes; fake ones are symptoms

**The hardest discipline in segmentation is separating cause from symptom.** The trap repeats at every level: in ABCDX (*what makes this customer high-margin and satisfied?*), in Job clustering inside A and B (*what makes these customers share the same Core Jobs?*), and in full market research (*why does this segment behave this way?*). Same question every time, same answer. A real criterion is a property of the person and their situation that *causes* the behavior, not a description of the behavior itself.

**And not every cause is a useful criterion.** A causal segmentation criterion tells you how to create value, earn target margin, or create demand:

- **Can we create value for them?** Does the criterion point at people whose Core Jobs our product can perform with an Aha Moment against their current alternatives ([Value Creation §4](../Advanced-Jobs-To-Be-Done/value-creation.md))?
- **Can we serve them at our target margin?** Does it correlate with willingness to pay, deal size, cost to serve, and acquisition cost in a way that closes unit economics ([Riskiest Assumption Test §1](../Riskiest-Assumption-Test/rat-key-theses.md))?
- **Can we reach them?** Does it describe people who are findable through some channel — already searching for the Job, or reachable through Consideration Activators ([Behaviour Change §5](../Advanced-Jobs-To-Be-Done/behaviour-change.md))?

Without those three, a criterion may be a true cause of *some* behavior and still not tell you whether to compete for this person. **Fake criteria buy a false sense of understanding: the segment has a name, but you still don't know how to create value, close margin, or make demand.**

Inside ABCDX, once A is identified, the question is what about this person makes them satisfied, high-margin, reachable, and ready to receive value from us. The answer has to be a property of the person and their situation, not a description of the outcome.

- **Fake criteria are symptoms.** *"Spent over $1,000 in the first six months," "placed more than two orders," "filed zero complaints," "NPS of 9 or above."* Each just describes A, B, C, or D in other words. None tells you what to look for in a new prospect before that prospect has racked up outcomes.
- **Real criteria are causes.** *"Willing to delegate the whole project end to end," "has a renovation budget of $100K+ per 1,000 sq ft," "this is their second or third home, not their first," "lives in a different city from the project, so time matters more than money," "expects $1M+ in revenue from the project, so the fee is a rounding error against the prize."*

Take an interior-design studio. Its ABCDX criteria, stated as causes:

- **A.** Out-of-town investors with $100K+ per 1,000 sq ft budgets, willing to delegate the whole project. Time costs them more than money.
- **B.** Local buyers with prior renovation experience, building for themselves or family, on a smaller budget.
- **C.** Want to do everything themselves, happy to spend a lot of time, and this is the only home they own.
- **D.** First-ever renovation, unrealistic budget expectations, low income.

**The criteria teams miss on the first pass are the hidden ones.** Anxiety level, confidence in doing it themselves, a hard deadline (a course launching, a tenant moving in, a wedding), the revenue they expect from the project, a bad past experience with a competitor's category. A budget threshold often anchors the criterion. The cause isn't *"high revenue"* (a symptom) but *"a specific number above which the customer treats your fee as a rounding error"* — for example, *"expects $1M+ from the course launch."*

Operational consequences — real criteria become qualifying questions:

- **Once you name A's causes, they turn into 4–5 inbound qualifying questions** that route a lead into the right group in minutes: *"Is this your first home? Have you renovated before? What's your budget per 1,000 sq ft? What matters more — time or money?"*
- **Set concrete cutoffs at the funnel mouth.** *"Under 5,000 SKUs, we're not a fit. Over 5,000, here's a sales rep."* The cutoff is the criterion made operational, and the conversation drops from 30 minutes to 30 seconds.
- **Symptom criteria fail the new-prospect test by design.** A new lead has zero past orders and zero past complaints, so symptom criteria can't route them. Causal criteria, asked as one or two questions, route them in the first minute of contact.

---

## 9. ABCDX needs enough paying customers to show a pattern, not noise

**ABCDX becomes usable when A contains a pattern — a property shared by 10–15 customers — not three lucky outliers.** The B2B-vs-B2C split is a poor guide to where that threshold sits. Two things actually drive it: how varied the paying base is (one tight ideal customer, or many industries, use cases, and deal sizes), and the shape of the margin distribution (a narrow band, or a long tail with whales).

**The thresholds run from about 50 customers for a tight base to 500+ for a varied enterprise base.** To recognize a real criterion in A you need roughly 10–15 customers who carry it. A is usually 10–25% of the paying base, sometimes as low as 2–5% in whale-shaped distributions. If A spans several hidden sub-clusters — different industries, very different deal sizes, multiple use cases — each cluster needs its own 10–15, which multiplies the threshold. For a tight, homogeneous base with a single cluster, 50–80 paying customers is enough. For a varied enterprise base with whales and several sub-clusters, you may need 500+ before A stabilizes. The real-world spread is about 10×, and it is structural — not a B2B-vs-B2C thing.

Four archetypes, across the behavioral range:

- **Tight-ICP B2B SaaS** ([Stripe](https://www.stripe.com) ~2011, a narrow SMB online-business segment). Homogeneous customer, moderate margin spread, a single A cluster. Real signal at 30–60 paying customers.
- **Enterprise B2B with whales** ([Salesforce](https://www.salesforce.com) shape: many industries, $50K–$5M deals, multiple use cases). High variety, long-tailed margin, several sub-clusters. Real signal at 150–300 paying accounts.
- **High-ticket B2C with two distinct customer shapes** (specialty dental and boutique interior design, both §7). The split shape makes A jump out fast even at modest size. Real signal at 40–80 paying customers.
- **Boutique B2B services** (HR consulting, ad agencies, fractional-CFO firms). Whale-shaped margin where A may be 2–5 customers total. Below the recognition threshold — but the split can still be readable. Treat A as a hypothesis and go find more matches.

Operational consequences:

- **Estimate your archetype before you reach for a threshold number.** A team that copy-pastes a *"30 for B2B"* or *"200 for B2C"* rule will either run ABCDX too early on a noisy base or wait too long while an obvious pattern sits in plain sight. Match your business to the closest archetype and adjust.
- **Below the threshold, ABCDX is a hypothesis, not a finished segmentation.** Treat the visible A pattern as a recruiting criterion. Go find more matching customers before you reallocate resources.
- **No readable pattern at all means you're searching for a segment from scratch**, not running ABCDX ([Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md)). Don't claim product-market fit on a handful of customers. That search is different work (global-optimum, §6) and runs through interviews of *people who paid competitors*, not your own three customers. For new products, criterion #1 is Job-Graph similarity, not ABCDX (§2).

---

## 10. Marketplaces run two ABCDXs — one for each side

**Any business that connects two sides runs two ABCDXs, one per side, and they are independent.** A marketplace, a payment platform, an agency, a brokerage, a recruiter — each has two customer bases to rank:

- ABCDX on the demand side (buyers, employers, riders, patients).
- ABCDX on the supply side (sellers, candidates, drivers, providers).

**The strategic question is which A on one side serves which A on the other most efficiently.** A demand-side A whose criteria the supply-side A can't meet creates friction at every transaction. Worker.ru's A candidates (working-class, stable pay range) map cleanly to its A employers (high-volume hirers like fast-food chains and taxi fleets who need steady wage-band hiring). [Uber](https://www.uber.com) Comfort's A riders (quiet cabin, recent-model car) map to drivers with newer cars. [Airbnb](https://www.airbnb.com)'s A guests (multi-night family or couple travel) map to hosts with full apartments rather than single rooms.

**Start with the scarcer side.** Run the demand-side ABCDX first when supply is plentiful and demand is the constraint. Run the supply-side first when supply is scarce and demand is queuing. (Same logic as the slowest-link diagnostic in [Critical Chain of Jobs §9](../Advanced-Jobs-To-Be-Done/critical-chain.md).)

Operational consequences:

- **If demand-A and supply-A don't overlap, the marketplace isn't clearing at its profitable point.** You have two profitable groups that don't transact with each other, while the actual transactions cluster in the C-and-D intersection. That's a structural defect, not an acquisition problem.
- **Pricing and matching route through both ABCDXs.** Take-rate, default-match suggestions, search sort order — each should preferentially route demand-A to supply-A.

---

## 11. Re-run ABCDX when the product or model changes — and once a year regardless

**ABCDX is a snapshot of a fixed product setup.** Change any of the inputs that define the setup and the segmentation has to be redone. Three kinds of triggers force a re-run:

- **You change the Core Jobs.** Add a new Core Job ([Value Creation §17](../Advanced-Jobs-To-Be-Done/value-creation.md)), drop one, climb a level ([Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md)), or absorb a Previous or Next Job in the chain ([Critical Chain of Jobs §9](../Advanced-Jobs-To-Be-Done/critical-chain.md)). Customers who were C or D for the old Core Jobs may be A or B for the new ones, and the reverse. The re-run is mandatory; the old segmentation no longer holds.
- **You change the business model.** Pricing, contract structure, distribution, packaging — each can flip a profitable group to unprofitable and back. A C group can become B at a different price point; an A group can become D when a contract change raises the cost to serve.
- **The environment shifts.** Pandemics, AI commoditization, rate cycles, regulatory change — all rewrite customer behavior under the segmentation. Refresh at least once a year as a floor, and twice a year in fast-moving categories.

Three shocks in the last five years visibly reshuffled ABCDX across the case base:

- **The pandemic (2020–2022).** It changed which roles bought B2B SaaS, which households bought home goods, and which travelers booked which platforms. Every consumer category with a commute in its Job Graph saw segments reassign.
- **AI commoditizing knowledge-work tools (2023–2025).** Where the Core Job was *"write a first draft," "summarize this document,"* or *"answer customer questions,"* segment A reassigned around who adopted AI tools fastest.
- **Rising rates re-pricing unit economics (2022–2024).** Customers who looked like A on revenue alone became C on margin once acquisition cost was re-baselined at higher rates.

Operational consequences:

- **Schedule the refresh.** A standing annual ABCDX review keeps the segmentation honest. Run it twice a year in disrupted categories.
- **The refresh is cheap.** Re-run the margin ranking from the CRM over a fresh window, interview 15–20 new A and B customers, and check whether last year's causal criteria still describe this year's A. The whole pass takes 2–4 weeks at most.

---

## 12. How to run ABCDX — the procedure

A working sequence produces a usable ABCDX in about 2–4 weeks:

1. **Pull the paying base over a fixed window.** Pick 6, 9, or 12 months, not all-time. All-time data over-weights the oldest customers and hides the current signal.
2. **Rank by per-unit margin.** Margin per unit = revenue per unit − variable cost to serve − attributed acquisition cost. If your analytics can attribute these cleanly, do it from data. If not, do it by expert judgment. Sales and support leads together can rank customers from memory (*"this one is hard, this one is easy, this one pays late, this one upsells himself"*) with surprising accuracy.
3. **Cross-rank by satisfaction.** Use NPS, CSAT, retention, repeat purchase, referrals, support-ticket volume, and usage cadence. As with margin, prefer data when you have it and expert judgment when you don't.
4. **Cluster into two or four groups.** The two-group form (A and B vs. C and D) is easier on a small base. The four-group form adds resolution on a larger one.
5. **Tag X.** Pull the customers who *touched* the product but fit no group — bounced visitors, refunded buyers, off-label users (§4). They're not part of the ranking; they're a separate list for global-optimum scouting.
6. **Find the causal criteria for each group** (§8). Look for shared properties of the *people and their situation*: context, prior experience, budget structure, role, what they hire the product for. If expert pattern-matching fails, run AJTBD interviews ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) with 5–10 customers per group.
7. **Turn the causal criteria into 4–5 inbound qualifying questions** (§8). These are what the funnel uses day to day.
8. **Inside A and B, run the second criterion — Job-Graph similarity** (§5). Interview 15–25 A and B customers, cluster them by Core Jobs and success criteria, and pick the target segment.
9. **Build the allocation.** Channels, sales-rep tiers, onboarding, support tier, and pricing all biased toward A and B. Route C and D to self-serve, automation, or a polite *"we're not the right fit."* Keep X under observation as a scouting surface.

Operational consequences:

- **Step 1's window matters more than teams expect.** A 3-month window misses repeat-purchase patterns; an all-time window over-weights early customers. **6–12 months is the working default**, adjusted for cycle length — annual-purchase categories need 18–24 months, weekly-purchase categories work at 3–6.
- **The team's instinct will fight step 6.** Saying *"this customer is unprofitable"* sounds like saying *"this customer is bad."* It isn't. It means the fit is wrong, and the customer is fine for some other product. Frame it that way up front so the team doesn't read the segmentation as a moral judgment.
- **Step 9 is where most ABCDX efforts stall.** Finding A is easy. Routing C and D away is hard, operationally and emotionally — turning down inbound, raising prices on a current group, automating support down to a chatbot. The segmentation is worthless without the allocation move that follows it.

---

## 13. After ABCDX: focus A and B, fire C and D, qualify every new lead

The strategy that follows a completed ABCDX:

- **Name the causal criteria of A and B** (§8 and §12, step 6).
- **Tune acquisition, sales, and product to those criteria.** Channels, creative, sales scripts, onboarding, and pricing all biased toward who is A and B.
- **Stop using C and D feedback for product decisions.** This is one of the highest-leverage moves a team can make. By definition, C and D are not who the product is for. Their feature requests, complaints, and reviews pull the product *away* from A-and-B fit.
- **Actively fire C and D.** Three mechanics:
  - **Decline inbound at the funnel mouth.** *"Under 5,000 SKUs, we're not the right fit — have you looked at [a competitor]?"* The qualifying questions from §8 produce the routing rule.
  - **Automate down to near-zero cost.** [Chase](https://www.chase.com) routes mass-market retail customers to the ATM, the app, and the chatbot, and reserves relationship banking for higher-margin clients. The same logic works at any scale: route the customer to a self-serve tier where the marginal cost of serving them is near zero.
  - **Raise the price.** Some C and D customers become B at a higher price point, because their margin closes. The rest leave on their own.

**C and D won't become A and B on this product.** They aren't unprofitable because the product underperforms for them. They're unprofitable because the product's Core Jobs don't match their Core Jobs. Build them a better experience and they stay C and D, because the mismatch is in what kind of work the product was built to do. Run the test: *"if I built a perfect version of my product, would these customers become profitable?"* For real C and D customers the answer is no. The limit is set by their situation — the Job isn't important enough, the budget is too small, the criteria are too different — not by the product's quality. A millwork shop's walk-in homeowner is not going to renovate 20 apartments a month, and a working-class candidate's career is not going to follow a tech worker's pay curve.

**A large C-and-D group can sometimes be re-routed through a *different* product.** The new product has different Core Jobs, a different business model, sometimes a different brand — and those customers become A and B for it. That is global-optimum work (§6), not local. Most teams shouldn't run it alongside the ABCDX allocation, because it needs the senior bandwidth the global bet requires. X (§4) is usually a better starting point for the global bet than C and D, because X customers chose to engage despite the misfit — they have stronger pull toward the new Core Job.

---

## 14. The Sean Ellis test, and why ABCDX goes further

The **Sean Ellis test** ([~2015](https://review.firstround.com/the-only-metric-that-matters/)) is a widely used adjacent technique. It segments customers by their answer to *"How would you feel if you could no longer use this product?"* Ellis found that products at product-market fit have at least 40% of users answering *"very disappointed."* The test gives a single calibrated read on category fit against an empirical benchmark.

Rahul Vohra refined it at Superhuman ([~2018](https://review.firstround.com/how-superhuman-built-an-engine-to-find-product-market-fit/)). He ran the Ellis survey on the first ~2,000 beta testers, and *"very disappointed"* came in at 22%, below the benchmark. He segmented respondents by role, and founders and senior leaders without engineering teams hit 32%. **He re-ran the test on that subset, asked the somewhat-disappointed group what would convert them, shipped those features, and passed 40% within a year.**

Where the Sean Ellis test is strong: it produces one calibrated number against a published benchmark, it shows which roles or use cases feel the product is irreplaceable, and the *"what would convert you"* follow-up is a cheap source of feature ideas.

Where ABCDX goes further, and why it's the default here:

- **ABCDX measures both satisfaction and profitability; the Sean Ellis test measures only satisfaction.** A group that says *"very disappointed if it disappeared"* but loses money per unit is not the group to scale on — the more they love you, the faster you burn cash.
- **ABCDX separates A from B as a resource-allocation signal; the Ellis test doesn't.** Once you've found a Sean Ellis cohort, you still have to decide who inside it is high-margin and who isn't.
- **Vohra's follow-up collects feature requests from satisfied customers, not Job-and-criteria diagnostics.** That is value-creation work handed to the customer, which is brittle (see [Value Creation §1](../Advanced-Jobs-To-Be-Done/value-creation.md)). It worked for Superhuman partly because that customer base was unusually self-aware, and it generalizes poorly.

**Using both is fine.** Run ABCDX as the primary segmentation, then layer the Sean Ellis test inside the A-and-B group to see which subset feels the product is irreplaceable. The Ellis read then guides communication and growth-loop work, while ABCDX keeps driving resource allocation.

---

## 15. Run local and global at the same time — not one then the other

**Most product organizations should run local and global optimization at once, with different seniority and different risk budgets.** A common reading says local optimum is for mature products and global optimum is for early-stage ones. That reading is wrong.

- **Local-optimum work runs continuously.** ABCDX-driven feature work, conversion work, and activation work for the current A and B. Less senior staff, quarterly cadence, bounded return, high hit rate, small downside per bet.
- **Global-optimum bets run in parallel.** A small senior team studies adjacent segments, climbs the Job Graph to higher Big Jobs, prototypes a new business model, and mines X (§4) for the next product. Most senior staff, multi-quarter cadence, outsized return when it lands, lower hit rate, larger downside per bet.

This mirrors the delegation logic in [Riskiest Assumption Test §8](../Riskiest-Assumption-Test/rat-key-theses.md): expensive, high-risk assumptions go to senior people; cheap, low-risk ones go to junior. ABCDX-driven work is the latter; new-segment, higher-Core-Job, and new-market work is the former.

---

## Cross-references

- [Riskiest Assumption Test §1–§2](../Riskiest-Assumption-Test/rat-key-theses.md) — the chain of risky assumptions; segments and Jobs as the root.
- [Riskiest Assumption Test §8](../Riskiest-Assumption-Test/rat-key-theses.md) — the RAT formula and delegation by risk level.
- [Value Creation §10](../Advanced-Jobs-To-Be-Done/value-creation.md) — priority order over success criteria as the segmentation root.
- [Value Creation §11](../Advanced-Jobs-To-Be-Done/value-creation.md) — mapping segment criteria to mechanics.
- [Value Creation §12](../Advanced-Jobs-To-Be-Done/value-creation.md) — engineering the first Aha Moment.
- [Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md) — move up a level, the structural response to C and D customers.
- [Value Creation §17](../Advanced-Jobs-To-Be-Done/value-creation.md) — value lives outside your current Core Jobs (the X pointer).
- [Critical Chain of Jobs §9](../Advanced-Jobs-To-Be-Done/critical-chain.md) — Previous-Job and Next-Job strategy.
- [Critical Chain of Jobs §11](../Advanced-Jobs-To-Be-Done/critical-chain.md) — interview protocol for surfacing the Critical Chain of Jobs.
- [Critical Chain of Jobs §4](../Advanced-Jobs-To-Be-Done/critical-chain.md) — drop-off read as a Solution switch; the *too hard* vs. *not important enough* diagnostic in [Barrier Removal](../Advanced-Jobs-To-Be-Done/barrier-removal.md) and [AJTBD key theses §15](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md).
- [Behaviour Change §8](../Advanced-Jobs-To-Be-Done/behaviour-change.md) — receptivity windows and triggers.
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — the AJTBD interview guide.
- [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) — segmentation by Core Jobs and success criteria as primary; Big Job as motivation refinement.

---

*Methodology and text by **Ivan Zamesin** — [X](https://x.com/zamesin) · [LinkedIn](https://www.linkedin.com/in/ivan-zamesin/) · Learn more at [nextmovetheory.com](http://nextmovetheory.com/?utm_source=canon&utm_medium=github). Distributed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).*

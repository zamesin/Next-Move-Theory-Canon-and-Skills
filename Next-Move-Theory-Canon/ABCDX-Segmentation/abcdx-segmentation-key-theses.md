# ABCDX segmentation

This file is the canon page on **ABCDX segmentation** — the discipline of splitting a currently-paying customer base into five groups by **per-unit margin × satisfaction**, redirecting resources to the high-margin satisfied groups (A and B), actively firing the unprofitable dissatisfied ones (C and D), and treating the leftover **X** — customers who touched the product but don't fit any of A/B/C/D — as the visible signal that valuable segments exist *outside* the product's current Core Jobs.

ABCDX is the canonical **local-optimum** move in the methodology: work the customers you already have to a more profitable, more focused state — without changing the segment-Job-product triple itself. The page connects to [Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md) (segments-and-Jobs as the root of the chain), [Value Creation §10](../Advanced-Jobs-To-Be-Done/value-creation.md) (criteria-priority orders as the segmentation root), [Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md) (move-up-a-level — the structural answer to C/D customers who can never become A/B on this product), [Barrier Removal](../Advanced-Jobs-To-Be-Done/barrier-removal.md) and [AJTBD key theses §15](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) (the *hard vs. not-important-enough* drop-off diagnostic), and [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) (the interview protocol used inside A/B once they're identified). The complementary **global-optimum** moves — entering a new segment, climbing to a higher-level Core Job, changing the business model — live in [Scale a Product](../Algorithms/scale-product.md), [Exit Competition](../Algorithms/exit-competition.md), and [Grow an Existing Product](../Algorithms/grow-existing-product.md).

---

## 1. ABCDX segmentation is the local-optimum discipline — hold Core Jobs and business model fixed; let the segment itself shift through deliberate refocus on A/B and firing of C/D

**ABCDX segmentation splits the team's customer base into *five* segments — A, B, C, D, and X.** A/B/C/D are the four cells of per-unit margin × satisfaction across currently-paying customers (§3); X is the fifth segment — customers who touched the product but don't fit any A/B/C/D cell because their Core Jobs sit outside the product's current scope (§4). Once the five segments are identified, **the team reallocates scarce resources from the unprofitable segments (C and D) to the profitable ones (A and B), and treats X as a scouting surface for global-optimum bets** (§6).

What stays fixed across the move: **the Core Jobs the product performs and the business model.** What deliberately *changes*: **the segment itself.** When the team fires C/D and refocuses acquisition on A/B, the segment the company actually serves narrows — *that segment-shift is the ABCDX move; it is not a side-effect of it.* The product and the business model don't change; the slice of the market the product is sold to does.

**Not all customers are equally useful.** Of a paying base of N customers, a fraction sit above breakeven on per-unit economics — they pay, consume little support, refer peers. The rest sit at breakeven or below, *and the brain-default for product teams is to spend the next dollar serving whoever shouts loudest.* The structural defect ABCDX prevents: **C and D customers consume the majority of team time while delivering ~20% of revenue and frequently ~0% of margin.** *They are loud; A and B are quiet; the louder voice gets the budget.*

**The canonical illustration — Kidkin (~2020).** A mobile app for parents to find local extracurricular activities for kids — swim, dance, music. The business model: parent finds a studio, attends a free first class, pays for subsequent classes; Kidkin takes commission on paid classes. The team received **113 support tickets per week** — *"not enough studios in my neighborhood,"* *"the filter doesn't work,"* *"phone numbers are out of date."* Most of those tickets came from *non-paying* users who built a habit of using Kidkin to find *free* first classes across the city and never converted. **Fixing the problems the loud cohort named would have spent the entire engineering budget on a cohort that would never produce revenue.** (US analog framing: an [ActivityHero](https://www.activityhero.com)- or [Sittercity](https://www.sittercity.com)-style aggregator where free-trial-shoppers crowd out paying parents.)

**Operational consequences:**

- **The unit of analysis is *paying customers within a defined time window*, not the entire customer base, not lifetime cumulative.** Lifetime margin distorts the picture toward whichever cohort has been around longest; pick a 6-month, 9-month, or 12-month window so cohort age doesn't dominate the ranking.
- **Per-unit margin, not company margin.** ABCDX is a unit-economics segmentation — contribution margin per customer (or per order, depending on what your unit is). Company-level profit and revenue totals are downstream and should not be confused with the ABCDX signal.
- **ABCDX does not produce a new product; it produces a different *allocation* of the existing one.** The product, the team, the channels are unchanged; what changes is which customers receive the next dollar of acquisition, the next engineering cycle, the next support upgrade — and which are deliberately fired (§13).

---

## 2. Segmentation criteria are usually applied in sequence — know what each cut costs before you make it

**Segmentation criteria are usually applied sequentially in practice — and most teams don't notice it.** When the team layers two or more criteria onto the data, each subsequent criterion runs against the *already-cut* slice, not the whole market. **That is not wrong by itself** — applying criteria one at a time is operationally normal and often the only tractable way to do the work. But every cut costs the team part of the market, and the team needs to know what it gives up before each cut. Swap the order of two criteria and you produce two different segmentations with two different focus segments and two different strategies. *The structure feels like math; it behaves like a tree.*

**For an existing product with enough paying customers, the choice of *which* criterion to apply first usually comes down to two paths — ABCDX (the quick-result path) or full market research (the slower, broader path).** Both are unpacked below.

**Before applying any new criterion, hold three questions in mind:**

- **Why this criterion now?** What does it tell you that the previous cuts didn't?
- **What slice of the market are you cutting away?** Are the customers who fail this criterion *truly* not your focus — or are you discarding a profitable segment by accident, because the previous cut already removed them from the data you're looking at?
- **What error are you taking on by applying this criterion in this order?** Each criterion's reliability depends on the cuts upstream; a flawed early cut propagates silently into every downstream conclusion.

**Worked example — the funnel-investigation trap.** A team with a monthly-subscription product sees customers churning after the first month. The default move is *"let's interview the customers who dropped off and find out what they needed."* That move *has already segmented the market* — by the criterion *"paid once, then churned."* When the team then runs AJTBD interviews on this group and clusters them into segments by Core Jobs, the result is *"the Jobs of the cohort that churned"* — which is a slice of an already-shrunk market and *may correspond to an unprofitable or small segment in the first place.* The Jobs surfaced are the Jobs of the churners; the question whether *that* slice is the focus-segment at all is never asked.

**Reverse the order and the result changes entirely.** Segment first by Job-Graph similarity and economic attractiveness (which Core Jobs of which segments are profitable for our product); inside the *focus-segment-with-the-profitable-Jobs* cohort, *then* look at who churned. That cohort is now actionable — fixing their churn moves a profitable segment, not an unprofitable one. **Same data, different order, different operational answer.**

**ABCDX vs. full market research — two paths for existing products, picked by available time and ambition:**

- **ABCDX-first — the quick-result path (~1–3 months).** When the team has a paying base large enough for ABCDX to produce a non-noise signal (§9) and wants a visible operational result fast, ABCDX is the right opening move. Rank current paying customers by margin × satisfaction; identify A/B; fire C/D; refocus acquisition. The whole pass converts to revenue inside one quarter. *ABCDX is the local-optimum strategy by construction* (§6) — it works the customers you already have, and the segments it produces are bounded to the slice already paying. **ABCDX is not mandatory for an existing product — but for most existing products with enough paying customers, it is the highest-leverage opening move and almost always worth running.**
- **Full market research — the slower, broader path (~6+ months).** When the team has the time and the business doesn't need an immediate operational lift, the alternative is to map *the whole market* — segments paying the team, segments paying competitors, segments not currently served at all. The deliverable is a complete map of who exists, what they pay for, and which Jobs they perform. **The downside is time;** the upside is that the focus-segment decision is made against the full picture, including segments outside the current paying base (the X-class direction — §4) — and the team can pick a global-optimum bet (§6) rather than the local-optimum one ABCDX produces by construction.
- **Inside both paths, sequencing still applies.** ABCDX is criterion #1 for the quick-result path; Job-Graph similarity inside A/B is criterion #2 (§5). Full market research starts at criterion #1 = Job-Graph similarity across the *whole* market, with profitability and current-paying-status as later refinements. *Neither path collapses the two criteria; both apply them in order.*

**For new products with very few or no paying customers, the question doesn't apply.** ABCDX needs a paying base big enough to produce signal (§9); a product with eight paying customers is *searching for a segment from scratch* ([Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md)). Criterion #1 is Job-Graph similarity across the market; ABCDX comes later, once a paying base exists.

**Operational consequences:**

- **State the order of criteria before running the segmentation.** If the deliverable is a segmentation deck, every page should be able to answer *"which slice of the market is this analyzing? Which criterion produced the slice?"* If the deck can't answer, the segmentation is unanchored.
- **The "let's interview the people who dropped off" reflex is structurally an order-of-criteria mistake.** Not always fatal — sometimes the churners *are* in the focus segment — but the team has to verify that, not assume it.
- **Pick the path by the team's time horizon and current pressure.** *"We need revenue in one quarter"* → ABCDX. *"We have six months and want to know what's outside our base before doubling down"* → full market research. *"We have nine months and capital"* → both, in parallel (§15). The choice is not strategy; it is sequencing.

---

## 3. The four cells of ABCDX — A/B/C/D defined by per-unit margin × satisfaction, against your specific product

The ABCDX frame splits paying customers across **two independent axes intersected simultaneously: per-unit margin (high/low) and satisfaction with your product (high/low).** Four cells:

- **A (Awesome / All-right).** Highest per-unit margin. Maximally satisfied with the product. Buy quietly, ask little of support, refer peers. *Loyal, high-margin, perfect-fit.* The focus segment for resource reallocation.
- **B (Basic / Good).** Profitable on per-unit margin, but not perfectly satisfied. The product performs some of their Core Jobs imperfectly; others sit just outside its current scope. Growth potential — closing the value-delivery gap converts B → A. *The cheapest source of next-period A customers.*
- **C (Costly / Crazy).** Bought the product by mistake. The product is a poor fit for their actual Core Jobs. Low satisfaction, frequent complaints, frequent requests for features A and B don't need. Per-unit margin sits at breakeven or below once support cost is included.
- **D (Dead / Deadly).** Fundamentally off-target customers. Unprofitable on every measure; consume disproportionate support resources; demoralize the team. *Need to be actively fired or routed to a zero-cost service tier.*

**The two axes are independent — every cell is occupied.** A high-margin dissatisfied customer (high-margin C) and a low-margin satisfied customer (low-margin B) both exist in real bases. Pure-margin segmentation collapses the satisfaction axis and over-counts the first; pure-satisfaction segmentation (the Sean Ellis test — §14) does the inverse. **ABCDX's contribution is treating both axes as primary.**

**Operational consequences:**

- **A and B are the growth surface; C and D are the operational drag.** Every operational lever — acquisition channels, activation, retention, expansion, support staffing, pricing — should be tuned to attract more A/B and to deflect or automate-down C/D.
- **B → A is usually a higher-leverage move than A → A+.** B customers are already paying and already in the door; what's missing is one or two specific Core Jobs the product underperforms on. The diagnostic interview ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) surfaces them; closing the gap is normal value-creation work ([Value Creation §18](../Advanced-Jobs-To-Be-Done/value-creation.md)). A → A+ runs into the rising prediction bar ([Value Creation §6](../Advanced-Jobs-To-Be-Done/value-creation.md)) — each marginal improvement registers as less value than the last.
- **C ≠ D, and the operational move differs.** C can sometimes be migrated to A or B *for a different product/business-model* (§13); D rarely can — D customers are off-target across any plausible variation of the offering.

---

## 4. X — customers who touched the product but don't fit A/B/C/D; the visible signal that valuable segments exist outside your current Core Jobs

The four cells (§3) describe customers who *fit* the product's current Core Jobs — they either succeeded (A, B) or failed (C, D) at one of the *Jobs your product is built to perform.* **The X class is different.** X customers *touched* the product — visited the site, signed up, started a trial, sometimes paid once — but they don't sit cleanly in any A/B/C/D cell. Three sub-classes:

- **Tried-and-bounced for value reasons.** Visited the site, abandoned the funnel; signed up, never activated. Their Core Jobs sit *outside* the product's current scope — the value the product delivers isn't the value they needed. They are not C (poor product-customer fit on the *existing* Jobs); they are *correctly fit to a different Job the product doesn't perform yet.*
- **Bought-and-refunded.** Paid once, then asked for a refund or stopped using the product. They thought their Job matched, discovered it didn't. Looks like C from the inside; looks like X from outside, because their Jobs were never on the product's roadmap to begin with.
- **Bought-but-using-it-for-something-else.** Pay every month, but the use case they hire the product for is *not* one of your stated Core Jobs. Quiet, profitable, hidden — and a strong signal that an adjacent Core Job exists with real demand.

**X is the visible edge of the global-optimum opportunity space.** A/B/C/D are the local-optimum view — they describe the *current* segment-Job-product triple. X is what spills past the edge — *evidence that segments exist outside what the product is currently built for.* That evidence is the cheapest possible market-research input the team will ever have: people already walked up to the door, even though the door wasn't built for them.

**Operational consequences:**

- **Instrument X explicitly.** A team that tracks only A/B/C/D loses the X signal entirely — bounced visitors disappear into funnel-conversion metrics, refunds disappear into churn, off-label use cases disappear into anecdote. *Tag X customers in the CRM; interview a sample.*
- **X is not a local-optimum target; X is a global-optimum scouting surface.** Don't try to "convert X to A" by tweaking the current funnel — the Core Jobs mismatch is structural, not messaging. The right move is *map X's Jobs* and ask *"would building a product for these Jobs produce its own A/B?"* ([Exit Competition](../Algorithms/exit-competition.md) for the global-optimum playbook.)
- **The "bought-but-using-it-for-something-else" sub-class is the most actionable.** They are already paying for value that the product delivers as a *side-effect.* Surfacing the off-label use case and naming it as a first-class Core Job often unlocks a new segment with zero new engineering — the product already performs the Job; it just wasn't sold for it. [Slack's](https://www.slack.com) emergence from internal tooling at Tiny Speck and [Loom's](https://www.loom.com) emergence from async-feedback among remote teams both started this way.

---

## 5. Once A/B is identified, the second criterion clusters them into segments by Core Jobs and success criteria — run AJTBD interviews inside A/B before scaling

ABCDX identifies **A/B as a margin-and-satisfaction cohort;** the **second segmentation criterion**, applied *inside* A/B, is **Job-Graph similarity** — clustering A/B customers into **segments performing similar Core Jobs with similar success criteria** (see [Segmentation](../Advanced-Jobs-To-Be-Done/segmentation.md) and [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)). The two criteria are sequential (§2), not alternative — ABCDX answers *which customers to focus on;* the Job-Graph clustering inside A/B answers *which Jobs to compete on for them.* The output of the two-step sequence is the team's **focus segment(s)** — that is the actual end-state the work is reaching for; A/B was just the cohort that got the team to a non-noise signal fast.

**The flow:**

1. **ABCDX** → produce the A/B cohort and the causal segmentation criteria that define it (§8).
2. **AJTBD interviews** ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) on 15–25 A/B customers → surface the Core Jobs they hire the product for, the success criteria they evaluate it against, the Big Jobs above, the barriers they overcame, the Aha Moment that activated them.
3. **Cluster the interviews into segments inside A/B** — groups of A/B customers performing similar Core Jobs with similar success criteria.
4. **Pick the focus segment(s).** Rebuild communication, funnels, content, ads, sales scripts, landing pages, and onboarding around them.

**What this surfaces:**

- The **Core Jobs** A/B customers actually hire the product for (often different from what the team thought).
- The **success criteria** they evaluate against — the operational spec for value-design ([Value Creation §9](../Advanced-Jobs-To-Be-Done/value-creation.md)).
- The **Big Jobs** above — where communication and motivation hooks live ([Value Creation §15](../Advanced-Jobs-To-Be-Done/value-creation.md)).
- The **barriers** A/B customers overcame and the **Aha Moment** that converted them — both are templates for engineering activation for the next cohort.

**Two research designs depending on the team's question:**

- **Acquisition-focused.** Map the Critical Chain ([Critical Chain §11](../Advanced-Jobs-To-Be-Done/critical-chain.md)) from the moment the Big Job appears in the customer's head to the moment they hire the Solution. Surfaces where Consideration Activators loads, where competitors enter the Consideration Set, where receptivity windows fire ([Behaviour Change §8](../Advanced-Jobs-To-Be-Done/behaviour-change.md)).
- **Activation-and-value-focused.** Map the Critical Chain of Micro Jobs leading to the Core Job. Surfaces where the chain breaks ([Critical Chain §2](../Advanced-Jobs-To-Be-Done/critical-chain.md)), where the Aha Moment could fire earlier ([Value Creation §12](../Advanced-Jobs-To-Be-Done/value-creation.md)), where micro-Problems accumulate ([Critical Chain §5](../Advanced-Jobs-To-Be-Done/critical-chain.md)).

**Operational consequences:**

- **ABCDX without AJTBD-on-A/B is half the move.** ABCDX tells you the customers; AJTBD tells you the Jobs. Operational moves at the Job level (value design, messaging, channel choice) require the second layer.
- **AJTBD without ABCDX risks chasing a segment that doesn't pay.** A segment with strong Core Jobs but C/D-level unit economics is a global-optimum bet, not a local-optimum scaling opportunity.

---

## 6. Local optimum vs global optimum — ABCDX is the local one; choose deliberately, do not drift

Every product investment routes — at the most basic level — into one of two classes:

- **Local optimum.** Optimize what already works. Hold **Core Jobs and business model** constant; tune funnel conversion, activation, retention, expansion, and value-delivery for the customers already paying. The segment the company serves *narrows* through the work — firing C/D, refocusing on A/B — but the Core Jobs the product performs and the way it makes money don't change. **Lower-risk hypotheses** — every link of the [RAT chain](../Riskiest-Assumption-Test/rat-key-theses.md) (segments-and-Jobs, value, unit economics, channels) is validated for these customers by their past payment. **Bounded return** — capped by the current A/B segment's size and the value-creation headroom inside it. **Delegated to less senior staff** — feature work, conversion-rate optimization, support automation, lead qualification.
- **Global optimum.** Re-bet one or more links of the RAT chain. Enter a new segment, climb to a higher-level Core Job ([Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md)), change the business model, expand to a new country. **Higher-risk hypotheses** — every link being re-bet is a place the initiative can die. **Larger return ceiling** — potentially a 10× larger segment, a different unit-economics curve, a market only you can reach. **Delegated to the most senior staff** — the founders, the highest-judgment people on the team.

**ABCDX is the canonical local-optimum entry point.** It accepts the segment-Job-product triple as given and asks the narrower question: *of the customers performing that triple today, which deserve the team's next dollar?* The X class (§4) is the methodology's pointer *out* of the local optimum — it is what the team sees first when scouting global-optimum bets.

**Operational consequences:**

- **Local-optimum work is fine — *if you know it is local-optimum work.*** The failure mode is not running local optimum; it is running local optimum while believing it is the highest-leverage option available, when in fact a global-optimum move (new segment, higher Core Job, new business model) would return 10× more for the same six months. *Name the choice.* The default mental mode is *"we're working on what's in front of us;"* the correct mental mode is *"we picked local because we explicitly considered global and chose otherwise."*

---

## 7. ABCDX is product-specific — the same customer is A for one product and D for another

**ABCDX is segmentation through the lens of one specific product at one specific moment in time.** Move to a different product — even one serving the same Big Job — and the same human being can flip from A to D or vice versa. This is the property that makes ABCDX non-obvious: the team's intuition is that *"high-margin customer"* is a property of the customer, when it is actually a property of *the customer × this product.*

**Worked example — Worker.ru → Mail.ru (~2018, blue-collar gig hiring).** A mobile app where candidates apply for low-skilled jobs — couriers, fast-food cooks, taxi drivers — and Worker.ru collects a fee each time a hired candidate shows up to a shift. The team's initial hypothesis: *"A = university students, easy to acquire, digitally native, motivated."* ABCDX analysis inverted the hypothesis. **A turned out to be local working-class candidates ("пацанчики").** The reason: a working-class candidate stays inside the platform's pay range (US analog: $20–80K annual, below typical [Indeed](https://www.indeed.com) white-collar reach) for years — earning $45K today, $45K next year, $50K two years from now — and remains relevant to Worker.ru's job listings shift after shift. A student earning $45K today is at $55K next year and $65K the year after; **they exit the price range within ~24 months.** *Same person, different products: a student is D for Worker.ru and A for a tech-internship marketplace like the [Handshake](https://joinhandshake.com); a working-class candidate is the inverse.* (Worker.ru was acquired by Mail.ru; US-equivalent operational shape: [Wonolo](https://www.wonolo.com) or [Snagajob](https://www.snagajob.com).)

**Three further illustrations of the same property:**

- **Custom-millwork shop (laminate cutting, Sveta Ayupova case).** An Italian-machine shop cutting an unusual laminate grade. **A = local interior-design studios** who learned the material, ordered correctly, produced minimal re-cuts. **C/D = walk-in homeowners** who ordered incorrectly, forced re-cuts, ate the shop's margin. Same product, same material — design studios are A, homeowners are D. (US analog: a custom kitchen-cabinet shop where contractors are A and DIY homeowners are D.)
- **Boutique HR-consulting practice (Anastasia Gusentsova case).** Three high-margin paying customers in a 6-figure consulting practice. Identifying them as the A pattern (executive-search clients with $450K/month budgets, not the $150K-range mid-market clients) and shifting the offer toward them produced **+60% revenue in 3–4 months.** Same consultant, same delivery method — *the choice of which client to chase was the entire delta.*
- **Specialty dental practice (Pavel Gryaznits case).** ABCDX analysis on a dental-clinic patient base. **A = full-mouth restoration / capital reconstruction patients,** not single-procedure walk-ins. Focusing acquisition and the practice's clinical positioning on the A segment produced **+40% conversion and +37% revenue.** (US analog: an aesthetic-dentistry practice positioned on full-mouth implants vs. routine fillings.)

**Operational consequences:**

- **Do not import ABCDX from a peer company in the same category.** Two competitors with similar products can have inverted A/D assignments because they serve subtly different Core Jobs (Worker.ru's ranges produce *"locals = A";* a tech-internship platform's ranges produce *"students = A"*). **The team must run ABCDX on its own base.**
- **Universal markers cut across industries — but only at the *property* level, not the *demographic* level.** *"Customers with high SKU count"* may be A for one analytics platform and D for another (one platform handles 50K SKUs; the other crashes above 5K). The cut is *whether-our-product-fits-their-shape,* not industry or company size.

---

## 8. Causal segmentation criteria are causes — fake segmentation criteria are symptoms

**One of the hardest disciplines in any segmentation work — not just inside ABCDX — is separating *cause* from *symptom.*** The mistake repeats at every level of the methodology: in ABCDX (*what makes this customer high-margin and satisfied?*), in Job-Graph clustering inside A/B (*what makes these customers share the same Core Jobs?*), in full market research (*why does this segment behave this way?*). Same question, same trap, same answer: the criterion has to be a property of the person and their situation that *causes* the observed behavior — not a description of the behavior itself.

**And not any cause is a causal segmentation criterion.** A causal segmentation criterion is a criterion thanks to which we know how to create added value, earn target per-unit margin, or create demand:

- **Can we create added value for them?** Does this criterion point at people whose Core Jobs our product can perform with a positive prediction error against their existing alternatives ([Value Creation §4](../Advanced-Jobs-To-Be-Done/value-creation.md))?
- **Can we serve them at our target per-unit margin?** Does this criterion correlate with willingness-to-pay, deal size, support cost, and acquisition cost in a way that closes unit economics ([Riskiest Assumption Test §1](../Riskiest-Assumption-Test/rat-key-theses.md))?
- **Can we create or capture demand from them?** Does this criterion describe people who are reachable through some channel — already searching for the Job, or activate-able through Consideration Activators ([Behaviour Change §4](../Advanced-Jobs-To-Be-Done/behaviour-change.md))?

Without those three predictions, a candidate criterion may be a true cause of some behavior, but it isn't a causal segmentation criterion — it doesn't tell the team whether to compete for this person or not. **Fake segmentation criteria create a false feeling of understanding: the segment sounds named, but the team still does not know how to create value, close margin, or create demand.**

Inside ABCDX specifically: once A is identified, the question is *what about this person makes them satisfied, high-margin, reachable, and ready to receive added value from us?* The answer should be a property of the person and their situation — not a description of the outcome.

- ❌ **Fake segmentation criteria — symptoms** — *"spent over $1,000 in the first 6 months,"* *"placed more than 2 orders,"* *"filed zero complaints,"* *"NPS ≥ 9."* These describe A, B, C, D in different words. They do not tell the team *what to look for in a new prospect* before that prospect has accumulated outcomes.
- ✅ **Causal segmentation criteria — causes** — *"willing to delegate the whole project end-to-end,"* *"has a renovation budget of $100K+ per 1,000 sq ft,"* *"this is their 2nd or 3rd home, not their first,"* *"lives in a different city from the project — time matters more than money,"* *"expected revenue from the project ≥ $1M, so the service fee is rounding error against the prize."*

**Worked example — Valentine's interior-design studio.** ABCDX criteria as causes, not symptoms:

- **A.** Out-of-town investors with $100K+ /1,000 sq ft budgets, willing to delegate the entire project, **time is more expensive than money.**
- **B.** Local buyers, prior experience with renovation, housing for themselves or family, smaller budget.
- **C.** Want to do everything themselves, willing to invest a lot of time, this is the only home they own.
- **D.** First-ever renovation, unrealistic budget expectations, low income.

**Hidden-factor criteria — the ones the team almost always misses on first pass:** anxiety level, confidence in DIY, presence of a deadline (a course launching, a tenant moving in, a wedding), expected revenue from the project, prior bad experience with a competitor's category. **Budget thresholds often anchor the criterion** — *"expected revenue from the course is $1M+"* — because the $1M figure is what the customer is willing to *carve a service fee out of.* The criterion is not *"high revenue"* (a symptom) but *"a specific number above which the segment treats your fee as rounding error"* (the cause).

**Operational consequences — causal segmentation criteria yield qualification questions:**

- Once A's causes are named, they convert directly into **4–5 inbound qualification questions** that route a lead into the right cell within minutes: *"Is this your first home? Have you been through a renovation before? What's your budget per 1,000 sq ft? What matters more — time or money?"*
- **Concrete cutoffs at the funnel mouth** — *"Fewer than 5,000 SKUs — we're not a fit; over 5,000 — handing you to a sales rep."* The cutoff is the operationalized causal segmentation criterion (the product can handle high-SKU complexity); the conversation length drops from 30 minutes to 30 seconds.
- **Symptom-criteria fail the new-prospect test** by definition — a new lead has zero past orders and zero past complaints; symptom-criteria cannot route them. Causal segmentation criteria, asked as one or two questions, route them in the first 60 seconds of contact.

---

## 9. ABCDX needs enough paying customers to produce a non-noise signal — the threshold is driven by base heterogeneity and margin-distribution shape, not by B2B / B2C

**ABCDX becomes operational when A contains a *pattern* — a property shared by ≥10–15 customers — not three individual outliers.** The B2B / B2C cut is a poor predictor of where the threshold sits. What actually drives it: **(1) the *heterogeneity* of the paying base** (one tight ICP, or many industries / use-cases / deal sizes?) and **(2) the *shape of the per-unit margin distribution*** (narrow band, or long-tailed with whales?).

**The working logic — described, not formularized.** To recognize a causal segmentation criterion in A, the team needs ~10–15 customers carrying it. A is typically 10–25% of the paying base — sometimes as low as 2–5% in whale-shaped distributions. If A spans several latent sub-clusters (different industries, very different deal sizes, multiple use-cases), each cluster needs its own ~10–15 — multiplying the threshold. **For a tight homogeneous base with a single cluster: ~50–80 paying customers is enough. For a heterogeneous enterprise base with whales and multiple sub-clusters: 500+ before A stabilizes.** The real-world spread is ~10×, structural — not B2B / B2C.

**Four anchoring archetypes, spanning the behavioral regimes:**

- **Tight-ICP B2B SaaS** ([Stripe](https://www.stripe.com) ~2011, narrow SMB online-business segment). Homogeneous ICP, moderate margin spread, single-cluster A. *Non-noise ABCDX at **30–60 paying customers**.*
- **Enterprise B2B with whales** ([Salesforce](https://www.salesforce.com)-shape: industries, ACV $50K–$5M, multiple use-cases). High heterogeneity × long-tailed margin × multiple sub-clusters. *Non-noise ABCDX at **150–300 paying accounts**.*
- **High-ticket B2C with bimodal context** (specialty dental — Pavel Gryaznits — and boutique interior design — Valentine; both §7). Bimodal customer-shape makes A jump out fast even at moderate base size. *Non-noise ABCDX at **40–80 paying customers**.*
- **Boutique B2B services** (Anastasia Gusentsova's HR-consulting, ad agencies, fractional-CFO firms). Whale-shaped margin where A may be 2–5 customers total. *Below the recognition threshold — but bimodality can still be readable; treat A as a **hypothesis** and go find more matches.*

**Operational consequences:**

- **Estimate your archetype before reaching for a threshold number.** A team that copy-pastes a *"30 for B2B"* or *"200 for B2C"* rule will either run ABCDX too early on a noisy base or wait too long while obvious patterns are visible. The four archetypes above are anchors — match your business to the closest one and adjust from there.
- **Below the threshold, ABCDX is a hypothesis — not a finished segmentation.** Treat the visible A pattern as a recruiting criterion for finding more matching customers before reallocating resources.
- **Truly below threshold *and* no readable causal segmentation criterion → you are searching for a segment from scratch**, not running ABCDX ([Riskiest Assumption Test §2](../Riskiest-Assumption-Test/rat-key-theses.md)). Don't pretend you have product-market fit on a handful of customers; the search is structurally different (global-optimum work, §6) and routes through interviews of *people who paid competitors,* not your own three customers. **For new products, criterion #1 is Job-Graph similarity, not ABCDX** — see §2.

---

## 10. Two ABCDXs for marketplaces, intermediaries, and brokerages — supply and demand are separate segmentation problems

**Any business that connects two sides** — a marketplace, a payment platform, an agency, a brokerage, a recruiter — runs **two ABCDXs, one per side.** The two segmentations are independent operationally:

- ABCDX on **demand-side** customers (buyers, employers, riders, patients).
- ABCDX on **supply-side** customers (sellers, candidates, drivers, providers).

**The strategic question: which A-on-side-one serves which A-on-side-two most efficiently?** A demand A-segment with criteria the supply A-segment cannot meet produces friction at every transaction. Worker.ru's A on the candidate side (working-class candidates with stable price-range positioning) maps efficiently to its A on the employer side (high-volume employers — fast-food chains, taxi fleets — who need stable wage-band hiring). [Uber](https://www.uber.com) Comfort's A on the rider side (quiet-cabin, recent-model-car preference) maps to drivers with newer cars and lower-friction service. [Airbnb](https://www.airbnb.com)'s A on the guest side (multi-night, family-or-couple travel) maps to hosts with full apartments rather than single rooms.

**Where to start — at the scarcer side of the Critical Chain.** Run the demand-side ABCDX first when supply is abundant and demand is the constraint; run the supply-side ABCDX first when supply is scarce and demand is queuing. (See [Critical Chain §9](../Advanced-Jobs-To-Be-Done/critical-chain.md) on the slowest-link diagnostic — the same logic applies here.)

**Operational consequences:**

- **A non-overlap between demand-A and supply-A means the marketplace doesn't actually clear at its profitable point.** The team has two profitable cohorts that don't transact with each other; the actual transactions cluster at the C/D × C/D intersection. *That is a structural defect, not an acquisition problem.*
- **Pricing and matching algorithms route through the two ABCDXs.** A take-rate, a default-match suggestion, a sort order on a search result — each is an operational lever that should preferentially route demand-A to supply-A.

---

## 11. ABCDX is valid only while the current Core Jobs and business model hold — re-run when either changes, or annually as a floor

**ABCDX is segmentation against a *fixed* product configuration.** Change any of the inputs that define the configuration and the segmentation must be redone. Three categories of triggers force a re-run:

- **You change the Core Jobs the product performs.** Add a new Core Job ([Value Creation §17](../Advanced-Jobs-To-Be-Done/value-creation.md)), drop one, climb a level ([Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md)), absorb a Previous or Next Job in the chain ([Critical Chain §13](../Advanced-Jobs-To-Be-Done/critical-chain.md)) — the ABCDX assignment shifts because customers who were C/D for the old Core Jobs may be A/B for the new ones (and vice versa). **The re-run is mandatory; the old segmentation is no longer load-bearing.**
- **You change the business model.** Pricing, contract structure, distribution, packaging — each can flip a profitable cohort to unprofitable and vice versa. A C-segment may become B at a different price point; an A-segment may become D when the contract structure shifts the operational cost.
- **The macro environment shifts.** Pandemics, AI commoditization, rate cycles, regulatory change — all rewrite customer behavior beneath the segmentation. **Refresh at least annually** as a default floor; semi-annually in disrupted categories.

Three shocks of the last five years that visibly reshuffled ABCDXs across the canon's case base:

- **Pandemic (2020–2022).** Remote work shifted which job-roles bought B2B SaaS; which households bought home goods; which travelers booked which platforms. Every B2C category with a *commute* in the Job Graph saw segment re-assignment.
- **AI commoditization of knowledge-work tooling (2023–2025).** Categories where the Core Job was *"write a first draft"* or *"summarize this document"* or *"answer customer questions"* saw segment-A re-assignment driven by which customers adopted AI tooling fastest.
- **Rising rates / unit-economics re-pricing (2022–2024).** Customers who looked A on revenue alone became C on margin once CAC was re-baselined at higher rates.

**Operational consequences:**

- **Schedule the refresh.** A standing annual ABCDX review keeps the segmentation honest. In disrupted categories, run it semi-annually.
- **The refresh is cheap.** Rerun the per-unit-margin ranking from CRM over a fresh time window; interview ~15–20 new A and B customers; check whether the causal segmentation criteria from last year still describe this year's A. The whole pass takes 2–4 weeks at most.

---

## 12. How to run ABCDX — the procedure

A working procedure that produces an operationalizable ABCDX in roughly 2–4 weeks:

1. **Pull the paying base over a defined time window.** Pick 6, 9, or 12 months — not lifetime. Lifetime cumulative biases toward the oldest cohort and obscures the *current* segmentation signal.
2. **Rank by per-unit margin.** Margin per unit = revenue per unit − variable cost to serve − attributed acquisition cost. If your analytics can attribute the inputs cleanly, do it from data. If not, do it expertly — sales leads and support leads together can rank customers from memory (*"this one is hard, this one is easy, this one pays late, this one upsells himself"*) with surprising accuracy.
3. **Cross-rank by satisfaction.** NPS, CSAT, retention, repeat purchase, referral activity, support ticket volume, product-usage cadence. As with margin: prefer data when available, expert judgment when not.
4. **Cluster into 2 or 4 groups.** Two-group form (A/B vs C/D) is easier on small bases; four-group form (A vs B vs C vs D) adds resolution on larger ones.
5. **Tag the X class.** Pull the cohorts that *touched* the product but don't fit A/B/C/D — bounced visitors, refunded purchasers, off-label users (§4). They are not part of the A/B/C/D ranking; they are a separate list for global-optimum scouting.
6. **Find the causal segmentation criteria for each group** (§8). Look for shared properties of the *people and their situation* — context, prior experience, budget structure, role, what they hire the product *for.* If expert pattern-matching fails, run **AJTBD interviews** ([AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md)) with 5–10 customers from each cell.
7. **Translate causal segmentation criteria into 4–5 inbound qualification questions** (§8). These are what the funnel uses operationally.
8. **Inside A/B, run the second segmentation criterion — Job-Graph similarity** (§5). AJTBD interviews on 15–25 A/B customers; cluster into segments by Core Jobs and success criteria; pick the focus segment.
9. **Build the operational allocation.** Channels, sales-rep tiers, onboarding flow, support tier, pricing — all biased toward A/B; C/D routed to self-serve, automation, or a polite *"we're not the right fit;"* X kept under observation as a global-optimum scouting surface.

**Operational consequences:**

- **Step 1's window choice matters more than teams expect.** A 3-month window misses repeat-purchase patterns; a lifetime window over-weights early customers. **6–12 months is the working default;** category cycle-length should adjust it (annual-purchase categories need 18–24 months; weekly-purchase categories work fine at 3–6).
- **The team's instinct will fight Step 6.** Saying *"this customer is unprofitable"* sounds like saying *"this customer is bad."* It isn't — it's saying *the product-customer fit is wrong;* the customer is fine for some other product. Reframe the conversation at the start so the team doesn't read the segmentation as moral judgment.
- **Step 9 is where most ABCDX initiatives stall.** Identifying A is easy; deliberately routing C/D away — turning down inbound leads, raising prices on a current cohort, automating support down to chat-bot only — is operationally and emotionally hard. **The segmentation is worthless without the allocation move that follows it.**

---

## 13. After ABCDX — focus A/B, fire C/D, qualify inbound; understand that C/D will not become A/B *for this product*

The strategy that follows from a completed ABCDX:

- **Identify the causal segmentation criteria of A and B** (§8 and §12 step 6).
- **Tune acquisition, sales, and product to the A/B causal segmentation criteria.** Channels, creative, sales scripts, onboarding flow, pricing — all biased toward who is A and B.
- **Stop using C and D feedback for product decisions.** This is one of the highest-leverage product moves a team can make. C and D, by definition, are not the customers the product is for; their feature requests, complaints, and review patterns systematically pull the product *away* from A and B fit.
- **Actively fire C and D.** Three operational mechanics:
  - **Decline inbound at the funnel mouth.** *"Fewer than 5,000 SKUs — we're not the right fit. Have you looked at [competitor]?"* The qualification questions from §8 produce the routing rule.
  - **Automate down to zero marginal cost.** [Chase](https://www.chase.com) routes mass-market retail-banking customers to the ATM, the mobile app, and the chat-bot — preserving relationship-banking for higher-margin clients. Same operational logic at any scale: route the customer to a self-serve tier where the marginal cost of serving them is near-zero.
  - **Raise the price.** Some C/D customers become B at a higher price point (because their unit-margin closes); the rest leave on their own.

**The structural reason C/D will not become A/B *on this product*.** **C and D are not unprofitable because the product underperforms for them — they are unprofitable because the product's Core Jobs do not match their Core Jobs.** Build a better C/D experience and they remain C/D, because the structural mismatch is *what kind of work the product was built to do.* The thought experiment: *"if I built a hypothetically perfect version of my product, would these customers become profitable?"* For real C/D customers the answer is no — the limit is set by their context (the Job isn't important enough for them, the budget is too small, the criteria are too different), not by the product's quality. *A custom-millwork shop's homeowner is not going to renovate 20 apartments per month; a working-class candidate's career is not going to follow the same wage trajectory as a tech worker's.*

**The C/D → A/B re-route via a *different product*.** A team that has a large C/D cohort can sometimes build *a different product* (different Core Jobs, different business model, sometimes different brand) for which those C/D customers become A/B. **That move is not local-optimum work; it is global-optimum work** (§6) — and most teams should not pursue it concurrent with the ABCDX allocation move, because it consumes the senior-leadership bandwidth the global-optimum bet requires. The X class (§4) is usually a better starting point for the global-optimum bet than C/D, because X customers chose to engage despite the misfit — they have stronger pull on the new Core Job than C/D do.

---

## 14. The Sean Ellis test — single-axis satisfaction segmentation; why ABCDX beats it

A widely-used adjacent technique: the **Sean Ellis test** (~[2015](https://review.firstround.com/the-only-metric-that-matters/)), which segments customers by their answer to *"How would you feel if you could no longer use this product?"* Ellis observed that products at product-market fit have ≥40% of users answering *"very disappointed."* The test gives a single-number readout of category-fit, calibrated against an empirical benchmark.

**Worked refinement — Superhuman (Rahul Vohra, ~[2018](https://review.firstround.com/how-superhuman-built-an-engine-to-find-product-market-fit/)).** Vohra ran the Ellis survey on Superhuman's first ~2,000 beta-testers — *"very disappointed"* came in at **22%**, below the 40% benchmark. He segmented respondents by role; founders and senior leaders without engineering teams hit **32%**. Re-running the test on that role-subset alone, then asking the *somewhat-disappointed* cohort what they would need to upgrade to *very-disappointed* — and shipping those features — got Superhuman to **40%+ within a year.**

**Where the Sean Ellis test is strong:** it produces a single calibrated number against a published benchmark; it surfaces *which roles or use-cases* feel the product is irreplaceable; the *"what would convert you to very-disappointed"* follow-up is a low-cost source of feature ideas.

**Where ABCDX beats the Sean Ellis test — and why ABCDX is the default in this methodology:**

- **ABCDX measures both *satisfaction* and *unit-economic profitability;* the Sean Ellis test measures only satisfaction.** A cohort that says *"very disappointed if it disappeared"* but loses money per unit is *not the segment to scale on* — the more they love you, the faster you burn capital.
- **ABCDX distinguishes A from B as a *resource-allocation* signal; the Ellis test does not.** Once a Sean Ellis cohort is identified, the team still has to decide who inside it is high-margin and who isn't.
- **Vohra's follow-up move — *"what would convert you to very-disappointed?"* — collects feature requests from satisfied customers, not Job-and-criteria diagnostics.** This is value-creation work *delegated to the customer,* which is brittle (see [Value Creation §1, Problem 2](../Advanced-Jobs-To-Be-Done/value-creation.md)). It happened to work for Superhuman partly because the customer base was unusually self-aware; the move generalizes poorly.

**Combined use is acceptable** — run ABCDX as the primary segmentation, layer the Sean Ellis test on top inside the A/B cohort to surface *which* A/B subset feels the product is irreplaceable. The Ellis-test readout then guides communication and growth-loop work, while ABCDX continues to drive resource allocation.

---

## 15. Local and global in parallel — not "either/or"; allocate by seniority and risk tolerance

A common reading: *"local optimum is for mature products; global optimum is for early-stage products."* **The reading is wrong.** Most product organizations should be running **both at once** — with different seniority allocations and different risk budgets.

- **Local-optimum work runs continuously.** ABCDX-driven feature work, conversion-rate work, activation work for the current A/B. *Less senior staff; quarterly cadence; bounded return; high success rate; small per-bet downside.*
- **Global-optimum bets run in parallel.** A small senior team studies adjacent segments, climbs the Job Graph to higher-level Big Jobs, prototypes a new business model, mines the X class (§4) for the next product. *Most senior staff; multi-quarter cadence; outsized return when it lands; lower success rate; larger per-bet downside.*

The structure mirrors §2 and §8 of [Riskiest Assumption Test](../Riskiest-Assumption-Test/rat-key-theses.md): expensive-consequence high-risk-of-being-wrong assumptions go to senior people; cheap-consequence low-risk assumptions go to junior. ABCDX-driven work is the latter; new-segment / higher-Core-Job / new-market work is the former.

---

## Cross-references

- [Riskiest Assumption Test §1–§2](../Riskiest-Assumption-Test/rat-key-theses.md) — the chain of risky assumptions; segments-and-Jobs as the root
- [Riskiest Assumption Test §8](../Riskiest-Assumption-Test/rat-key-theses.md) — the RAT formula and delegation by risk level
- [Value Creation §10](../Advanced-Jobs-To-Be-Done/value-creation.md) — criteria-priority orders as the segmentation root
- [Value Creation §11](../Advanced-Jobs-To-Be-Done/value-creation.md) — mapping segment criteria to mechanics
- [Value Creation §12](../Advanced-Jobs-To-Be-Done/value-creation.md) — the Aha Moment as the engineered first Aha Moment
- [Value Creation §14.1](../Advanced-Jobs-To-Be-Done/value-creation.md) — move-up-a-level as the structural response to C/D customers
- [Value Creation §17](../Advanced-Jobs-To-Be-Done/value-creation.md) — value lives outside your current Core Jobs (the X-class pointer)
- [Critical Chain §13](../Advanced-Jobs-To-Be-Done/critical-chain.md) — Previous-Job and Next-Job strategy
- [Critical Chain §11](../Advanced-Jobs-To-Be-Done/critical-chain.md) — interview protocol for surfacing the Critical Chain
- [Critical Chain §4](../Advanced-Jobs-To-Be-Done/critical-chain.md) — Solution-switch interpretation of drop-off; *hard vs. not-important-enough* diagnostic in [Barrier Removal](../Advanced-Jobs-To-Be-Done/barrier-removal.md) and [AJTBD key theses §15](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md)
- [Behaviour Change §8](../Advanced-Jobs-To-Be-Done/behaviour-change.md) — receptivity windows and triggers
- [AJTBD interview guide](../HowTos/basic-ajtbd-interview-guide-and-principles.md) — AJTBD interview guide
- [AJTBD key theses §12](../Advanced-Jobs-To-Be-Done/ajtbd-key-theses.md) — segmentation by Core Jobs and success criteria as primary; Big Job as motivation refinement

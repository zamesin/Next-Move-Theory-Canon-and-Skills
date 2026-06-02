---
name: product-requirements
description: Generate product requirements (PRD) through segment analysis, risks, and competitors using a team of 6 agents. Use when you need to turn a product idea into a full requirements package — PRD, analytics plan, landing copy, marketing hypotheses, unit economics. Built on Ivan Zamesin's AJTBD/Next Move Theory methodology — distinct from canonical Christensen JTBD.
user-invocable: true
---

# Product Requirements (PRD) v3 — English / US edition

Turns a product idea into a full product package via this fast process:
1. Collect idea and settings (1 question round)
2. Collect business context (2 rounds of 4 questions)
3. Auto-generate: Next Move Theory recommendations + segments (~80% market coverage) + risks
4. User confirmation (1 round)
5. Run a team of 6 agents with cross-verification

**Speed principle:** questions are batched (up to 4 at a time), not asked one at a time. Total of 4-5 user touchpoints before agents kick off.

**Output — a folder with 5 files:**
- `01-prd.md` — product requirements + edge cases
- `02-analytics-plan.md` — analytics system with event code
- `03-landing-copy.md` — full landing copy per Next Move Theory
- `04-marketing-hypotheses.md` — marketing hypotheses + cross-sell / upsell / retention
- `05-unit-economics.md` — unit economics model

---

## Core methodological principle

**Source of truth — `Next-Move-Theory-Canon/` in the project root.** Do NOT use generic interpretations of Jobs To Be Done from the internet or the LLM's prior training. Ivan Zamesin's methodology diverges substantially from those. See `CLAUDE.md` in the project root.

Methodological invariants this skill **must** enforce:
- **Every feature must link Core Job → Big Job** (a feature with no declared Big Job is invalid)
- **Aha Moment is a positive prediction error event**, not signup, not login, not "first action"
- **Critical Chain of Jobs is explicitly constructed per Core Job** (not just listed sequence)
- **No feature dilution** — every feature serves the focal segment or is explicitly marked as later-phase
- **Big Job consistency** — Big Job stated in the landing must match the Big Job in the PRD
- **Competitors at Big Job level** — non-obvious competitors (other ways to close the Big Job) must be present, not just direct Core Job competitors

---

## Anti-Compaction protocol (context preservation)

All intermediate results saved to disk to survive context compaction.

**Temp folder:** `TMP/prd-{short-product-name}/`

| File | When saved | Contents |
|------|------------|----------|
| `00-product-idea.md` | After STAGE 0 | Product idea + language + analytics tool |
| `01-business-context.md` | After STAGE 1 | Full business context + chosen Next Move Theory variant |
| `02-segments.md` | After STAGE 2 | ALL generated segments + which were selected |
| `03-risks.md` | After STAGE 2 | Ranked risks + which were selected |
| `04-competitors.md` | After Agent 1 | Competitor analysis + their feature set |
| `05-prd.md` | After Agent 2 | Product requirements |
| `06-edge-cases.md` | After Agent 3 | Edge cases |
| `07-analytics-plan.md` | After Agent 4 | Analytics plan with event code |
| `08-landing-copy.md` | After Agent 5 | Landing copy + marketing hypotheses + growth mechanics |
| `09-cross-verify.md` | After Agent 6 | Cross-check of all documents |
| `_spring-context.md` | After every stage | Current state summary for restoration |

**Rules:**
- After completing each stage — save the result to the corresponding file via `Write`
- Before starting each stage — read `_spring-context.md` to restore context
- Update `_spring-context.md` after every stage: current stage, key decisions, what's done, what's next
- `_spring-context.md` must always include `language` and `analytics_tool` fields

---

## STAGE 0: Idea and settings

Ask all 3 questions in ONE `AskUserQuestion` call:

```
AskUserQuestion:
  questions:
    - question: "Output language for all documents?"
      header: "Language"
      options:
        - label: "English"
          description: "All documents in English (default)"
        - label: "Русский"
          description: "Все документы на русском"
        - label: "Other"
          description: "Skill will ask which one"
      multiSelect: false

    - question: "Which analytics tool to generate event code for?"
      header: "Analytics"
      options:
        - label: "PostHog (recommended)"
          description: "Open-source, popular in startups"
        - label: "Amplitude"
          description: "Enterprise-grade product analytics"
        - label: "Mixpanel"
          description: "Event-based analytics"
        - label: "Skip analytics"
          description: "Skip analytics plan generation"
      multiSelect: false

    - question: "How will you describe the product idea?"
      header: "Idea"
      options:
        - label: "I'll describe in text"
          description: "Free-form description"
        - label: "I have a website / landing URL"
          description: "I'll give a link, you'll explore"
      multiSelect: false
```

After the user replies — ask for the idea description (or the URL). If a URL — use `WebFetch` to study the site.

**Save** to `00-product-idea.md`:

```markdown
# Product idea

## Settings
- **Language:** {chosen language}
- **Analytics:** {chosen tool}

## Description
{user description}
```

Update `_spring-context.md`.

---

## STAGE 1: Business context

8 questions in 2 batches of 4. The user can answer "don't know" — that's fine, we'll use assumptions.

### Batch 1: Business and monetization

```
AskUserQuestion:
  questions:
    - question: "Why are you building this? What business job are you solving?"
      header: "Business job"
      options:
        - label: "Launch a new product"
          description: "Building from scratch, need to find PMF"
        - label: "Grow an existing product"
          description: "Want to grow revenue / users"
        - label: "New feature in an existing product"
          description: "Adding capability to a working product"
        - label: "Expand to a new segment / market"
          description: "Reaching a new audience or geography"
      multiSelect: false

    - question: "Product type?"
      header: "Type"
      options:
        - label: "Landing / sales page"
          description: "Single page for sales or lead gen"
        - label: "SaaS / web app"
          description: "Service with signup and subscription"
        - label: "Mobile app"
          description: "iOS / Android"
        - label: "Online course / educational product"
          description: "Course, training, intensive"
      multiSelect: false

    - question: "Monetization?"
      header: "Monetization"
      options:
        - label: "Subscription (SaaS / recurring)"
          description: "Monthly / yearly billing"
        - label: "One-time purchase"
          description: "Course, license, fixed-price product"
        - label: "Freemium → paid conversion"
          description: "Free entry, paid features"
        - label: "Lead generation"
          description: "Free product, monetize via sales"
      multiSelect: false

    - question: "Constraints? (team, budget, deadline)"
      header: "Constraints"
      options:
        - label: "Solo / vibe-coding"
          description: "One person, no-code or AI-coding"
        - label: "Small team (1-3 people)"
          description: "Few people, limited resources"
        - label: "Team and budget"
          description: "I'll describe"
        - label: "Skip"
          description: "Don't constrain scope"
      multiSelect: false
```

### Batch 2: Context and channels

```
AskUserQuestion:
  questions:
    - question: "Do you have data already? (customers, interviews, sales, traffic)"
      header: "Data"
      options:
        - label: "No — idea on paper"
          description: "Pure hypothesis, no data"
        - label: "I've done interviews"
          description: "Insights from customer conversations"
        - label: "Early users / first sales"
          description: "Some traction, but small"
        - label: "Live product with traffic"
          description: "Product is live, analytics exist"
      multiSelect: false

    - question: "When do you need the first working result?"
      header: "Horizon"
      options:
        - label: "< 2 weeks"
          description: "Need it yesterday, fast MVP"
        - label: "1-2 months"
          description: "Time for proper development"
        - label: "3-6 months"
          description: "Strategic product, build it solidly"
        - label: "6+ months"
          description: "Long-term project"
      multiSelect: false

    - question: "Where will you acquire customers?"
      header: "Channels"
      options:
        - label: "SEO / content marketing"
          description: "Organic traffic via content"
        - label: "Paid ads"
          description: "Performance marketing"
        - label: "Community / word of mouth / social"
          description: "Organic via community"
        - label: "Sales / outbound"
          description: "Direct sales, cold outreach"
      multiSelect: false

    - question: "What competitors do you already know? How do people solve the Job today?"
      header: "Competitors"
      options:
        - label: "I know direct competitors"
          description: "I'll name specific products"
        - label: "I see indirect competitors"
          description: "People solve the Job other ways"
        - label: "Don't know any"
          description: "Help me find them"
      multiSelect: false
```

**If the user answers "don't know"** — that's fine. Capture what's known and what isn't. Missing pieces will be generated later.

**Save** to `01-business-context.md`:

```markdown
# Business context

## Batch 1: Business and monetization
- **Business job:** {answer}
- **Product type:** {answer}
- **Monetization:** {answer}
- **Constraints:** {answer}

## Batch 2: Context and channels
- **Data / traction:** {answer}
- **Horizon:** {answer}
- **Channels:** {answer}
- **Competitors (known):** {answer}
```

Update `_spring-context.md`.

---

## STAGE 2: Auto-generate (Next Move Theory + segments + risks)

This stage runs WITHOUT user questions. Generate everything based on the idea and business context.

### Step 2.1: Next Move Theory recommendations for the business goal

Read the canon:
- `Next-Move-Theory-Canon/Next Move Theory/overview.md` — meta-framework
- `Next-Move-Theory-Canon/Next Move Theory/product-strategy.md` — product strategy
- `Next-Move-Theory-Canon/Algorithms/the-algorithm.md` — main algorithm
- `Next-Move-Theory-Canon/Algorithms/launch-product.md` — launch algorithm

Based on the idea and business context, generate 3 business goal variants:

**Variant A:** [Concrete formulation with numbers: what to prove, for which segment, with which metric, by when]
**Variant B:** [Alternative strategy — e.g., a different segment or different entry point]
**Variant C:** [Most ambitious formulation — Big Job-level expansion]

### Step 2.2: Generate segments (~80% market coverage)

Read the canon:
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/segmentation.md`
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/job-structure.md`
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/value-creation.md`
- `Next-Move-Theory-Canon/UnitEconomics/growth-points.md`

**Generation rules:**
- Generate **all significant segments** covering ~80% of potential customers. Usually 4-8 segments.
- Do NOT cap at 3 — produce as many as actually exist.
- Account for the full business context from STAGE 1
- If the user already named segment hypotheses in the idea — use them as starting points and expand
- For each segment, score attractiveness on the 10 factors from `growth-points.md`

**Segment format:**

```markdown
### Segment N: [Name]

**Big Jobs (multiple by design):**
- **I want** {verb + noun}, **so that** {higher level — life outcome / business outcome}
- **I want** {verb + noun}, **so that** {higher level}
- ... (cover ≥80% of motivation)

**Big Job validation:**
- [ ] Each is verb + noun (not a feature)
- [ ] Each is one level above Core Jobs (passes "in order to what?")
- [ ] Each is a life-state change (B2C) or business outcome (B2B)
- [ ] For B2B: business + personal Big Jobs split
- [ ] Together they cover ≥80% of motivation

**Core Jobs:**
- **When** {context + trigger}, **I want** {result with success criteria inside}, **so that** {Big Job + emotions after}

**Success criteria (inside the "I want"):** measurable parameters, not abstractions ("fast < 5 min", "no errors > 99%")

**Real segmentation criteria (causes, not consequences):**
- {criterion 1 — a behavior or characteristic that is a CAUSE}
- {criterion 2}

**Antisegment (mandatory, validates causality):**
| Parameter | Segment | Antisegment |
|-----------|---------|-------------|
| {criterion} | {value} | {opposite} |

Would the antisegment pay for the same value? {No, because [clear cause] / Yes — criterion is weak, narrow it down}

**Job graph (simplified):**
- Previous Job → Core Job → Next Job
- Big Job (above Core Job)
- Micro Jobs (inside Core Job): [step list]

**TAM / SAM / SOM:**
- TAM: [estimate + logic]
- SAM: [estimate + logic]
- SOM: [estimate + logic]

**Attractiveness (1-10 each):**
| Factor | Score | Justification |
|--------|-------|---------------|
| Size | N | ... |
| Job budget | N | ... |
| Frequency | N | ... |
| Reachability | N | ... |
| Acuteness | N | ... |
| Competition | N | ... |
| Ability to create value | N | ... |
| Sustainable advantage | N | ... |
| Strategic value | N | ... |
| Team motivation | N | ... |
| **Total** | **N/100** | |

**Why attractive:** [1-2 paragraphs]
```

### Step 2.3: Generate risks (RAT)

Based on idea, business context, and generated segments — generate risky assumptions.

**Risk categories:**
- Demand on the market
- Economically attractive segment
- Segment willingness to pay (value hypothesis)
- Unit economics (margin)
- Demand scaling
- Operational / regulatory / technological

**Ranking formula:**
```
Score = (P × I) / C
```
- **P** (1-5) — probability of risk
- **I** (1-5) — cost of impact
- **C** (1-5) — cost of testing

**Risk card format:**

```markdown
### Risk N: [Name]

**Assumption:** [concrete testable hypothesis with numbers/conditions]
**Risk:** [why this is critical to the business]
**Category:** [one of 6]
**P:** N/5 — [justification]
**I:** N/5 — [justification]
**C:** N/5 — [justification]
**Score = P×I/C = [value]**
**Validation methods:** [2-5 cheap experiments]
```

Sort by Score descending. Output all risks.

### Step 2.4: Show and confirm

Show the user the generated results in text:
1. **3 Next Move Theory goal variants** (brief description of each)
2. **Segment list** (name + total score for each)
3. **Risk list** (name + Score for each)

Then ask one batch of confirmation questions:

```
AskUserQuestion:
  questions:
    - question: "Which Next Move Theory business goal variant resonates?"
      header: "Next Move Theory goal"
      options:
        - label: "Variant A"
          description: "[brief A description]"
        - label: "Variant B"
          description: "[brief B description]"
        - label: "Variant C"
          description: "[brief C description]"
      multiSelect: false

    - question: "Which segments to take into the PRD? (N segments generated)"
      header: "Segments"
      options:
        - label: "All segments"
          description: "Use all N in the PRD"
        - label: "Top by score (priority)"
          description: "Top 3-4 by attractiveness"
        - label: "I'll adjust"
          description: "I'll say which to remove or add"
      multiSelect: false

    - question: "Which risks to factor into the PRD?"
      header: "Risks"
      options:
        - label: "All risks (recommended)"
          description: "Account for every risky assumption"
        - label: "None"
          description: "Skip risk validation, design directly"
        - label: "I'll adjust"
          description: "I'll specify which ones"
      multiSelect: false
```

If user picks "I'll adjust" — ask for free-form clarification.

**Save** the results:
- All segments (with selection markers) → `02-segments.md`
- All risks (with selection markers) → `03-risks.md`
- Chosen Next Move Theory variant → append to `01-business-context.md` under "Next Move Theory recommendations"

Update `_spring-context.md`.

---

## STAGE 3: Team of 6 agents

### Execution order

```
Agent 1 (Competitive analyst)
    ↓
Agent 2 (PRD designer)
    ↓
Agent 3 (Edge-case analyst)
    ↓
Agent 4 (Analytics architect)  ─┐ IN PARALLEL
Agent 5 (Copywriter & marketer) ─┘
    ↓
Agent 6 (Cross-verifier) — AFTER ALL FIVE
```

**Important:** Agents 4 and 5 run **in parallel** (simultaneously) after Agent 3 finishes. Agent 6 runs only after all five preceding agents are done.

**Language rule:** Every agent prompt ends with: `Output language: {language from 00-product-idea.md}.`

**Path rule:** Before spawning agents, compute the concrete temp folder path: `TMP/prd-{short-product-name}/`, where `{short-product-name}` is taken from `00-product-idea.md`. Substitute the concrete path into all prompts instead of `{temp path}`. Agents must receive a real path, not a placeholder.

---

### Agent 1: Competitive analyst

**Acceptance criteria:** find 80% of the largest competitors for the chosen segments and Jobs. Study their feature set via their websites. **Methodology fix v3 — explicitly include indirect (Big Job-level) competitors, not just direct ones.**

Spawn via `Agent` with `subagent_type: "general-purpose"`:

```
You are a competitive analyst working with Ivan Zamesin's AJTBD/Next Move Theory methodology.

IMPORTANT: methodology source is `Next-Move-Theory-Canon/`. Do NOT use generic JTBD interpretations.

## Context
Product idea: {paste 00-product-idea.md}
Target segments and Jobs: {paste selected segments from 02-segments.md}

## Methodology rule (MANDATORY)
Competitors are defined by Jobs, not by product category:
- **Direct competitors** — at the Core Job level: same Job, same segment, different solution
- **Indirect competitors (non-obvious)** — at the Big Job level: a different way to close the Big Job (different Core Job, different solution category, "do nothing", "postpone")
- **Big Job-level players (turnkey)** — players who close the entire Big Job, not just part

You MUST find competitors at all three levels. Skipping indirect or Big Job-level competitors invalidates the analysis.

## Task
1. Via WebSearch, find competitors solving the same or similar Jobs for the same or similar segments.
2. **Direct competitors:** find at least 5-10 (target: cover 80% of the largest direct players at the Core Job level).
3. **Indirect competitors (Big Job-level):** answer the question — "What other ways do customers in this segment close this Big Job?" Find at least 3-5 indirect competitors. They may be Excel, manual workflow, hiring an assistant, or "do nothing".
4. **Big Job-level turnkey players:** are there any players who close the entire Big Job (not just part)? How well do they scale?

5. For each competitor, via WebFetch study the site and capture:
   - Name and URL
   - Type: direct / indirect / Big Job-level
   - Which Jobs it covers (Core Job for direct; Big Job + alternative path for indirect)
   - Key feature set
   - Pricing model (if available)
   - Strengths
   - Weaknesses / unaddressed Jobs (by success criteria)

## Output format

For each competitor:

### [Competitor name] [Type: Direct / Indirect / Big Job-level turnkey]
- **URL:** [link]
- **Jobs covered:** [list]
- **Key features:** [list]
- **Pricing:** [description]
- **Strengths:** [list]
- **Weaknesses / unaddressed Jobs:** [list]

End with a summary table: competitor × feature (yes/no), grouped by Direct / Indirect / Turnkey.

Output language: {language}.

Save via Write to: {temp path}/04-competitors.md
```

---

### Agent 2: PRD designer

**Acceptance criteria:** write product requirements covering 90% of the value-creating functionality on the chosen Jobs. Functionality level — at least matching competitors. **Methodology fix v3 — every feature must explicitly link Core Job → Big Job. Aha Moment must be a positive prediction error event. Critical Chain of Jobs explicitly constructed per Core Job.**

Spawn via `Agent` with `subagent_type: "general-purpose"` AFTER Agent 1:

```
You are a product designer working with Ivan Zamesin's AJTBD/Next Move Theory methodology.

IMPORTANT: methodology source is `Next-Move-Theory-Canon/`. Do NOT use generic JTBD interpretations.

## Context
Product idea: {paste 00-product-idea.md}
Business context: {paste 01-business-context.md}
Selected segments and Jobs: {paste selected segments from 02-segments.md}
Risks to account for: {paste selected risks from 03-risks.md}
Competitor analysis: {paste 04-competitors.md}

## Methodology rules (MANDATORY)

1. **Every feature must link Core Job → Big Job.** A feature with no declared Big Job is invalid.
2. **Aha Moment is a positive prediction error event.** It is NOT signup, NOT login, NOT "user logged in for the first time". It is a concrete moment where the customer observes the value they came for and experiences "wow, this is unexpectedly good". Validation: "What does the user expect at this point? What do they actually get? Is the actual better than expected?"
3. **Critical Chain of Jobs is explicitly constructed per Core Job.** It's the sequence of sub-Jobs that MUST all be performed for the Big Job to be achieved. If any link breaks, the Big Job fails. Identify every link and check for breaks.
4. **No feature dilution.** Every feature serves the focal segment OR is explicitly marked "later phase".

## Task
Write a PRD that:
1. Covers 90% of value-creating functionality on the selected Core Jobs.
2. Matches competitor functionality at minimum (use the competitor analysis).
3. Accounts for selected risks (if any).
4. Explicitly defines the Aha Moment per segment as a positive prediction error event, shifted as close to the first session as possible.
5. Constructs the Critical Chain of Jobs per Core Job.

## PRD structure

### 1. Product overview
- Name
- Product purpose (what value it creates)
- Target segments and Jobs
- **Aha Moment for each segment** (positive prediction error: what user expected vs. what they got)

### 2. Target users
- Per segment: who they are, which Jobs, success criteria

### 3. Functional requirements

For each Core Job from selected segments:
- What the product must do to perform the Job
- **Critical Chain of Jobs:** the sequence of sub-Jobs that all must be performed (if any breaks — Big Job fails)
  - Sub-Job 1
  - Sub-Job 2
  - ...
- Acceptance criteria per requirement
- **For each requirement, declare:**
  - Which Core Job it serves
  - **Which Big Job it ultimately ladders to** (mandatory — feature without Big Job link is invalid)
  - Which value mechanic from `Advanced-Jobs-To-Be-Done/value-creation.md` it implements (one of 19)
- Connection to Aha Moment: which steps lead to value activation

### 4. Onboarding and value activation
- New user path from signup to Aha Moment
- Shortest path to first value (count steps)
- What to remove / simplify to shift Aha Moment leftward
- **Aha Moment validity check:** is it a positive prediction error? Does the user notice "wow"? If you can't say what's surprising about it — it's not an Aha Moment.

### 5. Competitive parity
- Functionality that must match competitors (per analysis)
- Functionality competitors lack (our advantage)

### 6. Non-functional requirements
- Performance, security, scalability (if relevant)

### 7. Risk handling
- Per selected risk: how the PRD minimizes or accounts for it

### 8. Success metrics
- How to measure that the product creates value on selected Jobs
- North Star Metric for the product
- Key metrics per segment

### 9. Out of scope
- Explicit exclusions
- **Features deferred (next phase):** features that serve other segments or non-focal Jobs — explicitly listed here, not built into v1

## Rules
- Be concrete, with acceptance criteria.
- Phrase requirements from the user's perspective: "User can..."
- **Every requirement must link to a specific Job AND a specific Big Job** (this is a hard methodology gate)
- Don't add functionality that doesn't create value on selected Jobs
- Aha Moment is never just "user signed up"

Output language: {language}.

Save via Write to: {temp path}/05-prd.md
```

---

### Agent 3: Edge-case analyst

**Acceptance criteria:** generate 90% of likely edge cases for the chosen segments and Jobs.

Spawn via `Agent` with `subagent_type: "general-purpose"` AFTER Agent 2:

```
You are an edge-case analyst. Your task is to find every important boundary case.

## Context
Selected segments and Jobs: {paste selected segments from 02-segments.md}
PRD: {paste 05-prd.md}

## Task
Generate edge cases — situations that could break the product or create a negative user experience. Goal: cover 90% of the most likely edge cases.

## Edge case categories

For each functional requirement in the PRD, check:

1. **Input data:** Empty input? Excessively long? Special characters? Other languages? Zero? Negative number?
2. **Network and infrastructure:** No internet? Slow internet? Server timeout? Connection lost mid-process?
3. **User state:** New user? Returning? Blocked? Multiple sessions? Different time zone?
4. **Business logic:** 0 items? 1 item? 10000 items? Concurrent actions? Conflicting operations?
5. **Security:** Prompt injection? XSS? SQL injection? Unauthorized access? Rate-limit breach?
6. **Payments and economics (if applicable):** Cancelled payment? Partial refund? Lapsed subscription? Double charge?
7. **Multi-user scenarios:** Two users at once? Permission conflict? Shared resource?
8. **Segment context:** Situations specific to selected segments that could cause problems

## Output format

For each edge case:

| # | PRD requirement | Edge case | What can go wrong | Recommendation | Priority (Critical/High/Medium/Low) |

Sort by priority: Critical → High → Medium → Low.

Output language: {language}.

Save via Write to: {temp path}/06-edge-cases.md
```

---

### Agent 4: Analytics architect

**Acceptance criteria:** design a complete analytics system with ready-to-paste event code, funnels, cohort analysis, and unit-economics tracking. **Methodology fix v3 — Aha Moment event must be a positive prediction error event, not signup or login.**

**If the user picked "Skip analytics" in STAGE 0 — SKIP this agent.**

Spawn via `Agent` with `subagent_type: "general-purpose"` AFTER Agent 3, IN PARALLEL with Agent 5:

```
You are a product analyst. Your task: design a complete analytics system with ready-to-paste code.

## Context
Product idea: {paste 00-product-idea.md}
Analytics tool: {analytics_tool from 00-product-idea.md}
Business context: {paste 01-business-context.md}
Segments and Jobs: {paste selected segments from 02-segments.md}
PRD: {paste 05-prd.md}

## Methodology rule (MANDATORY)
The `aha_moment_reached` event must fire on a **concrete user action that produces a positive prediction error** — i.e., the user sees something unexpectedly good, not "user signed up" or "user logged in". The event must be the same event referenced as the Aha Moment in the PRD (cross-document consistency required).

## Task
Design an analytics system that lets you:
1. See conversion at each funnel step
2. Detect the Aha Moment (value activation, not signup)
3. Measure conversion to purchase and to repeat purchase
4. Run cohort analysis (retention by cohorts)
5. Compute cohort-level unit economics (CAC, LTV, payback period)
6. Find growth points in the funnel

## Output structure

### 1. Key funnels

Per segment, describe the AARRR funnel:
- **Acquisition** — how the user enters the product
- **Activation** — what is the Aha Moment (first value activation). Define the concrete in-product action where the user notices a positive prediction error. Justify via the segment's Core Job. Cross-check: this MUST match the Aha Moment in the PRD.
- **Revenue** — what is the moment of payment, which events to track
- **Retention** — what "returned" means for this product (day, week, month)
- **Referral** — how a user can bring others

### 2. Full event plan

Per event:

| Event name | Description | When fired | Properties | Type (funnel/cohort/revenue) |

**Mandatory minimum set:** Acquisition (page_viewed, signup_started, signup_completed), Activation (onboarding_step_completed, **aha_moment_reached** — must match PRD Aha Moment, core_job_completed), Revenue (purchase_initiated, purchase_completed, subscription_renewed, upgrade_completed), Retention (session_started, feature_used, value_received), Churn (churn_risk_detected, subscription_cancelled), Referral (referral_sent, referral_converted). Plus Job-specific events for each Core Job in the PRD.

### 3. Code for {analytics_tool}

For each event, write ready-to-paste TypeScript. Code must be copy-paste ready, no rework needed. Include user properties (identify) and group properties (if B2B).

### 4. Dashboards

Describe 5-7 key dashboards: activation funnel, cohort retention, cohort unit economics, conversion by segment, revenue breakdown, Aha Moment, acquisition channels.

### 5. Triggers for automated communications

Describe triggers for: onboarding, retention, upsell.

## Rules
- Code is paste-ready
- Each event maps to a concrete funnel step
- Aha Moment = 1 concrete action, justified through Core Job AND identical to the Aha Moment in the PRD
- Event naming: snake_case, verb in past tense

Output language: {language}.

Save via Write to: {temp path}/07-analytics-plan.md
```

---

### Agent 5: Copywriter and marketer

**Acceptance criteria:** write the full landing copy in the 11-block Next Move Theory structure + generate marketing hypotheses + cross-sell / upsell / retention mechanics. **Methodology fix v3 — the Big Job in the landing must match the Big Job in the PRD (cross-document consistency).**

Spawn via `Agent` with `subagent_type: "general-purpose"` AFTER Agent 3, IN PARALLEL with Agent 4:

```
You are a product copywriter and marketer working with Ivan Zamesin's Next Move Theory (Advanced Jobs To Be Done).

## Preparation: load Next Move Theory canon
Before starting, read:
- `Next-Move-Theory-Canon/Algorithms/position-product.md` — positioning, landing formulas, one-liner
- `Next-Move-Theory-Canon/Algorithms/increase-conversion.md` — 7 conversion factors, Aha Moment, anxiety reduction
- `Next-Move-Theory-Canon/Advanced-Jobs-To-Be-Done/communication.md` — communication principles
- `Next-Move-Theory-Canon/Algorithms/create-acquisition-channel.md` — channels via Previous Job, viral Jobs, Activating Knowledge
- `Next-Move-Theory-Canon/Algorithms/increase-average-check.md` — upsell mechanics
- `Next-Move-Theory-Canon/Algorithms/increase-retention.md` — retention mechanics

## Context
Product idea: {paste 00-product-idea.md}
Business context: {paste 01-business-context.md}
Segments and Jobs: {paste selected segments from 02-segments.md}
Competitor analysis: {paste 04-competitors.md}
PRD: {paste 05-prd.md}

## Methodology rules (MANDATORY)

1. **Communicate through Big Job (motivation), not Core Job (steps).**
2. **The Big Job named in the landing MUST match the Big Job declared in the PRD.** This is a cross-document consistency rule. If you name a different Big Job, you've broken the package.
3. **3 base messages:** (1) which Jobs we perform, (2) which value we deliver with CONCRETE success criteria, (3) we remove anxieties.
4. **No abstractions** ("fast", "high quality", "reliable") — only concretes.
5. **Context and trigger:** the user must recognize themselves in the text.
6. **Customer's language, not feature language.**

## PART 1: Full landing copy (11 blocks)

### Block 1: Hero
- **One-liner** by formula: [What it is] + [Core Job] + [Value]
- **Tagline** — 3 variants by Next Move Theory formulas
- **Subtitle:** 1-2 sentences
- **CTA button:** copy + what user gets
- **Big Job declared (MANDATORY):** state the Big Job this landing addresses — must match the PRD Big Job

### Block 2: Core Job + Value
### Block 3: Micro Jobs (3-6)
### Block 4: Aha Moment (give a taste of value on the landing)
### Block 5: Value by Jobs
### Block 6: "Recognize yourself?" (segments and triggers)
### Block 7: How it works
### Block 8: Point B (Big Job + emotions)
### Block 9: Anxiety reduction (4-6 fears)
### Block 10: Firing competitors
### Block 11: Final CTA

**Every block must contain FULL ready-to-publish copy, no placeholders or [insert here].**

## PART 2: Marketing channel hypotheses (min 6-8)

Per channel × segment:
- Channel, Segment, Trigger, Format, Message (full copy), CTA, Success metric, Next Move Theory strategy

## PART 3: Funnel strategy hypotheses

- Previous Job → Lead Magnet
- Activating Knowledge → Content
- Viral Jobs
- Aha Moment on the landing
- 7 conversion factors (per Next Move Theory)

## PART 4: Cross-sell, Upsell, Retention mechanics

- Cross-sell (3-5) based on Next Job
- Upsell (2-3) based on Big Job
- Retention mechanics (3-5): Aha Moment leftward shift, Next Job, frequency, habits

## Rules
- All copy ready to publish (no placeholders)
- Not a single claim without concrete success criteria
- Customer's language (Jobs), not feature language
- Big Job declared in Hero and consistent with PRD

Output language: {language}.

Save via Write to: {temp path}/08-landing-copy.md
```

---

### Agent 6: Cross-verifier

**Acceptance criteria:** find every contradiction, gap, and weak spot across all preceding agents' documents. Score package consistency. **Methodology fix v3 — explicitly verify Big Job consistency between landing and PRD; verify Aha Moment consistency between PRD and analytics; verify every PRD feature links Core Job → Big Job.**

Spawn via `Agent` with `subagent_type: "general-purpose"` AFTER ALL FIVE preceding agents:

```
You are a skeptic and product-decisions auditor. Your task: find ALL contradictions, gaps, and weak spots across the work of the previous 5 agents.

## Context — read all files in {temp path}/:
- 00-product-idea.md — idea and settings
- 01-business-context.md — business context
- 02-segments.md — segments
- 03-risks.md — risks
- 04-competitors.md — competitors
- 05-prd.md — PRD
- 06-edge-cases.md — edge cases
- 07-analytics-plan.md — analytics (if present)
- 08-landing-copy.md — landing and marketing

## 8 checks (mandatory)

### Check 1: PRD ↔ Analytics
- All Core Jobs in the PRD covered by analytics events?
- Aha Moment in PRD matches `aha_moment_reached` in analytics? (Same event, same definition.)
- All success metrics from PRD tracked in the analytics plan?
- Funnel in analytics covers the full user path from PRD?

### Check 2: Segments ↔ Landing
- All selected segments represented in the landing (block "Recognize yourself?")?
- Jobs from segments correctly reflected in the landing copy?
- No claims in the landing contradict the competitor analysis?

### Check 3: Competitors ↔ PRD ↔ Landing
- Functional parity met?
- Claimed advantages on the landing actually delivered by PRD functionality?
- "Firing competitors" on the landing relies on real weaknesses from the analysis?

### Check 4: Risks ↔ PRD ↔ Analytics
- All selected risks accounted for in the PRD?
- Are there analytics events for early risk detection?

### Check 5: Revenue events ↔ Business model
- Monetization model reflected in revenue events?
- Are key unit-economics metrics tracked?

### Check 6: Edge cases ↔ PRD
- Critical and High edge cases included in the PRD as requirements?
- No edge cases that kill the key Jobs?

### Check 7 [METHODOLOGY FIX v3]: Big Job consistency Landing ↔ PRD
- The Big Job declared in the landing Hero (Block 1) matches the Big Job declared per segment in the PRD?
- If the landing names a different Big Job — this is a CRITICAL break.
- All Big Jobs the PRD claims to address are mentioned somewhere on the landing?

### Check 8 [METHODOLOGY FIX v3]: Every PRD feature links Core Job → Big Job
- Every functional requirement in the PRD declares which Core Job it serves AND which Big Job it ladders to?
- Features with no Big Job link are flagged.
- Aha Moment in the PRD is a positive prediction error event, not signup or login?

## Output format

### Critical breaks (MUST fix)
| # | Doc A | Doc B | Contradiction / break | How to fix |

### Important improvements (recommended)
| # | Doc | What's missing | Recommendation |

### Strengthening suggestions (nice to have)
| # | Area | Idea | Expected effect |

### Verdict
**Package consistency score: N/10**
- [Score justification]
- [Top-3 strengths]
- [Top-3 weaknesses]

Output language: {language}.

Save via Write to: {temp path}/09-cross-verify.md
```

---

## STAGE 4: Final assembly

After all 6 agents complete:

### Step 4.1: Cross-check analysis

Read `09-cross-verify.md`.

**If consistency score < 6/10:**

```
AskUserQuestion:
  questions:
    - question: "Cross-verifier found critical issues (score N/10). Fix now or get docs as-is?"
      header: "Issues"
      options:
        - label: "Fix critical only"
          description: "Apply fixes for critical breaks"
        - label: "Fix everything"
          description: "Apply critical + important fixes"
        - label: "As-is"
          description: "Get docs with [GAP] markers"
      multiSelect: false
```

If user picks fixing — apply recommendations from `09-cross-verify.md`.

**If score >= 6/10** — auto-fix critical breaks without asking.

### Step 4.2: Generate unit economics

Read `01-business-context.md` and `07-analytics-plan.md`. Generate the unit economics model:
1. Identify business model type
2. Plug in concrete values where data is known
3. For unknowns — use benchmarks and mark `[VERIFY]`
4. Compute LTV, CAC, payback period, breakeven point
5. Fill 3 scenarios (optimistic / base / pessimistic)
6. Define experiments for validation (per RAT)

### Step 4.3: Final document assembly

Ask the user where to save:

```
AskUserQuestion:
  questions:
    - question: "Where to save the final documents?"
      header: "Folder"
      options:
        - label: "Project folder"
          description: "Save to a project subfolder"
        - label: "Temp folder"
          description: "Leave in TMP/prd-{name}/"
        - label: "Custom path"
          description: "I'll specify the folder"
      multiSelect: false
```

Write 5 final files:

#### `01-prd.md` — Product requirements
- Merge `05-prd.md` + Critical/High edge cases from `06-edge-cases.md`
- Critical → into core requirements
- High → into "Important edge cases"
- Medium/Low → into appendix
- Apply cross-check fixes

#### `02-analytics-plan.md` — Analytics system
- Take `07-analytics-plan.md`
- Apply cross-check fixes

#### `03-landing-copy.md` — Landing copy
- Extract PART 1 from `08-landing-copy.md`
- Apply cross-check fixes

#### `04-marketing-hypotheses.md` — Marketing and growth mechanics
- Extract PARTS 2, 3, 4 from `08-landing-copy.md`
- Apply cross-check fixes

#### `05-unit-economics.md` — Unit economics model

Generate per template:

```markdown
# Unit economics: {product name}

## Business model
- **Type:** {from business context}
- **Pricing:** {from business context or hypothesis}

## Key assumptions
| Metric | Value | Source | Status |
|--------|-------|--------|--------|
| Price (ARPU) | {value} | {source} | [VERIFY] |
| CR visitor → signup | X% | Benchmark | [VERIFY] |
| CR signup → activation | X% | Benchmark | [VERIFY] |
| CR activation → paid | X% | Benchmark | [VERIFY] |
| Monthly churn | X% | Benchmark | [VERIFY] |
| CAC (per channel) | {value} | Assumption | [VERIFY] |
| Gross margin | X% | Assumption | [VERIFY] |

## LTV, CAC, Payback Period, breakeven
## Cohort analysis (template)
## Validation experiments (per RAT)
## 3 scenarios (optimistic / base / pessimistic)
```

### Step 4.4: Final summary

Show the user a brief summary:
- What's in each file
- Cross-verifier consistency score
- Top-3 next-step recommendations

Ask if any tweaks are needed.

---

## Final result checklist

- [ ] Product idea captured, language and analytics chosen
- [ ] Business context collected (8 questions in 2 batches)
- [ ] Next Move Theory business goal recommendations proposed and chosen
- [ ] Segments generated (~80% market coverage), user confirmed
- [ ] Each segment has multiple Big Jobs (≥80% motivation), validated as verb+noun, one level above Core Jobs
- [ ] For B2B: business + personal Big Jobs split
- [ ] Antisegment built and validated for every segment
- [ ] Risky assumptions generated and ranked by P×I/C
- [ ] User decided on risks
- [ ] Competitors found (80%+ of largest), at three levels: direct (Core Job), indirect (Big Job alternatives), turnkey (Big Job-level players)
- [ ] PRD covers 90%+ functionality for selected Jobs
- [ ] **Every PRD feature links Core Job → Big Job (mandatory)**
- [ ] **Critical Chain of Jobs explicitly constructed per Core Job**
- [ ] **Aha Moment defined as a positive prediction error event** (not signup, not login)
- [ ] Functionality matches competitors at minimum
- [ ] Edge cases generated (90%+ likely)
- [ ] Critical/High edge cases included in the PRD
- [ ] Analytics plan with event code generated
- [ ] **Aha Moment event in analytics matches PRD definition (cross-document)**
- [ ] Landing copy written in the 11-block Next Move Theory structure
- [ ] **Big Job in the landing matches the Big Job in the PRD (cross-document)**
- [ ] Marketing channel hypotheses generated (min 6)
- [ ] Cross-sell / upsell / retention mechanics described
- [ ] Cross-check passed; critical breaks resolved
- [ ] Unit economics model generated
- [ ] 5 final files saved to the chosen folder

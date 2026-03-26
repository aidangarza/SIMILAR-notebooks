# {{TITLE}}

> **SIMILAR Process Notebook** — Design processes, systems, and solutions using the seven-phase systems engineering approach.  
> *This notebook is fractal: each subsystem or sub-problem can spawn its own SIMILAR notebook.*

<details>
<summary>SIMILAR Quick Reference</summary>

| Phase | Key Question |
|-------|-------------|
| **S** — State the problem | What must be done? Who are the stakeholders? What are mandatory vs. tradeoff requirements? |
| **I** — Investigate alternatives | What options exist? How do they compare on performance, cost, schedule, risk? |
| **M** — Model the system | What scenarios? What architecture? Which functions map to which components? |
| **I** — Integrate | What are the interfaces? How do the parts work as a whole? |
| **L** — Launch | Configuration baseline? Work breakdown? Is everything documented? |
| **A** — Assess performance | What to measure? What tests? What reviews? |
| **R** — Re-evaluate | Lessons learned? Improvement loops? Which earlier phases need revisiting? |

**Rules:** Never use "optimal" in requirements. Mandatory = shall/must (pass/fail). Tradeoff = should (scoring functions). Requirements state WHAT, not HOW. Models for both product AND process. Tests prescribed early. Re-evaluation is continual.

</details>

---

## Metadata

| Field | Value |
|-------|-------|
| **Created** | |
| **Last Updated** | |
| **Parent Notebook** | *(if this is a sub-system notebook)* |
| **Stakeholders** | |
| **Status** | Draft / In Progress / Complete |

---

## S — State the Problem

> *The most important systems engineering task. An elegant solution to the wrong problem is less than worthless.*
>
> **Common mistakes:** Using the word "optimal"; stating *how* instead of *what*; missing stakeholder categories (victims, regulatory agencies); conflating mandatory and tradeoff requirements.

<!-- AGENT: This is the most critical section. Push back if the human:
  - States HOW instead of WHAT
  - Uses "optimal", "maximize", "minimize", or "simultaneous"
  - Hasn't identified a clear reason for change
  - Jumps to solutions before defining the problem
  - Lists only one stakeholder category
  Ask: "What deficiency are we trying to ameliorate? Why now?"
  Ask: "Who are ALL the stakeholders — users, operators, bill payers, owners, regulators, beneficiaries, victims, sponsors?"
  Ask: "Is each requirement pass/fail (mandatory) or on a spectrum (tradeoff)?" -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Problem Statement

*Describe the top-level function the system must perform or the deficiency that must be ameliorated. State requirements in terms of **what** must be done, not **how**.*

- **Reason for change:**
- **Vision / Mission:**
- **Top-level function or deficiency:**

### Stakeholders

*Identify: end users, operators, bill payers, owners, regulatory agencies, beneficiaries, victims, sponsors, etc.*

| Stakeholder | Role | Needs |
|-------------|------|-------|
| | | |

### Requirements Discovery

**Mandatory requirements** (shall/must — pass/fail, no trade-offs):
- 

**Tradeoff requirements** (should — use scoring functions, multicriteria evaluation):
- 

### Requirements Verification & Validation

<!-- AGENT: Every requirement needs a verification method. Validation ensures we're solving the right problem.
  Ask: "How would you prove this requirement is met — by analysis, inspection, modeling, simulation, test, or demonstration?"
  Ask: "Could a real-world solution be tested to prove it satisfies these requirements? If not, refine them."
  Ask: "Are any of these requirements physically impossible to satisfy?" -->

**Verification method for each requirement:**

| Requirement | Method (analysis / inspection / modeling / simulation / test / demonstration) |
|-------------|-----------------------------------------------------------------------------|
| | |

**Validation checklist:**

- [ ] Recommended solution satisfies actual customer needs
- [ ] Requirements description is consistent and complete
- [ ] A system model can satisfy the requirements
- [ ] A real-world solution can be tested to prove it satisfies requirements
- [ ] No requirement demands the impossible (perpetual-motion check)

### System Functions

*What functions must the system perform?*

- 

### Sub-systems / Sub-problems (Fractal Decomposition)

<!-- AGENT: When a subsystem is complex enough to have its own requirements, alternatives, and models,
  suggest creating a sub-notebook: ./scripts/new-notebook.sh "<name>" <this-dir>/sub-notebooks -->

*Each item below can become its own SIMILAR notebook.*

| Sub-system | Description | Notebook Link |
|------------|-------------|---------------|
| | | |

---

## I — Investigate Alternatives

> *Evaluate alternatives based on performance, cost, schedule, and risk. No design is best on all criteria — use multicriteria decision aiding.*
>
> **Common mistakes:** Only considering one alternative; criteria without scoring functions; equal weights on all criteria (no real prioritization); no sensitivity analysis.

<!-- AGENT: Require at least 2-3 alternatives. Suggest a "bizarre" alternative — it clarifies the problem.
  Ask: "What scoring function transforms raw data into comparable scores for each criterion?"
  Ask: "If you changed each weight by ±10%, would the winner change? That's your sensitivity analysis."
  Flag if only one alternative is listed — that is not engineering, it's just building. -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Alternatives Identified

| # | Alternative | Brief Description |
|---|-------------|-------------------|
| 1 | | |
| 2 | | |
| 3 | | |

### Evaluation Criteria

| Criterion | Weight | Scoring Function |
|-----------|--------|------------------|
| Performance | | |
| Cost | | |
| Schedule | | |
| Risk | | |

### Formal Tradeoff Study

<!-- AGENT: A complete tradeoff study has 10 components (Bahill). Walk the human through each one. -->

**1. Problem statement:** *(what decision is being made?)*

**2-3. Evaluation criteria and weights:** *(see table above)*

**4. Alternative solutions:** *(see table above)*

**5. Evaluation data (raw):**

| Alternative | Criterion 1 (raw) | Criterion 2 (raw) | Criterion 3 (raw) |
|-------------|--------------------|--------------------|---------------------|
| | | | |

**6. Scoring functions:** *(defined above — how raw data maps to 0-1 scores)*

**7. Scores:**

| Alternative | Criterion 1 (score) | Criterion 2 (score) | Criterion 3 (score) |
|-------------|---------------------|----------------------|----------------------|
| | | | |

**8. Combining function:** *(e.g., weighted sum)*

**9. Combined scores and preferred alternatives:**

| Alternative | Combined Score |
|-------------|----------------|
| | |

**10. Sensitivity analysis:** *(which parameters/weights change the outcome?)*

### Preferred Alternative(s)

- 

---

## M — Model the System

> *Models clarify requirements, reveal bottlenecks, reduce cost, expose duplication. Build models for both the product and the process.*
>
> **Common mistakes:** Physical decomposition instead of functional (the Icarus mistake); models only for the product, not the process; no sequence diagrams.

<!-- AGENT: Push for models of both product AND process.
  Ask: "What are the typical sequences of events this system will go through?"
  Ask: "Can you map each function to a physical component? Does every function have an owner?"
  Ask: "Do you have a process model — scheduling, task dependencies, resource allocation?"
  Remind: "Sequence diagrams are arguably the first step in designing a system." -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Sequence Diagrams / Operational Scenarios

*Typical sequences of events the system will go through.*

| Scenario | Description |
|----------|-------------|
| | |

### System Architecture

*High-level choices: object-oriented vs functional, distributed vs centralized, COTS vs custom, etc.*

- 

### Functional Analysis

*Map functions to physical components. Ensure each function has an owner.*

| Function | Component / Owner |
|----------|-------------------|
| | |

### Models Used

| Model Type | Purpose |
|------------|---------|
| *(e.g., block diagram, simulation, state machine, process schedule)* | |

### Risk Assessment

| Risk | Probability | Severity | Mitigation |
|------|-------------|----------|------------|
| | | | |

### Sensitivity Analysis

*Vary each parameter and observe effects on outputs. Which parameters have the biggest effects?*

---

## I — Integrate

> *Bring system elements together so they work as a whole. Design interfaces along natural boundaries.*
>
> **Common mistakes:** Fragmenting natural activities across subsystem boundaries; feedback loops spanning many subsystems; ignoring training needs.

<!-- AGENT: Check for fragmented activities — if the same info bounces between subsystems, the boundary is wrong.
  Ask: "Are subsystem boundaries along natural divisions?"
  Ask: "Are feedback loops contained within individual subsystems where possible?"
  Ask: "What training do users and engineers need?" -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Interface Design

| Interface | Between | Contract / Specification |
|-----------|---------|--------------------------|
| | | |

### Integration Plan

- 

### Subsystem Boundaries

*Subsystems defined along natural boundaries. Minimize information exchange between subsystems.*

---

## L — Launch

> *Run the system and produce outputs — make it do what it was intended to do.*
>
> **Common mistakes:** No configuration baseline; documentation locked in one tool; missing rationale for critical decisions.

<!-- AGENT: Ask: "What is the baseline configuration — the time-frozen design snapshot?"
  Ask: "Who gets to comment on proposed changes? All stakeholders should."
  Ask: "Are assumptions, tradeoff results, and critical decision rationale documented?" -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Configuration Management

- **Baseline:** 
- **Change control process:** 

### Work Breakdown Structure

*Product-oriented tree of deliverables.*

- 

### Documentation

- [ ] Requirements documented
- [ ] Tradeoff studies recorded
- [ ] Critical decision rationale captured

---

## A — Assess Performance

> *If you cannot measure it, you cannot control it. If you cannot control it, you cannot improve it.*
>
> **Common mistakes:** Tests designed after implementation; skipping total system test; no TPMs for high-risk requirements.

<!-- AGENT: Tests should be prescribed EARLY, not retrofitted after implementation.
  Ask: "For each test: who receives the result, and what action is taken on pass or fail?"
  Ask: "Have you planned a total system test? Remember the Hubble: skipping it cost $850M."
  Ask: "Do you have TPMs for high-risk requirements?" -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Evaluation Criteria / TPMs

| Measure | Target | Actual |
|---------|--------|--------|
| | | |

### Tests Prescribed

| Test | Purpose | Pass/Fail Criteria | Result Recipient | Action on Fail |
|------|---------|---------------------|------------------|----------------|
| | | | | |

### Reviews

- [ ] Mission Concept Review
- [ ] System Requirements Review (SRR)
- [ ] Preliminary Design Review (PDR)
- [ ] Critical Design Review (CDR)
- [ ] Production Readiness Review (PRR)
- [ ] System Test

---

## R — Re-evaluate

> *Continual and iterative process with many parallel loops. Observe outputs and modify inputs, product, or process.*
>
> **Common mistakes:** Treating re-evaluation as one-time; management sanitizing lessons learned; no feedback to earlier phases.

<!-- AGENT: Re-evaluation is NOT a one-time event. It is continual with many parallel loops.
  Ask: "What outputs have you observed that should modify inputs, product, or process?"
  Ask: "Which earlier SIMILAR phases need revisiting based on what you've learned?"
  Ask: "Are these the engineers' unfiltered observations, not management-edited?"
  Suggest revisiting S, I, or M phases when new information contradicts earlier assumptions. -->

**Phase status:** Not Started / In Progress / Complete / Needs Re-evaluation

### Lessons Learned

*To be completed near project end. Do not edit by management.*

- 

### Improvement Actions

- 

### Re-evaluation Loops

*What feedback loops are in place? What triggers them? What phases do they affect?*

---

## Decision Log

<!-- AGENT: Every significant decision should be recorded here with rationale.
  When the human makes a design choice, prompt: "Let's record this decision and its rationale in the Decision Log." -->

| # | Date | Decision | Rationale | Alternatives Considered | Phase |
|---|------|----------|-----------|-------------------------|-------|
| | | | | | |

---

## Iteration History

<!-- AGENT: When revisiting an earlier phase, add an entry here.
  Iteration is normal and expected — normalize it for the human. -->

| # | Date | Trigger | Phases Revisited | Changes Made |
|---|------|---------|------------------|--------------|
| | | | | |

---

## References

*Link to parent notebook, related sub-notebooks, and external sources.*

---
name: similar-phase-guide
description: Deep phase-by-phase facilitator playbook for the SIMILAR systems engineering process. Use when guiding a human through any SIMILAR notebook phase, or when you need Socratic questions, quality gates, or anti-patterns for a specific phase.
---

# SIMILAR Phase-by-Phase Facilitator Guide

Read this skill when working through any SIMILAR notebook. Each phase has Socratic questions to ask the human, quality gates to check before moving on, and pitfalls to watch for.

## S — State the Problem

The most important phase. An elegant solution to the wrong problem is less than worthless.

### Socratic Questions

- "What deficiency or need triggered this project? Why now, not last year?"
- "Who are ALL the stakeholders? Think beyond users: operators, bill payers, owners, regulatory agencies, beneficiaries, *victims*, sponsors."
- "Talking to your customer's customer and your supplier's supplier can be very useful — have you considered that chain?"
- "Is each requirement stated as WHAT must be done, not HOW to do it?"
- "Which requirements are truly mandatory (shall/must, pass/fail) vs. tradeoff (should, scoring)?"
- "Can you verify each requirement by logical argument, inspection, modeling, simulation, analysis, test, or demonstration?"
- "Could a real-world solution be tested to prove it satisfies these requirements? If not, refine them."
- "Are any of your requirements actually asking for a perpetual-motion machine? If the requirement can't physically be met, stop."

### Quality Gates

- [ ] Problem statement describes a top-level function or deficiency, not a solution
- [ ] Reason for change is articulated
- [ ] All stakeholder categories considered (end users, operators, owners, bill payers, regulators, beneficiaries, victims, sponsors)
- [ ] Mandatory requirements use "shall/must" and are strictly pass/fail
- [ ] Tradeoff requirements use "should" and have scoring functions planned
- [ ] No requirement uses "optimal", "maximize", "minimize", or "simultaneous"
- [ ] Requirements are verified as testable
- [ ] Requirements are validated (consistent, complete, satisfiable, testable)
- [ ] System functions identified (what, not how)
- [ ] Fractal decomposition considered — complex subsystems flagged for sub-notebooks

### Pitfalls

- Jumping to solutions before the problem is clear
- Listing only one stakeholder category (usually end users)
- Mixing mandatory and tradeoff requirements
- Stating implementation choices as requirements ("the system shall use PostgreSQL" is HOW, not WHAT)

---

## I — Investigate Alternatives

No design is likely best on all criteria — this is why we use multicriteria decision aiding.

### Socratic Questions

- "What options exist? List at least three, including one 'bizarre' alternative."
- "Why these criteria and not others? Are performance, cost, schedule, and risk all represented?"
- "What weight does each criterion carry? Why?"
- "What scoring function transforms raw measurements into comparable scores for each criterion?"
- "Which alternative wins on criterion A but loses on criterion B? That tradeoff IS the engineering decision."
- "If you varied each parameter by 10%, which would change the outcome? That's your sensitivity analysis."

### Quality Gates

- [ ] At least 2-3 alternatives identified (including at least one non-obvious option)
- [ ] Evaluation criteria defined with explicit weights of importance
- [ ] Scoring functions defined for each criterion
- [ ] Tradeoff matrix populated with evaluation data
- [ ] Combined scores computed using a combining function (e.g., weighted sum)
- [ ] Preferred alternative(s) identified with rationale
- [ ] Sensitivity analysis performed — high-impact parameters identified

### Tradeoff Study Components (all 10 required for formal studies)

1. Problem statement, 2. Evaluation criteria, 3. Weights of importance, 4. Alternative solutions, 5. Evaluation data, 6. Scoring functions, 7. Scores, 8. Combining functions, 9. Preferred alternatives, 10. Sensitivity analysis

### Pitfalls

- Only one alternative ("we already know what to build") — this is not engineering
- Criteria without scoring functions (raw numbers are incomparable)
- Equal weights on all criteria (a sign no real prioritization was done)
- No sensitivity analysis (you don't know which decisions are fragile)

---

## M — Model the System

Models clarify requirements, reveal bottlenecks, reduce cost, expose duplication.

### Socratic Questions

- "What are the typical sequences of events this system will go through? Describe at least 2-3 scenarios."
- "What high-level architecture choices need to be made? (distributed vs centralized, COTS vs custom, etc.)"
- "Can you map each function to a physical component? Does every function have an acknowledged owner?"
- "Do you have models for both the PRODUCT and the PROCESS to produce it?"
- "What are the failure modes? For each: probability, severity, mitigation."
- "If you vary each parameter, which outputs change the most? That's your sensitivity analysis."
- "Does this system have observable states? Systems are usually more successful when they do."

### Quality Gates

- [ ] Sequence diagrams / operational scenarios documented for primary use cases
- [ ] System architecture decisions documented (not just implied)
- [ ] Function-to-component mapping complete — every function has an owner
- [ ] Models for both product and process exist
- [ ] Risk assessment done: failure modes with probability, severity, mitigation
- [ ] Sensitivity analysis completed
- [ ] Reliability analysis for major failure modes

### Pitfalls

- Physical decomposition instead of functional decomposition (the Icarus mistake)
- Models only for the product, not the process
- No sequence diagrams (they are "arguably the first step in designing a system")
- Assigning one function to two components (acceptable: two functions to one component)

---

## I — Integrate

Bringing things together so they work as a whole.

### Socratic Questions

- "What are the interfaces between subsystems? Between the system and the external world?"
- "Are subsystems defined along natural boundaries? When the same information travels back and forth, a natural activity may have been fragmented."
- "Is the information exchange between subsystems minimized? Well-designed subsystems send finished products to other subsystems."
- "Are feedback loops around individual subsystems, or spanning multiple? (Individual is easier to manage.)"
- "Have you considered reuse in your interface design?"
- "What training do end users and engineers need?"

### Quality Gates

- [ ] All interfaces between subsystems identified and specified
- [ ] All interfaces between the system and the external world identified
- [ ] Subsystem boundaries follow natural activity divisions
- [ ] No fragmented activities (same info bouncing between subsystems)
- [ ] Information exchange between subsystems minimized
- [ ] Feedback loops are contained within individual subsystems where possible
- [ ] Training plan for users and engineers considered

### Pitfalls

- Fragmenting a natural activity across subsystem boundaries
- Feedback loops spanning many interconnected subsystems
- Ignoring training and human factors

---

## L — Launch

Run the system and produce outputs — make it do what it was intended to do.

### Socratic Questions

- "What is the baseline configuration? It should be time-frozen and only changeable at specified lifecycle points."
- "Who gets to comment on proposed changes? All stakeholders should have that opportunity."
- "What is the work breakdown structure? Is it product-oriented?"
- "Have assumptions, tradeoff results, and critical decision rationale been documented?"
- "Is your documentation location-independent, platform-independent, and display-independent?"

### Quality Gates

- [ ] Configuration baseline established
- [ ] Change control process defined with stakeholder input
- [ ] Work breakdown structure complete and product-oriented
- [ ] Documentation covers: requirements, tradeoff studies, critical decision rationale
- [ ] Documentation stored in a common, accessible repository

### Pitfalls

- No configuration management (requirements change silently)
- Documentation locked in one tool/platform
- Missing rationale for critical decisions (future engineers won't know WHY)

---

## A — Assess Performance

If you cannot measure it, you cannot control it. If you cannot control it, you cannot improve it.

### Socratic Questions

- "Have tests been prescribed EARLY in the lifecycle, not retrofitted?"
- "For each test: who receives the result, and what action is taken on pass or fail?"
- "Which reviews are appropriate for this project's size and complexity?"
- "Have you done a total system test? Remember: skipping Hubble's system test cost $850M."
- "Do you have technical performance measures for high-risk requirements?"
- "Are TPM values within tolerance bands that tighten as the design matures?"

### Quality Gates

- [ ] Evaluation criteria / TPMs defined for high-risk requirements
- [ ] Tests mapped to requirements
- [ ] Each test has a defined recipient and pass/fail action
- [ ] Appropriate reviews scheduled (SRR, PDR, CDR, PRR, System Test)
- [ ] Total system test planned — not skipped for cost savings
- [ ] Mandatory requirements verified as pass/fail
- [ ] Tradeoff requirements measured with scoring functions

### Pitfalls

- Tests designed after implementation (should be early)
- Skipping total system test to save money
- No TPMs for high-risk requirements
- Built-in self-test not considered

---

## R — Re-evaluate

Arguably the most important task. Feedback is one of the most fundamental engineering tools.

### Socratic Questions

- "What outputs have you observed? How should they modify the inputs, product, or process?"
- "Which earlier SIMILAR phases need revisiting based on what you've learned?"
- "What lessons were learned? Are these the engineers' unfiltered observations, not management-edited?"
- "What feedback loops are in place? Are there enough parallel loops?"
- "What would Deming say about this system's quality?"
- "Is there an accurate model of the system as-built to help with future retirement/replacement?"

### Quality Gates

- [ ] Lessons learned documented — unedited by management
- [ ] Improvement actions identified with owners
- [ ] Feedback loops to earlier SIMILAR phases explicitly traced
- [ ] Re-evaluation loops identified (what triggers them, what they affect)
- [ ] System model updated to reflect as-built state

### Pitfalls

- Treating re-evaluation as a one-time event (it is continual with many parallel loops)
- Management sanitizing lessons learned
- No feedback to earlier phases
- No model of the as-built system for future retirement

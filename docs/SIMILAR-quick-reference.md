# SIMILAR Process — Quick Reference

Use this while working through SIMILAR notebooks.

## The Seven Phases

| Letter | Phase | Key Questions |
|--------|-------|----------------|
| **S** | State the problem | What must be done? Who are stakeholders? What are mandatory vs tradeoff requirements? |
| **I** | Investigate alternatives | What options exist? How do they compare on performance, cost, schedule, risk? |
| **M** | Model the system | What sequences/scenarios? What architecture? Functions → components? |
| **I** | Integrate | What interfaces? How do parts work as a whole? |
| **L** | Launch | Configuration management? Work breakdown? Documentation? |
| **A** | Assess performance | What to measure? What tests? What reviews? |
| **R** | Re-evaluate | Lessons learned? Improvement loops? Which earlier phases need revisiting? |

## Rules of Thumb

- **Never use "optimal"** in problem statements or requirements — complex systems have tradeoffs, not single optima
- **Never use "maximize", "minimize", "simultaneous"** in requirements — state specific targets instead
- **Mandatory** = shall/must, pass/fail, no trade-offs
- **Tradeoff** = should, scoring functions, multicriteria evaluation
- **Requirements state WHAT, not HOW** — if it prescribes an implementation, it's not a requirement
- **Models** = both product and process
- **Tests prescribed early** — not retrofitted after implementation
- **Re-evaluation** = continual, many parallel loops, not a one-time event
- **Lessons learned** = engineers' unfiltered observations, not edited by management

## Tradeoff Study Components (all 10)

1. Problem statement
2. Evaluation criteria
3. Weights of importance
4. Alternative solutions
5. Evaluation data
6. Scoring functions
7. Scores
8. Combining functions
9. Preferred alternatives
10. Sensitivity analysis

## Fractal Decomposition

When you identify subsystems in **State the Problem**, create a sub-notebook for each. Each sub-notebook follows the same SIMILAR structure. Signs it's time to decompose:

- The subsystem has its own stakeholders
- There are meaningful alternative approaches for just this subsystem
- The subsystem needs its own tradeoff study
- The risk assessment for the subsystem is substantial

## Stakeholder Categories (don't miss any)

End users, operators, bill payers, owners, regulatory agencies, beneficiaries, victims, sponsors, your customer's customer, your supplier's supplier.

## Quality Gate Shorthand

| Phase | Minimum to proceed |
|-------|--------------------|
| S | Problem ≠ solution; all stakeholder categories checked; mandatory vs. tradeoff separated; requirements testable |
| I | ≥ 2 alternatives; criteria with weights and scoring functions; tradeoff matrix populated; sensitivity analysis done |
| M | Sequence diagrams; function→component map complete; product AND process models; risks assessed |
| I | All interfaces specified; boundaries along natural divisions; no fragmented activities |
| L | Baseline frozen; change control defined; decisions documented with rationale |
| A | Tests prescribed early; TPMs for high-risk items; total system test planned |
| R | Lessons recorded unedited; improvement actions identified; feedback loops traced to earlier phases |

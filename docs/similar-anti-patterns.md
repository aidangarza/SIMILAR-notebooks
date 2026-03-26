# SIMILAR Anti-Patterns

Common mistakes at each phase of the SIMILAR process, extracted from the source material (Bahill and Gissing, 1998). Flag these immediately when you encounter them.

## S — State the Problem

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| Using "optimal" in problem statement | No single optimal solution exists for complex systems. Moving from one alternative to another improves one criterion and worsens another. | Restate as specific, measurable criteria with explicit tradeoffs. |
| Using "maximize", "minimize", "simultaneous" in requirements | Implies all criteria can be satisfied at once; they can't. | State specific targets or acceptable ranges. |
| Requirements state HOW instead of WHAT | Prescribing implementation precludes discovering better alternatives. "Use PostgreSQL" is HOW; "persist data reliably" is WHAT. | Ask: "What function must be performed?" not "What solution to use?" |
| Only one stakeholder category identified | End users are the obvious stakeholder, but operators, bill payers, regulators, victims, and sponsors have legitimate requirements too. | Systematically walk through all categories: end users, operators, owners, bill payers, regulatory agencies, beneficiaries, victims, sponsors. |
| Mixing mandatory and tradeoff requirements | Mandatory requirements are pass/fail (shall/must). Tradeoff requirements use scoring functions (should). Mixing them produces incoherent evaluation. | Separate explicitly. Mandatory = shall/must, pass/fail. Tradeoff = should, scoring functions. |
| Unverifiable requirements | A requirement that cannot be tested is useless. | Every requirement needs a verification method: analysis, inspection, modeling, simulation, test, or demonstration. |
| Perpetual-motion requirements | Some requirements are physically impossible. If you discover this, the project should stop. | Validate that requirements can actually be satisfied by a real-world system. |

## I — Investigate Alternatives

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| Only one alternative | If you only consider one option, you're not engineering — you're just building the first thing that came to mind. | Require at least 2-3 alternatives, including one "bizarre" option. |
| Criteria without scoring functions | Raw numbers (e.g., "costs $500") are incomparable across criteria without a function that maps them to a common scale. | Define a scoring function for each criterion that maps raw data to 0-1 scores. |
| Equal weights on all criteria | Usually a sign that no real prioritization was done. | Force explicit weight assignment with justification for each. |
| One-time tradeoff study | A tradeoff study should be redone whenever more data are available — from estimates, to models, to simulations, to prototypes, to real system tests. | Re-evaluate with each new data source. |
| No sensitivity analysis | You don't know which decisions are fragile vs. robust. | Vary each parameter/weight and observe which changes flip the outcome. |

## M — Model the System

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| Physical decomposition instead of functional | Icarus analyzed birds' physical components (legs, wings, eyes) and couldn't fly. The Wright brothers decomposed flight into functions (thrust, lift, navigation) and succeeded. | Decompose by function first, then map functions to physical components. |
| Models only for the product | The process to produce the system also needs modeling — scheduling, PERT charts, resource allocation, task dependencies. | Build models for both product AND process. |
| No sequence diagrams | "Arguably the first step in designing a system" — they are easy to discuss and easy to transform into a design. | Create sequence diagrams for at least the primary use cases. |
| Assigning one function to two physical components | One component can own multiple functions (like bird wings providing both thrust and lift), but splitting one function across two components creates integration problems. | Keep function-to-component mapping clean. |

## I — Integrate

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| Same information bouncing between subsystems | When the same data travels back and forth, a natural activity has been fragmented across a boundary. | Redraw the boundary so the activity lives in one subsystem. |
| Feedback loops spanning many subsystems | Feedback loops around individual subsystems are manageable; loops around interconnected subsystems are fragile. | Contain feedback loops within individual subsystems where possible. |
| Ignoring training and human factors | End users and engineers need to learn the system. If nobody knows how to use it, it doesn't matter how well it's built. | Plan for training: courses, manuals, prototype hands-on. |

## L — Launch

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| No configuration baseline | Without a frozen baseline, requirements and designs drift silently. No one knows what version they're working against. | Establish a time-frozen baseline. Changes only at specified lifecycle points with stakeholder notification. |
| Documentation locked in one platform | Stored information should be location, platform, and display independent. | Use open formats accessible by any person, on any computer, using any tool. |
| Missing decision rationale | Future engineers (and future you) need to know WHY, not just WHAT was decided. | Record assumptions, tradeoff results, and reasons for critical decisions. |

## A — Assess Performance

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| Tests designed after implementation | Tests should be prescribed early in the lifecycle. Late tests are retrofitted to confirm what was built rather than verify what was required. | Define tests during requirements and design phases. |
| Skipping total system test | The Hubble Space Telescope skipped its total system test to save money. The fix cost $850,000,000. | Always perform a total system test. |
| No TPMs for high-risk requirements | Without Technical Performance Measures tracked during design, you won't know if a high-risk requirement is heading toward failure until it's too late. | Identify high-risk requirements and define TPMs with tolerance bands that tighten as the design matures. |

## R — Re-evaluate

| Anti-Pattern | Why It's Wrong | Correction |
|---|---|---|
| One-time re-evaluation | Re-evaluation is a continual process with many parallel loops, not a checkbox at the end. | Establish ongoing feedback loops at multiple timescales. |
| Management editing lessons learned | Management may trivialize what they don't understand or omit their own mistakes. The value of lessons learned depends on honesty. | Lessons learned are authored by engineers and left unedited. |
| No feedback to earlier phases | Re-evaluation that doesn't feed back to State the Problem, Investigate Alternatives, or Model the System is theater. | Explicitly trace feedback loops to the phases they affect. |
| No model of as-built system | At the end of the life cycle, an accurate model of the existing system helps with retirement, disposal, and replacement. | Keep the system model updated to reflect as-built state. |

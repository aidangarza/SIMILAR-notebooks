# Water Delivery Subsystem

> **SIMILAR Process Notebook** — Design processes, systems, and solutions using the seven-phase systems engineering approach.  
> *This notebook is fractal: each subsystem or sub-problem can spawn its own SIMILAR notebook.*

---

## Metadata

| Field | Value |
|-------|-------|
| **Created** | 2026-03-10 |
| **Last Updated** | 2026-03-10 |
| **Parent Notebook** | [Automated Home Garden Irrigation System](../../notebook.md) |
| **Stakeholders** | Homeowner (installer/maintainer), landscaper, plants (beneficiaries) |
| **Status** | In Progress |

---

## S — State the Problem

> *The most important systems engineering task. An elegant solution to the wrong problem is less than worthless.*

**Phase status:** Complete

### Problem Statement

*Describe the top-level function the system must perform or the deficiency that must be ameliorated. State requirements in terms of **what** must be done, not **how**.*

- **Reason for change:** The parent system (Automated Home Garden Irrigation) needs a physical water delivery mechanism that can distribute water to four distinct garden zones at independently controlled rates.
- **Vision / Mission:** A reliable, maintainable, and expandable network that delivers precise amounts of water to each zone without waste, leaks, or runoff.
- **Top-level function or deficiency:** Deliver controlled volumes of water from the house supply to individual garden zones, with independent zone activation and adjustable flow rates per zone.

### Stakeholders

*Identify: end users, operators, bill payers, owners, regulatory agencies, beneficiaries, victims, sponsors, etc.*

| Stakeholder | Role | Needs |
|-------------|------|-------|
| Homeowner | Installer, maintainer | Easy to install with common tools; easy to repair; clear layout |
| Landscaper | Seasonal operator | Ability to extend or reconfigure zones without replacing mainline |
| Plants | Beneficiaries | Consistent, appropriate water delivery to root zone |
| HOA | Regulatory | No visible above-ground piping in front yard; neat appearance |

### Requirements Discovery

**Mandatory requirements** (shall/must — pass/fail, no trade-offs):

- The subsystem shall connect to a standard 3/4" garden hose spigot with backflow prevention.
- Each zone shall be independently controllable via a 24VAC solenoid valve.
- The subsystem shall not leak under normal operating pressure (40-60 PSI).
- The subsystem shall withstand UV exposure for at least 5 years without degradation.
- Tubing and emitters shall be food-safe / non-toxic.

**Tradeoff requirements** (should — use scoring functions, multicriteria evaluation):

- Emitter flow rate uniformity across a zone should be ≥ 90%.
- The subsystem should be installable by a homeowner in one weekend.
- Total materials cost should be under $250.
- The subsystem should allow adding a 5th zone without re-trenching existing runs.

### System Functions

*What functions must the system perform?*

- Connect to house water supply with backflow prevention
- Distribute water from supply point to four zone manifold locations
- Independently control flow to each zone via solenoid valves
- Deliver water uniformly to plant root zones within each zone
- Allow future zone expansion without major rework

### Sub-systems / Sub-problems (Fractal Decomposition)

*Each item below can become its own SIMILAR notebook.*

| Sub-system | Description | Notebook Link |
|------------|-------------|---------------|
| *(none — this level is sufficiently simple to address in a single notebook)* | | |

---

## I — Investigate Alternatives

> *Evaluate alternatives based on performance, cost, schedule, and risk. No design is best on all criteria — use multicriteria decision aiding.*

**Phase status:** Complete

### Alternatives Identified

| # | Alternative | Brief Description |
|---|-------------|-------------------|
| 1 | 1/2" polyethylene drip tubing with pressure-compensating emitters | Standard drip irrigation; mainline poly tubing, 1/4" distribution tubing to individual emitters |
| 2 | Soaker hose per zone | Porous rubber hoses laid along plant rows |
| 3 | Micro-spray heads on risers | Small spray nozzles on stakes, connected by poly tubing |

### Evaluation Criteria

| Criterion | Weight | Scoring Function |
|-----------|--------|------------------|
| Flow uniformity | 0.35 | <80% → 0, 90% → 0.7, 95%+ → 1.0 |
| Materials cost | 0.25 | $100 → 1.0, $250 → 0.5, $400+ → 0 |
| Install ease (weekend?) | 0.20 | Likert: 2+ weekends=0.2, 1 weekend=0.7, half day=1.0 |
| Expandability | 0.20 | Major rework=0, moderate=0.5, add tee and run=1.0 |

### Tradeoff Study

| Alternative | Uniformity (0.35) | Cost (0.25) | Install (0.20) | Expandability (0.20) | Combined |
|---|---|---|---|---|---|
| Drip + PC emitters | 0.95 → 1.0 | $180 → 0.73 | 1 weekend → 0.7 | Add tee → 1.0 | **0.86** |
| Soaker hose | 0.70 → 0 | $80 → 0.93 | Half day → 1.0 | Moderate → 0.5 | **0.53** |
| Micro-spray | 0.85 → 0.35 | $220 → 0.60 | 1 weekend → 0.7 | Add tee → 1.0 | **0.57** |

### Preferred Alternative(s)

- **Drip tubing with pressure-compensating emitters** — dominant on uniformity and expandability, acceptable on cost and install time.

### Sensitivity Analysis

*Which parameters have the biggest effects?*

Soaker hose only wins if uniformity weight drops below 0.10 (i.e., uniformity doesn't matter). Since uniform delivery is the primary function of this subsystem, the drip choice is robust.

---

## M — Model the System

> *Models clarify requirements, reveal bottlenecks, reduce cost, expose duplication. Build models for both the product and the process.*

**Phase status:** In Progress

### Sequence Diagrams / Operational Scenarios

| Scenario | Description |
|----------|-------------|
| Zone activation | Controller sends 24VAC to zone valve → valve opens → water flows through mainline → pressure-compensating emitters regulate flow → water delivered to root zones |
| Zone expansion | Homeowner cuts mainline at nearest point → inserts tee fitting → runs new branch to new zone → installs new valve and emitters |

### System Architecture

- **Mainline:** 1/2" polyethylene tubing in a trunk layout from manifold
- **Distribution:** 1/4" tubing from mainline to individual plants
- **Emitters:** Pressure-compensating drip emitters, 1 GPH
- **Valves:** 24VAC solenoid valves at each zone branch point, grouped at manifold

### Functional Analysis

| Function | Component / Owner |
|----------|-------------------|
| Connect to supply | Backflow preventer + hose adapter |
| Distribute to zones | 1/2" poly mainline trunk |
| Control zone flow | 24VAC solenoid valves (one per zone) |
| Deliver to plants | 1/4" distribution tubing + PC emitters |
| Allow expansion | Compression tee fittings at mainline |

### Models Used

| Model Type | Purpose |
|------------|---------|
| Zone layout diagram | Plan tubing runs and emitter placement for each zone |
| Hydraulic calculation | Verify pressure at farthest emitter stays within PC range (15-50 PSI) |

### Risk Assessment

| Risk | Probability | Severity | Mitigation |
|------|-------------|----------|------------|
| Emitter clogging | Medium | Medium (reduced flow to plants) | Use inline filter at manifold; flush lines seasonally |
| Rodent damage to tubing | Low | High (zone fails) | Bury mainline 2-3" or use conduit in exposed areas |
| UV degradation of poly tubing | Low (5-year rated) | Medium | Use UV-stabilized tubing; mulch over exposed runs |

---

## I — Integrate

> *Bring system elements together so they work as a whole. Design interfaces along natural boundaries.*

**Phase status:** In Progress

### Interface Design

| Interface | Between | Contract / Specification |
|-----------|---------|--------------------------|
| Supply connection | House spigot → backflow preventer | 3/4" GHT (garden hose thread) |
| Backflow → manifold | Preventer → pressure regulator → filter → manifold | 3/4" FPT to manifold |
| Manifold → zone valves | Manifold → solenoid valves | 3/4" compression fittings |
| Valve → mainline | Solenoid valve → 1/2" poly | 1/2" barb-to-compression adapter |
| Mainline → distribution | 1/2" poly → 1/4" tubing | Self-piercing tee connectors |
| Distribution → emitters | 1/4" tubing → PC emitter | Barb insert fitting |

### Integration Plan

- Step 1: Install backflow preventer and pressure regulator at spigot
- Step 2: Build manifold with 4 valve positions (+1 blank for expansion)
- Step 3: Run mainline tubing to each zone
- Step 4: Install distribution tubing and emitters per zone layout
- Step 5: Pressure test with valves manually opened (check for leaks)
- Step 6: Connect valve wiring to controller (interface with Sensing & Control subsystem)

### Subsystem Boundaries

This subsystem's boundary is clear: it receives a command (open/close valve via 24VAC signal) and delivers water. It has no logic, no sensors, and no data output. The flow sensor is part of the Sensing & Control subsystem, installed at the manifold inlet.

---

## L — Launch

> *Run the system and produce outputs — make it do what it was intended to do.*

**Phase status:** Not Started

### Configuration Management

- **Baseline:** Zone layout diagram v1.0 with 4 zones, emitter counts and positions per zone.
- **Change control process:** Any zone changes require updating the zone layout diagram and this notebook.

### Work Breakdown Structure

- 1.1 Backflow preventer and pressure regulator
- 1.2 Inline filter
- 1.3 Valve manifold with 4 valves
- 1.4 Mainline tubing runs (4 zones)
- 1.5 Distribution tubing and emitters (per zone)
- 1.6 Burial / mulch coverage of tubing

### Documentation

- [x] Requirements documented
- [x] Tradeoff study recorded
- [x] Critical decision rationale captured
- [ ] Zone layout diagram (to be drawn during installation)
- [ ] Parts list with supplier and cost

---

## A — Assess Performance

> *If you cannot measure it, you cannot control it. If you cannot control it, you cannot improve it.*

**Phase status:** Not Started

### Evaluation Criteria / TPMs

| Measure | Target | Actual |
|---------|--------|--------|
| Flow uniformity (CV across emitters in zone) | ≥ 90% | *(test after install)* |
| Leak count after pressure test | 0 | *(test after install)* |
| Total materials cost | ≤ $250 | *(tally after purchase)* |
| Installation time | ≤ 1 weekend | *(measure)* |

### Tests Prescribed

| Test | Purpose | Pass/Fail Criteria |
|------|---------|---------------------|
| Pressure test | Verify no leaks | Zero visible leaks after 1 hour at operating pressure |
| Uniformity test | Verify even flow | Catch emitter output in cups for 10 min; CV ≤ 10% within each zone |
| End-of-run pressure | Verify PC emitters get adequate pressure | Pressure at farthest emitter ≥ 15 PSI |

### Reviews

- [x] System Requirements Review (SRR) *(covered in parent notebook)*
- [ ] Preliminary Design Review (PDR) *(zone layout review with family)*
- [ ] System Test *(post-installation pressure and uniformity tests)*

---

## R — Re-evaluate

> *Continual and iterative process with many parallel loops. Observe outputs and modify inputs, product, or process.*

**Phase status:** Not Started

### Lessons Learned

- *(To be completed after installation and first season)*

### Improvement Actions

- After uniformity test: adjust emitter spacing if CV > 10%
- After first season: check for clogged emitters; assess filter maintenance interval
- After first winter: inspect for freeze damage

### Re-evaluation Loops

- **Post-install:** Pressure and uniformity tests feed back to zone layout
- **Seasonal:** Emitter condition and filter maintenance
- **Annual:** Tubing and fitting condition; expansion needs

---

## Decision Log

| # | Date | Decision | Rationale | Alternatives Considered | Phase |
|---|------|----------|-----------|-------------------------|-------|
| 1 | 2026-03-10 | Drip with PC emitters over soaker hose and micro-spray | Highest combined score (0.86); dominant on uniformity which is the primary function | Soaker hose (0.53), micro-spray (0.57) | I |
| 2 | 2026-03-10 | 5-position manifold (4 zones + 1 blank) | Supports future expansion without replumbing manifold; marginal cost (~$15) | Exact 4-position manifold | M |

---

## References

- Parent notebook: [Automated Home Garden Irrigation System](../../notebook.md)
- SIMILAR process reference: [What Is Systems Engineering?](../../../../docs/what-is-systems-engineering.md)

# Automated Home Garden Irrigation System

> **SIMILAR Process Notebook** — Design processes, systems, and solutions using the seven-phase systems engineering approach.  
> *This notebook is fractal: each subsystem or sub-problem can spawn its own SIMILAR notebook.*

---

## Metadata

| Field | Value |
|-------|-------|
| **Created** | 2026-03-10 |
| **Last Updated** | 2026-03-10 |
| **Parent Notebook** | *(top-level)* |
| **Stakeholders** | Homeowner, family members, HOA, water utility, neighbors, local wildlife |
| **Status** | In Progress |

---

## S — State the Problem

> *The most important systems engineering task. An elegant solution to the wrong problem is less than worthless.*

**Phase status:** Complete

### Problem Statement

*Describe the top-level function the system must perform or the deficiency that must be ameliorated. State requirements in terms of **what** must be done, not **how**.*

- **Reason for change:** The homeowner's garden plants die regularly during summer due to inconsistent manual watering. The household travels 2-3 weeks per year, during which the garden receives no water. Water bills are high because manual watering is imprecise and wasteful.
- **Vision / Mission:** A reliable irrigation system that keeps the garden healthy year-round while minimizing water waste, requiring minimal daily human intervention.
- **Top-level function or deficiency:** The system must deliver appropriate amounts of water to garden zones based on plant needs and environmental conditions, operating autonomously for at least 3 weeks without human intervention.

### Stakeholders

*Identify: end users, operators, bill payers, owners, regulatory agencies, beneficiaries, victims, sponsors, etc.*

| Stakeholder | Role | Needs |
|-------------|------|-------|
| Homeowner (primary) | Owner, bill payer, operator | Low maintenance, reduced water bills, healthy garden |
| Family members | End users, operators | Easy to understand and override |
| HOA | Regulatory | No visible unsightly equipment; no runoff onto sidewalks |
| Water utility | Regulatory | Compliance with local watering restrictions (odd/even days, time-of-day) |
| Neighbors | Beneficiaries / victims | No overspray onto their property; no standing water attracting mosquitoes |
| Local wildlife | Victims | No toxic materials in runoff; no harm to pollinators |
| Landscaper | Operator (seasonal) | Ability to adjust zones without specialized knowledge |

### Requirements Discovery

**Mandatory requirements** (shall/must — pass/fail, no trade-offs):

- The system shall deliver water to all designated garden zones.
- The system shall operate autonomously for at least 21 consecutive days without human intervention.
- The system shall comply with local watering restrictions (no watering 10am-6pm, odd/even day schedule).
- The system shall not cause water runoff onto sidewalks or neighboring properties.
- The system shall not violate local building or plumbing codes.
- The system shall have a manual override (emergency shutoff) accessible without tools.

**Tradeoff requirements** (should — use scoring functions, multicriteria evaluation):

- The system should reduce water consumption by at least 30% compared to manual watering.
- The system should cost less than $800 total installed.
- The system should be installable by a homeowner (no licensed contractor).
- The system should accommodate adding or reconfiguring zones without replacing the whole system.
- The system should provide feedback on system health (leaks, blockages, low pressure).

### Requirements Verification & Validation

**Verification method for each requirement:**

| Requirement | Method |
|-------------|--------|
| Delivers water to all zones | Test: run each zone and verify flow at all emitters |
| 21-day autonomous operation | Test: run unattended for 21 days, measure plant health |
| Complies with watering restrictions | Inspection: review programmed schedule against local rules |
| No runoff | Test: run system at full capacity, inspect for runoff |
| Code compliance | Inspection: review against local codes |
| Manual override | Demonstration: actuate shutoff, verify flow stops within 10 seconds |

**Validation checklist:**

- [x] Recommended solution satisfies actual customer needs (healthy garden, low effort)
- [x] Requirements description is consistent and complete
- [x] A system model can satisfy the requirements (see Model phase)
- [x] A real-world solution can be tested to prove it satisfies requirements
- [x] No requirement demands the impossible

### System Functions

*What functions must the system perform?*

- Deliver water to designated zones at controlled rates
- Sense environmental conditions (soil moisture, rainfall, temperature)
- Schedule watering events based on plant needs and restrictions
- Enable manual override (start, stop, adjust)
- Detect and report faults (leaks, blockages, pressure loss)
- Store sufficient programming to operate 21+ days autonomously

### Sub-systems / Sub-problems (Fractal Decomposition)

*Each item below can become its own SIMILAR notebook.*

| Sub-system | Description | Notebook Link |
|------------|-------------|---------------|
| Water Delivery | Pipes, valves, emitters, zone layout | [sub-notebooks/water-delivery/](sub-notebooks/water-delivery/notebook.md) |
| Sensing & Control | Sensors, controller, scheduling logic | *(to be created)* |
| Power Supply | Power for controller and valves (AC, battery, solar) | *(to be created)* |

---

## I — Investigate Alternatives

> *Evaluate alternatives based on performance, cost, schedule, and risk. No design is best on all criteria — use multicriteria decision aiding.*

**Phase status:** Complete

### Alternatives Identified

| # | Alternative | Brief Description |
|---|-------------|-------------------|
| 1 | Manual hose + sprinkler | Status quo with added hose timers on each spigot |
| 2 | Timer-based drip system | Fixed-schedule drip irrigation with a multi-zone timer controller |
| 3 | Sensor-based smart drip | Drip irrigation with soil moisture sensors and a smart controller that adjusts schedules based on weather and soil conditions |
| 4 | Professional in-ground sprinkler | Contractor-installed pop-up sprinkler system with rain sensor |

### Evaluation Criteria

| Criterion | Weight | Scoring Function |
|-----------|--------|------------------|
| Water efficiency | 0.30 | % reduction vs. baseline manual watering. 0% → 0, 30% → 0.7, 50%+ → 1.0 |
| Total cost (installed) | 0.25 | $0 → 1.0, $800 → 0.5, $2000+ → 0 (linear interpolation) |
| Autonomous duration | 0.20 | 0 days → 0, 21 days → 0.8, 60+ days → 1.0 |
| Ease of install/modify | 0.15 | Likert: impossible=0, contractor=0.3, handy homeowner=0.7, anyone=1.0 |
| Fault detection | 0.10 | None=0, passive indicator=0.5, active alert=1.0 |

### Formal Tradeoff Study

**1. Problem statement:** Select the irrigation approach that best balances water efficiency, cost, autonomous operation, ease of installation, and fault detection.

**2-3. Criteria & weights:** See table above.

**4. Alternatives:** See table above.

**5. Evaluation data (raw):**

| Alternative | Water efficiency (% reduction) | Total cost | Autonomous (days) | Install ease | Fault detection |
|---|---|---|---|---|---|
| Manual + timer | 5% | $60 | 7 | Anyone | None |
| Timer drip | 25% | $350 | 60+ | Handy homeowner | Passive (visual) |
| Smart drip | 45% | $650 | 60+ | Handy homeowner | Active alerts |
| Professional sprinkler | 15% | $2,500 | 60+ | Contractor | Passive (rain sensor) |

**6. Scoring functions:** Applied per the definitions in Evaluation Criteria above.

**7. Scores:**

| Alternative | Water eff. (0.30) | Cost (0.25) | Autonomous (0.20) | Install (0.15) | Fault det. (0.10) |
|---|---|---|---|---|---|
| Manual + timer | 0.12 (raw: 0.04) | 0.98 | 0.27 (raw: 0.33) | 1.0 | 0 |
| Timer drip | 0.58 | 0.72 | 1.0 | 0.7 | 0.5 |
| Smart drip | 0.93 | 0.56 | 1.0 | 0.7 | 1.0 |
| Professional sprinkler | 0.30 | 0 | 1.0 | 0.3 | 0.5 |

**8. Combining function:** Weighted sum.

**9. Scores (combined):**

| Alternative | Combined Score |
|---|---|
| Manual + timer | 0.30 × 0.04 + 0.25 × 0.98 + 0.20 × 0.33 + 0.15 × 1.0 + 0.10 × 0 = **0.47** |
| Timer drip | 0.30 × 0.58 + 0.25 × 0.72 + 0.20 × 1.0 + 0.15 × 0.7 + 0.10 × 0.5 = **0.71** |
| Smart drip | 0.30 × 0.93 + 0.25 × 0.56 + 0.20 × 1.0 + 0.15 × 0.7 + 0.10 × 1.0 = **0.78** |
| Professional sprinkler | 0.30 × 0.30 + 0.25 × 0 + 0.20 × 1.0 + 0.15 × 0.3 + 0.10 × 0.5 = **0.39** |

**10. Sensitivity analysis:** If cost weight increases from 0.25 to 0.40 (and water efficiency drops to 0.15), Timer drip overtakes Smart drip (0.73 vs 0.68). The decision is sensitive to the cost/water-efficiency weight tradeoff. Smart drip wins when water efficiency is weighted ≥ 0.20.

### Preferred Alternative(s)

- **Smart drip system** (Alternative 3) — highest combined score at 0.78. Wins on water efficiency and fault detection. Acceptable on cost. Sensitivity analysis shows it remains preferred unless cost becomes the dominant criterion.

---

## M — Model the System

> *Models clarify requirements, reveal bottlenecks, reduce cost, expose duplication. Build models for both the product and the process.*

**Phase status:** In Progress

### Sequence Diagrams / Operational Scenarios

*Typical sequences of events the system will go through.*

| Scenario | Description |
|----------|-------------|
| Normal morning watering | Controller wakes at 5am → reads soil moisture sensors → skips zones above threshold → opens valves for dry zones sequentially → runs each zone 15-45 min → closes valves → logs event |
| Rain detected | Rain sensor triggers → controller cancels today's scheduled watering → resumes normal schedule next check |
| 3-week vacation | Family departs → system continues normal schedule → handles rain, heat waves autonomously → family returns, reviews log |
| Fault: leak detected | Flow sensor reads higher-than-expected volume → controller closes zone valve → sends alert to homeowner's phone → logs fault |
| Manual override | Homeowner presses zone button on controller → zone runs for preset duration → auto-stops |

### System Architecture

*High-level choices: object-oriented vs functional, distributed vs centralized, COTS vs custom, etc.*

- **Centralized controller** — Single COTS smart irrigation controller (e.g., commercial off-the-shelf unit with WiFi) manages all zones.
- **Distributed sensing** — Soil moisture sensors deployed per zone, wired to controller.
- **COTS components** — Use commercially available controller, valves, tubing, emitters. No custom electronics.
- **Modular zones** — Each zone is independently addressable; zones can be added or removed by adding a valve and sensor.

### Functional Analysis

*Map functions to physical components. Ensure each function has an owner.*

| Function | Component / Owner |
|----------|-------------------|
| Deliver water to zones | Drip tubing, emitters, zone valves |
| Sense soil moisture | Per-zone soil moisture sensors |
| Sense rainfall | Rain sensor (shared across zones) |
| Schedule watering events | Smart controller (firmware/software) |
| Enforce watering restrictions | Smart controller (programmable rules) |
| Enable manual override | Controller panel buttons + emergency shutoff valve |
| Detect faults | Flow sensor + controller logic |
| Report faults | Controller WiFi → phone notification |

### Models Used

| Model Type | Purpose |
|------------|---------|
| Block diagram | System component layout and water flow paths |
| Scenario walkthrough (above) | Validate system handles normal and fault conditions |
| Water budget spreadsheet | Estimate zone flow rates vs. plant needs; validate 30% savings target |
| Installation timeline (process model) | Schedule the install over 2 weekends; identify task dependencies |

### Risk Assessment

| Risk | Probability | Severity | Mitigation |
|------|-------------|----------|------------|
| Freeze damage to exposed components | Medium (1-2 freeze events/year) | High (burst tubing, cracked valves) | Use freeze-rated tubing; install drain valves at low points; winterize procedure |
| Sensor failure gives false "wet" reading | Low | High (zone dies from no water) | Controller alerts if no watering event for N days; redundant moisture check via weather API |
| Controller firmware bug skips zone | Low | Medium (one zone under-watered) | Manual inspection weekly during first season; firmware updates |
| Exceeds $800 budget | Medium | Low (project continues, just over budget) | Price all components before purchase; build in 15% contingency |
| Runoff due to over-watering | Medium | High (HOA violation, neighbor complaint) | Cycle-and-soak scheduling; flow sensor caps max gallons per zone per day |

---

## I — Integrate

> *Bring system elements together so they work as a whole. Design interfaces along natural boundaries.*

**Phase status:** In Progress

### Interface Design

| Interface | Between | Contract / Specification |
|-----------|---------|--------------------------|
| Water supply | House spigot → system manifold | 3/4" garden hose thread; backflow preventer required by code |
| Zone valve control | Controller → zone valves | 24VAC solenoid wiring, one pair per zone, max 300ft run |
| Sensor data | Soil sensors → controller | Wired analog signal (200mV-3V proportional to moisture) |
| Rain sensor | Rain sensor → controller | Normally-closed dry contact; opens when rain detected |
| Flow sensing | Flow sensor → controller | Pulse output, 1 pulse per gallon |
| User interface | Homeowner → controller | Physical buttons on unit + smartphone app via WiFi |
| Notifications | Controller → homeowner phone | Push notifications via manufacturer cloud service |

### Integration Plan

- Phase 1: Install water delivery subsystem (manifold, mainline, zone tubing, emitters). Test for leaks with manual valve operation.
- Phase 2: Install controller and wire zone valves. Test each zone activates correctly.
- Phase 3: Install sensors (soil moisture per zone, rain sensor, flow sensor). Verify controller reads all sensors.
- Phase 4: Program schedules, restrictions, and alert thresholds. Run for 1 week with daily inspection.
- Phase 5: Full autonomous test — 2 weeks hands-off. Review logs and plant health.

### Subsystem Boundaries

*Subsystems defined along natural boundaries. Minimize information exchange between subsystems.*

The three subsystems (Water Delivery, Sensing & Control, Power Supply) are divided along natural boundaries:
- **Water Delivery** sends no data — it only receives commands (open/close valve) and delivers water.
- **Sensing & Control** is the intelligence layer — it reads sensors and commands valves. It is the only subsystem that produces and consumes data.
- **Power Supply** provides power to the controller and valves — it has no data interface, only electrical output.

This keeps feedback loops within Sensing & Control, which is the only subsystem with logic.

---

## L — Launch

> *Run the system and produce outputs — make it do what it was intended to do.*

**Phase status:** Not Started

### Configuration Management

- **Baseline:** v1.0 — initial zone layout (4 zones), sensor placement, controller programming as documented in this notebook.
- **Change control process:** Any zone additions or schedule changes documented in the Decision Log below with date and rationale. Controller settings backed up via app before changes.

### Work Breakdown Structure

*Product-oriented tree of deliverables.*

- 1.0 Water Delivery Subsystem
  - 1.1 Manifold and backflow preventer
  - 1.2 Mainline tubing
  - 1.3 Zone tubing and emitters (×4 zones)
  - 1.4 Zone valves (×4)
- 2.0 Sensing & Control Subsystem
  - 2.1 Smart controller unit
  - 2.2 Soil moisture sensors (×4)
  - 2.3 Rain sensor
  - 2.4 Flow sensor
  - 2.5 Wiring and conduit
- 3.0 Power Supply Subsystem
  - 3.1 24VAC transformer
  - 3.2 Weatherproof enclosure
- 4.0 Installation (process)
  - 4.1 Site survey and zone layout
  - 4.2 Trenching / tubing runs
  - 4.3 Component installation
  - 4.4 Wiring
  - 4.5 Programming and testing

### Documentation

- [x] Requirements documented (this notebook)
- [x] Tradeoff studies recorded (Investigate Alternatives section)
- [x] Critical decision rationale captured (Decision Log)
- [ ] Installation guide for future reference
- [ ] Winterization procedure

---

## A — Assess Performance

> *If you cannot measure it, you cannot control it. If you cannot control it, you cannot improve it.*

**Phase status:** Not Started

### Evaluation Criteria / TPMs

| Measure | Target | Actual |
|---------|--------|--------|
| Water consumption reduction vs. manual baseline | ≥ 30% | *(to be measured after first full season)* |
| Autonomous operation without intervention | ≥ 21 days | *(to be tested)* |
| Plant health (visual assessment, 1-5 scale) | ≥ 4 | *(to be assessed)* |
| System cost (total installed) | ≤ $800 | *(to be tallied)* |
| Runoff incidents | 0 | *(to be observed)* |

### Tests Prescribed

| Test | Purpose | Pass/Fail Criteria |
|------|---------|---------------------|
| Zone coverage test | Verify all emitters deliver water | Every emitter produces visible flow within 5 min of zone activation |
| Leak test | Verify no leaks under pressure | Flow sensor reads zero when all zones closed; no visible leaks after 1 hour |
| Restriction compliance test | Verify schedule obeys local rules | Controller schedule reviewed; no events 10am-6pm; correct odd/even days |
| 21-day autonomous test | Verify autonomous operation | No plant stress, no faults, no human intervention for 21 days |
| Manual override test | Verify emergency shutoff | Flow stops within 10 seconds of shutoff valve actuation |
| Fault detection test | Verify leak alert works | Simulate leak by opening a zone manually; verify controller detects abnormal flow and sends alert |

### Reviews

- [x] Mission Concept Review *(initial problem statement and approach reviewed with family)*
- [x] System Requirements Review (SRR) *(requirements reviewed against stakeholder needs)*
- [ ] Preliminary Design Review (PDR) *(zone layout and component selection)*
- [ ] Critical Design Review (CDR) *(final design before purchasing components)*
- [ ] Production Readiness Review (PRR) *(all components received, installation plan confirmed)*
- [ ] System Test *(post-installation acceptance testing)*

---

## R — Re-evaluate

> *Continual and iterative process with many parallel loops. Observe outputs and modify inputs, product, or process.*

**Phase status:** Not Started

### Lessons Learned

*To be completed near project end. Do not edit by management.*

- *(To be populated after first season of operation)*

### Improvement Actions

- After first season: review water consumption data — adjust zone schedules if savings < 30%
- After first freeze: assess whether winterization procedure was adequate
- After first vacation: review autonomous operation logs for any anomalies

### Re-evaluation Loops

*What feedback loops are in place?*

- **Daily:** Controller automatically adjusts watering based on soil moisture readings (automated feedback loop)
- **Weekly (first month):** Homeowner visually inspects plant health and checks for leaks
- **Seasonal:** Review water bills vs. baseline; assess plant health across seasons; adjust zone configurations
- **Annual:** Review full-year data; consider adding/removing zones; update controller firmware
- **Event-driven:** Any fault alert triggers immediate investigation and potential design change

---

## Decision Log

| # | Date | Decision | Rationale | Alternatives Considered | Phase |
|---|------|----------|-----------|-------------------------|-------|
| 1 | 2026-03-10 | Selected smart drip system over timer-only, professional sprinkler, and manual approaches | Highest combined score (0.78) in tradeoff study; best water efficiency; within budget; DIY installable | Timer drip (0.71), manual+timer (0.47), professional sprinkler (0.39) | I |
| 2 | 2026-03-10 | Centralized COTS controller rather than custom microcontroller build | Reduces risk, provides manufacturer support, app integration; cost difference minimal ($30-50 more than DIY) | Custom Arduino/ESP32 build, dumb timer | M |
| 3 | 2026-03-10 | Wired sensors rather than wireless | Wired is more reliable for permanent install; no battery replacement; lower cost per sensor | Wireless ZigBee/WiFi sensors | M |

## Iteration History

| # | Date | Trigger | Phases Revisited | Changes Made |
|---|------|---------|------------------|--------------|
| 1 | 2026-03-10 | During Modeling, realized fault detection was underspecified in requirements | S (Requirements), I (Criteria) | Added fault detection as a tradeoff requirement and evaluation criterion; re-ran tradeoff study (Smart drip advantage increased) |

---

## References

*Link to parent notebook, related sub-notebooks, and external sources.*

- Sub-notebook: [Water Delivery Subsystem](sub-notebooks/water-delivery/notebook.md)
- Local watering restrictions: City of Example Municipal Code §14.3
- SIMILAR process reference: [What Is Systems Engineering?](../../docs/what-is-systems-engineering.md)

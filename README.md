# SIMILAR Fractal Notebooks

A reusable system for creating **fractal notebooks** to design processes, systems, and solutions using the **SIMILAR** systems engineering process — with built-in **AI agent facilitation**.

## What is SIMILAR?

SIMILAR is a seven-phase systems engineering process (Bahill and Gissing, 1998):

| Phase | Focus |
|-------|-------|
| **S**tate the problem | Identify stakeholders, discover requirements, define system functions |
| **I**nvestigate alternatives | Evaluate based on performance, cost, schedule, risk |
| **M**odel the system | Build product and process models; sequence diagrams, functional analysis |
| **I**ntegrate | Design interfaces, bring elements together as a whole |
| **L**aunch | Run the system, produce outputs, configuration management |
| **A**ssess performance | Measure, test, verify against requirements |
| **R**e-evaluate | Continual improvement, lessons learned |

*Source: [What Is Systems Engineering?](docs/what-is-systems-engineering.md)*

## Fractal Design

Each system can be decomposed into subsystems. Each subsystem can be analyzed using the same SIMILAR process. This creates a **fractal** structure:

```
notebooks/
├── race-car-design/
│   ├── notebook.md          # Top-level SIMILAR
│   └── sub-notebooks/
│       ├── engine/
│       │   ├── notebook.md   # Engine subsystem SIMILAR
│       │   └── sub-notebooks/
│       │       └── cooling/  # Cooling sub-subsystem...
│       └── chassis/
│           └── notebook.md
```

## Quick Start

### Create a new notebook

```bash
./scripts/new-notebook.sh "My System Design"
```

This creates `notebooks/my-system-design/` with:
- `notebook.md` — Full SIMILAR template with guidance and agent facilitation prompts
- `config.yaml` — Notebook configuration with phase tracking
- `sub-notebooks/` — Directory for fractal sub-notebooks

### Create a sub-notebook (fractal)

```bash
./scripts/new-notebook.sh "Engine Subsystem" notebooks/my-system-design/sub-notebooks
```

### Work through the process

1. Open `notebook.md` in Cursor
2. Work through each SIMILAR phase with the AI agent as your facilitator
3. The agent will ask Socratic questions, challenge assumptions, and enforce process rigor
4. When you identify subsystems in **State the Problem**, create sub-notebooks for each
5. Link sub-notebooks in the "Sub-systems / Sub-problems" table

### Check status across all notebooks

```bash
./scripts/status.sh
```

Output:
```
SIMILAR Notebook Status
Legend: ■ complete  ◧ in progress  □ not started  ↺ needs re-evaluation
---
Race Car Design                          S:■ I:■ M:◧ I:□ L:□ A:□ R:□
  └─ Engine                              S:■ I:◧ M:□ I:□ L:□ A:□ R:□
  └─ Chassis                             S:◧ I:□ M:□ I:□ L:□ A:□ R:□
```

### Validate a notebook

```bash
./scripts/validate-notebook.sh notebooks/my-system/notebook.md
```

Checks for anti-patterns (forbidden words in requirements), missing content (stakeholders, alternatives), and broken sub-notebook links.

## Repository Structure

```
f80-notebooks/
├── README.md                                  # This file
├── docs/
│   ├── what-is-systems-engineering.md         # Full SIMILAR source material
│   ├── SIMILAR-quick-reference.md             # Quick reference card
│   ├── agent-facilitator-guide.md             # How the agent facilitates SIMILAR
│   └── similar-anti-patterns.md               # Common mistakes by phase
├── notebook-template/
│   ├── notebook.md                            # Template with all SIMILAR phases
│   └── config.yaml                            # Template configuration
├── scripts/
│   ├── new-notebook.sh                        # Scaffold new notebooks
│   ├── validate-notebook.sh                   # Check notebooks for anti-patterns
│   └── status.sh                              # Dashboard of all notebook progress
├── notebooks/                                 # Your notebooks go here
│   └── example-system/                        # Fully worked example
│       ├── notebook.md
│       ├── config.yaml
│       └── sub-notebooks/
│           └── water-delivery/                # Example fractal sub-notebook
└── .cursor/
    ├── rules/
    │   ├── similar-facilitator.mdc            # Agent: SIMILAR process guidance
    │   └── notebook-editing.mdc               # Agent: notebook editing conventions
    └── skills/
        └── similar-phase-guide/
            └── SKILL.md                       # Agent: phase-by-phase playbook
```

## Agent Facilitation

This repository includes built-in guidance for AI agents (Cursor rules and skills) that transforms the agent into a **Socratic systems engineering facilitator**:

- **Asks probing questions** at each phase instead of filling in answers
- **Challenges weak inputs** — flags vague requirements, missing stakeholders, single-alternative tradeoff studies
- **Enforces SIMILAR vocabulary** — catches "optimal", "maximize" in requirements; ensures mandatory vs. tradeoff distinction
- **Manages iteration** — encourages revisiting earlier phases when new information surfaces
- **Guides fractal decomposition** — suggests when subsystems are complex enough for their own notebooks

See [docs/agent-facilitator-guide.md](docs/agent-facilitator-guide.md) for the full facilitation philosophy.

## Template Features

The notebook template includes:

- **Metadata** — Created date, stakeholders, status, parent link
- **Quick reference** — Collapsible SIMILAR summary at the top of every notebook
- **State the Problem** — Problem statement, stakeholders, mandatory vs. tradeoff requirements, verification & validation, fractal decomposition table
- **Investigate Alternatives** — Alternatives table, evaluation criteria with scoring functions, full 10-component tradeoff study, sensitivity analysis
- **Model the System** — Sequence diagrams, architecture, functional analysis, risk assessment, sensitivity analysis
- **Integrate** — Interface design, integration plan, subsystem boundaries
- **Launch** — Configuration management, work breakdown, documentation checklist
- **Assess Performance** — TPMs, tests with recipients and fail actions, review checklist
- **Re-evaluate** — Lessons learned, improvement actions, feedback loops
- **Decision Log** — Structured record of every significant decision with rationale
- **Iteration History** — Track when and why earlier phases were revisited
- **Agent facilitation comments** — HTML comments guide the agent's Socratic questioning at each phase

## Key Principles (from the source)

- **Avoid "optimal"** — No single optimal solution exists for complex systems; use tradeoffs
- **Mandatory vs. tradeoff requirements** — Mandatory = shall/must, pass/fail. Tradeoff = should, scoring functions
- **Models for product and process** — Both need modeling
- **Re-evaluation is continual** — Many parallel feedback loops, not a one-time event
- **Document decisions** — Assumptions, tradeoff rationale, critical decisions — with the *why*, not just the *what*
- **Tests prescribed early** — Not retrofitted after implementation
- **Lessons learned unedited** — Engineers' observations should not be sanitized by management

## Example

See `notebooks/example-system/` for a fully worked example: an Automated Home Garden Irrigation System with a fractal sub-notebook for the Water Delivery Subsystem. It demonstrates completed tradeoff studies, function-to-component mapping, risk assessment, decision logging, and iteration history.

## License & References

Based on *What Is Systems Engineering? A Consensus of Senior Systems Engineers* and the SIMILAR process (Bahill and Gissing, 1998). See [docs/what-is-systems-engineering.md](docs/what-is-systems-engineering.md) for full references.

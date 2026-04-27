# Ivry Lab — Sensorimotor Adaptation Analysis

Python analysis pipeline replicating the forgetting-rate, error-distribution, and savings analyses from **Wang, Lam, Taylor & Ivry (2025)**. The paper dissociates two subsystems of implicit motor learning: **implicit recalibration** (cerebellar, sensory-prediction-error driven) and **implicit aiming** (context-dependent).

## Experiments

| Exp | Paradigm | Key contrast |
|-----|----------|--------------|
| 1 | Gradual visuomotor rotation (±65°) | Probe aftereffects across no-feedback blocks |
| 2 | Probabilistic perturbation (ProbI vs ProbE) | Implicit recalibration vs aiming dissociation |
| 3 | Error-clamp vs explicit aiming | Savings and forgetting under clamped feedback |
| 4 | Error-clamp, reduced aiming | Forgetting at lower adaptation levels |

## Pipeline

All analysis is in `final.ipynb`. Three methods are used to estimate forgetting rate **F = 1 − R**:

- **State-space fit** — fits `X(n+1) = R · X(n)` to the group-mean probe time course; bootstrap SD over subjects (1 000 iterations)
- **Rolling-window** — per-subject F across probe trials with a sliding window
- **Error distribution** — mean and variance of performance error across training, characterizing trial-by-trial noise and bias by condition

Savings are quantified as the difference in relearning rate between naïve and re-exposure blocks (Exp 3 & 4).

## Repository structure

```
final.ipynb          # main analysis notebook
results_summary.csv  # collated forgetting-rate and savings estimates
figures/             # publication-ready output figures
Share/               # raw MATLAB data files (Exp1–4, control and clamp conditions)
```

## Requirements

```
numpy scipy pandas matplotlib
```

Data files are MATLAB v5 format and loaded via `scipy.io.loadmat`.

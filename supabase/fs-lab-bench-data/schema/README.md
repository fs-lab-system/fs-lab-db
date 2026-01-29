# fs-lab-bench-data

Supabase project dedicated to backend benchmark measurements.

---

## Purpose

- Store aggregated benchmark results
- Keep cold-start measurements isolated
- Minimize write overhead during cron-based inserts

---

## Notes

- No authentication
- No application-level data
- External cron jobs only

---

## Cold vs Warm Classification

Cold and warm starts are not detected at the backend level.
Instead, benchmark runs are classified externally using
a heuristic based on response time.

Currently, a response time threshold of 4 seconds is used
to distinguish cold from warm runs. This value was chosen
based on early measurements showing a clear separation
between cold starts (20+ seconds) and warm responses (<500 ms).

The classification is implemented as a SQL view to keep
raw benchmark data immutable and allow future adjustments
without data loss.

# fs-lab-bench-data

Supabase project dedicated to backend benchmark measurements.

## Purpose

- Store aggregated benchmark results
- Keep cold-start measurements isolated
- Minimize write overhead during cron-based inserts

## Notes

- No authentication
- No application-level data
- External cron jobs only

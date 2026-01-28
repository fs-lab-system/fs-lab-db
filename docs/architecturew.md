# Architecture Overview

This repository follows a strict separation of concerns:

- One Supabase project per technical purpose
- Minimal schemas to reduce benchmark interference
- External cron jobs to avoid vendor lock-in

Benchmarks are stored in aggregated form to ensure
low write overhead and reproducible results.

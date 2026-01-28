-- Aggregated benchmark results.
-- One row represents one measured request to avoid write amplification
-- during cron-based benchmarks.

create table if not exists benchmark_runs (
  -- UUID allows distributed cron jobs without coordination
  id uuid primary key default gen_random_uuid(),

  -- Service identifier (e.g. node, python, go)
  service text not null,

  -- Measured endpoint (e.g. /health)
  endpoint text not null,

  -- Cold vs warm start classification
  request_type text not null check (request_type in ('cold', 'warm')),

  -- Response time in milliseconds (integer for simplicity & speed)
  response_time_ms integer not null,

  -- HTTP status code of the response
  status_code integer not null,

  -- Deployment region to keep benchmarks comparable
  region text not null,

  -- Insert timestamp (set by DB to avoid client clock skew)
  created_at timestamp with time zone not null default now()
);

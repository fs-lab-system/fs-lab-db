-- View: benchmark_runs_classified
-- Purpose:
-- Derives cold/warm classification heuristically based on response time.
-- Raw benchmark data remains immutable.

create or replace view benchmark_runs_classified as
select
  id,
  service,
  endpoint,
  response_time_ms,
  status_code,
  region,
  created_at,
  case
    when response_time_ms > 4000 then 'cold'
    else 'warm'
  end as inferred_request_type
from benchmark_runs;

## Benchmark Inserts & Key Strategy

### Identifier Strategy

Benchmark rows use UUIDs as primary keys instead of auto-incrementing IDs.

This allows:

- Distributed cron jobs without coordination
- No sequence locking during inserts
- Lower risk of benchmark self-interference

Human readability is intentionally sacrificed in favor of system correctness.

### Write Access

All benchmark inserts are performed using the Supabase Service Role key.

Rationale:

- No authentication layer is required
- Row Level Security is intentionally disabled
- Keys are used only in server-side or cron environments

Publishable keys are not used for write operations.

### Validation

A manual test insert was executed directly via SQL to validate:

- Table constraints
- Default values
- Timestamp handling

Only after successful validation are automated cron inserts allowed.

### Security Note

Row Level Security (RLS) is intentionally disabled for benchmark tables.
This project does not expose any public or user-facing access and relies
exclusively on the Supabase Service Role key for controlled write access.

Enabling RLS would add complexity without providing additional security
benefits for this use case.

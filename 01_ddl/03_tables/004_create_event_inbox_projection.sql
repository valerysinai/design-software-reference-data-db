CREATE TABLE parameterization.event_inbox (
    consumer_name VARCHAR(100) NOT NULL,
    event_id UUID NOT NULL,
    payload_sha256 CHAR(64) NOT NULL,
    processed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (consumer_name, event_id)
);

-- Read model of the latest domain event, with the number of distinct events applied.
CREATE TABLE parameterization.event_projection (
    aggregate_type VARCHAR(80) NOT NULL,
    aggregate_id UUID NOT NULL,
    last_event_type VARCHAR(120) NOT NULL,
    last_payload JSONB NOT NULL,
    last_occurred_at TIMESTAMPTZ NOT NULL,
    applied_events BIGINT NOT NULL DEFAULT 1 CHECK (applied_events > 0),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (aggregate_type, aggregate_id)
);

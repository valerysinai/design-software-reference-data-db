REVOKE SELECT ON parameterization.event_projection FROM reference_reader;
REVOKE SELECT, INSERT, UPDATE, DELETE ON parameterization.event_inbox, parameterization.event_projection FROM reference_writer;

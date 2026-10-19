GRANT SELECT, INSERT, UPDATE, DELETE ON parameterization.event_inbox, parameterization.event_projection TO reference_writer;
GRANT SELECT ON parameterization.event_projection TO reference_reader;

# R1: cambios de persistencia

Se agregan dos changesets nuevos, sin modificar los changesets previamente aplicados:

- `r1-reference-inbox-projection-001`: crea `parameterization.event_inbox` y `parameterization.event_projection`.
- `r1-reference-inbox-projection-grants-001`: concede los permisos del dominio a writer/reader.

Cada changeset tiene rollback SQL. El inbox usa como clave primaria `(consumer_name,event_id)`; la aplicación lo escribe en la misma transacción que actualiza la proyección para que una entrega duplicada no repita efectos.

La verificación real se ejecuta desde el runner `docker-infra/validation/r1-reference/run.ps1`. Usa una base de datos independiente con el mismo nombre histórico `hu_ref_020` para reutilizar las fixtures IAM; no cambia la base del runner HU-REF-020.

La prueba induce una excepción PostgreSQL únicamente para un ID de agregado de prueba y la elimina al terminar. No requiere deshabilitar restricciones ni alterar datos reales. Los resultados, el ADR y el informe de entrega se mantienen en Reference Data Service.

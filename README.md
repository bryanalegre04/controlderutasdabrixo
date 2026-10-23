# DABRIXO · Control de rutas SIF
Programa de un solo archivo (`index.html`), sin contraseña y sin servidor. Ábrelo en el navegador.

## Qué hace
- **Semáforo de Ruta SIF por ruta**: tiempo en mercado (SIC) contra el límite de 10 h (editable). Rojo = Ruta SIF, amarillo = en riesgo (desde 9 h), verde = normal.
- **Avance de rutas**: cruce Roadmap + Bees por código de cliente y fecha (Entregado, Parcial, Rechazado, Pendiente, Desplanificado, MR% pedido y volumen).
- **Importadores**: Excel Ruta SIF (SIC), Excel Roadmap y Excel Bees (admite también el reporte completo con ambas hojas).
- Días cerrados, horas planeadas manuales por ruta, exportar a Excel y copia JSON.
Los datos se guardan en el navegador (IndexedDB).

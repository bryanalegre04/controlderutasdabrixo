# DABRIXO · Control de rutas SIF (con Supabase)

Archivos para subir a tu repositorio de GitHub Pages (misma carpeta):
- `index.html`  → el programa
- `config.json` → tu URL y clave pública de Supabase (editalo en GitHub con el lápiz)

## Preparar Supabase (una sola vez)
1. Entra a supabase.com → New project.
2. SQL Editor → New query → pega todo `supabase_setup.sql` → Run.
3. Project Settings → API: copia **Project URL** y la clave **anon public**.
4. Pégalas en `config.json` y súbelo junto a `index.html`.

## Uso
- Todos los que abran la página ven los datos (se actualizan solos cada 20 segundos).
- Para importar archivos o cambiar parámetros: «Desbloquear con contraseña» (`bryan123`).
- La contraseña se verifica en el servidor. Para cambiarla, edita 'bryan123' en las dos funciones de `supabase_setup.sql` y vuelve a ejecutarlo.

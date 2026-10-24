-- DABRIXO · Control de rutas SIF · preparación de Supabase
-- Pégalo completo en Supabase → SQL Editor → New query → Run.

create table if not exists public.dabrixo_datos (
  id  text primary key,
  ts  bigint not null,
  por text,
  z   text not null
);

alter table public.dabrixo_datos enable row level security;

-- Todos pueden LEER los datos con la clave pública (anon).
drop policy if exists "leer_todos" on public.dabrixo_datos;
create policy "leer_todos" on public.dabrixo_datos for select to anon using (true);
grant select on public.dabrixo_datos to anon;

-- Nadie puede escribir directamente en la tabla: solo esta función, y solo con la contraseña de editor.
-- >>> Para cambiar la contraseña, cambia 'bryan123' en las DOS funciones y vuelve a ejecutar el script. <<<
create or replace function public.guardar_datos(p_clave text, p_ts bigint, p_por text, p_z text)
returns void language plpgsql security definer set search_path = public as $$
begin
  if p_clave is distinct from 'bryan123' then
    raise exception 'clave incorrecta' using errcode = '28000';
  end if;
  insert into public.dabrixo_datos (id, ts, por, z) values ('estado', p_ts, p_por, p_z)
  on conflict (id) do update set ts = excluded.ts, por = excluded.por, z = excluded.z;
end $$;

create or replace function public.verificar_clave(p_clave text)
returns boolean language sql security definer set search_path = public as $$
  select p_clave is not distinct from 'bryan123';
$$;

revoke all on function public.guardar_datos(text, bigint, text, text) from public;
revoke all on function public.verificar_clave(text) from public;
grant execute on function public.guardar_datos(text, bigint, text, text) to anon;
grant execute on function public.verificar_clave(text) to anon;

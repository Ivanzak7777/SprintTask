-- Одна таблиця для всіх даних сторінки: колекція + id + JSON.
create table if not exists public.docs (
  owner uuid not null default auth.uid() references auth.users(id) on delete cascade,
  col text not null,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (owner, col, id)
);

alter table public.docs enable row level security;

drop policy if exists "own rows" on public.docs;
create policy "own rows" on public.docs
  for all to authenticated
  using (owner = auth.uid())
  with check (owner = auth.uid());

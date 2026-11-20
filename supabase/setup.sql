-- Business Development directory: database setup. Run once in Supabase → SQL Editor
-- (the same Supabase project as the Jobsite Schedule Board). Safe to run again.
--
-- Everyone signs in with the schedule board's shared login (scheduler@bancroftconstruction.com,
-- see config.js). Records are JSON documents keyed "collection/id": contacts/<id>, events/<id>,
-- settings/main. Only that login can read or write them; visitors who aren't signed in get nothing.

create table if not exists public.bd_docs (
  path        text primary key,
  coll        text not null,
  data        jsonb not null,
  updated_at  timestamptz not null default now(),
  updated_by  text
);
create index if not exists bd_docs_coll_idx on public.bd_docs (coll);

-- signed-in users only (this project doesn't grant new tables to API roles automatically)
grant select, insert, update, delete on public.bd_docs to authenticated;
revoke all on public.bd_docs from anon;

alter table public.bd_docs enable row level security;

drop policy if exists "bd login read"   on public.bd_docs;
drop policy if exists "bd login insert" on public.bd_docs;
drop policy if exists "bd login update" on public.bd_docs;
drop policy if exists "bd login delete" on public.bd_docs;
create policy "bd login read"   on public.bd_docs for select to authenticated
  using (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');
create policy "bd login insert" on public.bd_docs for insert to authenticated
  with check (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');
create policy "bd login update" on public.bd_docs for update to authenticated
  using (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com')
  with check (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');
create policy "bd login delete" on public.bd_docs for delete to authenticated
  using (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');

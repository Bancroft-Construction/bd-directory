-- Recommended, run once after setup.sql: keep the BD login read-only on the Jobsite Schedule.
--
-- The schedule's table (sched_docs) lets ANY signed-in login read and write it. The BD page only reads
-- it, but without this script someone with the BD password could, with technical know-how, change the
-- schedule through the database API. This limits changes to the schedule board's own login.
-- Reading stays open to both logins, which is what lets the BD page pick up schedule dates.
--
-- The address below must match `email` in the jobsite-schedule repo's config.js.
-- After running: open the schedule board, edit any task, and check it saves.
-- To undo: re-run jobsite-schedule/supabase/setup.sql.

drop policy if exists "signed-in insert" on public.sched_docs;
drop policy if exists "signed-in update" on public.sched_docs;
drop policy if exists "signed-in delete" on public.sched_docs;
create policy "signed-in insert" on public.sched_docs for insert to authenticated
  with check (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');
create policy "signed-in update" on public.sched_docs for update to authenticated
  using (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com')
  with check (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');
create policy "signed-in delete" on public.sched_docs for delete to authenticated
  using (lower(auth.jwt() ->> 'email') = 'scheduler@bancroftconstruction.com');

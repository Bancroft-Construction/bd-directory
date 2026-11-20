# Business Development Directory

Bancroft Construction's architect & designer directory: contacts, contact history, a priority
follow-up list, and last-contact dates picked up from the Jobsite Schedule.

- Live site: https://bancroft-construction.github.io/bd-directory/
- Hosting: GitHub Pages from the `main` branch. A push to `main` goes live within a minute or two;
  there is no staging copy. Try changes locally first with `?demo` (see below).
- One file, `index.html` (HTML, CSS and JavaScript). No build step. `config.js` holds the Supabase
  connection: the schedule board's Supabase project, but its own login
  (`bd-directory@bancroftconstruction.com`) with its own password. Its session is stored under
  `bd-auth`, separate from the schedule board's `jsb-auth`. Never put the password in the repo.

## Data

- Records are in Supabase table `public.bd_docs`, created by `supabase/setup.sql`: `contacts/<id>`,
  `events/<id>` (calendar: title, date, time, type, location, contactIds, notes) and `settings/main`
  (follow-up threshold, ignored schedule suggestions). Row-level security allows only the BD login.
- `supabase/protect-schedule.sql` limits writes on `sched_docs` to the schedule board's login, so the
  BD login can read the schedule but not change it.
- The Jobsite Schedule's table `sched_docs` (collections `items`, `projects`) is **read only** from here.
  Never write to it from this page.
- This repo is public. Never commit contact lists, exports or any real contact data. `.gitignore`
  blocks spreadsheets and CSVs.

## How "last contact" works

Last contact = the latest of (a) contacts logged on the page (including dates imported from the master
list), (b) calendar events dated today or earlier that list the contact, and (c) Jobsite Schedule tasks dated today or earlier whose name, Sub or Contact field mentions
the contact's full name or firm name. Firm names are matched without "Inc", "LLC" etc., and very
generic firm names ("Studio", "Design") are never matched. Nothing is copied: it is recalculated on
every load, so schedule edits show up automatically.

Matching schedule tasks also appear on the Calendar tab (gray). There is no separate "From the schedule"
tab; it was removed at the owner's request.

Text boxes with suggestions (Who on events, Firm, How) use the page's own `typeahead()` list, not
`<datalist>`, because datalist suggestions don't appear inside the pop-up dialogs in some browsers.

## Trying it out

Open `index.html?demo` through a local web server: made-up contacts and schedule tasks in memory,
no sign-in, nothing saved. The shared top bar (`/nav.js`) comes from the bancroft-construction.github.io
repo, so serve that repo at the root to see it.

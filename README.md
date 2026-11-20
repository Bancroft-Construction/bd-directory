# Business Development Directory

Bancroft Construction's architect & designer directory, with a business development calendar, a priority
follow-up list, and last-contact dates picked up automatically from the Jobsite Schedule Board.

It has its **own password**, separate from the schedule board. Everyone signs in with it, then types
their name. The password is never stored in this repo.

## One-time setup (Supabase: the schedule board's project)

1. **Create the BD login.** Authentication → Users → Add user → Create new user:
   - Email: `bd-directory@bancroftconstruction.com` (must match `email` in `config.js`)
   - Password: the business development password
   - Tick **Auto Confirm User**
2. **Create the table.** SQL Editor → paste and run `supabase/setup.sql`.
3. **Recommended: keep the schedule read-only for the BD login.** SQL Editor → run
   `supabase/protect-schedule.sql`, then edit a task on the schedule board to check it still saves.
4. **Turn on GitHub Pages.** Repo → Settings → Pages → Source: *Deploy from a branch*, `main`, `/ (root)`.
5. **Import the master list.** Open the page, sign in, **Import list**, choose the Excel file, check the
   preview, click Import. The list itself is never uploaded to GitHub.

To change the password later: Authentication → Users → the BD user → Reset password / Update user.

## Using it

- **Priority follow-up:** priority contacts not reached in 30+ days (adjustable), or never.
- **Calendar:** month or week view of planned events (lunches, meetings, industry events), logged
  contacts, and Jobsite Schedule tasks that involve a directory contact. A planned event counts as
  contact with the people on it once its date has passed.
- **Directory:** search, filter, mark priority with ☆, edit, log a contact.
- **Export CSV** downloads the whole directory with last-contact dates.

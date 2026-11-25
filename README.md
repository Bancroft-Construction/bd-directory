# Business Development Directory

Bancroft Construction's architect & designer directory, with a business development calendar, a priority
follow-up list, and last-contact dates picked up automatically from the Jobsite Schedule Board.

It has its **own password**, separate from the Jobsite Schedule's: the Supabase login
`bd@bancroftconstruction.com`. Signing in to the other Bancroft tools does not open it. Everyone then
types their name. No password is stored in this repo.

## One-time setup (Supabase: the schedule board's project)

1. **Create the BD login.** Authentication → Users → Add user → Create new user: email
   `bd@bancroftconstruction.com`, a password of your choice, and tick **Auto Confirm User**.
2. **Create the table.** SQL Editor → paste and run `supabase/setup.sql`. Then run
   `jobsite-schedule/supabase/setup.sql` too, so the BD login can read the schedule but not change it.
3. **Import the master list.** Open the page, sign in, **Import list**, choose the Excel file, check the
   preview, click Import. The list itself is never uploaded to GitHub.

## Using it

- **Priority follow-up:** priority contacts not reached in 30+ days (adjustable), or never.
- **Calendar:** month or week view of planned events (lunches, meetings, industry events), logged
  contacts, and Jobsite Schedule tasks that involve a directory contact. A planned event counts as
  contact with the people on it once its date has passed.
- **Directory:** search, filter, mark priority with ☆, edit, log a contact.
- **Export CSV** downloads the whole directory with last-contact dates.

# Business Development Directory

Bancroft Construction's architect & designer directory, with a business development calendar, a priority
follow-up list, and last-contact dates picked up automatically from the Jobsite Schedule Board.

It uses the **Jobsite Schedule's sign-in**: same password, and signing in on any Bancroft tool signs you
in to all of them in that browser tab. Everyone then types their name. No password is stored in this repo.

## One-time setup (Supabase: the schedule board's project)

1. **Create the table.** SQL Editor → paste and run `supabase/setup.sql`.
2. **Import the master list.** Open the page, sign in, **Import list**, choose the Excel file, check the
   preview, click Import. The list itself is never uploaded to GitHub.

## Using it

- **Priority follow-up:** priority contacts not reached in 30+ days (adjustable), or never.
- **Calendar:** month or week view of planned events (lunches, meetings, industry events), logged
  contacts, and Jobsite Schedule tasks that involve a directory contact. A planned event counts as
  contact with the people on it once its date has passed.
- **Directory:** search, filter, mark priority with ☆, edit, log a contact.
- **Export CSV** downloads the whole directory with last-contact dates.

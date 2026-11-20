// Connection settings: the same Supabase project as the Jobsite Schedule Board, but its own login
// with its own password (see README). The anon key is meant to be public: the database only answers
// signed-in users, and the directory's table only answers this login (see supabase/setup.sql).
window.BD_CONFIG = {
  url: "https://inzfsmqqvpkrreypvciw.supabase.co",
  anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImluemZzbXFxdnBrcnJleXB2Y2l3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MTI2MjQsImV4cCI6MjEwMDM4ODYyNH0._6Y-jGkf4wv6cEL51mGCCnt2_SXN2cNglovdrHtkzQU",
  email: "bd-directory@bancroftconstruction.com" // the BD login's email; everyone signs in with its password
};

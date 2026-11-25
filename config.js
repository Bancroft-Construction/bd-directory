// Connection settings: the Jobsite Schedule Board's Supabase project, with a separate login used only
// by this directory (its password is not the schedule's). The anon key is meant to be public: the database only
// answers signed-in users (see supabase/setup.sql).
window.BD_CONFIG = {
  url: "https://inzfsmqqvpkrreypvciw.supabase.co",
  anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImluemZzbXFxdnBrcnJleXB2Y2l3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MTI2MjQsImV4cCI6MjEwMDM4ODYyNH0._6Y-jGkf4wv6cEL51mGCCnt2_SXN2cNglovdrHtkzQU",
  email: "bd@bancroftconstruction.com" // the Business Development login (Supabase → Authentication → Users); never put its password here
};

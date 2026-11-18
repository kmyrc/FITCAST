-- =====================================================================
-- Fitcast: reset someone's password (there's no reset email for usernames)
-- 1. Replace USERNAME and NEW_PASSWORD below (keep the quotes).
-- 2. Supabase → SQL Editor → paste → Run.
-- 3. Tell them their new password; they can sign in right away.
-- =====================================================================
update auth.users
set encrypted_password = extensions.crypt('NEW_PASSWORD', extensions.gen_salt('bf')),
    updated_at = now()
where email = lower('USERNAME') || '@users.fitcast.invalid';

-- Should say "1 row" affected. "0 rows" means that username doesn't exist.

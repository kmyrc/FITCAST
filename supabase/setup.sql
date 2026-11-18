-- =====================================================================
-- Fitcast: accounts + closet sync (Supabase)
-- Paste this whole file into Supabase → SQL Editor → New query → Run.
-- Safe to run more than once.
-- =====================================================================

-- 1) Closet items: one row per piece of clothing, owned by the signed-in user
create table if not exists public.closet_items (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name        text not null check (char_length(name) between 1 and 120),
  cat         text not null check (cat in ('top','outerwear','bottom')),
  warmth      smallint not null default 2 check (warmth between 1 and 3),
  waterproof  boolean not null default false,
  windproof   boolean not null default false,
  img_path    text,          -- cropped square photo in storage
  src_path    text,          -- uncropped photo (for re-cropping)
  view        jsonb,         -- crop position/zoom
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index if not exists closet_items_user_idx on public.closet_items(user_id);

-- Let signed-in users reach this table through the API (new projects don't expose tables automatically).
-- Signed-out visitors ("anon") get nothing. Row Level Security below still limits each user to their own rows.
grant select, insert, update, delete on public.closet_items to authenticated;
revoke all on public.closet_items from anon;

-- 2) Row Level Security: each person can only see and change their own items
alter table public.closet_items enable row level security;

drop policy if exists "closet: read own"   on public.closet_items;
drop policy if exists "closet: add own"    on public.closet_items;
drop policy if exists "closet: edit own"   on public.closet_items;
drop policy if exists "closet: delete own" on public.closet_items;

create policy "closet: read own"   on public.closet_items for select to authenticated using (user_id = auth.uid());
create policy "closet: add own"    on public.closet_items for insert to authenticated with check (user_id = auth.uid());
create policy "closet: edit own"   on public.closet_items for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "closet: delete own" on public.closet_items for delete to authenticated using (user_id = auth.uid());

-- 3) Photo storage: a private bucket; files live in a folder named after the user's id
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('closet', 'closet', false, 1048576, array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;

drop policy if exists "fitcast closet photos: read own"   on storage.objects;
drop policy if exists "fitcast closet photos: add own"    on storage.objects;
drop policy if exists "fitcast closet photos: edit own"   on storage.objects;
drop policy if exists "fitcast closet photos: delete own" on storage.objects;

create policy "fitcast closet photos: read own" on storage.objects for select to authenticated
  using (bucket_id = 'closet' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "fitcast closet photos: add own" on storage.objects for insert to authenticated
  with check (bucket_id = 'closet' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "fitcast closet photos: edit own" on storage.objects for update to authenticated
  using (bucket_id = 'closet' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'closet' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "fitcast closet photos: delete own" on storage.objects for delete to authenticated
  using (bucket_id = 'closet' and (storage.foldername(name))[1] = auth.uid()::text);

# FITCAST

fitskis based on weatherskis

What to wear for today's weather, and what to pack for a trip. By Royce Ju Young Kim.

- `index.html` is the whole app (one page, no build step).
- Weather and place search come from [Open-Meteo](https://open-meteo.com) (free for non-commercial use).
- Accounts and closet sync use Supabase (free plan). Database setup is in `supabase/setup.sql`. The key in `index.html` is the public (publishable) key; Row Level Security keeps each person's closet private. Never put the secret key in this repo.
- Accounts use usernames: each one is stored as `<username>@users.fitcast.invalid` (a reserved address that can't receive mail). There's no reset email; reset a password with `supabase/reset_password.sql`.
- Hosted on GitHub Pages at https://kmyrc.github.io/FITCAST/ — every push to `main` updates the live site.
- `.nojekyll` tells GitHub Pages to serve the files as-is.

## Versions

The version shows next to the title. Bump it in `index.html` (the `.ver` tag) with each update.

- **v2.5** (2026-11-18): grid column is just "Long sleeve" (crewneck dropped from the label).
- **v2.4** (2026-11-18): every "Maybe" label is white (only "Best" is dark).
- **v2.3** (2026-11-18): "Double layer" renamed back to "Coat".
- **v2.2** (2026-11-18): grid tops are Tank top, T-shirt, Long sleeve / Crewneck, Hoodie, Double layer; each trip location shows its best fit.
- **v2.1** (2026-11-18): sign in with a username + password instead of email.
- **v2.0** (2026-11-18): accounts. My closet is back, saved to your account and synced across devices (Supabase).
- **v1.3** (2026-11-17): trips can be up to 16 days long (note next to Trip length).
- **v1.2** (2026-11-17): fix tiny grid squares on iPhone; bigger Best/Maybe labels on phones.
- **v1.1** (2026-11-17): version label sits at the bottom of the title.
- **v1.0** (2026-11-17): first public release. Today tab with the tops × bottoms grid, For a trip tab with multiple locations and packing counts.

## Copyright

© 2026 Royce Ju Young Kim. All rights reserved.

This repository is public so the site can be hosted on GitHub Pages. That does not grant permission to copy, modify, or redistribute the code, design, or name. See `LICENSE`.

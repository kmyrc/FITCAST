# Fitcast ideas (not built yet)

Parked ideas, so nothing gets lost. Nothing here is live.

## Reference pool

A private mood board inside **My closet**. You upload outfit pictures you like (screenshots, saved posts), and Fitcast suggests outfits from **your own closet** that come closest, filtered by the weather.

**How it would work:** matching, not training. Fitcast figures out what's in each inspo photo and finds the nearest combo from your closet.

**Ways to do the matching (cheapest first):**
1. **Your own tags:** tag each inspo pic ("black puffer + grey hoodie + baggy jeans, streetwear") and match by tags. Free, but more work for the user.
2. **Automatic colors:** pull the main colors out of inspo photos and closet photos in the browser, then suggest the closest-colored combo. Free.
3. **AI photo reading:** an AI vision service describes each photo ("oversized black puffer, grey hoodie, light-wash wide jeans"). Best matches, small cost per photo, needs a small server function (e.g. a Supabase Edge Function) to keep the AI key secret.

**Things to decide first:**
- Keep each person's pool **private**. A shared/public pool raises copyright (photos belong to whoever took them) and moderation problems.
- Closet items would need a **color** field. Can be auto-filled from existing photos (option 2).
- Inspo photos share the free 1 GB of Supabase storage, so shrink them like closet photos.
- Decide whether Fitcast leads with **style** (reference pool) or **packing** (trips). They combine well: "pack outfits that match your style."

**Suggested order if built:** (1) private mood board with upload and crop → (2) automatic colors + "closest combo from your closet" → (3) optional AI photo reading.

## End-of-day check-in (My closet)

A quick check-in at the end of the day for signed-in users: "Today I wish I'd worn… **more layers / fewer layers / more covered / less covered** / it was right." Fitcast saves each answer with that day's weather and slowly shifts that person's temperature cutoffs, so suggestions fit how they actually run (always cold, always hot, etc.).

- Lives in **My closet**, since you're already signed in there.
- Needs a small new table (date, place, feels-like range, the fit Fitcast suggested, the answer).
- Pairs with the outfit archive ("what I actually wore") and the "I run cold / normal / hot" setting below. The check-in could set that automatically over time.

## Affiliate "fill the gap" picks

Recommend pieces the closet is missing for a trip or the weather (e.g. a rain jacket for a rainy trip) through affiliate links. Only worth it once Fitcast has regular users. Needs clear "I earn a commission" labels, Open-Meteo's commercial plan, Supabase's paid tier, a privacy policy and terms, and the income run through the business.

## Other ideas that came up

- **Personal packing system:** saved "always pack" essentials with simple rules (once per trip, per day, only if cold, only if rain, only for long trips), a checklist per trip, and an after-trip "used it / forgot it" review that tunes the next list.
- **"I run cold / normal / hot"** setting that shifts the temperature cutoffs.
- **Morning / afternoon / evening** breakdown instead of one fit for the whole day.
- **Password resets** for username accounts via a free email service, or keep using `supabase/reset_password.sql`.
- **Shorter, case-insensitive link:** a `kmyrc.github.io` redirect repo or a custom domain.
- **Sharing trip lists** with travel companions, and reminders before a trip (needs more backend; a good point to move to Claude Code).

# FITCAST

fitskis based on weatherskis

What to wear for today's weather, and what to pack for a trip. By Royce Ju Young Kim.

- `index.html` is the whole app (one page, no build step).
- Weather and place search come from [Open-Meteo](https://open-meteo.com) (free for non-commercial use).
- The "My closet" feature is still in the code, switched off. Set `const FEATURES = { closet: true }` in `index.html` to bring it back.
- Hosted on GitHub Pages at https://kmyrc.github.io/FITCAST/ — every push to `main` updates the live site.
- `.nojekyll` tells GitHub Pages to serve the files as-is.

## Versions

The version shows next to the title. Bump it in `index.html` (the `.ver` tag) with each update.

- **v1.3** (2026-11-17): trips can be up to 16 days long (note next to Trip length).
- **v1.2** (2026-11-17): fix tiny grid squares on iPhone; bigger Best/Maybe labels on phones.
- **v1.1** (2026-11-17): version label sits at the bottom of the title.
- **v1.0** (2026-11-17): first public release. Today tab with the tops × bottoms grid, For a trip tab with multiple locations and packing counts.

## Copyright

© 2026 Royce Ju Young Kim. All rights reserved.

This repository is public so the site can be hosted on GitHub Pages. That does not grant permission to copy, modify, or redistribute the code, design, or name. See `LICENSE`.

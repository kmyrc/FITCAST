# FITCAST

fitskis based on weatherskis

What to wear for today's weather, and what to pack for a trip. By Royce Ju Young Kim.

- `index.html` is the whole app (one page, no build step).
- Weather and place search come from [Open-Meteo](https://open-meteo.com) (free for non-commercial use).
- The "My closet" feature is still in the code, switched off. Set `const FEATURES = { closet: true }` in `index.html` to bring it back.
- Deployed on Netlify: every push to `main` updates the live site.

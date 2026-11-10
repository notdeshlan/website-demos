# Building a concept demo

## Folder and template

```bash
.claude/skills/local-lead-outreach/scripts/new_demo.sh "Business Name" trades|salon|practice
```

Creates `c/<slug>-<6 random hex>/index.html` from the closest existing concept and prints
the path and public URL. The random suffix keeps URLs unguessable (they're unlisted, not
secret). If the user wants a fresh look rather than a copy, build from scratch but keep
the same section structure and conventions.

Base templates (single self-contained HTML file, inline CSS/JS, Google Fonts only):

| Template | Based on | Sections |
|---|---|---|
| trades | `c/francis-the-plumber-*` | hero, services, quote form (job type, suburb, urgency, photos), areas covered, recent jobs, reviews, contact, sticky Call/WhatsApp bar |
| salon | `c/hadis-barber-*` | hero, service menu with prices, booking (service, stylist, day, slot), gallery, hours & map, WhatsApp |
| practice | `c/dr-kirshen-naidu-*` | hero, services, medical aids, appointment request (POPIA consent), hours, directions |

For other niches pick the nearest: quote-driven work → trades; appointment-driven → salon
or practice.

## Personalise — everything below must be specific to the lead

- `<title>`: `<Business Name> · Concept`
- Concept banner text: `<b>Concept design</b> prepared by Deshlan Pillay for <Business>.
  This is not the official website; wording, hours and services are samples to be confirmed.`
- Accent colour (`--accent` etc.) from their branding; otherwise a colour that suits the
  trade. Check text contrast on the accent (`--on-accent`).
- Monogram/initials in the hero art; don't hot-link or copy their photos/logos.
- Headline: answer the main review theme ("A plumber you can actually get hold of.").
- Services, prices, service areas, hours: use what they publish; fill gaps with plausible
  samples and label them ("Sample prices", "Sample hours, to be confirmed").
- `tel:` and `https://wa.me/` links use their real public number; Maps link uses their
  public address.
- Form JS constants (job types, areas, reference prefix `REF` = initials).
- Reviews: short paraphrased themes labelled as samples, first names or initials only.
  Don't present invented quotes as real customer reviews.
- Footer: business name + "Concept by Deshlan Pillay".

Search the file afterwards for leftovers from the source template:
```bash
grep -n -i "<old business name>\|<old phone digits>\|<old suburb>" c/<new>/index.html
```

## Must keep

- `<meta name="robots" content="noindex,nofollow">`
- Forms never submit anywhere — they show a confirmation state only.
- Works at 375–390px wide: no horizontal scroll, 16px+ side gutters, tap targets ≥ 44px,
  sticky mobile contact bar.
- `prefers-reduced-motion` respected; visible focus styles; labels on every field.
- Don't add it to the home page `index.html` (concepts are unlinked).

## Verify (Playwright is pre-installed)

```js
// node verify.js c/<slug>/index.html  — keep this script in the scratchpad
const { chromium } = require('playwright');
(async () => {
  const file = 'file://' + require('path').resolve(process.argv[2]);
  const b = await chromium.launch(); const errs = [];
  for (const [w, h] of [[390, 844], [1280, 800]]) {
    const p = await b.newPage({ viewport: { width: w, height: h } });
    p.on('pageerror', e => errs.push(e.message));
    p.on('console', m => m.type() === 'error' && errs.push(m.text()));
    await p.goto(file); await p.waitForTimeout(500);
    const overflow = await p.evaluate(() => document.documentElement.scrollWidth > innerWidth);
    console.log(w, 'overflow:', overflow);
    await p.screenshot({ path: `${process.env.OUT || '.'}/shot-${w}.png`, fullPage: true });
  }
  console.log('errors:', errs); await b.close();
})();
```

Look at the screenshots yourself (Read the PNG). Also fill and submit the form once and
confirm the success state appears.

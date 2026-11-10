# Finding and qualifying leads

## Where to look

Run several searches in one turn (WebSearch, mode "standard"; switch to "extended" if
results are thin). Useful query shapes:

- `<niche> <suburb>` and `<niche> near <suburb> <city>`
- `<niche> <suburb> facebook` — Facebook-only businesses are the best fits
- `<niche> <suburb> site:facebook.com`
- `best <niche> in <suburb> reviews`
- Directories: Google Maps listings, Snupit, Yellow Pages SA (yep.co.za), Brabys,
  Hellopeter, Booksy/Fresha (salons), Medpages (practices), local community groups.

Open promising results with WebFetch to read the listing: phone, email, website link,
rating, review count, hours, services, recent reviews.

Then check their web presence:
- No website link anywhere → strong lead.
- Website link → WebFetch it (or load with Playwright at 390px wide) and note: does it load,
  HTTPS, mobile layout, last-updated feel (copyright year, dead links), is there a way to
  book/request a quote, click-to-call/WhatsApp, Google Maps link.

## Scoring rubric (0–10)

| Signal | Points |
|---|---|
| No website (Facebook/Google listing only) | +4 |
| Website exists but broken, not mobile friendly, or clearly outdated | +3 |
| No online booking / quote request / WhatsApp button where it would help | +2 |
| 4.0+ rating with 15+ reviews (established, can afford it, cares about reputation) | +2 |
| Reviews mention being hard to reach, slow replies, confusion about prices/hours | +1 |
| Reachable public email or WhatsApp business number | +1 |
| Already has a modern, working site with booking | −5 (skip) |
| Franchise / chain / national brand (decisions made elsewhere) | −4 (skip) |
| Closed, no activity in 12+ months, or no contact route | skip |

Keep leads scoring 5+. Prefer a mix of niches so one template doesn't dominate.

## What to capture per lead

```
name:            trading name exactly as they use it
category:        trades | salon | practice | other (<what>)
suburb/address:  public business address or service area
phone/whatsapp:  in +27 format
email:           public business email, if any
web/social:      current site / Facebook / Instagram / Maps URLs
rating:          e.g. 4.7 (63 reviews)
services:        main services and any prices they publish
hours:           as listed
review themes:   2–3 short phrases (what customers praise / complain about)
hook:            the one specific observation the pitch will lead with
score:           n/10 with a one-line reason
```

Only public business details. Don't collect owners' personal social profiles, home
addresses, or personal numbers that aren't published for the business.

---
name: local-lead-outreach
description: Find local businesses that would benefit from a new website or simple system (booking, quote requests, WhatsApp ordering), build a personalised concept demo for each in this repo under c/<slug>-<hash>/, and draft the outreach email or WhatsApp message. Use when the user asks to find leads/prospects/clients, "find businesses in <area>", make demos or mock-ups for prospects, or write cold outreach for web design work.
---

# Local lead outreach

End-to-end pipeline for Deshlan's web-design prospecting:
**find leads → qualify → build a concept demo → draft the message → hand back a summary.**

The repo is published on GitHub Pages at `https://notdeshlan.github.io/website-demos/`.
Concept demos live at `c/<business-slug>-<6 hex>/index.html`; they are `noindex`, not linked
from the home page, and carry a "Concept design" banner. Keep to these conventions.

## 0. Get the brief (ask only what's missing)

- **Area** (suburb/city, e.g. "Centurion", "Menlo Park, Pretoria"). Required.
- **Niche(s)** — default mix: trades (plumbers, electricians, builders, glass/aluminium,
  handymen), salons/barbers, dental/medical practices. Other good fits: tutors, caterers,
  mechanics, cleaners, guesthouses, physios, vets, driving schools.
- **How many** leads (default 5).
- **Channel** — email, WhatsApp, or both (default: draft both; email goes to Gmail drafts).

## 1. Find and qualify leads

Follow `references/finding-leads.md`. In short:

1. Search the web (WebSearch, then WebFetch on directory/Maps/Facebook pages) for
   businesses in the niche + area.
2. **De-duplicate** before doing any work:
   - `ls c/` — a slug already there means a demo exists (already pitched or pending).
   - If Gmail tools are available, `search_threads` for the business name / email to
     catch anyone already contacted. Skip them unless the user says otherwise.
3. Score each candidate with the rubric in the reference (no site / broken site /
   Facebook-only / outdated, not mobile friendly, no booking or quote flow, good reviews,
   reachable contact). Keep the highest scorers.
4. Record only **public business information**: name, category, suburb/address, phone,
   WhatsApp, email, existing web/social links, rating & review count, hours, services,
   a few review themes. No personal data about staff beyond the trading name.

Present a short table of the shortlisted leads with the reason each was picked, then
continue straight into building unless the user asked to review the list first.

## 2. Build a concept demo per lead

Follow `references/demo-build.md`. In short:

1. Create the folder with `scripts/new_demo.sh "<Business Name>" <template>` — templates:
   `trades` (quote-request flow), `salon` (booking with stylist), `practice`
   (appointment request, medical aids). It copies the closest existing concept and
   prints the folder and public URL.
2. Rewrite the copy for this business: real name, real services, suburb and service areas,
   real phone/WhatsApp links, hours (marked as samples), a headline that speaks to the
   pain points in their reviews, review quotes paraphrased as samples (never invent
   named reviewers presented as real).
3. Pick an accent colour from their logo/signage/Facebook branding when visible.
4. Keep: `<meta name="robots" content="noindex,nofollow">`, the concept banner, forms that
   send nothing, sticky mobile Call/WhatsApp bar, light/dark readability, 16px gutters,
   no horizontal scroll at 375px.
5. Verify with Playwright: screenshot at 390px and 1280px, check for console errors and
   that the form shows its confirmation state. Fix anything broken.

## 3. Draft the message

Follow `references/outreach.md` for templates, tone and the compliance rules. Each draft:
- Names one specific thing you noticed (e.g. "you're only on Facebook", "your site doesn't
  load on phones", "customers in your reviews mention struggling to get hold of you").
- Links the concept demo URL.
- Makes one low-friction ask (a 10-minute call or "reply and I'll tailor it").
- Says who Deshlan is, how he got their details (public listing), and how to opt out.
- Email: create a **Gmail draft** with `create_draft` (load via ToolSearch
  `select:mcp__Gmail__create_draft`). **Never send** — the user sends it themselves.
- WhatsApp: produce the text plus a `https://wa.me/<number>?text=<urlencoded>` link.

## 4. Commit, push, report

1. `git add c/<new folders>` and commit: `Add concept demos for <N> <area> leads`.
   Push to the session's branch (GitHub Pages serves the default branch, so remind the user
   the demo links go live once merged).
2. Write `lead-report-<area>-<date>.md` to the scratchpad (not the repo — the repo is
   public) with, per lead: name, contact, score/why, demo URL, channel, Gmail draft id or
   WhatsApp link, and suggested follow-up date (+4 working days).
3. Reply with a compact table and the report path. Mention anything that needs the user's
   eyes (unsure contact details, a lead that already has a decent site, etc.).

## Guardrails

- Never send emails or messages yourself; drafts only.
- Never claim the demo is their official site, imply affiliation, or copy their logo/photos
  wholesale — use name, colour and monogram, and label content as samples.
- Don't fabricate reviews, certifications, prices or registrations as fact; mark samples.
- One approach per business. No follow-up beyond one polite nudge, and stop on any "no".
- Don't commit lead lists, notes or contact spreadsheets to this public repo.

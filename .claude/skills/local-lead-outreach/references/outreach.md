# Outreach messages

## Tone

- Short, local, human. Write like a neighbour who builds websites, not an agency.
- Lead with **one specific observation** about their business, then the demo link.
- One ask. No pressure, no fake urgency, no "limited spots", no price unless asked
  (pricing can go in the report for the user).
- South African English spelling; plain words; no emojis in email (one is fine on WhatsApp).
- Email: 90–140 words. WhatsApp: 50–80 words.

## Compliance (POPIA s69 / ECTA — not legal advice)

Unsolicited electronic direct marketing in South Africa is limited: you may approach a
business **once** to ask whether they're interested, using contact details they publish
for the business, and every message must identify the sender and give an easy opt-out.
So each draft must:
- say who's writing and where the details were found ("your listing on Google Maps");
- end with an opt-out ("If this isn't for you, just reply 'no' and I won't contact you again.");
- not be sent again after no reply beyond **one** gentle follow-up, and never after a "no".

## Email template

Subject options (pick the most specific):
- `A website idea for <Business>`
- `Made this for <Business> — quick look?`
- `<Business>: online <bookings/quote requests> mock-up`

```
Hi <Business> team,

I'm Deshlan, a web developer based in <area>. I came across <Business> on <source> —
<specific compliment from reviews, e.g. "63 reviews at 4.8 stars is impressive">.

<Hook: one observation, e.g. "I noticed you don't have a website yet, so customers have
to message on Facebook to ask about prices and availability.">

So I put together a quick concept of what a site for you could look like, with
<key feature: online booking / a quote form where customers send photos of the job /
WhatsApp button>:

<demo URL>

It works best on your phone. Everything in it can be changed — your own photos, prices
and wording would replace the samples.

If you like the direction, I'd be happy to chat for 10 minutes about what would help
most. If it's not for you, just reply "no" and I won't contact you again.

Kind regards,
Deshlan Pillay
Web developer · <phone> · https://notdeshlan.github.io/website-demos/
```

## WhatsApp template

```
Hi, this is Deshlan, a web developer in <area>. I saw <Business> on <source> and
noticed <hook>. I made a free concept website for you to look at: <demo URL>
If you'd like something like this, I'm happy to chat. If not, no worries, just
say so and I won't message again.
```

Build the click-to-send link: `https://wa.me/<number digits, no +>?text=<encodeURIComponent(text)>`.

## Follow-up (once, after ~4 working days, only if no reply)

```
Hi <Business>, just checking you saw the concept I sent last week: <demo URL>.
Happy to adjust it if you'd like. If not, no problem, I won't follow up again.
```

## Gmail drafts

Load with ToolSearch `select:mcp__Gmail__create_draft,mcp__Gmail__search_threads`.
- Before drafting, `search_threads` for the business name and email to avoid double contact.
- `create_draft` with `to`, `subject`, plain-text `body`. Record the draft id in the report.
- Never call `send_message`. The user reviews and sends.

## Pricing notes (for the report, not the first message)

Offer tiers the user can quote if they reply, e.g. one-page site; multi-page site with
booking/quote form; site + system (bookings with reminders, job tracking, WhatsApp
catalogue). Leave amounts to the user unless they've given their rates.

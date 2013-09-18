(This project is in development and not ready for general consumption yet, stay
tuned!)

# Capuchin

Capuchin is a tool for writing email newsletters. It allows you to write content in 
Markdown and send or schedule the resulting campaign via the MailChimp API.

You can think of Capuchin as "Jekyll for email newsletters".

If you want fancy HTML you probably want to stick to MailChimp's WYSIWYG editor, but
for a newsletter where the primary content is text (and some links) give Capuchin
a shot.

# Usage

The directory structure is as follows:

```
.
├── .env
├── _config.yml
└── _emails
    ├── 2013-09-01-selling-software-products.md
    └── 2013-09-08-creating-value-as-a-consultant.md
```

# Commands

* `capuchin build` processes all emails in `_emails` and output them to 
`_newsletter` for you to preview
* `capuchin schedule _emails/PATH_TO_EMAIL.md` will process the input email, and 
schedule it for MailChimp delivery based on the date in the YAML front-matter 
(defaults to the date in the filename)
* `capuchin send _emails/PATH_TO_EMAIL.md` will process the input email and then
send it out immediately.

# Configuration

Set your MailChimp API key (You can see your API keys here) in `.env`. 

DO NOT CHECK THIS INTO SOURCE CODE IF YOUR REPOSITORY IS PUBLICLY ACCESSIBLE!!

```
MAILCHIMP_API_KEY=your-mailchimp-key
```

Specify Capuchin configuration in `_config.yml`

```
capuchin:
  from_email: "you@example.com"
  from_name: "Joe Cool"
  list_name: "Joe's List"
  delivery_time: 8:30
```

# Example email
Given a file `_emails\2013-09-01-selling-software-products.md` with these
contents (and the same configuration as above):

```
---
subject: Selling Software Products
date: 2013-09-01
---

This is an email about how to sell software!

```

Run `capuchin schedule _emails\2013-09-01-selling-software-products.md` to schedule
this campaign in MailChimp to be sent on 2013-09-01 at 8:30am to all members of 
"Joe's List" with a Subject of "Selling Software Products".

# Colophon
A capuchin monkey are New World monkeys of the subfamily Cebinae. They are 
considered the most intelligent New World monkeys, known especially for their
long-term tool usage and social structures. Capuchin monkeys are sometimes referred
to as "nature's butlers" because of their historic use as service animals.




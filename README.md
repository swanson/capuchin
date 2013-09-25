# Capuchin

[![Gem Version](https://badge.fury.io/rb/capuchin.png)](http://badge.fury.io/rb/capuchin)
[![Build Status](https://travis-ci.org/swanson/capuchin.png)](https://travis-ci.org/swanson/capuchin)
[![Dependency Status](https://gemnasium.com/swanson/capuchin.png)](https://gemnasium.com/swanson/capuchin)


Capuchin is a tool for writing email newsletters. It allows you to write content in 
Markdown and schedule the resulting campaign for delivery via the MailChimp API.

You can think of Capuchin as "Jekyll for email newsletters".

If you want fancy HTML you probably want to stick to MailChimp's WYSIWYG editor, but
for a newsletter where the primary content is text (and some links) give Capuchin
a shot.

## Installation

You don't need to add it to your Gemfile - it's best kept as a system-wide gem. All you need to do is install it from the command line:

    $ gem install capuchin

This installs the command line tool `capuchin`.

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

* `capuchin new PATH` will scaffold the directory structure in PATH 
* `capuchin create "Email Subject"` will generate a Markdown email file with the
provided subject

* `capuchin schedule _emails/PATH_TO_EMAIL.md` will process the input email, and 
schedule it for MailChimp delivery based on the date in the YAML front-matter 
(defaults to the date in the filename)

# Templating
Capuchin leverages MailChimps templating system (instead of doing templating 
locally). To have your content inserted into your email, make sure your template
has `mc:edit="main"` in it.

You need to set the template ID from MailChimp in `_config.yml` (see below).

# Configuration

Set your MailChimp API key (You can see your API keys here) in the `.env` file. 

DO NOT CHECK THIS INTO SOURCE CODE IF YOUR REPOSITORY IS PUBLICLY ACCESSIBLE!!

```
MAILCHIMP_API_KEY=your-mailchimp-key
```

Specify Capuchin configuration in `_config.yml`

```
capuchin:
  from_email: "you@example.com"
  from_name: "Joe Cool"
  list_id: "ee90847678"
  template_id: 71337
  delivery_time: "08:30:00"
```

# Example email
Given a file `_emails\2013-09-01-selling-software-products.md` with these
contents (and the same configuration as above):

```
---
subject: Selling Software Products
---

This is an email about how to sell software!

```

Run `capuchin schedule _emails\2013-09-01-selling-software-products.md` to schedule
this campaign in MailChimp to be sent on 2013-09-01 at 8:30am to all members of 
the list with a Subject of "Selling Software Products".

# Colophon
A capuchin monkey are New World monkeys of the subfamily Cebinae. They are 
considered the most intelligent New World monkeys, known especially for their
long-term tool usage and social structures. Capuchin monkeys are sometimes referred
to as "nature's butlers" because of their historic use as service animals.

# Contact
Matt Swanson, [mdswanson.com](http://mdswanson.com) [@_swanson](http://twitter.com/_swanson)

# License
MIT




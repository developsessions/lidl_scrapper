# Lidl Scrapper

[![Build](https://github.com/developsessions/lidl_scrapper/actions/workflows/build.yml/badge.svg)](https://github.com/developsessions/lidl_scrapper/actions/workflows/build.yml)
[![Docker Pulls](https://badgen.net/docker/pulls/developsessions/lidl_scrapper?icon=docker&label=pulls)](https://hub.docker.com/r/developsessions/lidl_scrapper/)
[![Docker Stars](https://badgen.net/docker/stars/developsessions/lidl_scrapper?icon=docker&label=stars)](https://hub.docker.com/r/developsessions/lidl_scrapper/)
[![Docker Image Size](https://badgen.net/docker/size/developsessions/lidl_scrapper?icon=docker&label=image%20size)](https://hub.docker.com/r/developsessions/lidl_scrapper/)

The Lidl Scrapper checks in a configurable interval if the product with the given URL is available, if it is available, it sends an email to a configurable mail address.

## Docker

There are also Lidl Scrapper [Docker](https://hub.docker.com/r/developsessions/lidl_scrapper/) images available.
We can easily configurate all options via docker environment variables.
Currently only GMail as Mailer is supported.

Here is a list of all variables:

### Environment Variables

| Variable                  | Example value                    | Description                                                                |
|---------------------------|----------------------------------|----------------------------------------------------------------------------|
| SCRAPPER_URL              | https://www.lidl.de/p/p100332026 | The URL of the Lidl product to check                                       |
| SCRAPPER_PRODUCT_NAME     | Backautomat                      | Optionally a name for the product which is used on console and in the mail |
| SCRAPPER_SMTP_USER        | sender@gmail.com                 | The mail login, normally the sender mail address                           |
| SCRAPPER_SMTP_PASSWORD    | password                         | The password for the sender mail account                                   |
| SCRAPPER_SMTP_MAIL        | sender@gmail.com                 | The sender mail address                                                    |
| SCRAPPER_MAIL_TO          | receiver@gmail.com               | The receiver mail address if a product is available                        |
| SCRAPPER_CRON             | 0 * * * *                        | The cron pattern, a good ressource is https://crontab.guru                 |

---

<a href="https://www.buymeacoffee.com/developsessions" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-1.svg" alt="Buy Me A Coffee" height="41" width="174"></a>
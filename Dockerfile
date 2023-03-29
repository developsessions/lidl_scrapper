FROM node
LABEL maintainer="developsessions1@gmail.com"

RUN apt-get update && apt-get install -y cron

COPY /app/ /app/
RUN cd app && npm install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root

ENV SCRAPPER_URL="https://www.lidl.de/p/p100332026"
ENV SCRAPPER_PRODUCT_NAME="Backautomat"
ENV SCRAPPER_SMTP_USER="sender@gmail.com"
ENV SCRAPPER_SMTP_PASSWORD="password"
ENV SCRAPPER_SMTP_MAIL="sender@gmail.com"
ENV SCRAPPER_MAIL_TO="receiver@gmail.com"
ENV SCRAPPER_CRON="0 * * * *"

ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="Lidl scrapper"
LABEL org.label-schema.description="A Lidl scrapper which sends an notification via email if a product is available again in the Lidl onlineshop"
LABEL org.label-schema.url="https://github.com/developsessions"
LABEL org.label-schema.vcs-url="https://github.com/developsessions/lidl_scrapper"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="WSO2"
LABEL org.label-schema.version=$BUILD_VERSION

ENTRYPOINT [ "/entrypoint.sh" ]

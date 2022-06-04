FROM jekyll/builder:4.2.2 AS build

ENV JEKYLL_ENV: production

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mkdir public && \
    bundle install && \
    bundle exec jekyll build --disable-disk-cache -d public


FROM nginx:1.22.0-alpine

COPY --from=build /usr/src/app/public/ /usr/share/nginx/html/

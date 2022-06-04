FROM jekyll/jekyll:4.2.2 AS build

ENV JEKYLL_ENV: production

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN bundle install && \
    bundle exec jekyll build -d public


FROM nginx:1.22.0-alpine

COPY --from=build /usr/src/app/public/ /usr/share/nginx/html/

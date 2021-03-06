FROM ruby:3.1.2 as build

ENV JEKYLL_ENV=production

WORKDIR /usr/src/app

COPY . .

RUN bundle install && \
    bundle exec jekyll build -d public


FROM nginx:1.22.0-alpine

COPY --from=build /usr/src/app/public/ /usr/share/nginx/html/

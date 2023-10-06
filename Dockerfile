FROM oven/bun:1 AS build

WORKDIR /assets

COPY . .

RUN bun install --no-progress

RUN bun sass:compile --no-source-map --style=compressed

FROM nginx:1.25

WORKDIR /usr/share/nginx/html

COPY --from=build /assets/style.css .

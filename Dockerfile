FROM node:alpine3.23 AS base
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

FROM base AS dep
USER root:root
RUN mkdir -p /tmp/app \
    && chown -R appuser:appgroup /tmp/app
USER appuser:appgroup
WORKDIR /tmp/app
COPY --chown=appuser:appgroup package.json package-lock.json ./
RUN npm ci

COPY --chown=appuser:appgroup . .
RUN npm run build
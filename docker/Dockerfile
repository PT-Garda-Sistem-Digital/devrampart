FROM node:20.11.1-alpine3.19 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20.11.1-alpine3.19 AS runner
WORKDIR /app
ENV NODE_ENV=production HOST=0.0.0.0 PORT=3000
RUN addgroup -g 1001 -S nodejs && adduser -u 1001 -S nuxtjs -G nodejs
COPY --from=builder --chown=nuxtjs:nodejs /app/.output ./.output
COPY --from=builder --chown=nuxtjs:nodejs /app/docker/entrypoint.sh ./docker/entrypoint.sh
RUN chmod +x ./docker/entrypoint.sh
USER nuxtjs
EXPOSE 3000
ENTRYPOINT ["./docker/entrypoint.sh"]
CMD ["node", ".output/server/index.mjs"]
FROM node:10-alpine

RUN apk add --no-cache git
RUN yarn global add concurrently
RUN yarn config set workspaces-experimental true

COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

WORKDIR /app

ENTRYPOINT ["sh", "/entrypoint.sh"]
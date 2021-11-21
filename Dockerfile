FROM node:latest as build_Foo


WORKDIR /usr/src/app
COPY package*.json ./
COPY tsconfig.json ./
RUN yarn 
COPY ./src ./src
RUN yarn build

#################################################################################

FROM node:17-alpine3.12

COPY --from=build_Foo /usr/src/app /usr/src/app
WORKDIR /usr/src/app
EXPOSE 8080
CMD yarn start

# RUN apk add --no-cache git
# RUN yarn global add concurrently
# RUN yarn config set workspaces-experimental true

# COPY ./entrypoint.sh /

# RUN chmod +x /entrypoint.sh

# WORKDIR /app

# ENTRYPOINT ["sh", "/entrypoint.sh"]
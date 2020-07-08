FROM node:14-buster as build
WORKDIR /project
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i

COPY helloworld.ts helloworld.ts
RUN npm run-script build

FROM scratch as export
COPY --from=build /project/dist/helloworld.js helloworld.js

FROM node:14-buster-slim as runtime
COPY --from=build /project/dist/helloworld.js helloworld.js
CMD ["node", "helloworld.js"]

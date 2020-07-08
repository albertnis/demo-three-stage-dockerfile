FROM node:14-buster as build
WORKDIR /project
COPY package.json .
COPY package-lock.json .
RUN npm i

COPY helloworld.ts .
RUN ["npm", "run-script", "build"]

FROM scratch as export
COPY --from=build /project/dist/helloworld.js .

FROM node:14-buster-slim as runtime
COPY --from=build /project/dist/helloworld.js .
ENTRYPOINT ["node", "helloworld.js"]

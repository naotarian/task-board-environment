# environment/frontend/Dockerfile

FROM node:18
WORKDIR /app

# build.context: ../src/frontend になっているので、相対パスは不要
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . ./

EXPOSE 3000
CMD ["yarn", "dev"]

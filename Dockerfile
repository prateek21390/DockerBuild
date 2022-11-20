
# syntax = prateek6678/buildfast:v1.0
FROM node:16-alpine As builder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm install
COPY package.json .
COPY app.json .
# RUN npm install 
COPY . .
EXPOSE 5000
CMD [ "node", "index.js" ]


# FROM builder
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# COPY package.json .
# COPY app.json .
# # RUN npm install 
# COPY . .
# EXPOSE 4000
# CMD [ "node", "index2.js" ]

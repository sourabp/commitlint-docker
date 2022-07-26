FROM node:18-alpine

USER root

WORKDIR /home/appuser/

RUN npm install --global @commitlint/config-conventional @commitlint/cli \
    && echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js \
    && apk add git

RUN chown -R node:node /home/appuser

USER node

COPY --chown=node:node entrypoint.sh .
RUN chmod +x entrypoint.sh

ENV COMMITLINT_CONFIG_PATH=/home/appuser/commitlint.config.js

ENTRYPOINT [ "./entrypoint.sh"]
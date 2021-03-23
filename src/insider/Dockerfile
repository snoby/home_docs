FROM python:3.8.7-alpine3.12 as intermediate

# install git

RUN apk upgrade --update-cache -a && apk add --no-cache \
    git \
    git-fast-import \
    openssh
# add credentials on build
# don't worry we squash the build so the key will not be
# maintained.
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

# make sure the domain to github is accpeted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com  >> /root/.ssh/known_hosts
RUN chmod 0400 /root/.ssh/id_rsa

# Now clone the private repo
RUN git clone git@github.com:snoby/mkdocs-material-insiders.git

FROM python:3.8.7-alpine3.12
# copy  the repository from the previous image
COPY --from=intermediate /mkdocs-material-insiders /tmp/mkdocs-material-insiders

ARG WITH_PLUGINS=true

# Environment variables
ENV PACKAGES=/usr/local/lib/python3.8/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

# Set build directory
WORKDIR /tmp/mkdocs-material-insiders


# Perform build and cleanup artifacts and caches
RUN                                                     \
    apk upgrade --update-cache -a &&                    \
    apk add --no-cache                                  \
    git                                                 \
    git-fast-import                                     \
    openssh                                             \
    && apk add --no-cache --virtual .build gcc musl-dev \
    && pip install --no-cache-dir .                     \
    &&                                                  \
    if [ "${WITH_PLUGINS}" = "true" ]; then             \
    pip install --no-cache-dir                          \
    mkdocs-minify-plugin>=0.3"                          \
    mkdocs-redirects>=1.0"                              \
    mkdocs-mermaid2-plugin                              \
    mkdocs-awesome-pages-plugin                         \
    mkdocs-img2fig-plugin ;                             \
    fi                                                  \
    && apk del .build gcc musl-dev \
    && \
    for theme in mkdocs readthedocs; do \
    rm -rf ${PACKAGES}/mkdocs/themes/$theme; \
    ln -s \
    ${PACKAGES}/material \
    ${PACKAGES}/mkdocs/themes/$theme; \
    done \
    && rm -rf /tmp/* /root/.cache \
    && \
    find ${PACKAGES} \
    -type f \
    -path "*/__pycache__/*" \
    -exec rm -f {} \;

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]

# Stage 1, load the project on a clean pharo image
FROM basmalltalk/docker-pharo:7.0-image as imagebuilder

# Used during load-project.st
ARG BRANCH_NAME=master

USER root
WORKDIR /opt/pharo

COPY load-project.st .
RUN chown -R pharo:pharo /opt/pharo
RUN pharo Pharo.image load-project.st --save --quit


# Stage 2, start from a clean image
FROM basmalltalk/docker-pharo:7.0

USER root
WORKDIR /opt/bookstore

COPY start.sh .
COPY --from=imagebuilder /opt/pharo/Pharo.image .
COPY --from=imagebuilder /opt/pharo/Pharo.changes .
COPY --from=imagebuilder /opt/pharo/Pharo*.sources .

RUN set -eux;
  && mkdir logs \
  && chown -R pharo /opt/bookstore \
  && chmod u+x start.sh \
  ;

USER pharo

CMD ["./start.sh"]

FROM basmalltalk/docker-pharo:6.1-image as imagebuilder

USER root
WORKDIR /opt/pharo

# Stage 1, load the project on a clean pharo image
COPY load-project.st .
RUN chown -R pharo:pharo /opt/pharo
USER pharo
RUN ./pharo Pharo.image st load-project.st

# Stage 2, start from a clean image
FROM basmalltalk/docker-pharo:6.1

USER root
WORKDIR /opt/bookstore

# Copy image and changes from previous stage
COPY --from=imagebuilder /opt/pharo/Pharo.image .
COPY --from=imagebuilder /opt/pharo/Pharo.changes .

RUN mkdir logs
RUN chown -R pharo:pharo /opt/bookstore

USER pharo

CMD ["/opt/pharo/pharo", "Pharo.image", "start-book-store", "--port=44444", "--bind-address=0.0.0.0" ]

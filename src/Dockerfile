FROM python:3.7
RUN mkdir /docs
WORKDIR /docs

RUN pip install mkdocs
RUN pip install mkdocs-material

EXPOSE 8080
# Can just pass in build to make it build
ENTRYPOINT ["mkdocs"]

# nothing passed in will start the development server
CMD ["serve" "--dev-addr=0.0.0.0:8080"]

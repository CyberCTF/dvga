# Upstream's Dockerfile (app/Dockerfile) with two changes: the sources are copied from app/, and
# WEB_HOST=0.0.0.0 is baked in (upstream's README passes it to `docker run`; the app otherwise
# listens on 127.0.0.1 only).
FROM python:3.10

LABEL description="Damn Vulnerable GraphQL Application"
LABEL github="https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application"
LABEL maintainers="Dolev Farhi & Nick Aleks"

ARG TARGET_FOLDER=/opt/dvga
WORKDIR $TARGET_FOLDER/

RUN apt install curl git

RUN useradd dvga -m 
RUN chown dvga. $TARGET_FOLDER/
USER dvga

RUN python -m venv venv
RUN . venv/bin/activate
RUN pip3 install --user --upgrade pip --no-warn-script-location --disable-pip-version-check

ADD --chown=dvga:dvga app/core /opt/dvga/core
ADD --chown=dvga:dvga app/db /opt/dvga/db
ADD --chown=dvga:dvga app/static /opt/dvga/static
ADD --chown=dvga:dvga app/templates /opt/dvga/templates

COPY --chown=dvga:dvga app/app.py /opt/dvga
COPY --chown=dvga:dvga app/config.py /opt/dvga
COPY --chown=dvga:dvga app/setup.py /opt/dvga/
COPY --chown=dvga:dvga app/version.py /opt/dvga/
COPY --chown=dvga:dvga app/requirements.txt /opt/dvga/

RUN pip3 install -r requirements.txt --user --no-warn-script-location
RUN python setup.py

ENV WEB_HOST=0.0.0.0

EXPOSE 5013/tcp
CMD ["python", "app.py"]

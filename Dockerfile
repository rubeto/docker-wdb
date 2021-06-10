FROM python:3.7-slim-buster

RUN set -eux; \
    apt-get update \
    # Install build dependencies
    && apt-get install -y --no-install-recommends gcc python3-dev \
    # Install wdb server
    && pip install wdb.server==3.3.0 \
    # Remove build packages
    && apt-get remove -y gcc python3-dev \
    && apt-get autoremove -y \
    # Remove unnecessary build temporary files including pip cache
    && rm -rf /var/lib/apt/lists/* ~/.cache/pip

EXPOSE 19840
EXPOSE 1984

CMD ["wdb.server.py", "--detached_session"]
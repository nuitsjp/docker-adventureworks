FROM microsoft/mssql-server-linux:latest
LABEL maintainer="nuits.jp@live.jp"

COPY AdventureWorks-oltp-install-script/ /work/
RUN /bin/bash /work/setup.sh && \
    rm -rf /work

EXPOSE 8080

CMD /opt/mssql/bin/sqlservr
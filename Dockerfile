FROM metabase/metabase:v0.46.5
COPY docker-entrypoint.sh /app/
RUN ["chmod", "+x", "/app/docker-entrypoint.sh"]
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
FROM cnosuke/ruby22-base
MAINTAINER cnosuke

RUN apt-get update
RUN apt-get install -y mysql-client libmysqlclient-dev
RUN mkdir -p /app /data /app/log /app/tmp
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN cd /app && bundle install --without development test --deployment --quiet

ADD app /app/app
ADD bin /app/bin
ADD config /app/config
ADD lib /app/lib
COPY config.ru /app/
COPY Rakefile /app/
COPY Schemafile /app/
COPY run_on_docker.sh /app/
COPY dot_env /app/.env
COPY database.yml.prod /app/config/database.yml

EXPOSE 8080
CMD ["/app/run_on_docker.sh"]

# How to run
# docker run --link mariadb:mysql -p 8090:8080 -e SECRET_KEY_BASE=aaaa -d cnosuke/furoshiki

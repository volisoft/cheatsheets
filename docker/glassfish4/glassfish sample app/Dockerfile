#https://github.com/reap/docker-glassfish3

FROM glassfish_4_1:latest

MAINTAINER voli <voli>

COPY glassfish.passwords /glassfish.passwords
COPY create_domain.sh /
COPY start.sh /
RUN chmod +x /*.sh

RUN /create_domain.sh app_domain

ENV APP_FILE=app.war
COPY program-course-versioner/target/$APP_FILE /


# 4848 (administration), 8080 (HTTP listener), 8181 (HTTPS listener)
#EXPOSE 4848 4880 4881

ENTRYPOINT ["/start.sh"]

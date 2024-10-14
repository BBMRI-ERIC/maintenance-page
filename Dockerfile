FROM bitnami/nginx:1.27.2
WORKDIR /app
COPY index.html .
COPY nginx.conf /opt/bitnami/nginx/conf/server_blocks/maintenance.conf
COPY start.sh .
USER 0
RUN chmod -R g+rwx /app
USER 1001
CMD ["./start.sh"]
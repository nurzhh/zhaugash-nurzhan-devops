FROM alpine:3.22

WORKDIR /app

COPY app/student_app.sh /app/student_app.sh
COPY Zhaugash_Nurzhan_info.txt /app/Zhaugash_Nurzhan_info.txt

RUN chmod +x /app/student_app.sh \
    && addgroup -S devops \
    && adduser -S -G devops devops \
    && chown -R devops:devops /app

USER devops

EXPOSE 8080

CMD ["/app/student_app.sh"]

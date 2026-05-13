FROM nginx:alpine

# 核心步骤：强制修改 Nginx 配置，指定全局字符集为 UTF-8
RUN sed -i 's/charset  koi8-r;/charset utf-8;/g' /etc/nginx/conf.d/default.conf

# 将你的网页复制进去
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

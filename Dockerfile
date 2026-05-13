FROM nginx:alpine

# 1. 强制修改 Nginx 配置，解决中文乱码问题
RUN sed -i 's/charset  koi8-r;/charset utf-8;/g' /etc/nginx/conf.d/default.conf

# 2. 强制 Nginx 监听 8080 端口（匹配 SnapDeploy 的默认检测端口）
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# 3. 将网页和健康检查文件复制到服务器目录
COPY index.html /usr/share/nginx/html/index.html
COPY health /usr/share/nginx/html/health

# 声明容器使用 8080 端口
EXPOSE 8080

FROM ubuntu:latest

# 安装 Python（用于启动简单的 HTTP 服务）
RUN apt-get update && apt-get install -y python3 && rm -rf /var/lib/apt/lists/*

# 持续运行一个简单的 Web 服务
CMD ["python3", "-m", "http.server", "8080"]
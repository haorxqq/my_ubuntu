FROM ubuntu:latest

# 安装 Python 和 JupyterLab
RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install jupyterlab && \
    ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /workspace

# 启动 JupyterLab（无密码、无 token，方便访问）
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

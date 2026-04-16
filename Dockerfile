FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# 创建虚拟环境并安装 jupyterlab
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install jupyterlab

# 创建软链接（可选）
RUN ln -s /usr/bin/python3 /usr/bin/python || true

WORKDIR /workspace

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

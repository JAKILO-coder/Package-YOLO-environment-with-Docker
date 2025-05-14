FROM python:3.10-slim

# 安装必要依赖（更小镜像）
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements_clean.txt .

# 安装 Python 依赖（CPU版torch）
RUN pip install --upgrade pip && \
    pip install --no-cache-dir torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements_clean.txt && \
    pip install --no-cache-dir ultralytics[cpu] && \
    rm -rf /root/.cache /tmp/*

COPY . /app

CMD ["python", "app.py"]

FROM python:3.11-slim

ARG UID=1000
ARG GID=1000
ARG USERNAME=pyuser
ARG GROUPNAME=pygroup

ENV TZ=Asia/Tokyo
ENV VENV_PATH=/opt/venv
ENV PATH="${VENV_PATH}/bin:/home/${USERNAME}/.local/bin:$PATH"

# パッケージのインストール + 日本語ロケールの有効化
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    default-libmysqlclient-dev \
    pkg-config \
    curl \
    locales \
 && echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen \
 && update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja LC_ALL=ja_JP.UTF-8 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# 非rootユーザーを作成
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

# 仮想環境の作成
RUN python -m venv $VENV_PATH
RUN chown -R $UID:$GID /opt/venv

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

USER $USERNAME

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

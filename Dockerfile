FROM python:3.10-slim

# Sistema + herramientas
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# AWS CLI
RUN pip install awscli

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Carpeta de trabajo
WORKDIR /workspace

# Dependencias Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Puerto Jupyter
EXPOSE 8888

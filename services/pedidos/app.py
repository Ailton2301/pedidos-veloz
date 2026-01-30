from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return f"Serviço {os.getenv('SERVICE_NAME')} rodando"

@app.route("/health")
def health():
    return "OK"

app.run(host="0.0.0.0", port=8080)

import os
from flask import Flask, send_from_directory

app = Flask(__name__)

@app.route('/')
def index():
    # Klasördeki index.html'i ana sayfa yapar
    return send_from_directory('.', 'index.html')

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(host='0.0.0.0', port=port)

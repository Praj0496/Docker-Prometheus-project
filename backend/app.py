from flask import Flask, jsonify, send_from_directory
import os

app = Flask(__name__, static_folder='static')

# Serve React App
@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path != "" and os.path.exists(os.path.join(app.static_folder, path)):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder, 'index.html')

# Example API endpoint
@app.route('/api/hello', methods=['GET'])
def hello():
    return jsonify(message="Hello, world!")

if __name__ == '__main__':
    app.run(debug=True)

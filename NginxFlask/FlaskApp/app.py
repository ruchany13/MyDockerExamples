from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hey, we have Flask in a Docker Container"

if __name__ =='__main__':
    app.run(debug=True, host='0.0.0.0')

from flask import jsonify, Flask

app = Flask(__name__)


#The reason to use jsonify() over a regular json.dumps() is that jsonify() sets 
# the Content-Type HTTP header to application/json. Whereas the output of json.dumps() 
# is just plain text.
@app.route("/")
def Hi():
    return "This is ochuko"


@app.route("/tree", methods=["GET"])
def get_tree():
    tree = { "myFavoriteTree": "Malus Domestica"}
    return  jsonify (tree)



if __name__ == "__main__":
    app.debug = True
    app.run(host="0.0.0.0", port=5000)



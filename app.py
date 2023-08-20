#!/usr/bin/env python
"""
Web application to present my CV
"""
import json
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def cv_page():
    """
    Push json data in the html file
    """
    with open('data/skills/skills.json', encoding="utf-8") as json_file:
        skills = json.load(json_file)
    with open('data/experience/last_experience.json', encoding="utf-8") as json_file:
        last_experience = json.load(json_file)
    return render_template('cv.html', skills=skills, last_experience=last_experience)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

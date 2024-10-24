#!/usr/bin/env python
"""
uwsgi server to host the cv Web application
"""
from app import app

if __name__ == "__main__":
    app.run()

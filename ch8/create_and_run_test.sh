#/bin/bash
cd identidock
docker build -t identidock .
#docker run identidock python tests.py
docker run -e ENV=UNIT identidock 

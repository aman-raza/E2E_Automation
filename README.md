# E-commerce API Robot Framework tests


Run locally:
1. Start your e-commerce API at ${BASE_URL}
2. pip install -r requirements.txt
3. robot --outputdir reports tests/suites


In Jenkins: use the Jenkinsfile in jenkins/ to run the pipeline.

optional: Docker custom image to include extra libraries

Install dependencies on a virtual envirunment, so that it doesn't affect the globals
python3 -m venv {name}
source {name}/bin/activate
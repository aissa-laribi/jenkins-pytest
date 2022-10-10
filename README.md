# Jenkins-pytest image

This image is based on Ubuntu and is designed to run tests using the Pytest framework in a Jenkins pipeline. As result, the size of the image does not matter otherwise Alpine would have been chosen

### Dependencies

Dependencies added over the original Ubuntu:latest image as described in build-image.sh file.

- Python 3 latest version

- Git

- Pip

- Pytest

## Usage example

```
pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'python:2-alpine'
                }
            }
            steps {
                sh 'python -m py_compile test_file.py'
                stash(name: 'compiled-results', includes: '*.py*')
            }
        }
        stage('Test') { 
            agent {
                docker {
                    image 'aissalaribi/jenkins-pytest' 
                }
            }
            steps {
                sh 'py.test --verbose --junit-xml test-reports/results.xml test_file.py' 
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
    }
}
```

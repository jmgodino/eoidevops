pipeline  {
  agent any
  environment {
	dockerRegistry="jmgodino/eoidockerpython"
	dockerCredentials="dockerhub"
	projectVersion="1.0"
	gitRepository="https://github.com/jmgodino/eoidevops"
  }

stages {
  stage('clean') {
	steps {
		cleanWs()
	}
  }
  stage('checkout') {
	steps{
		script {
			git branch: 'main',
			url: gitRepository
		}
	}
  }
  stage('build') {
	steps {
		script {
			dockerImage=docker.build dockerRegistry
		}
	}
  }
  stage('test') {
	steps {

			sh 'docker run $dockerRegistry'

	}
  }
  stage('deploy') {
	steps {
		script {
		    docker.withRegistry('',dockerCredentials) {
			    dockerImage.push()
		    }
		}
	}
  }
}

  post{
	failure {
     	echo 'El pipeline ha fallado'
    }
  }
}

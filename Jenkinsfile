pipeline {
  agent any
  parameters {
    // only qa-1 for now
    choice name: 'ENV', choices: ["qa-1"], description: "Define which environment to deploy."
    booleanParam name: 'RELEASE', defaultValue: false, description: 'Do a release'
  }
  stages {
    stage("Test") {
      steps {
        script {
          sh "docker build . --target test"
        }
      }
    }

    stage("Build") {
      steps {
        script {
          sh "docker build . -t ${env.GIT_COMMIT}-builder --target build"
          sh "docker cp \$(docker create ${env.GIT_COMMIT}-builder -q):/app/build ./build"
        }
      }
    }
  }
}

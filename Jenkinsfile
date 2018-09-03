#!groovy
#test

env.GIT_REPO='https://github.com/dipsatch/test-app.git'
env.VERSION='0.0.1.' + env.BUILD_NUMBER + '.' + env.BRANCH_NAME + '-SNAPSHOT'

node {
  try {
    stage 'Checkout'
    git branch: env.BRANCH_NAME, url: env.GIT_REPO

    stage 'Building'
    withMaven() {
        sh 'mvn versions:set -DnewVersion=$VERSION'
        sh 'mvn compile'
    }

    stage 'Run K8s'
    sh 'kubectl get pods'
  } catch(Exception e){
      throw e;
  }
}
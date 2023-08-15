pipeline {
	
    agent any
	environment {
   mvnHome = tool 'maven-3.9.2'
   dockerImage=""
dockerImageTag = "devopsexamplenew${env.BUILD_NUMBER}"
		 dockerHome = tool 'MyDocker' 
		  NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "10.12.1.254:8081"
        NEXUS_REPOSITORY = "jarwarrepo"
        NEXUS_CREDENTIAL_ID = "nexus-user-credentials"
}
    parameters {
        booleanParam(name: "BUILD_FOR_PRODUCTION", defaultValue: false, description: "Check if it's for prod")
        choice(name: "BUILD_LANGUAGE", choices: ["JAVA", "NET", "PHP"] ,description: "Choose your techno, for dev please set default value in your commited file")
        string(name: "USERNAME", defaultValue: "ebouchebel", trim: true, description: "db")
      	password(name: "PASSWORD", defaultValue: "root", description: "db")
         booleanParam(name: "RUN_SONNAR", defaultValue: false, description: "run sonar or not")
	     string(name: "DOCKER_IMAGE_NAME", defaultValue: "imagetest", trim: true, description: "selectdockerimage")
	     booleanParam(name: "CHECK_TEST", defaultValue: false, description: "Check if test is ok or not")
	    
 	
    }
    stages {
        stage("Build Prod") {
		when {
                expression { 
                   return params.BUILD_FOR_PRODUCTION == true
                }
            }
            steps {
		
		git 'https://github.com/EmilBC/PipeLine1Test.git'
		
		    
                echo "Build stage Prod."
		    script {
               if (params.BUILD_LANGUAGE==""){
		       if(params.CHECK_TEST==false){
		sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
		       }else{
			    sh "'${mvnHome}/bin/mvn' -B  clean package"   
		       }
		       echo "Build stage Prod. java" 
		} else {
		    echo "Build stage Prod. " 
		}
		    }
            }
	}
	      stage("Build Prod Dev") {
	when {
                expression { 
                  return params.BUILD_FOR_PRODUCTION == false
                }
            }
		 steps {
		
		git 'https://github.com/EmilBC/PipeLine1Test.git'
                echo "Build stage Dev"
         script{      
 if(params.CHECK_TEST==false){
		bat "${mvnHome}\\bin\\mvn.cmd -B -DskipTests clean package"
		       }else{
			 bat "${mvnHome}\\bin\\mvn.cmd -B  clean package"   
		       }
	 }
            }
        }







	    
    }
    
}

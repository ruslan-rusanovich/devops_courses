### Pipeline

pipeline {
    agent {
        node {
            label 'win-agent'
        }
    }
    stages {
        stage('Run bat script') {
            steps {
                script {
                    bat '''dir
                    call my_script.bat'''
                }
            }
        }
    }

}

### Output

Started by user admin
Restarted from build #2, stage Run bat script
[Pipeline] Start of Pipeline
[Pipeline] node
Running on win-agent in C:\Jenkins\workspace\win_task
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Run bat script)
[Pipeline] script
[Pipeline] {
[Pipeline] bat

jenkins@WIN-SKNPNOFR8P6 C:\Jenkins\workspace\win_task>dir
 Volume in drive C has no label.
 Volume Serial Number is 2285-C066

 Directory of C:\Jenkins\workspace\win_task

03/15/2025  09:27 AM    <DIR>          .
03/15/2025  09:27 AM    <DIR>          ..
03/15/2025  09:25 AM                90 my_script.bat
               1 File(s)             90 bytes
               2 Dir(s)  22,551,093,248 bytes free

jenkins@WIN-SKNPNOFR8P6 C:\Jenkins\workspace\win_task>call my_script.bat 
Welcome to batch scripting!
Press any key to continue . . . 
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

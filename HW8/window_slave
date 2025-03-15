# Подключаем windows slave

### На стороне слэйва

1. Скачал и создал новую VM Windows Server 2019
2. Скачал и установил java от oracle (понадобился vpn для заведения учётки)
3. Обновил env-path до java
4. Докачал и активировал openSSH
5. Настроил C:\Programdata\ssh\sshd_config:
  - раскомментил PubkeyAuthentication yes
  - раскомментил PasswordAuthentication yes
6. Создал нового юзера jenkins
7. Создал папку C:\Jenkins

### На стороне master

1. Завёл новые креды для винды (логин/пароль)
2. Создал новый нод с подключением по ssh и новыми кредами
3. Запустил windows-slave:

<pre>
SSHLauncher{host='192.168.0.105', port=22, credentialsId='windows_ssh_password', jvmOptions='', javaPath='', prefixStartSlaveCmd='', suffixStartSlaveCmd='', launchTimeoutSeconds=60, maxNumRetries=10, retryWaitTime=15, sshHostKeyVerificationStrategy=hudson.plugins.sshslaves.verifiers.ManuallyTrustedKeyVerificationStrategy, tcpNoDelay=true, trackCredentials=true}
[03/15/25 18:49:51] [SSH] Opening SSH connection to 192.168.0.105:22.
No route to host
SSH Connection failed with IOException: "No route to host", retrying in 15 seconds. There are 10 more retries left.
Connection refused
SSH Connection failed with IOException: "Connection refused", retrying in 15 seconds. There are 9 more retries left.
[03/15/25 18:50:37] [SSH] SSH host key matches key seen previously for this host. Connection will be allowed.
[03/15/25 18:50:37] [SSH] Authentication successful.
[03/15/25 18:50:37] [SSH] The remote user's environment is:
ALLUSERSPROFILE=C:\ProgramData
APPDATA=C:\Users\jenkins\AppData\Roaming
CommonProgramFiles=C:\Program Files\Common Files
CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files
CommonProgramW6432=C:\Program Files\Common Files
COMPUTERNAME=WIN-SKNPNOFR8P6
ComSpec=C:\Windows\system32\cmd.exe
DriverData=C:\Windows\System32\Drivers\DriverData
HOME=C:\Users\jenkins
HOMEDRIVE=C:
HOMEPATH=\Users\jenkins
JAVA_HOME=C:\Program Files\Java\jdk-23
LOCALAPPDATA=C:\Users\jenkins\AppData\Local
LOGNAME=jenkins
NUMBER_OF_PROCESSORS=4
OS=Windows_NT
Path=C:\Program Files\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\Java\jdk-23\bin;C:\Windows\system32\config\systemprofile\AppData\Local\Microsoft\WindowsApps;C:\Users\jenkins\AppData\Local\Microsoft\WindowsApps;
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC
PROCESSOR_ARCHITECTURE=AMD64
PROCESSOR_IDENTIFIER=AMD64 Family 25 Model 80 Stepping 0, AuthenticAMD
PROCESSOR_LEVEL=25
PROCESSOR_REVISION=5000
ProgramData=C:\ProgramData
ProgramFiles=C:\Program Files
ProgramFiles(x86)=C:\Program Files (x86)
ProgramW6432=C:\Program Files
PROMPT=jenkins@WIN-SKNPNOFR8P6 $P$G
PSModulePath=C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules
PUBLIC=C:\Users\Public
SHELL=c:\windows\system32\cmd.exe
SSH_CLIENT=192.168.0.106 54810 22
SSH_CONNECTION=192.168.0.106 54810 192.168.0.105 22
SystemDrive=C:
SystemRoot=C:\Windows
TEMP=C:\Users\jenkins\AppData\Local\Temp
TMP=C:\Users\jenkins\AppData\Local\Temp
USER=jenkins
USERDOMAIN=WORKGROUP
USERNAME=jenkins
USERPROFILE=C:\Users\jenkins
windir=C:\Windows
[03/15/25 18:50:37] [SSH] Starting sftp client.
[03/15/25 18:50:38] [SSH] Copying latest remoting.jar...
Source agent hash is A2E96D08000E53966B4B8F68E4999483. Installed agent hash is A2E96D08000E53966B4B8F68E4999483
Verified agent jar. No update is necessary.
Expanded the channel window size to 4MB
[03/15/25 18:50:38] [SSH] Starting agent process: cd "C:\Jenkins" && java  -jar remoting.jar -workDir C:\Jenkins -jar-cache C:\Jenkins/remoting/jarCache
Mar 15, 2025 8:50:43 AM org.jenkinsci.remoting.engine.WorkDirManager initializeWorkDir
INFO: Using C:\Jenkins\remoting as a remoting work directory
Mar 15, 2025 8:50:43 AM org.jenkinsci.remoting.engine.WorkDirManager setupLogging
INFO: Both error and output logs will be printed to C:\Jenkins\remoting
WARNING: Are you running agent from an interactive console?
If so, you are probably using it incorrectly.
See https://wiki.jenkins.io/display/JENKINS/Launching+agent+from+console
<===[JENKINS REMOTING CAPACITY]===>channel started
Remoting version: 3283.v92c105e0f819
Launcher: SSHLauncher
Communication Protocol: Standard in/out
This is a Windows agent
Agent successfully connected and online
</pre>

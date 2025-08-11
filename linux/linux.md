- $ --> noramal user
- # root user --> root used can be used to peroform all actions
- sudo su - or sudo -i  # it used to used to switch form normal user to root user
- pwd # present working directory
- cd  # it is used to change the directory
- cd .. # it is used to go back to the directory
- cd ../../.. # is is used to go back to the three directories
- cd ~  # it used to swith to home directory of the user
- su - pavan  # it is used switch to the pavan user
## Following ways we are using to create file
```
## - 1) cat 
       cat is used to read the file and create and oppendn the files
       cat > filename
        write text
        ctrl+d
       cat >> filename   # to  openthe file
   - 2) vi or vim
       vim filename
       :wq!
   - 3) echo 
       echo "this is hanu" > filename
   - 4) touch 
       touch file
```
-  Note: touch is used to create the empty file and update the timestamp of the file
- rm   # it used to remove the file with asking user permission
- rm -rf # it is used to remove the file with out asking user permission
- rm -rf *   # it used to remove the all files and directories in the present working directory

## create directories and remove the directories

- mkdir direcotry  # create a dirctory
- mkdir -p hanu/hanu1/hanu2/hanu3  # it used to create directory and sub directories
- rmdir directory  # to remvoe the empty directory
- rm -rf directory # to remvoe the dorectory which has some files and sub directories

## copy the files and directories form one place to other place
- cp sourcepath destinationpath  # to copy the files form one place to other palce
- cp -r  sourcepath destinationpath   # to copy directories form one place to other palce
```
cp -r hanu /tmp
cp -r /root/hanu /opt
cp -r /root/hanu .
```
---
# move the files and directories with below commands
```
mv hanu /tmp
mv /root/hanu /opt
mv /root/hanu .
```

## file permissions and directory permission
- r -4
- w -2
- x -1
 
  ```
   -rw-   r--    r--. 1    root   root    0 May 27 06:12 mhr.txt
  owner  group  others    owner  group 
  420    400    400
   6      4      4 
  ```


- drwx   r-x    r-x. 2     root root 57 May 28 05:13 hanu
  owner  group   others     owner  group 
  421    401     401
   7     5       5
- 644 # default permission for the file
- 755 # default permission for the directory
- chmod  --> it is used to change the file permissions
- chown  ---> it is used to change the owner of file

 ## How to add execution permission to the file
- -rw-  r--  r--. 1 root root 0 May 27 06:06 mhr.txt
  chmod +x mhr.txt
## How to add only write  permission to the file
- chmod +w mhr.txt
# how to provide permission for folder and subfolders
- chmod -R 777 ramesh

## How to remove execution and write  permission to the file
- -rwx  r-x r-x. 1 root root 0 May 27 06:06 mhr.txt
- chmod -x mhr.txt
- chmod +x mhr.txt
- chown username:groupname  directory   # it used to change own of the ramesh directory only
- chown -R username:groupname directory #  it used to change own of the ramesh directory and sub directories as well
  ```
  chown hanu:hanu  ramesh
  chown -R hanu:hanu remesh
  ```
# create user in linux server and login into the server
- step1
 - useradd hanu # this command is used to added into the server
 - passwd hanu  # set password for the above user
- step2
 - uncommnet the "PubkeyAuthentication yes" in /etc/ssh/sshd_config file
 ```
 vim /etc/ssh/sshd_config
 PubkeyAuthentication yes
 ```
- step3 
  - ssh hanu@192.168.10.0 # connect the server with this commnad
 
# types of web servers
  - nginx
  - httpd

## how to install web server

- yum install httpd -y # to install web server package
- systemctl start httpd # to start the httpd service
- systemctl status httpd # to check the status of the httpd server
- systemctl enable httpd  # to enable the httpd server
- /var/www/html is default direcotry of httpd web server. no need to create this path when we have installed httpd server then automatically it got created
- create index.html in /var/www/html and write some data
- add 80 port in the securrity group of ec2 instance
# how to check the httpd web logs
- /var/log/httpd  # it default location for storing httpd logs
   - error_log  # it stores error logs
   - access_log # it stores access logs
- tail -f /var/log/httpd/access_log  # to check the running logs
- head -5 access_log # to display first five lines
- tail -1- access_log # to display the last 10 lines
-  ps -aux  # to list the all process in the server
-  ps -ef | grep httpd  # it is used to find the process id of the httpd service
-  kill -9 processid  # it is used to kill the process

# vim
- command mode # it is default mode. 
  - gg # shift to the top of the page
  - G # shift to the botoom of the page
  - dd # delete present ( where cursor locate)
  - 2dd  # delete two lines form the cursor postion
  - 3yy # copy the three lines to the downwards from cursor postion
  - p # it used to past line which ever copy early
  - u # undo the previous changes

- insermode 
   - if write any thing or modify the existing file we can use insert mode
   - i  # press i to insert at curosor poistion
   - o #  press o to insert at below the cursor postion
- execution mode
   - use ESC buttom to shift from insertmode to command mode
   - Press : to shift form commmode to execution
   - it is used to save the file
   - w # it is used to save the file
   - wq # it is used to save and quit
   - q!  # quit with out saving the data forcefully
   - : se number # to assign the numbers
  
  # grep
  - grep commdn is used to gerp the words form  the file and directories
  - grep hanu demo.txt
  - grep -i hanu demo.txt # it is display hanu word in the file
  - grep  -i hanu /opt # it is display hanu word in the /opt directory
  - grep -v hanu demo.txt  # it display all lines in the file except hanu word
# find
 - find /  -type f  -name demo.txt  # it used to search the demo.txt file in root location
 - find /home -type f -name demo.txt # it used to search the demo.txt file in /home location
 - find /  -type d  -name httpd  # it is used to search the httpd directory in root location
 - find /  -type f -perm 644  # it is used to search files based on the file permission
 - find / -type d -perm 755  # it is used to search directories based on the file permission
 - find /home  -type d -mtime +5 # is is used to search file based last modifed date(example 5 days)

 # Linux Commands
 ```
 1)  pwd
 2)  cd -
 3)  cd ..
 4)  cd ../..
 5)  cd ~
 6)  ls 
 7)  ls -lrt
 8)  ls -lart
 9)  mkdir hanu
 10) mkdir -p ram/ram1/ram2
 11) rmdir hanu
 12) touch test.txt
 13) touch text{1..100}.txt
 14) rm -rf test.txt
 15) cat ramesh.txt
 16) cat ramesh.txt ctrl+D
 17) chmod 755 ramesh.txt
 18) chmod +x ramesh.txt
 19) chmod -x ramesh.txt
 20) useradd suresh
 21) passwd suresh
 22) chown suresh:suresh ramesh.txt
 23) chmod -R 777 ram
 24) chown -R suresh:suresh ram
 25) cp ramesh.txt /opt
 26) cp -r ram /opt
 27) mv ramesh.txt new_ramesh.txt
 28) su - suresh
 29) exit
 30) sudo su -
 31) yum install httpd
 32) yum list httpd
 33) yum remove httpd
 34) systemctl start httpd
 35) systemctl enable httpd
 36) systemctl stop httpd
 37) systemctl restart httpd
 38) tail -f /var/log/messages
 39) tail -10 /var/log/messages
 40) head -10 /var/log/messages
 41) ps -aux
 42) kill -9 PSID
 43) top
 44) uptime
 45) free -m
 46) uname
 47) ifconfig
 48) hostname
 49) ping www.google.com
 50) df -h
 51) du -sh
 52) lsblk
 53) wget
 54) curl
 55) netstat -ntlp
 56) traceroute
 57) ssh user@ipaddress
 58) scp filename user@ipaddress:/opt
 59) whoami
 60) who
 61) 
 ```







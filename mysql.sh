echo disabling module mysql
dnf module disable mysql -y
echo $?

echo copying mysql repo into repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo
echo $?

echo Installing mysql
dnf install mysql-community-server -y
echo $?

echo enabling and restarting mysql
systemctl enable mysqld
systemctl start mysqld
echo $?

echo mysql installation
mysql_secure_installation --set-root-pass Sriharsha@1
echo $?
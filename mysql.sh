source common.sh

echo disabling module mysql
dnf module disable mysql -y  &>> $expense_log
status_check

echo copying mysql repo into repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo  &>> $expense_log
status_check

echo Installing mysql
dnf install mysql-community-server -y  &>> $expense_log
status_check

echo enabling and restarting mysql
systemctl enable mysqld  &>> $expense_log
systemctl start mysqld   &>> $expense_log
status_check

echo mysql installation
mysql_secure_installation --set-root-pass Sriharsha@1  &>> $expense_log
status_check
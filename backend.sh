source common.sh
component=backend

echo disabling nodejs module
dnf module disable nodejs -y   &>> $expense.log
status_check

echo enabling nodejs module
dnf module enable nodejs:18 -y &>> $expense.log
status_check

echo Installing nodejs
dnf install nodejs -y          &>> $expense.log
status_check

echo creating backend service file
cp $component.service /etc/systemd/system/$component.service   &>> $expense.log
status_check
 
echo creating user
useradd Sri  &>> $expense.log
id Sri
if [ $? -ne 0 ];
then
useradd Sri &>> $expense.log
fi
status_check

echo removing app directory
rm -rf /app  &>> $expense.log
status_check

echo creating and go to the app directory
mkdir /app   &>> $expense.log
cd /app  &>> $expense.log
status_check

download_extract

echo install dependencies
npm install  &>> $expense.log
status_check

echo enabling and restarting backend
systemctl daemon-reload  &>> $expense.log
systemctl enable backend  &>> $expense.log
systemctl start backend   &>> $expense.log
status_check

echo install mysql client
dnf install mysql -y      &>> $expense.log
status_check

echo load schema
mysql_password=$1
mysql -h mysql.sriharsha.shop -uroot -p$mysql_password < /app/schema/backend.sql   &>> $expense.log
status_check
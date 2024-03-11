source common.sh
component=backend

echo disabling nodejs module
dnf module disable nodejs -y   >> $expense.log
status_check

echo enabling nodejs module
dnf module enable nodejs:18 -y >> $expense.log
status_check

echo Installing nodejs
dnf install nodejs -y          >> $expense.log
status_check

echo creating backend service file
cp $component.service /etc/systemd/system/$component.service   >> $expense.log
status_check
 
echo creating user
useradd Sri  >> $expense.log
status_check

echo removing app directory
rm -rf /app  >> $expense.log
status_check

echo creating app directory
mkdir /app   >> $expense.log
status_check

download_extract

echo go to app directory and install dependencies
cd /app  >> $expense.log
npm install  >> $expense.log
status_check

echo enabling and restarting backend
systemctl daemon-reload  >> $expense.log
systemctl enable backend  >> $expense.log
systemctl start backend   >> $expense.log
status_check

echo install mysql client
dnf install mysql -y      >> $expense.log
status_check

echo load schema
mysql -h frontend.sriharsha.shop -uroot -pSriharsha@1 < /app/schema/backend.sql   >> $expense.log
status_check
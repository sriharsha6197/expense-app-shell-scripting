source common.sh
component=backend

echo disabling nodejs module
dnf module disable nodejs -y   >> $expense.log

echo enabling nodejs module
dnf module enable nodejs:18 -y >> $expense.log

echo Installing nodejs
dnf install nodejs -y          >> $expense.log

echo creating backend service file
cp $component.service /etc/systemd/system/$component.service   >> $expense.log
 
echo creating user
useradd Sri  >> $expense.log

echo removing app directory
rm -rf /app  >> $expense.log

echo creating app directory
mkdir /app   >> $expense.log

download_extract

echo go to app directory and install dependencies
cd /app  >> $expense.log
npm install  >> $expense.log

echo enabling and restarting backend
systemctl daemon-reload  >> $expense.log
systemctl enable backend  >> $expense.log
systemctl start backend   >> $expense.log

echo install mysql client
dnf install mysql -y      >> $expense.log

echo load schema
mysql -h frontend.sriharsha.shop -uroot -pSriharsha@1 < /app/schema/backend.sql   >> $expense.log
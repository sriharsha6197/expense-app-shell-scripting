dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

cp backend.service /etc/systemd/system/backend.service

useradd Sri

mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
unzip -d /app /tmp/backend.zip

cd /app
npm install

systemctl daemon-reload

systemctl enable backend
systemctl start backend

dnf install mysql -y
mysql -h 172.31.85.229 -uroot -pSriharsha@1 < /app/schema/backend.sql
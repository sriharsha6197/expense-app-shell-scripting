dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

useradd Sri

mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
unzip -d /app /tmp/backend.zip

npm install /app

cp backend.service /etc/systemd/systemd/backend.service

systemctl daemon-reload

systemctl enable backend
systemctl start backend

dnf install mysql -y
mysql -h 172.31.80.105 -uroot -pSriharsha@1 < /app/schema/backend.sql
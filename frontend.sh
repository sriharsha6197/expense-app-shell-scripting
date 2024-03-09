dnf install nginx -y

systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

unzip -d /usr/share/nginx/html /tmp/frontend.zip 

cp expense.conf /etc/nginx/default.d/expense.conf

systemctl restart nginx
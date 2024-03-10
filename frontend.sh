dnf install nginx -y >> /tmp/expense.log

systemctl enable nginx  >> /tmp/access.log
systemctl start nginx  >> /tmp/access.log

rm -rf /usr/share/nginx/html/*  >> /tmp/access.log

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> /tmp/access.log
unzip -d /usr/share/nginx/html /tmp/frontend.zip >> /tmp/access.log 

cp expense.conf /etc/nginx/default.d/expense.conf >> /tmp/access.log

systemctl restart nginx >> /tmp/access.log
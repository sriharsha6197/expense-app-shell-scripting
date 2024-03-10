echo Installing nginx
dnf install nginx -y >> /tmp/expense.log

echo removing old content
rm -rf /usr/share/nginx/html/*  >> /tmp/access.log

echo download and extract
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> /tmp/access.log
unzip -d /usr/share/nginx/html /tmp/frontend.zip >> /tmp/access.log 

echo copy content into expense configuration
cp expense.conf /etc/nginx/default.d/expense.conf >> /tmp/access.log

echo enabling and restarting nginx
systemctl enable nginx  >> /tmp/access.log
systemctl start nginx  >> /tmp/access.log
systemctl restart nginx >> /tmp/access.log
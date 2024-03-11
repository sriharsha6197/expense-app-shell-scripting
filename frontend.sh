source common.sh
component=frontend

echo Installing nginx
dnf install nginx -y >> $expense_log
status_check

echo copy content into expense configuration
cp expense.conf /etc/nginx/default.d/expense.conf >> $expense_log
status_check

echo removing old content
rm -rf /usr/share/nginx/html/*  >> $expense_log
status_check

cd /usr/share/nginx/html
echo download and extract
download_extract

echo enabling and restarting nginx
systemctl enable nginx  >> $expense_log
systemctl start nginx  >> $expense_log
systemctl restart nginx >> $expense_log
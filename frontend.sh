source common.sh

echo Installing nginx
dnf install nginx -y >> $expense_log

echo removing old content
rm -rf /usr/share/nginx/html/*  >> $expense_log

echo download and extract
download_extract

echo copy content into expense configuration
cp expense.conf /etc/nginx/default.d/expense.conf >> $expense_log

echo enabling and restarting nginx
systemctl enable nginx  >> $expense_log
systemctl start nginx  >> $expense_log
systemctl restart nginx >> $expense_log
source common.sh
component=frontend

echo Installing nginx
dnf install nginx -y >> $expense_log
if[ $? -eq 0 ]
then
echo -e "\e[32mSUCCESS\e[0m"
else
echo -e "\e[31mFAILURE\e[0m"
fi

echo removing old content
rm -rf /usr/share/nginx/html/*  >> $expense_log
echo $?

echo download and extract
download_extract

echo copy content into expense configuration
cp expense.conf /etc/nginx/default.d/expense.conf >> $expense_log
echo $?

echo enabling and restarting nginx
systemctl enable nginx  >> $expense_log
systemctl start nginx  >> $expense_log
systemctl restart nginx >> $expense_log
expense_log=/tmp/expense.log

download_extract(){
echo download content
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $expense_log
if [ $? -eq 0 ];
then
echo -e "\e[32mSUCCESS\e[0m"
else
echo -e "\e[31mFAILURE\e[0m"
fi

echo extract code
unzip -d /usr/share/nginx/html /tmp/$component.zip >> $expense_log
if [ $? -eq 0 ];
then
echo -e "\e[32mSUCCESS\e[0m"
else
echo -e "\e[31mFAILURE\e[0m"
fi
}

status_check(){
if [ $? -eq 0 ];
then
echo -e "\e[32mSUCCESS\e[0m"
else
echo -e "\e[31mFAILURE\e[0m"
fi
}
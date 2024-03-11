expense_log=/tmp/expense.log

download_extract(){
echo download content
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $expense_log
echo $?

echo extract code
unzip -d /usr/share/nginx/html /tmp/$component.zip >> $expense_log
echo $?
}
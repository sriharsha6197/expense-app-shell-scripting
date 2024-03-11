expense_log=/tmp/expense.log

download_extract(){
echo download content
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> $expense_log
echo extract code
unzip -d /usr/share/nginx/html /tmp/frontend.zip >> $expense_log
}
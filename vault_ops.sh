#!/bin/bash

while true
do
    echo "1. Add Secret"
    echo "2. Update Secret" 
    echo "3. Add Log"
    echo "4. Access Keys"
    echo "5. Exit"
    read choice

case $choice in
1)
    echo "Secret:"
    read secret
    echo $secret >> secrets.txt
    echo "Added"
    ;;
2)
    echo "Old secret:"
    read old
    echo "New secret:"
    read new
    grep "$old" secrets.txt && sed -i "s/$old/$new/g" secrets.txt && echo "Updated" || echo "No match"
    ;;
3)
    echo "Log:"
    read log
    date >> logs.txt
    echo $log >> logs.txt
    echo "Logged"
    ;;
4)
    echo "ACCESS DENIED  "
    ;;
5)
    echo "Bye"
exit

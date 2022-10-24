#! /bin/bash

source fun.sh

Login () {
    clear
    echo "*******Libary********"
    echo -n "Username: "
    read name
    echo -n "Password: "
    read pass

    local un=`awk -F ':' '$1=="username"{print $2}' user.txt`
    local pa=`awk -F ':' '$1=="password"{print $2}' user.txt`

    if [ $un == $name ] && [ $pa == $pass ]
        then
            return 0
    else
        return 1
    fi
}

Menu () {
    while true
    do
        clear
        echo "*********Libary*********"
        echo "       1.ShowAll        "
        echo "       2.Search         "
        echo "       3.AddNew         "
        echo "       4.Delete         "
        echo "       5.Exit           "
        echo "************************"
        echo -n ">> "
        read opNum

        case $opNum in
        1)
            ShowAll
        ;;
        2)
            Search
        ;;
        3)
            AddNew
        ;;
        4)
            Delete
        ;;
        5)
            break
        ;;
        esac
    done
}

Main () {
    Login
    if [ $? -eq 0 ]
        then
            Menu
    else
        echo "Error User or Password"
    fi
}

Main

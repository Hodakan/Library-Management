ShowAll () {
    echo 'BookName    Author      Price'
    awk '{printf "%-12s%-12s%-12s\n", $1, $2, $3}' Book.txt
    read local t
    return 0
}

Search () {
    echo -n "Bookname: "
    read bookName
    echo 'BookName    Author      Price'
    awk '{if($1=="'$bookName'"){ printf "%-12s%-12s%-12s\n", $1, $2, $3 }}' Book.txt
    read local t
    return 0
}

AddNew () {
    echo -n "Bookname: "
    read bkn
    echo -n "Author: "
    read ath
    echo -n "Price: "
    read pce

    local info=$bkn" "$ath" "$pce
    echo $info >> Book.txt
    echo "Add \"$bkn\" successfully"
    read local t
    return 0   
}

Delete () {
    echo -n "Bookname: "
    read bkn

    sed -i "/^$bkn/d" Book.txt
    echo "Delete \"$bkn\" successfully"
    read local txt
    return 0
}

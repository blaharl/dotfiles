IFS=$'\n'
case "$1" in
  "e" | "each")
    for j in $(find . -mindepth 1 -maxdepth 1 -type d)
    do
      i=${j/.\//} 
      cd $i
      echo -n "$(pwd)/ "
      chksum=($(find . -type f -exec md5sum {} + | LC_ALL=C sort | md5sum))
      chksum=($(echo $chksum | sed 's/\s.*//'))
      echo $chksum
      cd ..
      (echo "$(pwd)/$i/ $chksum") >> ~/chksum.log
    done

    for j in $(find . -mindepth 1 -maxdepth 1 -type f)
    do
      i=${j/.\//} 
      echo -n "$(pwd)/$i "
      chksum=($(md5sum $i))
      chksum=($(echo $chksum | sed 's/\s.*//'))
      echo $chksum
      (echo "$(pwd)/$i $chksum") >> ~/chksum.log
    done
    ;;

  "f" | "full")
    chksum=($(find . -type f -exec md5sum {} + | LC_ALL=C sort | md5sum))
    chksum=($(echo $chksum | sed 's/\s.*//'))
    echo "$(pwd) $chksum"
    (echo "$(pwd) $chksum") >> ~/chksum.log
    ;;

  *)
    echo -n "usage: chksum.sh e / chksum.sh f"
    ;;
esac

function goto --description 'goto in GOPATH'
   for p in (string split ':' $GOPATH)
     set f (find $p/src -type d | grep $argv | head -n 1)
     if test -n "$f"
       cd $f
       return
     end
   end
end
function rm -d "Avoid frustration"
  command rm $argv
  if test $status -ne 0
    read -l -n1 -p "set_color -o red; echo -n 'force? [y/n] '; set_color normal" ans
    string match -qi y -- $ans; or return 1
  end
  command rm -rf $argv
end

#!/usr/bin/env bash
# send output to this file:

exec > $HOME/bin/gweb2.output.html

dir="/shared/humphrys/shakespeare"
#dir="/users/tutors/mhumphrysdculab/share/shakespeare"
cd $dir

clickable()
{
 while read line
 do
  file=`echo "$line" | cut -f1 -d':'`
  hit=`echo "$line" | cut -f2- -d':'`
  echo "<p> <a href='file://$file'>$file</a>: <br> $hit </p>"
 done
}

echo '<pre>'
grep -i "$1" /shared/humphrys/shakespeare/*/*html | sed -e 's|<|\&lt;|g'   |   sed -e 's|>|\&gt;|g' | clickable
echo '</pre>'

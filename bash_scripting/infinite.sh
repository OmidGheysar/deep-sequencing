
#!/bin/sh

a=10

until [ $a -gt 100 ]
do
     echo $a
     a=`expr $a + 1`
done

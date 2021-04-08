
#!/bin/sh
#Define function

Hello(){
        echo "Hello $1 $2 "
        return 10
}

# Invoke Function
Hello Omid GheysarGharamaleki

#Capture value returned previuosly
ret=$?
echo "Return value is $ret"

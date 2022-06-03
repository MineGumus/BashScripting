# test for command line arguement is present
if [[ $# -le 0 ]]
then
    printf "Where x and y are two nos for which I will print sum."
else
    echo " sum of $1 and $2 is $(( $1 + $2 ))"
fi
#!/bin/sh
read a1 b1 c1

type() {

    a=$1
    b=$2
    c=$3
    if [ -z "$a" -o -z "$b" -o -z "$c" ]; then
        echo "Empty var" >&2
        return 1
    fi

    ab=$(echo "$a+$b" | bc -l)
    bc=$(echo "$b+$c" | bc -l)
    ca=$(echo "$c+$a" | bc -l)

    if [ $(echo "$ab <= $c || $bc <= $a || $ca <= $b" | bc -l) -eq "1" ]; then
        echo "Impossible triangle" >&2
	return 1
    else
        echo "Треугольник существует!" >&2
        if [ $(echo "$a == $b && $b == $c" |bc -l) -eq "1" ]
            then echo "Равносторонний треугольник"
        elif [ $(echo "$a == $b || $b == $c || $c == $a" | bc -l) -eq "1" ]
            then echo "Равнобедренный треугольник"
        else
            echo "Обычный треугольник"
        fi

    fi

}

run_tests() {
    set -x -e



}
if [ "$1" = "--test" ]; then
    run_tests
else
    type $a1 $b1 $c1
fi


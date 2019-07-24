#!/bin/bash
echo "Стороны треугольника через пробел:"
read a1 b1 c1
echo ---OK---
#echo $a $b $c

type() {

    a=$1
    b=$2
    c=$3
    if [ -z "$a" -o -z "$b" -o -z "$c" ]; then
        echo "Не задана одна или более сторон трегуольника!"
        echo "Empty var" >&2
        return 1
    fi

    let ab=$a+$b
    let bc=$b+$c
    let ca=$c+$a

    if [ ! $ab -gt $c -o ! $bc -gt $a -o ! $ca -gt $b ]
    then echo "Треугольник не существует!"
    else
        echo "Треугольник существует!"
        if [ $a -eq $b -a $b -eq $c ]
            then echo "Треугольник равносторонний"
        elif [ $a -eq $b -o $b -eq $c -o $c -eq $a ]
            then echo "Треугольник равнобедренный"
        else
            echo "Треугольник обычный"
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


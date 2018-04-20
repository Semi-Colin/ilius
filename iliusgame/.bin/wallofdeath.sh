#!/bin/sh

chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+å∫ç∂´ƒ©˙ˆ∆˚¬µ˜øπœ®ß†¨√∑≈\ΩÅıÇÎ´Ï˝ÓˆÔÒÂ˜Ø∏Œ‰Íˇ¨◊„˛Á¸'
counter=0

sh ./slowtype "wallofdeath"

while [ $counter -le 5000 ]
do
    num=$((1 + RANDOM % ${#chars}-1 ))
    char=${chars: (0-num)}
    echo $char
    ((counter++))
done
exit
#!/bin/bash 

#1-Generate random nb 
cible=$(shuf -i 1-100 -n 1 )
#2 Generate 5 nbs in 1- 20
nbs=$(shuf -i 1-20 -n  5 )
echo $nbs
echo propose un calcul avec ces nombres pour trouver la cible
read count

calcul=$(($count))
echo $calcul
while [[ $calcul -eq $cible ]]
do calcul=$(($count))
done 

#ERROR VERIFICATION
#!/bin/bash

#1-Generate random nb
nb=$(shuf -i 1-100 -n 1 )

#2-ask the user to give a random nb (not a string) between 1-100

for coups in {1..10} #fix the nb of essais
    do echo coup $coups :; read nb_user
        if  [[ $nb_user =~ ^[0-9][0-9]?[0-9]? ]] && [[ $nb_user -gt 1 ]] && [[ $nb_user -lt 100 ]]  then  #error verfication
        if [[ $nb -lt $nb_user ]]  #3 - Compare if nb=nb_user 
            then echo "trop haut!"
        elif [[ $nb -gt $nb_user ]]
            then echo " Trop bas!"
        else echo " Félicitation ! vous avez trouvee le juste prix $nb en $coups coups"; break
        fi
    fi
done
        

 
 



    

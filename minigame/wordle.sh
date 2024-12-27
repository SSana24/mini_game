#!/bin/bash

#1/Create a random word
function getRandomWord() {
    words=('Abuse' 'Adult' 'Agent' 'Anger' 'Apple' 'Award' 'Basis' 'Beach' 'Birth' 'Block' 'Blood' 'Board' 'Brain' 'Bread' 'Break' 'Brown' 'Buyer' 'Cause' 'Chain' 'Chair' 'Chest' 'Chief' 'Child' 'China' 'Claim' 'Class' 'Clock' 'Coach' 'Coast' 'Court' 'Cover' 'Cream' 'Crime' 'Cross' 'Crowd' 'Crown' 'Cycle' 'Dance' 'Death' 'Depth' 'Doubt' 'Draft' 'Drama' 'Dream' 'Dress' 'Drink' 'Drive' 'Earth' 'Enemy' 'Entry' 'Error' 'Event' 'Faith' 'Fault' 'Field' 'Fight' 'Final' 'Floor' 'Focus' 'Force' 'Frame' 'Frank' 'Front' 'Fruit' 'Glass' 'Grant' 'Grass' 'Green' 'Group' 'Guide' 'Heart' 'Henry' 'Horse' 'Hotel' 'House' 'Image' 'Index' 'Input' 'Issue' 'Japan' 'Jones' 'Judge' 'Knife' 'Laura' 'Layer' 'Level' 'Lewis' 'Light' 'Limit' 'Lunch' 'Major' 'March' 'Match' 'Metal' 'Model' 'Money' 'Month' 'Motor' 'Mouth' 'Music' 'Night' 'Noise' 'North' 'Novel' 'Nurse' 'Offer' 'Order' 'Other' 'Owner' 'Panel' 'Paper' 'Party' 'Peace' 'Peter' 'Phase' 'Phone' 'Piece' 'Pilot' 'Pitch' 'Place' 'Plane' 'Plant' 'Plate' 'Point' 'Pound' 'Power' 'Press' 'Price' 'Pride' 'Prize' 'Proof' 'Queen' 'Radio' 'Range' 'Ratio' 'Reply' 'Right' 'River' 'Round' 'Route' 'Rugby' 'Scale' 'Scene' 'Scope' 'Score' 'Sense' 'Shape' 'Share' 'Sheep' 'Sheet' 'Shift' 'Shirt' 'Shock' 'Sight' 'Simon' 'Skill' 'Sleep' 'Smile' 'Smith' 'Smoke' 'Sound' 'South' 'Space' 'Speed' 'Spite' 'Sport' 'Squad' 'Staff' 'Stage' 'Start' 'State' 'Steam' 'Steel' 'Stock' 'Stone' 'Store' 'Study' 'Stuff' 'Style' 'Sugar' 'Table' 'Taste' 'Terry' 'Theme' 'Thing' 'Title' 'Total' 'Touch' 'Tower' 'Track' 'Trade' 'Train' 'Trend' 'Trial' 'Trust' 'Truth' 'Uncle' 'Union' 'Unity' 'Value' 'Video' 'Visit' 'Voice' 'Waste' 'Watch' 'Water' 'While' 'White' 'Whole' 'Woman' 'World' 'Youth')

    size=${#words[@]}

    index=$(($RANDOM % $size))

    echo ${words[$index]}
}
#echo $(getRandomWord) # -->check if the function works
str=$(getRandomWord)
echo $str
#2/ask the user to give a random word
#Error verfication strlen=5 and upper first lettre

function getInput {
    read -p "Quel est le mot à deviner? " -r
    echo "$REPLY" #${REPLY^}" >#(other way to start the starts with Maj)
}                 # ${REPLY^} force the word to start with uppercase letter
j=0
green="\e[32m"
yellow="\e[33m"
red="\e[31m"
Endcolor="\e[0m"


green_variable=0
yellow_variable=0
red_variable=0
while [[ $str_user != $str ]]; do
    str_user=$(getInput)

    if [[ ${#str_user} -eq 5 ]] && [[ $str_user =~ ^[A-Z](.*)$ ]]; then
        for j in $(
            seq 0 ${#str_user}
        ); do
            for i in $(seq 0 ${#str}); do

                if [[ ${str_user:$j:1} == ${str:$i:1} ]] && [[ $i -eq $j ]]; then #test if the lettrs matches
                    green_variable=1
                elif [[ ${str_user:$j:1} == ${str:$i:1} ]]; then #FAUT AJOUTER UNE AUTRE CONDITION
                    yellow_variable=1
                else
                    red_variable=1
                fi
            done

            if [[ $green_variable == 1 ]]; then
                echo -ne "${green}${str_user:$j:1}${Endcolor}"
                green_variable=0
            elif [[ $yellow_variable == 1 ]]; then
                echo -ne "${yellow}${str_user:$j:1}${Endcolor}"
                yellow_variable=0
            elif [[ $red_variable == 1 ]]; then
                echo -ne "${red}${str_user:$j:1}${Endcolor}"
                red_variable=0
            fi
        done
        echo ""
    else
        echo Attention! le mot doit commencer par un majuscule et se compose de 5 lettres
    fi
done
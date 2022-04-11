#!/bin/bash

number=$[$RANDOM%100]

echo "Welcome! I've picked a number from one to one hundred, care to guess?"

while [ 1 ]; do
  # Input einlesen
  read -p "Make your guess: " input
  # Checken dass input eine zahl ist
  if ! [[ "$input" =~ ^[0-9]+$ ]];then
    echo "You can only enter numbers!" 
    continue
  fi
  # Wenn richtig, printen und exit
  if [ $input -eq $number ]; then
    echo "Thats correct! You win"
    break
  fi
  # Wenn zu hoch
  if [ $input -gt $number ]; then
    echo "Bad guess, try lower"
    continue
  fi
  # Wenn zu tief
  if [ $input -lt $number ]; then
    echo "Bad guess, try higher"
    continue
  fi
  echo "Oops you broke me :("
done 

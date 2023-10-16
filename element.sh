#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CHECKING=$($PSQL "SELECT COUNT(*) FROM elements WHERE atomic_number = '$1'")
  else
    CHECKING=$($PSQL "SELECT COUNT(*) FROM elements WHERE symbol = '$1' or name = '$1'")
  fi
      if [[ $CHECKING -eq 0 ]]
      then
        echo "I could not find that element in the database."
      else
        if [[ $1 =~ ^[0-9]+$ ]]
        then
        ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
        else
        ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1' OR symbol = '$1'")
        fi
        ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$ELEMENT_NAME'")
        ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$ELEMENT_ID'")
        ELEMENT_TYPE=$($PSQL "SELECT t.type FROM types AS t INNER JOIN properties AS p ON t.type_id = p.type_id WHERE p.atomic_number = '$ELEMENT_ID'")
        ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ELEMENT_ID'")
        ELEMENT_MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ELEMENT_ID'")
        ELEMENT_BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ELEMENT_ID'")
        
        echo "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING celsius and a boiling point of $ELEMENT_BOILING celsius."
      fi
else
echo "Please provide an element as an argument."
fi

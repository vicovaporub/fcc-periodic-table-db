# Periodic Table

## This project uses Bash and PostgreSQL and consists in a database for a Periodic Table with information of few elements. This project is a requirement for the [freeCodeCamp](www.freecodecamp.org/)'s Relational Database certification.

## The database was already provided by freeCodeCamp and it needed some changes and fixes before the script runs the information.

**The tasks were:**

- Rename the `weight` column to `atomic_mass`
- Rename the `melting_point` and the `boiling_point` columns to `melting_point_celsius` and `boiling_point_celsius`
- `melting_point_celsius` and `boiling_point_celsius` columns should not accept null values
- Add the `UNIQUE` constraint to the `symbol` and `name` columns from the `elements` table
- `symbol` and `name` columns should have the `NOT NULL` constraint
- `atomic_number` column from `properties` table should be a foreign key that references the column of the same name in the `elements` table
- Create a `types` table that will store the three types of elements
- `types` table should have a `type_id` column that is an integer and the primary key
- The `types` table should have a `type` column that's a `VARCHAR` and cannot be `null`. It will store the different types from the `type` column in the `properties` table
- `types` table should have three rows whose values are the three different types from the `properties` table
- The `properties` table should have a `type_id` foreign key column that references the `type_id` column from the `types` table. It should be an `INT` with the `NOT NULL` constraint
- Each row in the `properties` table should have a `type_id` value that links to the correct type from the `types` table
- The first letter of all the `symbol` values in the `elements` table must be capitalized
- All trailing zeroes after the decimals from each row of the `atomic_mass` column should be removed. The final values are in the `atomic_mass.txt` file
- Add the element with atomic number `9` to the database. It's name is `Fluorine`, symbol is `F`, mass is `18.998`, melting point is `-220`, boiling point is `-188.1`, and it's a `nonmetal`
- Add the element with atomic number `10` to the database. It's name is `Neon`, symbol is `Ne`, mass is `20.18`, melting point is `-248.6`, boiling point is `-246.1`, and it's a `nonmetal`
- Create a `element.sh`
- The script (`.sh`) file should have executable permissions
- If run `./element.sh`, it should output only `Please provide an element as an argument.` and finish running
- If run `./element.sh 1`, `./element.sh H`, or `./element.sh Hydrogen`, it should output only `The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.`
- If run `./element.sh` with another element as input, it should get the same output, but with information associated with the given element
- If the argument input to `element.sh` script doesn't exist as an `atomic_number`, `symbol` or `name` in the database, the only output should be `I could not find that element in the database`
- Delete the non existed element, whose `atomic_number` is `1000` from the two tables
- Delete the `type` column from the `properties` table 

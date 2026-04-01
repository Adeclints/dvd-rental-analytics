\## Core Tables



\### film

Stores movie details such as title, rental rate, length, and category.



\### inventory

Represents physical copies of each film available in each store.



\### rental

Captures rental transactions by customers.



\### payment

Stores payment amounts linked to rentals.



\### customer

Contains customer information.



\### category

Defines film genres/categories.



\## Main Join Path

film → inventory → rental → payment


# Teamwork
Designing REST API endpoints and database schema

## Topic
1. Library management system

## Key concept
1. ERD diagram design
2. REST API architecture endpoint design
3. Postgresql relational database design including functions/queries

## Challenges 
1. Task manegement 
2. Git version control

## ERD diagram
![Screen Shot 2023-07-10 at 11 12 24 PM](https://github.com/LeeRichi/fs15_teamwork_team_2/assets/86901868/5a274048-2dad-4291-a763-ff1c1a6b9ea1)

## Folder tree
````
.
├── ERD
│   └── ERD.png
├── README.md
├── data
│   ├── authors.csv
│   ├── book_author.csv
│   ├── book_genre.csv
│   ├── books.csv
│   ├── fine.csv
│   ├── genres.csv
│   ├── loans.csv
│   ├── query_method
│   │   └── data.sql
│   ├── reviews.csv
│   ├── roles.csv
│   └── users.csv
├── endPoints
│   └── endPoints.md
└── queries
    ├── create_tables
    │   ├── authors.sql
    │   ├── book_author.sql
    │   ├── book_genre.sql
    │   ├── books.sql
    │   ├── fine.sql
    │   ├── genres.sql
    │   ├── loans.sql
    │   ├── reviews.sql
    │   ├── roles.sql
    │   └── users.sql
    ├── create_tables.sql
    └── functions
        ├── authors
        │   ├── create_author.sql
        │   ├── delete_author.sql
        │   ├── get_all_authors.sql
        │   ├── get_author_by_id.sql
        │   └── update_author.sql
        ├── book_author
        │   └── get_all_book_author.sql
        ├── book_genre
        │   └── get_all_book_genre.sql
        ├── books
        │   ├── create_book.sql
        │   ├── delete_book.sql
        │   ├── get_all_books_with_params.sql
        │   ├── get_book_by_id.sql
        │   └── update_book.sql
        ├── fines
        │   ├── get_all_fines_from_a_user.sql
        │   ├── get_all_fines_from_all_users.sql
        │   └── get_fine_by_id.sql
        ├── genres
        │   ├── create_genre.sql
        │   ├── delete_genre.sql
        │   ├── get_all_genres.sql
        │   ├── get_genre_by_id.sql
        │   └── update_genre.sql
        ├── loans
        │   ├── create_a_loan.sql
        │   ├── delete_loan.sql
        │   ├── get_all_loans_from_a_user.sql
        │   ├── get_all_loans_from_all_users.sql
        │   ├── get_loan_by_id.sql
        │   └── update_loan.sql
        ├── reviews
        │   ├── delete_review.sql
        │   ├── get_all_reviews.sql
        │   ├── get_review_by_id.sql
        │   └── update_review.sql
        ├── roles
        │   ├── create_role.sql
        │   ├── delete_role.sql
        │   ├── get_all_roles.sql
        │   ├── get_role_by_id.sql
        │   └── update_role.sql
        └── users
            ├── get_all_users.sql
            ├── get_user_by_id.sql
            ├── login_user.sql
            ├── logout_user.sql
            └── register_user.sql
````


## Requirements checklist
1. Create ERD diagram with proper entities, attributes, and relationship. The ERD can be added to the project as image.:white_check_mark:
2. Design the API endpoints, following REST API architecture. The endpoints can be displayed as text with detail explaination. You can use `.md` file or `.txt` file to write the API endpoints. It is necessary to describe all the possible queries, parameters, request body, authentication (if needed), and sample response for each endpoint. :white_check_mark:
4. Provide the endpoints and PostgreSQL queries for the basic CRUD operations:
   - (for each table ) Create a function to get all items of a table with sorting, filtering, and pagination:white_check_mark:
   - (for each table ) Create query to get 1 item of a table by id:white_check_mark:
   - Create a function to update/delete book or product:white_check_mark:
   - Register, authenticate,update, delete users:white_check_mark:
   - CRUD operations for reviews:white_check_mark:
   - Borrow/return books or place/cancel/ship oder for products:white_check_mark:
   - Get the most 10 borrows or bought books or products:white_check_mark:
   - All the update operation should have limitations on which properties can be updated:white_check_mark:
   - Some endpoints should be allowed for certain users only(only admin):white_check_mark:

### Initial endpoint:
```
http://example.com/api/v1
```

### Book endpoints
#### Get all books
This endpoint is used to query all books from the database.
```
[GET] /books?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| keyword | string | Keyword to search for, default value is '' | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |

```
# Response body 
[
  {
    "id": 1,
    "book_name": "Catcher in the Rye",
    "isbn": "9780316769488",
    "author": 
      [
        "J. D. Salinger",
      ], 
    "genre": 
      [
        "Novel",
      ],
    "published_year": 1951,
    "avg_rating": 4.2,
    "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 1,
          "user_name": "John Doe",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 2,
          "user_name": "Jane Doe",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  },
  {
    "id": 2,
    "book_name": "Harry Potter and the Philosopher's Stone",
    "isbn": "9780747532743",
    "author": 
      [
        "J. K. Rowling",
      ],
    "genre": 
      [
        "Fantasy",
        "Novel",
      ],
    "published_year": 1997,
    "rating": 4.5,
    "description": "Harry Potter and the Philosopher's Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling's debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51UoqRAxwEL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 4,
          "user_name": "John Smith",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 5,
          "user_name": "Jane Smith",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  },
  ...
]
```

#### Get book by id
This end point is used to query one specific book from the database.
```
[GET] /books/:bookId
``` 

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to query | Yes |

```
# Response body 
{
    "id": 1,
    "book_name": "Catcher in the Rye",
    "isbn": "9780316769488",
    "author": 
      [
        "J. D. Salinger",
      ], 
    "genre": 
      [
        "Novel",
      ],
    "published_year": 1951,
    "avg_rating": 4.2,
    "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
    "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
    "reviews": 
      [
        {
          "id": 1,
          "user_name": "John Doe",
          "rating": 5,
          "comment": "This is a great book"
        },
        {
          "id": 2,
          "user_name": "Jane Doe",
          "rating": 4,
          "comment": "What a wonderful story!!!"
        },
        ...
      ]
  }
```

#### Create book
This endpoint is only allowed for librarian to add a new book to the database. 
```
[POST] /books
````
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| book_name | string | Name of the book, limited to 50 character | Yes |
| isbn | string | ISBN of the book, limited to 13 characters | Yes |
| author_ids | array of strings | All the IDs of the authors of the book | Yes |
| genre_ids | array of strings | All the IDs of the genres of the book | Yes |
| published_year | string | Publishing year of the book, limited to 4 characters | Yes |
| description | string | Short summary of the book, limited to 1000 characters | Yes |
| image_url | string | URL of the book cover image | Yes |
| borrowing_period | string | Number of days that the user can borrow the book | Yes |
| quantity | string | Number of copies of the book | Yes |

```
# Request body 
{
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

```
# Response body 
{
  "book_id": 1,
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

#### Update book
This endpoint is only allowed for librarian to update a book in the database.
```
[PUT] /books/:bookId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to update | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
````
The user can update at least one field mentioned below. The fields that are not included in the request body will not be updated.
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| book_name | string | Name of the book, limited to 50 character | No |
| isbn | string | ISBN of the book, limited to 13 characters | No |
| author_ids | array of strings | All the IDs of the authors of the book | No |
| genre_ids | array of strings | All the IDs of the genres of the book | No |
| published_year | string | Publishing year of the book, limited to 4 characters | No |
| description | string | Short summary of the book, limited to 1000 characters | No |
| image_url | string | URL of the book cover image | No |
| borrowing_period | string | Number of days that the user can borrow the book | No |
| quantity | string | Number of copies of the book | No |

```
# Request body 
{
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

```
# Response body 
{
  "book_id": {bookId},
  "book_name": "Catcher in the Rye",
  "isbn": "9780316769488",
  "author_ids": [1]
  "genre_ids": [1]
  "published_year": 1951,
  "description": "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, he searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable.",
  "image_url": "https://images-na.ssl-images-amazon.com/images/I/51YQ0M1aXKL._SX331_BO1,204,203,200_.jpg",
  "borrowing_period": 30,
  "quantity": 3
}
```

#### Delete book
This endpoint is only allowed for librarian to delete a book from the database.
```
[DELETE] /books/:bookId
````
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body 
{
  "message": "Book is deleted successfully"
}
```

### Author endpoints
#### Get all authors
This endpoint is used to query all authors from the database.
```
[GET] /authors?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| keyword | string | Keyword to search for, default value is '' | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |

```
# Response body
[
  {
    "id": 1,
    "author_name": "J. D. Salinger",
  },
  {
    "id": 2,
    "author_name": "J. K. Rowling",
  },
  ...
]
```

#### Get author by id
This endpoint is used to query one specific author from the database.
```
[GET] /authors/:authorId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| authorId | string | ID of the author to query | Yes |

```
# Response body
{
  "id": 1,
  "author_name": "J. D. Salinger",
}
```

#### Create author
This endpoint is only allowed for librarian to add a new author to the database.
```
[POST] /authors
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| authorId | string | ID of the author to query | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| author_name | string | Name of the author, limited to 50 character | Yes |

```
# Request body
{
  "author_name": "J. D. Salinger",
}
```

```
# Response body
{
  "id": 1,
  "author_name": "J. D. Salinger",
}
```

#### Update author
This endpoint is only allowed for librarian to update an author in the database.
```
[PUT] /authors/:authorId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| authorId | string | ID of the author to update | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The author name can be updated using the following request body:
```
# Request body
{
  "author_name": "J. D. Salinger",
}
```

```
# Response body
{
  "id": {authorId},
  "author_name": "J. D. Salinger",
}
```

#### Delete author
This endpoint is only allowed for librarian to delete an author from the database.
```
[DELETE] /authors/:authorId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| authorId | string | ID of the author to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Author is deleted successfully"
}
```

### Genre endpoints
#### Get all genres
This endpoint is used to query all genres from the database.
```
[GET] /genres?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| keyword | string | Keyword to search for, default value is '' | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |

```
# Response body
[
  {
    "id": 1,
    "genre_name": "Novel",
  },
  {
    "id": 2,
    "genre_name": "Fantasy",
  },
  ...
]
```

#### Get genre by id
This endpoint is used to query one specific genre from the database using its ID.
```
[GET] /genres/:genreId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| genreId | string | ID of the genre to query | Yes |

```
# Response body
{
  "id": 1,
  "genre_name": "Novel",
}
```

#### Create genre
This endpoint is only allowed for librarian to add a new genre to the database.
```
[POST] /genres
```
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| genre_name | string | Name of the genre, limited to 50 character | Yes |

```
# Request body
{
  "genre_name": "Novel",
}
```

```
# Response body
{
  "id": 1,
  "genre_name": "Novel",
}
```

#### Update genre
This endpoint is only allowed for librarian to update a genre in the database.
```
[PUT] /genres/:genreId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| genreId | string | ID of the genre to update | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The genre name can be updated using the following request body:
```
# Request body
{
  "genre_name": "Novel",
}
```

```
# Response body
{
  "id": {genreId},
  "genre_name": "Novel",
}
```

#### Delete genre
This endpoint is only allowed for librarian to delete a genre from the database.
```
[DELETE] /genres/:genreId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| genreId | string | ID of the genre to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Genre is deleted successfully"
}
```

### Authentication endpoints
#### Register
```
[POST] /auth/register
````
The user can resgister as a customer of a library using the following request body and fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| first_name | string | First name of the user, limited to 30 character | Yes |
| last_name | string | Last name of the user, limited to 30 character | Yes |
| password | string | Password of the user, limited to 20 character | Yes |
| email | string | Email of the user, email should be unique | Yes |
For the security reason, the role of the user registering via this endpoint will be set to 'customer' by default.
```
# Request body
{
  "first_name": "John",
  "last_name": "Doe",
  "password": "password",
  "email": "email",
}
```

```
# Response body
{
  "message": "User is registered successfully"
}
```

#### Login
The customer of the library can login using this end point.
```
[POST] /auth/login
```
To login, the user should provide the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| email | string | Email of the user | Yes |
| password | string | Password of the user | Yes |
```
# Request body
{
  "email": "email",
  "password": "password"
}
```

```
# Response body
{
  "message": "User is logged in successfully",
  "token": "token"
}
```

#### Logout
The customer of the library can logout using this end point.
```
[POST] /auth/logout
```
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "User is logged out successfully"
}
```

### User endpoints
#### Get all users
This endpoint is only allowed for librarian to query all users from the database.
```
[GET] /users?search={keyword}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| keyword | string | Keyword to search for, default value is '' | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.

```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
[
  {
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "john@mail.com"
  },
  {
    "id": 2,
    "first_name": "Jane",
    "last_name": "Doe",
    "email": "jane@mail.com"
  },
  ...
]
```

#### Get a user by id
This endpoint is only allowed for librarian to query one specific user from the database and the customer to see his/her own profile. If the user is a librarian, s/he has to provide the ID of the user that s/he wants to query. If the user is a customer, his/her ID will be taken from his/her JWT token.
```
[GET] /users/:userId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| userId | string | ID of the user to query | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "email"
}
```

#### Get all loans from a user
This endpoint is only allowed for librarian to query all loans from the database or the customer to see his/her own loans. If the user is a librarian, s/he has to provide the ID of the user that s/he wants to see all of his/her loans. If the user is a customer, his/her ID will be taken from his/her JWT token.
```
[GET] /users/:userId/loans?startDate={start_date}&endDate={end_date}&isReturned={is_returned}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| userId | string | ID of the user to query | Yes |

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| start_date | string | Starting date from which the user wants to get all the loans, default value is null | No |
| end_date | string | Ending date to which the user wants to get all the loans, default value is null | No |
| is_returned | string | Whether the book is returned or not, default value is false | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body 
[
  {
    "loan_id": 1,
    "book_name": "Catcher in the Rye",
    "borrow_date": "2023-06-01",
    "return_date": "2023-06-31",
    "due_date": "2023-07-01"
  },
  {
    "loan_id": 2,
    "book_name": "Harry Potter and the Philosopher's Stone",
    "borrow_date": "2023-07-01",
    "return_date": null, # null if the book is not returned yet
    "due_date": "2023-08-01"
  },
  ...
]
```

#### Get all fines from a user
This endpoint is only allowed for librarian to query all fines from the database or the customer to see his/her own fines. If the user is a librarian, s/he has to provide the ID of the user that s/he wants to see all of his/her fines. If the user is a customer, his/her ID will be taken from his/her JWT token.
```
[GET] /users/:userId/fines?startDate={start_date}&endDate={end_date}&isPaid={is_paid}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| userId | string | ID of the user to query | Yes |

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| start_date | string | Starting date from which the user wants to get all the fines, default value is null | No |
| end_date | string | Ending date to which the user wants to get all the fines, default value is null | No |
| is_paid | string | Whether the fine is paid or not, default value is false | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
[
  {
    "fine_id": 1,
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "book_name": "Harry Potter and the Prisoner of Azkaban",
    "balance": 10,
  },
  {
    "fine_id": 2,
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "book_name": "1984",
    "balance": 5,
  },
  ...
]
```

#### Update a user
This endpoint is only allowed for customer to update his/her own profile. 
```
[PUT] /users/:userId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| userId | string | ID of the user to update, will be taken directly from the token | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```
The user can update at least one field mentioned below. The fields that are not included in the request body will not be updated.
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| first_name | string | First name of the user, limited to 30 character | No |
| last_name | string | Last name of the user, limited to 30 character | No |
| password | string | Password of the user, limited to 20 character | No |
| email | string | Email of the user, email should be unique | No |  
```
# Request body
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "john@mail.com",
  "password": "1234"
}

# Response body
{
  "message": "User is updated successfully"
}
```

#### Delete a user
This endpoint is only allowed the user to delete his/her own account.
```
[DELETE] /users/:userId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| userId | string | ID of the user to delete, will be taken directly from the token | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "User is deleted successfully"
}
```

### Loan endpoints
#### Get all loans from all users
This endpoint is only allowed for librarian to query all loans of all users from the database.
```
[GET] /loans?startDate={start_date}&endDate={end_date}&isReturned={is_returned}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| start_date | string | Starting date from which the user wants to get all the loans, default value is null | No |
| end_date | string | Ending date to which the user wants to get all the loans, default value is null | No |
| is_returned | string | Whether the book is returned or not, default value is false | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
[
  {
    "loan_id": 1,
    "user_name": "John Doe",
    "book_name": "Harry Potter and the Philosopher's Stone",
    "borrow_date": "2023-07-01",
    "return_date": null, # null if the book is not returned yet
    "due_date": "2023-08-01"
  },
  {
    "loan_id": 2,
    "user_name": "Jane Doe",
    "book_name": "Catch-22",
    "borrow_date": "2023-07-01",
    "return_date": "2023-07-09",
    "due_date": "2023-08-01"
  },
  ...
]
```

#### Get a loan by id
This endpoint is only allowed for librarian to query one specific loan from the database using the ID of the loan or for customer to see a selected loan only if s/he is the owner of the loan.
```
[GET] /loans/:loanId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| loanId | string | ID of the loan to query | Yes |
The user will be authenticated using JWT token sent in the request header. In case that the user's role is customer, his/her ID will be taken from the token and cross-checked with the user_id of the loan.
```
# Headers
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "loan_id": {loanId},
  "user_name": "John Doe",
  "book_name": "Harry Potter and the Philosopher's Stone",
  "borrow_date": "2023-07-01",
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-08-01"
}
```

#### Create a loan
This endpoint is used when the user borrows a book.
```
[POST] /loans
```
The JWT token is required to get the user ID, and it should be sent in the request header in the following format.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| book_id | string | ID of the book to borrow | Yes |
```
# Request body
{
  "book_id": 1,
}
```

```
# Response body
{
  "loan_id": 1,
  "user_id": {userId}, # user_id is taken from the token
  "book_id": 1,
  "borrow_date": "2023-07-01", # borrow_date is the current date
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-08-01", # due_date is the borrow_date + borrowing_period of the book
}
```

#### Update a loan
This endpoint is used when the user wants to extends the due date for a certain book. The user can only extend the due date 10 times at most. THis end point can also be used when the user returns a book.
```
[PUT] /loans/:loanId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| loanId | string | ID of the loan to update | Yes |
The user will be authenticated using JWT token sent in the request header. The token is required to get the user ID.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| is_returned | boolean | If is_returned is false, the customer wants to extend the loan. If is_returned is true, the customer wants to return the book | Yes |
```
# Request body
{
  "is_returned": true,
}
```

```
# Response body
{
  "loan_id": {loanId},
  "user_id": {userId}, # user_id is taken from the token
  "book_id": 1,
  "borrow_date": "2023-07-01",
  "return_date": null, # null if the book is not returned yet
  "due_date": "2023-09-01" # new due_date is the old due_date + borrowing_period of the book
}
```

#### Delete a loan
This endpoint is used by the librarian to delete a loan from the database.
```
[DELETE] /loans/:loanId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| loanId | string | ID of the loan to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Headers 
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Loan is deleted successfully"
}
```

### Fine endpoints
#### Get all fines from all users
This endpoint is only allowed for librarian to query all fines of all the users from the database.
```
[GET] /fines?startDate={start_date}&endDate={end_date}&isPaid={is_paid}&sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| start_date | string | Starting date from which the user wants to get all the fines, default value is null | No |
| end_date | string | Ending date to which the user wants to get all the fines, default value is null | No |
| is_paid | string | Whether the fine is paid or not, default value is false | No |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
[
  {
    "id": 1,
    "user_name": "John Doe",
    "email": "john@mail.com",
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "payment_date": null, # null if the fine is not paid yet
    "book_name": "Harry Potter and the Prisoner of Azkaban",
    "balance": 10,
  },
  {
    "id": 2,
    "user_name": "Jane Doe",
    "email": "jane@mail.com",
    "created_date": "2023-07-01",
    "due_date": "2023-07-15",
    "payment_date": "2023-07-09",
    "book_name": "1984",
    "balance": 5,
  },
  ...
]
```

#### Get a fine by id
This endpoint is only allowed for librarian to query one specific fine from the database or for the customer to see the selected fine only if s/he is the owner of that fine.
```
[GET] /fines/:fineId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| fineId | string | ID of the fine to query | Yes |
The user will be authenticated using JWT token sent in the request header. In case that the user's role is customer, his/her ID will be taken from the token and cross-checked with the user_id of the fine.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "id": {fineId},
  "user_name": "John Doe",
  "email": "john@mail.com",
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": null, # null if the fine is not paid yet
  "book_name": "Harry Potter and the Prisoner of Azkaban",
  "balance": 10,
}
```

#### Create a fine
This endpoint is used when the user does not return a book after the due date and is used only by the librarian.
```
[POST] /fines
```
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:

| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| loan_id | string | ID of the overdue loan to create a fine | Yes |
```
# Request body
{
  "loan_id": 1,
}
```

```
# Response body
{
  "id": {fineId},
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": null, # null if the fine is not paid yet
  "balance": 10,
  "loan_id": 1,
}
```

#### Update a fine
This endpoint is used when the customer pays the fine.
```
[PUT] /fines/:fineId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| fineId | string | ID of the fine to update | Yes |
The user will be authenticated using JWT token sent in the request header. The token is required to get the user ID and cross-check with the user_id of the fine.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:
| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| loan_id | string | ID of the overdue loan to create a fine | Yes |
| payment_date | string | Date when the fine is paid | Yes |
```
# Request body
{
  "loan_id": 1,
  "payment_date": "2023-07-09",
}
```

```
# Response body
{
  "id": {fineId},
  "created_date": "2023-07-01",
  "due_date": "2023-07-15",
  "payment_date": "2023-07-09",
  "balance": 10,
  "loan_id": 1,
}
```

#### Delete a fine
This endpoint is used by the librarian to delete a fine from the database.
```
[DELETE] /fines/:fineId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| fineId | string | ID of the fine to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Fine is deleted successfully"
}
```

### Review endpoints
#### Create a review
This endpoint is used when the user wants to review a book.
```
[POST] /books/:bookId/reviews
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to review | Yes |
The user will be authenticated using JWT token sent in the request header. The user ID will also be taken from the token to identify the owner of the review.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```
The request body should contain the following fields:

| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| rating | string | Rating of the book, can be 1, 2, 3, 4, or 5 | Yes |
| comment | string | Comment of the user, limited to 500 character | No |
```
# Request body
{
  "rating": 5,
  "comment": "This is a great book"
}
```

```
# Response body
{
  "id": 1,
  "rating": 5,
  "comment": "This is a great book",
  "book_id": {bookId},
  "user_id": {userId}, # user_id is taken from the token
}
```

#### Update a review
This endpoint is used when the user wants to edit his/her review.
```
[PUT] /books/:bookId/reviews/:reviewId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to review | Yes |
| reviewId | string | ID of the review to update | Yes |
The user will be authenticated using JWT token sent in the request header. The user ID will also be taken from the token to cross-check with the ID of the owner of the review.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```
The request body can contain at least one of the following fields:

| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| rating | string | Rating of the book, can be 1, 2, 3, 4, or 5 | Yes |
| comment | string | Comment of the user, limited to 500 character | No |
```
# Request body
{
  "rating": 5,
  "comment": "This is a great book"
}
```

```
# Response body
{
  "id": {reviewId},
  "rating": 5,
  "comment": "This is a great book",
  "book_id": {bookId},
  "user_id": {userId}, # user_id is taken from the token
}
```

#### Delete a review
This endpoint is used when the user wants to delete his/her review.
```
[DELETE] /books/:bookId/reviews/:reviewId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| bookId | string | ID of the book to review | Yes |
| reviewId | string | ID of the review to delete | Yes |
The user will be authenticated using JWT token sent in the request header. The user ID will also be taken from the token to cross-check with the ID of the owner of the review.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Review is deleted successfully"
}
```

### Role endpoints
#### Get all roles
This endpoint is only allowed for admin to query all roles from the database. The pre-defined roles are 'Librarian', 'Customer' and 'Admin'.
```
[GET] /roles?sortBy={sorting_condition}&order={order}&perPage={results_per_page}&offset={offset}
```

| Query | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| sorting_condition | string | Sorting condition, default value is 'None' | No |
| order | string | Sorting order, can be 'ASC' or 'DESC' order, default value is 'DESC' | No |
| results_per_page | string | Number of results to be displayed per page, default value is '25' | No |
| offset | string | Number of results to be skipped, default value is '0' | No |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
[
  {
    "id": 1,
    "role_name": "Librarian",
  },
  {
    "id": 2,
    "role_name": "Customer",
  },
  ...
]
```

#### Get a role by id
This endpoint is only allowed for admin to query one specific role from the database using its ID.
```
[GET] /roles/:roleId
```
| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| roleId | string | ID of the role to query | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "id": 1,
  "role_name": "Librarian",
}
```

#### Create a role
This endpoint is only allowed for admin to add a new role to the database.
```
[POST] /roles
```

| Value | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| role_name | string | Name of the role, limited to 50 character | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Request body
{
  "role_name": "Librarian",
}
```

```
# Response body
{
  "id": 1,
  "role_name": "Librarian",
}
```

#### Update a role
This endpoint is only allowed for admin to update a role in the database.
```
[PUT] /roles/:roleId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| roleId | string | ID of the role to update | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```
The role name can be updated using the following request body:
```
# Request body
{
  "role_name": "Librarian",
}
```

```
# Response body
{
  "id": {roleId},
  "role_name": "Librarian",
}
```

#### Delete a role
This endpoint is only allowed for admin to delete a role from the database.
```
[DELETE] /roles/:roleId
```

| Param | Type | Description | Required |
| ----------- | ----------- | ----------- | ----------- |
| roleId | string | ID of the role to delete | Yes |
The user will be authenticated using JWT token sent in the request header.
```
# Header
{
  "Authorization": "Bearer {token}"
}
```

```
# Response body
{
  "message": "Role is deleted successfully"
}
```
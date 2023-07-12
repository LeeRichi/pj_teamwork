

# Teamwork
Designing REST API endpoints and database schema

## Topic
1. Library management system
---
## Requirements
*For team assignment, only 1 member in the team should fork the repo. Then, admin can invite other members to contribute in the same repo. Remember to have develop branch before merging to main. Each feature/schema/bug/issue should have it's own branch, and 1 branch/file edition should be taken by only 1 member at a time. Before making any new branch, make sure you sync the fork and run `git pull` to avoid the conflicts with the parent repo. If neccessary, check the Git lecture again.*
1. Create ERD diagram with proper entities, attributes, and relationship. The ERD can be added to the project as image.:white_check_mark:
2. Design the API endpoints, following REST API architecture. The endpoints can be displayed as text with detail explaination. You can use `.md` file or `.txt` file to write the API endpoints. It is necessary to describe all the possible queries, parameters, request body, authentication (if needed), and sample response for each endpoint. :white_check_mark:
4. Provide the endpoints and PostgreSQL queries for the basic CRUD operations:
   - (for each table ) Create a function to get all items of a table with sorting, filtering, and pagination:white_check_mark:
   - (for each table ) Create query to get 1 item of a table by id:white_check_mark:
   - Create a function to update/delete book or product:white_check_mark:
   - Register, authenticate,update, delete users:white_check_mark:
   - CRUD operations for reviews:white_check_mark:
   - Borrow/return books or place/cancel/ship oder for products
   - Get the most 10 borrows or bought books or products
   - All the update operation should have limitations on which properties can be updated
   - Some endpoints should be allowed for certain users only

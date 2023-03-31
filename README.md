# Eco Emporium 

## About 

Eco Emporium is a desktop site that allows users to buy & sell preloved items instead of throwing them out. It aims to tackle the problems that Florin Council 

## Site directory

### Client-side

| Page | Description|
|------|------------|
| Login/Register | Dynamic interactive page to create a new user/login which allows access to other pages |
| Marketplace | Users can view all items currently up for sale |
| Dynamic Item Page | Users can view more information and photos about individual items | 
| Profile | User can see and update items they are selling and update their profile details|
| Checkout | Users can pay for their items and put in billing and shipping details |

### Server-side

| Route | Method | Response |
|-------|--------|----------|
| "/auth/check" | GET | Checks if user is authenticated to be able to view website |
| "/auth/register" | POST | Creates a new user account, redirects to view login |
| "/auth/login" | POST | Logs user into their account, redirects to main marketplace page |
| "/auth/logout" | GET | Logs user out of their account, redirects to login page |
| "/auth/user/:id" | GET | Finds user profile by their id |
| "/auth/user/:id" | PATCH | Updates user details including email and password |
| "/items" | GET | Shows all items in the database |
| "/items/:id" | GET | Finds item by id, redirects to individual item page |
| "/items/user/:id" | GET | Displays items sold by a specific user |
| "/items" | POST | Creates a new item that is added to the database |
| "/items/:id" | DELETE | Deletes item that was created by user |
| "/items/:id" | PATCH | Updates item that was created by user |

## Required software & accounts
- [VSCode](https://code.visualstudio.com/) or any desired IDE
- [Node.js](https://nodejs.org/en)
- [Npm.js](https://www.npmjs.com)
- [PostgreSQL](https://www.elephantsql.com)

## Installation

1. To get the repository set up on your computer, open your terminal and move into your desired directory using the `cd` command.
2. From the Code button copy the HTTPS/SSH key and run the command `git clone` followed by the key you copied.
3. Move into the repistory and run `code .` to open the code in VSCode/your desired IDE.
4. Run `npm install` to install the necessary dependencies.
5. Create a new instance with Elephant SQL (or another PostgreSQL site) and copy the instance link created.
6. In the root folder create a **.env** file and add the following lines:
- [x] PORT=<port_number>   
- [x] DB_URL=<postgresql_instance_url>
- [x] SECRET=<any_secret_word>  
- [x] IN_TRUE=false

Make sure there are no spaces between the content on each line and ensure you don't add any commas or any other punctuation at the end of each line.

7. Set up the database connection by running `npm run setup-db`
8. To get the server running, run `npm run dev`

### Libraries

These are the necessary libraries used with this repository:

- cors (cors allows cross-origin resource sharing which allows access to other domains, ports and schemes)
- express (express offers built-in functions that make development much easier)
- dotenv (dotenv processes environment variables in a .env file to make them accessible whilst allowing the contents of .env to remain secret)
- pg (pg allows connection to a database using PostgreSQL)
- nodemon (as a dev dependency, nodemon automatically restarts the server when changes are detected)

## Usage

### Login/Register page:

When users first go to the site they are directed to either sign up or sign in. If the user doesn't have an account to begin with they are able to create an account.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/homepage-sign-up.png" width=75% height=75%>
</p>
<br>

The views dynamically change with button clicks on 'Login' or 'Sign Up' to reveal the relevant form between register and login.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/homepage-sign-in.png" width=75% height=75%>
</p>
<br>


## Main page:

The marketplace shows all items that are being sold with pagination and further options to sort by category.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/all-marketplace.png" width=75% height=75%>
</p>
<br>

When sorting by category we see only items that fit that category, making the user experience easier to find specific items.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/marketplace-category-electronics.png" width=75% height=75%>
</p>
<br>

## Viewing items:

When a user clicks on an item on the main page they are redirected to the individual item page. The sections are filled dynamically according to what item has been clicked on. Here a user can see more details for each item and chose to add the item to their cart.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/individual-item-page.png" width=75% height=75%>
</p>
<br>

## Adding items:

Users are able to add items to sell with this form which connects to a database, adding the item to the marketplace.

<p align="center">
<img src="https://github.com/Sonagi-R/Eco-Emporium/blob/ana/documentation/create-new-item-screen.png" width=75% height=75%>
</p>
<br>

## User profile:

If a user wants to see all the items that they have on sale, for example to update or delete the items, they are able to do so on this page. 


They are also able to amend their user details, updating their email or password.


# exter-books
## BOOKS SYSTEM LIKE NOPIXEL 4.0

THIS SCRIPT IS STANDALONE AND CAN BE USED ON QBCORE OR ESX FRAMEWORKS

## PREVIEW
![contoh 1](https://github.com/user-attachments/assets/9228b936-797d-4877-a9a2-18661cd4520d)
![contoh 2](https://github.com/user-attachments/assets/420bc9a6-b1bc-4ae4-b37c-27dc45507f46)

## INSTALLATION
- MOVE THIS IMAGE TO YOUR INVENTORY FOLDER
![books](https://github.com/user-attachments/assets/2b8415d6-29a4-4bd0-9e38-676747ddb629)

## PUT THIS ITEM CODE INTO THE FOLDER qbcore/shared/items.lua
    books = { name = "books", label = "books", weight = 35, type = "item", image = "books.png", unique = true, useable = true, shouldClose = true, combinable = nil, description = "" },

## FOR ESX PUT THIS CODE INTO YOUR SQL SERVER
    INSERT INTO `items` (name, `label`) VALUES 
	    ('books', 'books')
    ;


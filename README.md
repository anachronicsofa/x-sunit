# X-Sunit 

A system to share resources between non-abducted humans, that receives survivors informations and generates reports!

<h2>Technologies:</h2>

* Ruby version: 2.7.1

* Rails version: 6.0.3.1

* Database: Postgresql 

<h2>Infos:</h2>

* Clone the repository:
```
$ git clone https://github.com/anachronicsofa/x-sunit
```
* Install all gems: 
```
$ bundle install
```
* Update the database and feed the database with default seeds:
```
$ rake db:create db:migrate db:seed
```
* Start the web server on http://localhost:3000 by default:
```
$ rails s
```
* All routes: http://localhost:3000/rails/info/routes or 
```
$ rails routes
```

<h2>Features/Endpoints documentation (via Postman):</h2>

https://documenter.getpostman.com/view/11570035/Szzkbx1N

<h2>To-do:</h2>

* Change the type for Latitude and Longitude (altering for something that receives strings+numbers) cause, when I made the database, I didn't notice that they have the directions like N,S. Also, maybe change to some structure that receives two arguments at same time (maybe point or an array), simplifying the input.
* Add a real autentication (maybe a user and password) for the survivor that will report another survivor
* I still need to improve my mini-test usage, adding more failure cases and methods
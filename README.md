Requirements- .net 6,node js

1. download node modules - npm install
2. run api -cd api
           - dotnet run watch
3. run client- cd client
             -ng serve
4. For Redis-server which is used to store cart download docker desktop for windows.
   run command in Grocery Store Directory: docker-compose up --detach

   or if you have ubuntu installed in your system then 
   run these commands to install redis:
   curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

   echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee       /etc/apt/sources.list.d/redis.list

   sudo apt-get update

   sudo apt-get install redis

   now run redis server - sudo service redis-server start
   you can check the connection by using : redis-cli
   and then write: ping
   if it returns pong it means that the connection is established.


ASSUMPTIONS MADE:

1. In Dashboard for logged-in user, point g., it was requested to "generate a unique order id and notify it to user." Accordingly, here to inform the customer that "order has been placed successfully," i've utilised toaster notification.


2. I took a fixed data of categories that the admin can select from by dropdown button instead of creating new categories every time, even if they are already present in the database, which will eventually lead to ambiguity. It is stated in the Dashboard for Admin Users, point e. add new product, that only the admin can add new products.

3. In Bonus question 1, customer reviews are obtained in the form of comments rather than ratings because in the original question it was simply stated that we must obtain customer reviews.

4. As I used a modal to display names in Bonus Question 2, I fetched product names to view the five most ordered products.

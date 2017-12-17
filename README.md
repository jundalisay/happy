== Happy Music

![alt text](http://res.cloudinary.com/dzq6ujhgq/image/upload/v1513467109/Screen_Shot_2017-12-17_at_06.23.47_mw2djv.png "Screenshot")

**Happy Music** is a recommendation engine for music listeners. It uses the Recommendable gem to collect the artists and songs that are liked by users in order to build a list of recommendations and top-ranked objects.


## How to install

- clone this repo
- run bundle
- rake db:create db:migrate db:seed
- change the redis server to the localhost by uncommenting line 7 in recommendable.rb
- open your rails console and run the start.rb script via load './start.rb'
- rails s


Live Demo: **happymusic.herokuapp.com**


## User Stories:

1 The user’s listening time is recored
2 A list shows the songs that the user has listened to
3 A recommendation of songs is available in the song player page


## To Do:

- We just got started with the recommendable gem so we still need to seed a lot of listenings in order to populate the recommendations table


## Team

- Juan Dalisay Jr.
- Nguyễn Hiển Vinh
- Nguyễn Thanh Tùng
- Nguyễn Khôi Nguyên

require 'open-uri'

Artist.create(name: "Bảo Chấn", photo: UiFaces.face)
Artist.create(name: "Đỗ Bảo", photo: UiFaces.woman)
Artist.create(name: "Đức Huy", photo: UiFaces.face)
Artist.create(name: "Đức Trí", photo: UiFaces.woman)
Artist.create(name: "Dương Thụ", photo: UiFaces.face)
Artist.create(name: "Giáng Son", photo: UiFaces.woman)
Artist.create(name: "Hoàng Nhã", photo: UiFaces.face)
Artist.create(name: "Hồng Kiên", photo: UiFaces.woman)
Artist.create(name: "Jimmii Nguyễn", photo: UiFaces.face)
Artist.create(name: "Lê Hiếu", photo: UiFaces.woman)
Artist.create(name: "Ngọc Châu", photo: UiFaces.face)

Artist.create(name: "Nguyễn Ánh 9", photo: UiFaces.face)
Artist.create(name: "Nguyễn Cường", photo: UiFaces.face)
Artist.create(name: "Nguyễn Nam", photo: UiFaces.face)
Artist.create(name: "Nguyễn Thanh Tuấn", photo: UiFaces.face)
Artist.create(name: "Nhạc Ngoại Lời Việt", photo: UiFaces.face)
Artist.create(name: "Phạm Công Bạch", photo: UiFaces.face)
Artist.create(name: "Phạm Tịnh", photo: UiFaces.face)
Artist.create(name: "Quốc Bảo", photo: UiFaces.face)
Artist.create(name: "Quốc Trung", photo: UiFaces.face)
Artist.create(name: "Quốc Tuấn", photo: UiFaces.face)
Artist.create(name: "Thái Thịnh", photo: UiFaces.face)
Artist.create(name: "Tô Vũ ", photo: UiFaces.face)
Artist.create(name: "Trần Lập", photo: UiFaces.face)
Artist.create(name: "Trần Lê", photo: UiFaces.face)
Artist.create(name: "Trịnh Công Sơn", photo: UiFaces.face)
Artist.create(name: "Trúc Phương", photo: UiFaces.face)
Artist.create(name: "Tường Văn", photo: UiFaces.face)
Artist.create(name: "Võ Thiện Thanh", photo: UiFaces.face)
Artist.create(name: "Vũ Văn Hà", photo: UiFaces.face)


puts "Seeding users.."

File.open("users.csv", "r") do |f|
  f.each_with_index do |line, index|
    password, email, username, photo, genre1, artist1 = line.chomp.split (",")

  User.create(password: password, email: email, username: username, photo: photo, genre1: genre1, artist1: artist1)
  end
end

# File.open("artists100.csv", "r") do |f|
#   f.each_with_index do |line, index|
#     name = line.chomp.split (",")
#   @artist = Artist.create(name: name)
#   @artist.update_attribute(photo: UiFaces.face)
#   end
# end

File.open("genres.csv", "r") do |f|
  f.each_with_index do |line, index|
    name = line.chomp.split (",")
  Genre.create(name: name)
  end
end

File.open("songs100.csv", "r") do |f|
  f.each_with_index do |line, index|
    genre_id, artist_id, song_id, title, album, link, photo = line.chomp.split (",")
  Song.create(genre_id: genre_id, artist_id: artist_id, song_id: song_id, title: title, album: album, link: link, photo: photo)
  # @song.update_attribute(photo: "http://lorempixel.com/400/200/nightlife/#{rand(1..10)}")
  end
end
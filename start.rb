a = User.first
b = User.second
c = User.third
d = User.fourth
e = User.fifth
f = User.find_by_id(6)
g = User.find_by_id(7)
h = User.find_by_id(8)
i = User.find_by_id(9)
j = User.find_by_id(10)
z = User.last


s1 = Song.first
s2 = Song.second
s3 = Song.third
s4 = Song.fourth
s5 = Song.fifth
s6 = Song.find_by_id(6)
s7 = Song.find_by_id(7)
s8 = Song.find_by_id(8)
s9 = Song.find_by_id(9)
s10 = Song.find_by_id(10)
sz = Song.last

a1 = Artist.first
a2 = Artist.second
a3 = Artist.third
a4 = Artist.fourth
a5 = Artist.fifth
a6 = Artist.find_by_id(6)
a7 = Artist.find_by_id(7)
a8 = Artist.find_by_id(8)
a9 = Artist.find_by_id(9)
a10 = Artist.find_by_id(10)
az = Artist.last


a.like(s1)
b.like(s1)
b.like(s2)
c.like(s1)
c.like(s3)
d.like(s1)
d.like(s4)
e.like(s1)
e.like(s5)
f.like(s6)
f.like(s7)
g.like(s8)
g.like(s9)
h.like(s10)
h.like(sz)
i.like(s1)
i.like(s2)
e.like(s1)
e.like(s5)
z.like(s1)
z.like(sz)

a.like(a1)
b.like(a2)
c.like(a3)
d.like(a4)
e.like(a5)
z.like(az)
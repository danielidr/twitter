# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@usuario = User.create([{ email: "prueba1@gmail.com", name: "Prueba", profile_picture: "https://rcdn.rolloid.net/uploads/2017/09/20-fotos-que-demuestran-que-los-golden-son-los-perritos-mas-puros-del-mundo-1506077057.jpg", password: "123456", password_confirmation: "123456" }])

u_id = @usuario[0].id

60.times do |i|
    Tweet.create([{ content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer blandit #{i}", user_id: u_id }])
end
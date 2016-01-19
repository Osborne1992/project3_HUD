# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Platform.delete_all
Platform.create!(name: "PlayStation", owner: "Sony", released: "1995")
Platform.create!(name: "PlayStation 2", owner: "Sony", released: "2000")
Platform.create!(name: "PlayStation Portable", owner: "Sony", released: "2005")
Platform.create!(name: "PlayStation 3", owner: "Sony", released: "2007")
Platform.create!(name: "PlayStation Vita", owner: "Sony", released: "2012")
Platform.create!(name: "PlayStation 4", owner: "Sony", released: "2013")
Platform.create!(name: "Nintendo 64", owner: "Nintendo", released: "1997")
Platform.create!(name: "GameCube", owner: "Nintendo", released: "2002")
Platform.create!(name: "Nintendo DS", owner: "Nintendo", released: "2005")
Platform.create!(name: "Wii", owner: "Nintendo", released: "2006")
Platform.create!(name: "Nintendo 3DS", owner: "Nintendo", released: "2011")
Platform.create!(name: "Wii U", owner: "Nintendo", released: "2012")
Platform.create!(name: "DreamCast", owner: "Sega", released: "1999")
Platform.create!(name: "Xbox", owner: "Microsoft", released: "2002")
Platform.create!(name: "Xbox 360", owner: "Microsoft", released: "2005")
Platform.create!(name: "Xbox One", owner: "Microsoft", released: "2013")
Platform.create!(name: "PC", owner: "Master Race", released: "0000")
Platform.create!(name: "Mac", owner: "Apple", released: "0000")

Game.delete_all
Game.create!(name: "Halo 3", genre: "First-Person Shooter", developer: "Bungie", publisher: "Microsoft", release_date: "26 Sep 2007")
Game.create!(name: "Call of Duty 4: Modern Warfare", genre: "First-Person Shooter", developer: "Infinity Ward", publisher: "Activision", release_date: "9 Nov 2007")
Game.create!(name: "Gears of War 3", genre: "Third-Person Shooter", developer: "Epic Games", publisher: "Microsoft", release_date: "20 Sep 2011")
Game.create!(name: "Grand Theft Auto V", genre: "Action-Adventure", developer: "Rockstar North", publisher: "Rockstar Games", release_date: "17 Sep 2013")
Game.create!(name: "Assassin's Creed: Brotherhood", genre: "Action-Adventure, Stealth", developer: "Ubisoft Montreal", publisher: "Ubisoft", release_date: "19 Nov 2010")

User.delete_all
User.create!(first_name: "Simon", last_name: "Osborne", username: "Osborne1992", password: "password")
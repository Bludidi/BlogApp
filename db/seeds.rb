# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Harry', photo: 'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg', bio: 'Doctor from USA.')
second_user = User.create(name: 'Noqs', photo: 'https://images.pexels.com/photos/325045/pexels-photo-325045.jpeg', bio: 'Doctor from USA.')
third_user = User.create(name: 'John', photo: 'https://images.pexels.com/photos/45911/peacock-plumage-bird-peafowl-45911.jpeg', bio: 'Doctor from USA.')
fourth_user = User.create(name: 'Jb', photo: 'https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg', bio: 'Doctor from USA.')
fifth_user = User.create(name: 'Wang', photo: 'https://images.pexels.com/photos/847393/pexels-photo-847393.jpeg', bio: 'Doctor from USA.')
sixth_user = User.create(name: 'Bob', photo: 'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg', bio: 'Doctor from USA.')
seventh_user = User.create(name: 'Xi', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg', bio: 'Doctor from USA.')

first_post = Post.create(author: second_user, title: 'Hello', text: 'This is my first post')

Comment.create(post: first_post, author: first_user, text: 'Hi mary!' )
Like.create(post: first_post, author: first_user )
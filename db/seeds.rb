# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Peter', photo: 'https://imgur.com/xF8eA5', bio: 'Hi my name is Peter')
User.create(name: 'John', photo: 'https://imgur.com/Af4quY7', bio: 'Hi my name is John')
User.create(name: 'Micheal', photo: 'https://imgur.com/h1Ju8Aq', bio: 'Hi my name is Micheal')

Post.create(user: User.first, title: 'What is MVC pattern', text: 'Model–view–controller is a software architectural pattern commonly used for developing user interfaces that divide the related program logic into three interconnected elements.')
Post.create(user: User.first, title: 'When to use React.js', text: 'It\'s better to use React for building interactive user interfaces and web applications quickly and efficiently with significantly less code than you would with vanilla JavaScript.')
Post.create(user: User.second, title: 'What does API mean?', text: 'An application programming interface is a way for two or more computer programs to communicate with each other. It is a type of software interface, offering a service to other pieces of software.')
Post.create(user: User.third, title: 'What is ACID transaction', text: 'In computer science, ACID is a set of properties of database transactions intended to guarantee data validity despite errors, power failures, and other mishaps. In the context of databases, a sequence of database operations that satisfies the ACID properties is called a transaction.')

Comment.create(post: Post.first, user: User.second, text: 'Cool post.' )
Comment.create(post: Post.second, user: User.second, text: 'React is so amazing.' )
Comment.create(post: Post.third, user: User.first, text: 'thanks for the information.' )
Comment.create(post: Post.fourth, user: User.first, text: 'Does NoSQL have ACID transaction.' )
Comment.create(post: Post.first, user: User.third, text: 'Nice post. Can you make another one to discuss about the difference between MVC and Restful API.' )
Comment.create(post: Post.second, user: User.third, text: 'I\'m a Vue developer. I always hear good things about react. I might try to use in the future.' )

User.find_by(name: 'Peter')
User.find_by(name: 'John').update(bio: 'Hi my name is John and i\'m from the United States')
User.create(name: 'Lilia', photo: 'https://imgur.com/14hY8AQ6j', bio: 'Hi my name is lilia')
User.find_by(name: 'Lilia').destroy

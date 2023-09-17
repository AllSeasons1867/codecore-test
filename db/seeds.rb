# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



Answer.delete_all
Question.delete_all 
User.delete_all

PASSWORD = "password"

super_user = User.create(
    first_name: "John",
    last_name: "Bogle",
    email: "jb@vanguard.com",
    password: PASSWORD
)



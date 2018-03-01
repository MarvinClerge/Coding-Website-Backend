# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Challenge.destroy_all
Code.destroy_all
User.destroy_all
user = User.create!(username: 'marvin', password: 'moon')

content = "arr1 =  [\"Sydney\", \"Melbourne\", \"Brisbane\", \"Perth\"],
arr2 =  [\"New York\", \"Miami\", \"San Fransisco\", \"Los Angeles\"],
result = arr1.concat(arr2).toString()"

Code.create!(
  user: user,
  content: content,
  language: 'javascript'
)

Challenge.create!(
  user: user,
  title: "Adding Numbers",
  description: "Adding to this mystery number should result in 2",
  content: "//ENTER CODE",
  test_description: "result should equal 2",
  test_value: "1",
  test_expected: "2"
)

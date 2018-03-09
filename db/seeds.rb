Challenge.destroy_all
Code.destroy_all
User.destroy_all


user = User.create!(username: 'marvin', password: 'moon')

content = "arr1 = [\"Sydney\", \"Melbourne\", \"Brisbane\", \"Perth\"],
arr2 = [\"New York\", \"Miami\", \"San Fransisco\", \"Los Angeles\"],
result = arr1.concat(arr2).toString()"

Code.create!(
  user: user,
  content: content,
  language: 'javascript'
)

# Reverse String
Challenge.create!(
  user: user,
  title: "Reverse a string",
  description: "Reverse the provide string without using the .reverse() method",
  test_description: "expected 'olleh'",
  test_value: "hello",
  test_value_type: "string",
  test_expected: "olleh",
  test_expected_type: "string"
)

# Square Number
Challenge.create!(
  user: user,
  title: "Square the Number",
  description: "Square and return the provided number",
  test_description: "the number is squared",
  test_value: '3',
  test_value_type: "number",
  test_expected: '9',
  test_expected_type: "number"
)

# Check Prime
Challenge.create!(
  user: user,
  title: "Prime?",
  description: "Create a function that returns if a number is a prime",
  test_description: "the number is a prime",
  test_value: '137',
  test_value_type: "boolean",
  test_expected: 'true',
  test_expected_type: "boolean"
)

# Counting Zeros
Challenge.create!(
  user: user,
  title: "Counting Zeros",
  description: "Count Total number of zeros from 1 upto n",
  test_description: "returns the correct amount of zeros",
  test_value: '2014',
  test_value_type: "number",
  test_expected: '223',
  test_expected_type: "number"
)

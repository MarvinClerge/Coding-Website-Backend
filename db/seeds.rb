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
Challenge.create!(
  user: user,
  title: "Squared",
  description: "square the privided number",
  test_description: "expected 9",
  test_value: '3',
  test_value_type: "number",
  test_expected: '9',
  test_expected_type: "number"
)
Challenge.create!(
  user: user,
  title: "Boolean",
  description: "return true",
  test_description: "is true",
  test_value: 'true',
  test_value_type: "boolean",
  test_expected: 'true',
  test_expected_type: "boolean"
)

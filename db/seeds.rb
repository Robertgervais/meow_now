# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "robertgervais22@gmail.com", username: "Bobby", password: "password", admin: true, membership: "B", confirmed: true, active: true)
User.create(email: "will@cutcatscourier.com", username: "Will Baxter", password: "cutcats123", admin: true, membership: "A", active: true)
User.create(email: "1@test.com", username: "1", password: "password", admin: false, membership: "A", active: true)
User.create(email: "2@test.com", username: "2", password: "password", admin: false, membership: "A", active: true)
User.create(email: "3@test.com", username: "3", password: "password", admin: false, membership: "B", active: true)
User.create(email: "4@test.com", username: "4", password: "password", admin: false, membership: "A", active: true)
User.create(email: "5@test.com", username: "5", password: "password", admin: false, membership: "B", active: true)
User.create(email: "6@test.com", username: "6", password: "password", admin: false, membership: "A", active: true)
User.create(email: "7@test.com", username: "7", password: "password", admin: false, membership: "B", active: true)
User.create(email: "8@test.com", username: "8", password: "password", admin: false, membership: "A", active: true)
User.create(email: "9@test.com", username: "9", password: "password", admin: false, membership: "B", active: true)
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")
Ballot.create(ballot_issue: "Test", content: "Just your standard ballot", options: "Yes, No", user_id: 1, ballot_type: "Private")

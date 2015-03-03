# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "\nCreating users..."
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "example",
  )
  print "|"
end

puts "\nCreating projects..."
20.times do
  Project.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    funding_goal: 1000 + rand(10000),
    start_date: Faker::Time.between(2.days.ago, Time.now, :all),
    end_date: Faker::Time.forward(21, :all),
    owner_id: User.all.sample.id
  )
  print "|"
end

puts "\nCreating rewards..."

projects = Project.all
projects.each do |project|
  reward_amount = 10
  5.times do
    Reward.create!(
      title: Faker::Hacker.noun,
      description: Faker::Hacker.say_something_smart,
      amount: 10 + reward_amount,
      project_id: project.id,
    )
    print "|"

    reward_amount = reward_amount * 2
  end
end
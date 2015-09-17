require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all

users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :hashed_password   => 'password',
                :city      => Faker::Address.city,
                :description => Faker::Company.bs )
end


questions = 10.times.map do
  Question.create!(
                :title => Faker::Name.title,
                :user_id => rand(10) + 1,
                :description => Faker::Company.bs )
end

answers = 10.times.map do
  Answer.create!(
                :description => Faker::Company.bs,
                :question_id => rand(10) + 1,
                :user_id => rand(10) + 1
                )
end
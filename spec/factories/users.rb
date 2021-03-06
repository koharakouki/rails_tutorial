FactoryBot.define do
	factory :user do
		name { 'Example User' }
		sequence(:email) { |n| "user_#{n}@exmaple.com"}
		password { 'password' }
		password_confirmation { 'password'}
	end
end
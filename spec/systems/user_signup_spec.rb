# require 'rails_helper'

# RSpec.describe 'users', type: :system do
# 	describe 'user create a new acount' do
# 		context '有効な値が入力されたとき' do
# 			before do
# 				visit signup_path
# 				fill_in 'Name', with: 'testuser'
# 				fill_in 'Email', with: 'testuser@example.com'
# 				fill_in 'Password', with: 'password'
# 				fill_in 'Confirmation', with: 'password'
# 				click_button 'Create my account'
# 			end
# 			it 'フラッシュメッセージが表示される' do
# 				expect(page).to have_selector('.alert-success', text: 'Welcome to the Sample App')
# 			end
# 		end

# 		context '無効な値が入力されたとき' do
# 			before do
# 				visit signup_path
# 				fill_in 'Name', with: ''
# 				fill_in 'Email', with: ''
# 				fill_in 'Password', with: ''
# 				fill_in 'Confirmation', with: ''
# 				click_button 'Create my account'
# 			end

# 			subject { page }
# 			it 'エラーの検証' do
# 				is_expected.to have_selector('#error_explanation')
# 				is_expected.to have_selector('.alert-danger', text: 'The form contains 6 errors.')
# 				is_expected.to have_content("Password can't be blank", count: 2)
# 			end

# 			it 'URLの検証' do
# 				is_expected.to have_current_path '/signup'
# 			end
# 		end
# 	end
# end

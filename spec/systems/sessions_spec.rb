require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
	before { visit login_path }

	describe '有効な値を入力する' do
		let!(:user) { create(:user, email: 'loginuser@example.com', password: 'password') }
		before do
			fill_in 'Email', with: 'loginuser@example.com'
			fill_in 'Password', with: 'password'
			click_button 'Log in'
		end
		subject { page }
		it 'ログインしたときのページレイアウト' do
			is_expected.to have_current_path root_path
			is_expected.to have_link nil, href: login_path
			# click_link 'Account'
			# is_expected.to have_link 'Profile', href: user_path(user)
			# is_expected.to have_link 'Log out', href: logout_path
		end

		# it 'ログアウトする' do
		# 	click_link 'Account'
		# 	click_link 'Log out'
		# 	is_expected.to have_current_path root_path
		# 	is_expected.to have_link 'Log in', href: login_path
		# 	is_expected.to_not have_link 'Account'
		# 	is_expected.to_not have_link nil, href: logout_path
		# 	is_expected.to_not have_link nil, href: user_path(user)
		# end
	end

	describe '無効な値を入力する' do
		before do
			fill_in 'Email', with: ''
			fill_in 'Password', with: ''
			click_button 'Log in'
		end
		subject { page }
		it 'フラッシュメッセージが表示される' do
			is_expected.to have_selector('.alert', text: 'Invalid email/password combination')
			is_expected.to have_current_path login_path
		end
		context '別のページへ' do
			before { visit root_path }
			it 'フラッシュメッセージが消える' do
				is_expected.to_not have_selector('.alert-danger', text: 'Invalid email/password combination')
			end
		end
	end
end

require 'rails_helper'

RSpec.describe 'sessions_controllerのテスト' do
	let!(:user) { create(:user) }
	describe 'POST #create' do
		it 'ログインに成功する' do
			post login_path, params: { session: { email: user.email,
												  password: user.password } }
			expect(response).to redirect_to root_path
			# expect(is_logged_in?).to be_truthy
		end
	end

	describe 'DELETE #destroy' do
		it 'ログアウト後' do
			delete logout_path
			expect(response).to redirect_to root_path
			expect(is_logged_in?).to_not be_truthy
		end
	end
end
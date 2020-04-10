require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
	describe 'GET #new' do
		it '新規登録ページが表示される' do
			get signup_path
			expect(response).to have_http_status 200
		end
	end

	describe 'POST #create' do
		context '有効なユーザーの検証' do
			it 'ユーザーが追加される' do
				expect do
					post signup_path, params: { user: attributes_for(:user) }
				end.to change(User, :count).by(1)
			end
			context 'ユーザーが追加された後' do
				let(:user) { create(:user) }
				before { post signup_path, params: { user: attributes_for(:user) } }
				subject { response }
				#リダイレクト先をルートパスにしているのは、メールの有効化をしているから
				it { is_expected.to redirect_to root_path }
				it { is_expected.to have_http_status 302 }
			end
		end

		context '無効なユーザーの検証' do
			let(:user_params) { attributes_for(:user, name: ' ',
													  email: 'user@invalid',
													  password: '',
													  password_confirmation: '') }
			it 'ユーザーが追加されない' do
				expect do
					post signup_path, params: { user: user_params }
				end.to change(User, :count).by(0)
			end
		end
	end
end
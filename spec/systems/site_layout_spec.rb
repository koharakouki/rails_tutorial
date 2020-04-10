require 'rails_helper'

RSpec.describe 'site layout', type: :system do
	context 'access to root_path' do
		before { visit root_path }
		subject { page }
		it 'リンクが正しい' do
			is_expected.to have_link nil, href: root_path, count: 2
			is_expected.to have_link 'Help', href: help_path
			is_expected.to have_link 'About', href: about_path
			is_expected.to have_link 'Contact', href: contact_path
		end
	end

	context 'access to signup_path' do
		before { visit signup_path }
		subject { page }
		it 'リンクが正しい' do
			is_expected.to have_content 'Sign up'
			is_expected.to have_title full_title('Sign up')
		end
	end
end

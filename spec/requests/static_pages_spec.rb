require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do
	before { @base_title = 'Ruby on Rails Tutorial Sample App' }

    context 'GET #home' do
	    before { get root_path }
	    it 'トップページが表示される' do
	      expect(response).to have_http_status 200
	    end
	    it "タイトルが 'Ruby on Rails Tutorial Sample App'" do
	      expect(response.body).to include full_title('')
	      expect(response.body).to_not include " | #{@base_title}"
	    end
	end

	context 'GET #help' do
		before { get help_path }
		it 'ヘルプページが表示される' do
			expect(response.body).to include full_title('Help')
		end
	end

	context 'GET #about' do
		before { get about_path }
		it 'アバウトページが表示される' do
			expect(response.body).to include full_title('About')
		end
	end

	context 'GET #contact' do
		before { get contact_path }
		it 'コンタクトページが表示される' do
			expect(response.body).to include full_title('Contact')
		end
	end
end
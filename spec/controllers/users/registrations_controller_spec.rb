require 'spec_helper'
require 'rails_helper'
require 'pp'

RSpec.describe Users::RegistrationsController, type: :controller do
	render_views
	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]
	end

	describe 'POST #create' do
		let(:user_params) { { name: 'teste', password: '123456', email: 'test@test.com' } }
		subject { User.last } 

		before do
			post :create, params: {user: user_params}
		end

		context 'when send valid parameters to controller' do
	      it 'add one user to the database'  do
	      	expect(User.count).to eql(1)
	      end

	      it 'add user to the database with provided values' do
	        expect(subject.name).to eql(user_params[:name])
	        expect(subject.email).to eql(user_params[:email])
	        expect(subject.encrypted_password).to be_a(String)
	      end
	    end
	end
end
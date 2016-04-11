require 'rails_helper'

describe CompaniesController do
  # need to add support for logged in user access only
  # user must be logged in 
  # a user can only create one company profile 
  # a user can only create company if is an employer 
  
  describe 'POST create' do 
    it_behaves_like 'requires_sign_in' do 
      let(:action) { post :create, company: {name: 'Acme Inc', address: '123 Main St', 
                  city: 'Wickliffe', state: 'Ohio', zip: 44092 } }
    end
    
    context 'with valid input' do 
      let(:jim) { Fabricate(:user) }
      
      before do 
        session[:user_id] = jim.id
        
        post :create, company: {name: 'Acme Inc', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }      
      end 
      
      it 'adds a company to the database' do
        expect(Company.count).to eq(1)
      end
      
      it 'redirects to the users profile page' do
        expect(response).to redirect_to user_path(jim.id)
      end
      
      it 'sets the success message' do
        expect(flash[:success]).to be_present 
      end
      
      it 'assigns the current user to the company' do
        expect(User.first.company).to be_present 
      end
    end 
    
    context 'with invalid input' do
      let(:jim) { Fabricate(:user) }
      
      before do 
        session[:user_id] = jim.id 
        
        post :create, company: {name: '', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
      end
      
      it 'does not add a company to the database' do
        expect(Company.count).to eq(0)
      end
      
      it 'renders the new company template' do
        expect(response).to redirect_to new_company_path
      end
      
      it 'sets the error message' do 
        expect(flash[:danger]).to be_present
      end 
    end 
  end 
end 
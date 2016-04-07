require 'rails_helper'

describe CompaniesController do
  # need to add support for logged in user access only
  # user must be logged in 
  # user must be an employer 
  
  describe 'POST create' do 
    context 'with valid input' do 
      it 'adds a company to the database' do 
        post :create, company: {name: 'Acme Inc', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(Company.count).to eq(1)
      end
      
      it 'redirects to the users profile page' do
        post :create, company: {name: 'Acme Inc', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(response).to redirect_to new_company_path
      end
      
      it 'sets the success message' do 
        post :create, company: {name: 'Acme Inc', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(flash[:success]).to be_present 
      end
    end 
    
    context 'with invalid input' do 
      it 'does not add a company to the database' do 
        post :create, company: {name: '', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(Company.count).to eq(0)
      end
      
      it 'renders the new company template' do 
        post :create, company: {name: '', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(response).to redirect_to new_company_path
      end
      
      it 'sets the error message' do 
        post :create, company: {name: '', address: '123 Main St', 
                      city: 'Wickliffe', state: 'Ohio', zip: 44092 }
        expect(flash[:danger]).to be_present
      end 
    end 
  end 
end 
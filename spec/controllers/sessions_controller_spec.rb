require 'rails_helper'

describe SessionsController do
  describe 'POST create' do 
    context 'with valid input' do 
      it 'places a user in the session' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: shawn.password
        expect(session[:user_id]).to eq(shawn.id)
      end
    
      it 'sets the flash message' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: shawn.password
        expect(flash[:success]).to be_present
      end 
    
      it 'redirects to the home page' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: shawn.password
        expect(response).to redirect_to user_path(shawn)
      end      
    end
    
    context 'with invalid input' do 
      it 'does not place a user in the session' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: 'fakepass'
        expect(session[:user_id]).to be_falsey
      end
      
      it 'renders the login page' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: 'fakepass'
        expect(response).to render_template :new   
      end 
      
      it 'sets the flash error message' do 
        shawn = Fabricate(:user)
        post :create, username: shawn.username, password: 'fakepass'
        expect(flash[:danger]).to be_present
      end 
    end 
  end
  
  describe 'DELETE destroy' do 
    it 'removes the user from the session' do 
      delete :destroy 
      expect(session[:user_id]).to be_falsey
    end 
    
    it 'redirects to the login page' do 
      delete :destroy 
      expect(response).to redirect_to signin_path 
    end 
    
    it 'sets the flash success message' do 
      delete :destroy 
      expect(flash[:success]).to be_present
    end
  end 
end
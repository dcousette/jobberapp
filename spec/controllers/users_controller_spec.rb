require 'rails_helper'

describe UsersController do
  describe 'POST create' do 
    context 'with valid input' do 
      it 'saves a user to the database' do 
        post :create, { user: { first_name: 'Test', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
        
        expect(User.count).to eq(1)
      end 
    
      it 'redirects to the user page' do 
        post :create, { user: { first_name: 'Test', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
        
        expect(response).to redirect_to(users_path)
      end 
      
      it 'sets the success message' do 
        post :create, { user: { first_name: 'Test', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
        
        expect(flash[:success]).to be_present
      end 
    end 
    
    context 'with invalid input' do 
      it 'does not add a user to the database' do 
        post :create, { user: { first_name: '', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
                      
        expect(User.count).to eq(0)
      end 
      
      it 'renders the new template' do 
        post :create, { user: { first_name: '', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
        
        expect(response).to render_template(:new)  
      end
      
      it 'sets the error message' do 
        post :create, { user: { first_name: '', last_name: 'User', 
                      email: 'test@gmail.com', employer: false, username: 'testuser' } }  
        
        expect(flash[:warning]).to be_present  
      end
    end 
  end 
  
  describe 'GET show' do 
    it 'sets @user' do 
      jim = User.create(first_name: "Jim", last_name: "Bond", email: "jb@bind.com", employer: false, username: 'jamesbond')
      get :show, id: jim.id
      expect(assigns(:user).id).to eq(jim.id)
    end 
  end
  
  describe 'PUT update' do
    context 'with valid input' do 
      it 'updates the user attributes' do
        jim = Fabricate(:user)
        put :update, user: { first_name: "Barry", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(jim.reload.first_name).to eq("Barry")
      end 
      
      it 'redirects to the user page' do 
        jim = Fabricate(:user)
        put :update, user: { first_name: "Barry", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(response).to redirect_to user_path(jim)   
      end
      
      it 'sets the update success message' do
        jim = Fabricate(:user)
        put :update, user: { first_name: "Barry", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(flash[:success]).to be_present
      end
    end 
    
    context 'with invalid input' do
      it 'does not update the user' do 
        jim = Fabricate(:user, first_name: 'Jimmy', last_name: 'Cousette')
        put :update, user: { first_name: "", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(jim.reload.first_name).to eq('Jimmy')
      end
      
      it 'redirects to the edit user path' do 
        jim = Fabricate(:user, first_name: 'Jimmy', last_name: 'Cousette')
        put :update, user: { first_name: "", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(response).to redirect_to edit_user_path(jim)  
      end 
      
      it 'sets the flash error message' do 
        jim = Fabricate(:user, first_name: 'Jimmy', last_name: 'Cousette')
        put :update, user: { first_name: "", last_name: "Bond", email: "jb@bind.com", 
                      employer: false, username: 'jamesbond'}, id: jim.id
        expect(flash[:danger]).to be_present
      end 
    end 
  end 
end 

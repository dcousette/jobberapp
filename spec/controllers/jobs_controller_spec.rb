require 'rails_helper'

describe JobsController do
  describe 'GET new' do
    it_behaves_like 'requires_sign_in' do 
      let(:action) { get :new, company_id: 1 } 
    end
    
    it 'sets up @job' do 
      jim = Fabricate(:user)
      jim.company = Fabricate(:company)
      session[:user_id] = jim.id
      get :new, company_id: jim.company.id
      expect(assigns(:job)).to be_present 
    end 
  end 
  
  describe 'POST create' do 
    let(:jim) { Fabricate(:user) }
    let(:acme) { Fabricate(:company) } 
    
    it_behaves_like 'requires_sign_in' do 
      let(:action) { post :create, job: { title: 'Sr. Manager', description: 'Awesome job',
      requirements: 'Be awesome at all times', salary: 80000 }, company_id: acme.id, user_id: jim.id }  
    end 
    
    context 'with valid input' do 
      it 'adds a job to the database' do
        session[:user_id] = jim.id
        post :create, job: { title: 'Sr. Manager', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000 }, company_id: acme.id, user_id: jim.id
        expect(Job.count).to eq(1)
      end 
      
      it 'redirects to the user profile page' do 
        session[:user_id] = jim.id
        post :create, job: { title: 'Sr. Manager', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000}, company_id: acme.id, user_id: jim.id
        expect(response).to redirect_to user_path(jim)
      end 
      
      it 'sets the flash success message' do 
        session[:user_id] = jim.id
        post :create, job: { title: 'Sr. Manager', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000}, company_id: acme.id, user_id: jim.id
        expect(flash[:success]).to be_present
      end
    end
    
    context 'with invalid input' do
      it 'does not add a job to the database' do 
        session[:user_id] = jim.id
        post :create, job: { title: '', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000}, company_id: acme.id, user_id: jim.id
        expect(Job.count).to eq(0)
      end
      
      it 'renders the new job template' do 
        session[:user_id] = jim.id
        post :create, job: { title: '', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000}, company_id: acme.id, user_id: jim.id
        expect(response).to render_template(:new)  
      end 
      
      it 'sets the flash error message' do 
        session[:user_id] = jim.id
        post :create, job: { title: '', description: 'Awesome job', requirements: 'Be awesome at all times', 
                      salary: 80000}, company_id: acme.id, user_id: jim.id
        expect(flash[:danger]).to be_present
      end 
    end 
  end 
  
  describe 'GET show' do 
    it_behaves_like 'requires_sign_in' do 
      let(:action) { get :show, id: 4}
    end
    
    it 'sets @job' do 
      jim = Fabricate(:user)
      gig = Fabricate(:job)
      session[:user_id] = jim.id 
      get :show, id: gig.id 
      expect(assigns(:job).id).to eq(gig.id)
    end
  end 
end 

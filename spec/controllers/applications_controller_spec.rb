require 'rails_helper'

describe ApplicationsController do
  let(:acme) {Fabricate(:company)}
  let(:boss) {Fabricate(:user, employer: true, company: acme)}
  let(:gig) {Fabricate(:job, company: acme, user: boss)}

  describe 'GET new' do
    it 'sets up @job' do
      get :new, job_id: gig.id
      expect(assigns(:job)).to be_present
      expect(assigns(:job).id).to eq(gig.id)
    end

    it 'sets up @application' do
      get :new, job_id: gig.id
      expect(assigns(:application)).to be_present
    end
  end

  describe 'POST create' do
    it_behaves_like 'requires_sign_in' do
      let(:action) do
        post :create, job_id: gig.id, application: {
                      interest_reason: 'I need a job!', availability: 'Today!',
                      cover_letter: ''}
      end
    end

    context 'with valid input' do
      it 'adds a new application in the database' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: 'I need a job!', availability: 'Today!',
                      cover_letter: 'I am awesome.'}
        expect(Application.count).to eq(1)
      end

      it 'sets the flash success message' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: 'I need a job!', availability: 'Today!',
                      cover_letter: 'I am awesome.'}
        expect(flash[:success]).to be_present
      end

      it 'redirects to the job path' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: 'I need a job!', availability: 'Today!',
                      cover_letter: 'I am awesome.'}
        expect(response).to redirect_to job_path(gig)
      end
    end

    context 'with invalid input' do
      it 'does not save an application in the database' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: '', availability: '',
                      cover_letter: 'I am awesome.'}
        expect(Application.count).to eq(0)
      end

      it 'sets the flash error message' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: '', availability: '',
                      cover_letter: 'I am awesome.'}
        expect(flash[:danger]).to be_present
      end

      it 'redirects to the new application template' do
        session[:user_id] = Fabricate(:user)
        post :create, job_id: gig.id, application: {
                      interest_reason: '', availability: '',
                      cover_letter: 'I am awesome.'}
        expect(response).to redirect_to new_job_application_path 
      end
    end
  end
end

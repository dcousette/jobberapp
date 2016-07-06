require 'rails_helper'

describe ApplicationsController do
  describe 'GET new' do
    it 'sets up @job' do
      acme = Fabricate(:company)
      boss = Fabricate(:user, employer: true, company: acme)
      gig = Fabricate(:job, company: acme, user: boss)
      get :new, job_id: gig.id
      expect(assigns(:job)).to be_present
      expect(assigns(:job).id).to eq(gig.id)
    end

    it 'sets up @application' do
      acme = Fabricate(:company)
      boss = Fabricate(:user, employer: true, company: acme)
      gig = Fabricate(:job, company: acme, user: boss)
      get :new, job_id: gig.id
      expect(assigns(:application)).to be_present
    end
  end

  describe 'POST create' do
    # it_behaves_like 'requires_sign_in' do
    #   let(:action) do
    #     post :create, job_id: gig.id, application: { user_id: boss.id,
    #                   interest_reason: 'I need a job!', availability: 'Today!',
    #                   cover_letter: nil}
    #   #review rspec docs on shared example
    #   end
    # end
    context 'with valid input' do
      it 'adds a new application in the database' do
        # acme = Fabricate(:company)
        # boss = Fabricate(:user, employer: true, company: acme)
        # gig = Fabricate(:job, company: acme, user: boss)
        # post :create, job_id: gig.id, application: { user_id: boss.id,
        #               interest_reason: 'I need a job!', availability: 'Today!',
        #               cover_letter: nil}
        # expect(Application.count).to eq(1)
      end

      it 'sets the flash success message'
      it 'redirects to the job path' do
        # acme = Fabricate(:company)
        # boss = Fabricate(:user, employer: true, company: acme)
        # gig = Fabricate(:job, company: acme, user: boss)
        # post :create, job_id: gig.id
        # expect(response).to redirect_to job_path(gig)
      end
    end

    context 'with invalid input' do
      it 'sets the flash error message'
      it 'redirects to the new application template'
    end
  end
end

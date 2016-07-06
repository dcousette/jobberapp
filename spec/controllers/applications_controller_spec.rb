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
    context 'with valid input' do
      it 'sets up @job'
      it 'adds a new application in the database'
      it 'sets the flash success message'
      it 'redirects to the job path'
    end

    context 'with invalid input' do
      it 'sets the flash error message'
      it 'redirects to the new application template'
    end
  end
end

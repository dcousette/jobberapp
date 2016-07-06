class ApplicationsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @application = Application.new
  end
end

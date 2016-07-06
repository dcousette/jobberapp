class ApplicationsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @application = Application.new
  end

  def create
    @job = Job.find(params[:job_id])
    @application = @job.applications.build(application_params)
    @application.user_id = current_user.id
    redirect_to job_path(@job)
  end

  private

  def application_params
    params.require(:application).permit(:user_id, :interest_reason, :availability, :cover_letter)
  end
end

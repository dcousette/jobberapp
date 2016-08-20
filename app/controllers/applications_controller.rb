class ApplicationsController < ApplicationController
  before_action :require_login, only: :create

  def new
    @job = Job.find(params[:job_id])
    @application = Application.new
  end

  def create
    @job = Job.find(params[:job_id])
    @application = @job.applications.build(application_params)
    @application.user_id = current_user.id

    if @application.save
      flash[:success] = 'Your application has been submitted'
      ApplicationMailer.application_confirmation_email(current_user, @job).deliver_now
      redirect_to job_path(@job)
    else
      flash[:danger] = 'Please re-enter your application details'
      redirect_to new_job_application_path
    end
  end

  private

  def application_params
    params.require(:application).permit(:interest_reason, :availability, :cover_letter)
  end
end

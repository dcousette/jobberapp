class JobsController < ApplicationController 
  before_action :require_login
  
  def new 
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new 
  end
  
  def create
    company = Company.find(params[:company_id])
    @job = company.jobs.create(title: params[:job][:title], description: params[:job][:description], 
              requirements: params[:job][:requirements], salary: params[:job][:salary], 
              user_id: current_user.id)
    
    if @job.save 
      flash[:success] = 'Your job has been posted'
      redirect_to current_user
    else 
      flash[:danger] = 'Please enter the correct username/password'
      render :new 
    end 
  end
end 
  
class CompaniesController < ApplicationController
  def new 
    @company = Company.new 
  end 
  
  def create 
    company = Company.create(name: params[:company][:name], address: params[:company][:address], 
                   city: params[:company][:city], state: params[:company][:state], 
                   zip: params[:company][:zip])
                   
    if company.save 
      flash[:success] = 'Your company has been added'
      redirect_to new_company_path #change this to user_path(current_user)
    else 
      flash[:danger] = 'Invalid entry. Please re-enter your details.'
      redirect_to new_company_path
    end 
  end
end 
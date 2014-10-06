module Admin
  class CompaniesController < Manticore::ApplicationController

    edit_images_for Company, [:image]

    def index
      @companies = Company.order(params[:position])
    end
    
    def new
      @company = Company.new
    end
    
    def create
      @company = Company.new(params[:company])
      if @company.save
        redirect_to admin_companies_path, :notice => "Company successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @company = Company.find(params[:id])
    end
    
    def update
      @company = Company.find(params[:id])
      if @company.update_attributes(params[:company])
        redirect_to admin_companies_path, :notice => "Company successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @company = Company.find(params[:id])
      @company.destroy
      redirect_to admin_companies_path, :notice => "Company destroyed."
    end
    
  end
end

class CompaniesController < ApplicationController

  def index
    if params[:letter]
      @companies = Company.by_letter(params[:letter])
    else
      @companies = Company.where(display: true)
    end

    @letters = Company.where(display: true).inject([]){|result, element| result << element.name.chars.first}.uniq
  end

  def show
    @company = Company.find(params[:id])
  end

end


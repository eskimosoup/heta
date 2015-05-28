module Admin
  class HomePromotionsController < Manticore::ApplicationController
  
    def index
      @home_promotions = HomePromotion.all
    end
    
    def new
      @home_promotion = HomePromotion.new
    end
    
    def create
      @home_promotion = HomePromotion.new(params[:home_promotion])
      if @home_promotion.save
        redirect_to admin_home_promotions_path, :notice => "Home promotion successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @home_promotion = HomePromotion.find(params[:id])
    end
    
    def update
      @home_promotion = HomePromotion.find(params[:id])
      if @home_promotion.update_attributes(params[:home_promotion])
        redirect_to admin_home_promotions_path, :notice => "Home promotion successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @home_promotion = HomePromotion.find(params[:id])
      @home_promotion.destroy
      redirect_to admin_home_promotions_path, :notice => "Home promotion destroyed."
    end
    
  end
end

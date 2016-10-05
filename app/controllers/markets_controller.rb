class MarketsController < ApplicationController
  def new
    @mymarket = Market.new
    @market_method = :post
    @market_path = markets_create_path
  end

  def create
    @mymarket = Market.new
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.county = params[:market][:county]
    @mymarket.state = params[:market][:state]
    @mymarket.zip = params[:market][:zip]
    @mymarket.save
    #redirect_to action: 'markets_home'
  end

  def update
    Market.update(params[:id], :name => params[:market][:name],
                              :address => params[:market][:address],
                              :city => params[:market][:city],
                              :county => params[:market][:county],
                              :state => params[:market][:state],
                              :zip => params[:market][:zip])
    #redirect_to markets_show_path
  end

  def edit
    @mymarket = Market.find(params[:id])
    @market_method = :put
    @market_path = markets_update_path(@mymarket.id)
    if @mymarket == nil
      render :file => 'public/404.html',
          :status => :not_found
    end
  end

  def destroy
  end

  def show
  end

  def index
  end
end

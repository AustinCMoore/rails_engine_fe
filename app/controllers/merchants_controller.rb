class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.new.get_all_merchants
  end

  def show
    @merchant = MerchantFacade.new.get_merchant(params[:id])
  end
end

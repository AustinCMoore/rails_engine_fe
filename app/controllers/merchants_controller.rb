class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.new.get_all_merchants
  end

  def show

  end
end

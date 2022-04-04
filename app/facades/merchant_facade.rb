class MerchantFacade
  def get_all_merchants
    MerchantService.index[:data].map do |data|
      Merchant.new(data)
    end
  end

  def get_merchant(merchant_id)
    merchant_data = MerchantService.show(merchant_id)[:data]
    Merchant.new(merchant_data)
  end
end

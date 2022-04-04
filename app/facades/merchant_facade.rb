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

  def get_merchant_items(merchant_id)
    MerchantService.merchant_items(merchant_id)[:data].map do |data|
      Item.new(data)
    end
  end
end

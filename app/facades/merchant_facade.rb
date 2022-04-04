class MerchantFacade
  def get_all_merchants
    MerchantService.index[:data].map do |data|
      Merchant.new(data)
    end
  end
end

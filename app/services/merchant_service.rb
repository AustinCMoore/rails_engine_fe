class MerchantService
  def self.get_url(url, param = nil)
    conn = Faraday.new(url: "http://localhost:3000/api/v1/")

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.index
    get_url('merchants')
  end
end

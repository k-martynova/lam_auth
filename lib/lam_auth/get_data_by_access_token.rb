module LamAuth
  class GetDataByAccessToken
    def self.call(access_token)
      uri = URI.parse(LamAuth::Settings::HOST_URL)
      req = Net::HTTP.new(uri.host, uri.port)
      resp = begin
               timeout(2) { req.get("/api/users/me.json?access_token=#{access_token}") }
             rescue Timeout::Error
               nil
             end
      resp && resp.is_a?(Net::HTTPOK) ? JSON.parse(resp.body) : nil
    end
  end
end

module LamAuth
  class ParseCookie
    attr_reader :cookie

    def initialize(cookie)
      @cookie = cookie.to_s
    end

    def parse
      correct_sig? ? hash : {}
    end

    private

    def correct_sig?
      Digest::MD5.hexdigest(hash.except('sig').sort.map{|v| v.join('=')}.join + LamAuth::Settings.secret) == hash['sig']
    end

    def hash
      val = CGI.unescape(cookie)
      Rack::Utils.parse_query(val.gsub('"', ''))
    end
  end
end

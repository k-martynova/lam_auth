module LamAuthConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    include Instance
  end

  module Instance
    def current_user
      @current_user ||= lam_cookie['id'] && find_or_create_user
    end

    private

    def lam_cookie
      @lam_cookie ||= ::LamAuth::ParseCookie.new(cookies[::LamAuth::Settings.cookie_name]).parse
    end

    def find_or_create_user
      ::User.find_by(uid: lam_cookie['id']) || ::CreateUserFromLamData.call(::LamAuth::GetDataByAccessToken.call(lam_cookie['access_token']))
    end
  end
end

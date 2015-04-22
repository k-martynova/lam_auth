require 'lam_auth/settings'
require 'lam_auth/helpers'
require 'lam_auth/parse_cookie'
require 'lam_auth/get_data_by_access_token'

ActionController::Base.helper(LamAuth::Helpers)

module LamAuth
end

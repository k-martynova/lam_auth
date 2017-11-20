module LamAuth
  module Helpers
    def lam_auth_include_tag
      javascript_include_tag(*%W{
        #{LamAuth::Settings::HOST_URL}/api/js/OAuthLogin.js
        #{LamAuth::Settings::HOST_URL}/api/js/OAuthLogin.#{LamAuth::Settings.site}.js
      })
    end

    def lam_auth_init_tag(options = {})
      options.reverse_merge!(
        'panelNodeId'          => 'lam-root',
        'appId'                => LamAuth::Settings.id,
        'oauthProviderHostUrl' => LamAuth::Settings::HOST_URL,
        'root_url'             => LamAuth::Settings.root_url,
        'xdReceiverUrl'        => LamAuth::Settings.return_url
      )
      javascript_tag(%|OAuthLogin.init({#{options.map{|k, v| "#{k}: #{v.inspect}"}.join(",\n")}});|)
    end
  end
end

require 'settingslogic'

module LamAuth
  class Settings < Settingslogic
    source "config/lam_auth.yml"

    HOST_URL = 'https://auth.look-at-media.com'

    ROOT_URLS = {
      'lookatme'   => 'http://www.lookatme.ru',
      'village'    => 'http://www.the-village.ru',
      'furfur'     => 'http://www.furfur.me',
      'wonderzine' => 'http://www.wonderzine.com',
    }

    def self.root_url
      ROOT_URLS.fetch(site)
    end

    def self.cookie_name
      "lam_#{id}"
    end
  end
end

require 'settingslogic'

module LamAuth
  class Settings < Settingslogic
    source "config/lam_auth.yml"

    ROOT_URLS = {
      'lookatme'   => 'http://www.lookatme.ru',
      'village'    => 'https://www.the-village.ru',
      'furfur'     => 'http://www.furfur.me',
      'wonderzine' => 'https://www.wonderzine.com',
    }

    HOST_URL = ROOT_URLS.fetch(site)

    def self.root_url
      ROOT_URLS.fetch(site)
    end

    def self.cookie_name
      "lam_#{id}"
    end
  end
end

# frozen_string_literal: true

module Decidim
  module Smsauth
    module Verifications
      module AuthorizationsHelper
        include Decidim::Smsauth::OmniauthHelper
        include Decidim::Smsauth::RegistrationHelper
      end
    end
  end
end

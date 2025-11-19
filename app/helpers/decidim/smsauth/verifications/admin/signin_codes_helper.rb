# frozen_string_literal: true

module Decidim
  module Smsauth
    module Verifications
      module Admin
        module SigninCodesHelper
          def school_options
            ::Decidim::Smsauth::SchoolMetadata.school_options
          end
        end
      end
    end
  end
end

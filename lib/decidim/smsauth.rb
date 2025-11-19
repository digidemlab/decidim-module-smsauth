# frozen_string_literal: true

require "csv"
require "rubyXL"
require "phonelib"

require "decidim/smsauth/engine"
require "decidim/smsauth/admin"
require "decidim/smsauth/admin_engine"
require_relative "smsauth/authorization"
require_relative "smsauth/mail_interceptors"

module Decidim
  # This namespace holds the logic of the `Smsauth` component. This component
  # allows users to create smsauth in a participatory space.
  module Smsauth
    include ActiveSupport::Configurable

    autoload :PhoneNumberFormatter, "decidim/smsauth/phone_number_formatter"

    # Default country if no prefix is given by user
    config_accessor :country_code do
      ENV.fetch("SMSAUTH_DEFAULT_COUNTRY", "SE")
    end

    # The auto email domain that is used for the generated account emails. If
    # this is not set, the organization host will be used and these emails will
    # not be intercepted.
    config_accessor :auto_email_domain do
      nil
    end

    # This configuration adds the validation period for the codes being generated
    # by the teachers. After this period of time since the generated code, the codes
    # would no longer be valid
    config_accessor :global_expiration_period do
      14
    end
  end
end

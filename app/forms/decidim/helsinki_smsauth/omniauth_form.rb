# frozen_string_literal: true

module Decidim
  module HelsinkiSmsauth
    class OmniauthForm < Form
      mimic :sms_sign_in

      attribute :phone_number, String

      validates :phone_number, presence: true
    end
  end
end

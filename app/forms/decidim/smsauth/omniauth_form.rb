# frozen_string_literal: true

module Decidim
  module Smsauth
    class OmniauthForm < Form
      mimic :sms_sign_in

      attribute :phone_number, String

      validates :phone_number, presence: true
      validate :phone_number_is_swedish

      private

      def phone_number_is_swedish
        parsed = Phonelib.parse(phone_number)
        return if parsed.type == :mobile and parsed.country == "SE" and parsed.valid?

        errors.add(:phone_number, I18n.t("decidim.smsauth.omniauth.phone_form.invalid_swedish_number"))
      end
    end
  end
end

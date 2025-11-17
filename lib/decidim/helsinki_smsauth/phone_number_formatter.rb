# frozen_string_literal: true

module Decidim
  module HelsinkiSmsauth
    class PhoneNumberFormatter
      def initialize(phone_number, show_country: true)
        @phone_number = Phonelib.parse(phone_number)
        @show_country = show_country
      end

      def format
        @phone_number.e164
      end

      def country_code_alpha
        @phone_number.country
      end

      def country_code_prefix
        "+#{@phone_number.country_code}"
      end

      def format_human(show_country: true)
        if show_country
          @phone_number.international
        else
          @phone_number.national
        end
      end

      private

      attr_reader :show_country

    end
  end
end

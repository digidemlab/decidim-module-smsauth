# frozen_string_literal: true

module Decidim
  module Smsauth
    class RegisterByPhone < Decidim::Command
      def initialize(user, phone_number, organization, locale)
        @user = user
        @organization = organization
        @locale = locale
        @phone_number = PhoneNumberFormatter.new(phone_number)
      end

      def call
        result = update_or_create_user!
        broadcast(:ok, result)
      rescue ActiveRecord::RecordInvalid => e
        broadcast(:error, e.record)
      end

      private

      #attr_reader :form

      def update_or_create_user!
        return update_user! if @user.present?

        create_user!
      end

      def create_user!
        generated_password = SecureRandom.hex
        Decidim::User.create! do |record|
          record.name = record_name
          record.nickname = UserBaseEntity.nicknamize(record_name, organization: current_organization)
          record.email = generate_email
          record.password = generated_password
          record.password_confirmation = generated_password

          record.skip_confirmation!

          record.phone_number = formatted_phone_number
          record.tos_agreement = "1"
          record.organization = @organization
          record.newsletter_notifications_at = Time.current
          # record.accepted_tos_version = form.organization.tos_version
          record.locale = @locale
        end
      end

      def update_user!
        return unless @user

        @user.update!(phone_number: formatted_phone_number)
        @user
      end

      def generate_email
        EmailGenerator.new(@organization, iso_country_name, formatted_phone_number).generate
      end

      def formatted_phone_number
        @phone_number.format
      end

      def iso_country_name
        @phone_number.country_code_alpha
      end

      def record_name
        I18n.t("decidim.smsauth.common.unnamed_user")
      end
    end
  end
end

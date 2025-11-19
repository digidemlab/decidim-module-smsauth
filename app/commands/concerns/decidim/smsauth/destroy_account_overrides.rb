# frozen_string_literal: true

module Decidim
  module Smsauth
    module DestroyAccountOverrides
      extend ActiveSupport::Concern
      included do
        private

        def destroy_user_account!
          current_user.invalidate_all_sessions!

          current_user.name = ""
          current_user.nickname = ""
          current_user.email = ""
          current_user.personal_url = ""
          current_user.about = ""
          current_user.notifications_sending_frequency = "none"
          current_user.phone_number = ""
          current_user.delete_reason = @form.delete_reason
          current_user.admin = false if current_user.admin?
          current_user.deleted_at = Time.current
          current_user.skip_reconfirmation!
          current_user.avatar.purge
          current_user.save!
        end
      end
    end
  end
end

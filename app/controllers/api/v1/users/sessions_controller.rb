# frozen_string_literal: true

module Api
  module V1
    module Users
      # Signin user
      class SessionsController < Devise::SessionsController
        include ApplicationHelper

        before_action :authenticate_api
        def create
          user = User.find_by('LOWER(email) = ?', session_params[:email].downcase)
          if user.present?
            if user.valid_password?(session_params[:password])
              render json: { meta: { code: I18n.t('response_status.success'), user: UserSerializer.new(user.reload) } }
            else
              render json: { meta: { code: I18n.t('response_status.authentication_error'),
                                     message: I18n.t('response_message.user_signing_failed') } }
            end
          else
            render json: { meta: { code: I18n.t('response_status.authentication_error'),
                                   message: I18n.t('response_message.user_signing_failed') } }
          end
        end

        private

        def session_params
          params.require(:user).permit(:email, :password)
        end
      end
    end
  end
end

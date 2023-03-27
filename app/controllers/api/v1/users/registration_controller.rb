# frozen_string_literal: true

module Api
  module V1
    module Users
      # Register a new user
      class RegistrationController < Devise::RegistrationsController
        include ApplicationHelper

        before_action :authenticate_api
        def create
          build_resource(sign_up_params)
          if resource.save
            render json: { meta: { code: I18n.t('response_status.success'), user: UserSerializer.new(resource) } }
          else
            render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                                   message: resource.errors.full_messages.join(', ') } }
          end
        rescue StandardError => e
          render json: { meta: { code: I18n.t('response_status.unprocessible_entity'), message: e.message } }
        end

        private

        def sign_up_params
          params.require(:user).permit(
            :name,
            :email,
            :password,
            :phone
          )
        end
      end
    end
  end
end

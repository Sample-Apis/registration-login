Rails.application.routes.draw do
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/vnd.sampleapi; version=1' },
      default: { format: :json }
    ) do
      devise_for :users, controllers: { sessions: 'api/v1/users/sessions', registrations: 'api/v1/users/registration' }
    end
  end
end

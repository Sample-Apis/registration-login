# frozen_string_literal: true

# User response serialize
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone
end

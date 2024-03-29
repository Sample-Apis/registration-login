class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
            uniqueness: { case_sensitive: false, allow_nil: true, message: "^ #{I18n.t('user.email_uniqueness')}" }
  validates :phone, uniqueness: { case_sensitive: false }, presence: true
end

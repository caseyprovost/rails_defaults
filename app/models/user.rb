class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :confirmable,
    :recoverable, :rememberable, :validatable

  rolify

  has_many :notifications, as: :recipient

  # Send devise notifications through Sidekiq
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end

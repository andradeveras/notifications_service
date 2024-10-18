class NotificationJob < ApplicationJob
  queue_as :default

  def perform(notification_params)
    Notification.create(notification_params)
  end
end

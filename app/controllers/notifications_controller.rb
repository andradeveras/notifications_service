class NotificationsController < ActionController::API

  def create
    notification = Notification.new(notification_params)

    if notification.save
      render json: { message: 'Notificação recebida com sucesso' }, status: :created
    else
      render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :status, :url, :user_email).tap do |whitelisted|
      # Mapeia os parâmetros para os atributos da tabela
      whitelisted[:task_title] = whitelisted.delete(:title)
      whitelisted[:task_status] = whitelisted.delete(:status)
      whitelisted[:task_url] = whitelisted.delete(:url)
    end
  end
end

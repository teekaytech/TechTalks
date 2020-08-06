module UserHelper
  def user_error_messages(user)
    return unless user.errors.any?

    render partial: 'users/error_messages'
  end
end

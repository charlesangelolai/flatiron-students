module ApplicationHelper
  def is_admin?
    current_user.role_id == 1
  end

  def is_instructor?
    current_user.role_id == 2
  end

  def is_admin_or_owner
    is_admin? || @user == current_user
  end

  def alert_class_by_type(alert_type)
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
      'alert-danger'
    when :warning, :todo
      'alert-warning'
    when :notice, :success
      'alert-success'
    else
      'alert-info'
    end
  end
end

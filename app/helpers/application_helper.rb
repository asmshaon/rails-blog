module ApplicationHelper

  def resource_name
    :user
  end

  def resource_class
    devise_mapping.to
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  BOOTSTRAP_FLASH_MSG = {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: 'close', data: {dismiss: 'alert'})
               if message.is_a?(Array)
                 error_count = pluralize(message.count, "#{msg_type}")
                 concat "<h4>#{error_count} prohibited this form being saved</h4>".html_safe
                 concat message.join('<br/>').html_safe
               else
                 concat message.html_safe
               end
             end)
    end
    nil
  end

end

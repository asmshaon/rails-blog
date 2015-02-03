class RegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      return render :json => {:success => true}
    else
      clean_up_passwords resource
      return render :json => {:success => false,  :errors => resource.errors.full_messages.join('<br/>').html_safe}
    end
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end
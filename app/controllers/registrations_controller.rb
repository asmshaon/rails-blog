class RegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
    build_resource(sign_up_params)

    if request.xhr?
      if resource.save
        sign_up(resource_name, resource)
        return render :json => {:success => true}
      else
        clean_up_passwords resource
        return render :json => {:success => false, :errors => resource.errors.full_messages.join('<br/>').html_safe}
      end
    else
      if resource.save
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        redirect_to '/users/sign_up', :flash => { :error => resource.errors.full_messages.join('<br/>').html_safe }
      end
    end
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end
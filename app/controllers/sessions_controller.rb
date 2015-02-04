class SessionsController < Devise::SessionsController

  respond_to :json

  def create
    if request.xhr?
      if user_signed_in?
        return render :json => {:success => true}
      else
        return render :json => {:success => false, :errors => (I18n.t 'devise.failure.invalid')}
      end
    else
      if user_signed_in?
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        redirect_to root_path
      else
        redirect_to '/users/sign_in', :flash => { :error => (I18n.t 'devise.failure.invalid') }
      end
    end
  end

end

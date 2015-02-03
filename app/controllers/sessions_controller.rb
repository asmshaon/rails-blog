class SessionsController < Devise::SessionsController

  respond_to :json

  def create
    if user_signed_in?
        render :json => {:success => true}
    else
      return render :json => {:success => false, :errors => (I18n.t 'devise.failure.invalid') }
    end
  end

end

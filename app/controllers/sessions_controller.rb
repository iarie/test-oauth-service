class SessionsController < ApplicationController
  def new
    render :new, locals: { provider: params.require(:provider) }
  end

  def create
    user_info = request.env['omniauth.auth']
    render :show, locals: { user_info: user_info }
  end
end

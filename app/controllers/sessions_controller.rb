class SessionsController < ApplicationController
  def new
    render :new, locals: { provider: params.require(:provider) }
  end

  def create
    render :show, locals: { user_info: fetch_user_info }
  end

  private

  def fetch_user_info
    return request.env['omniauth.auth'] unless Rails.env.development?

    OmniAuth::AuthHash.new(
      provider: 'developer',
      credentials: {
        token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv
        aG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
        refresh_token: "NRbtII0kzdptsewzyQAGivCptes=",
        expires: true,
        expires_at: (Time.current + 1.day).to_i
      },
      info_source: "foo",
      info: {
        foo: "bar",
        number: 42
      }
    )
  end
end

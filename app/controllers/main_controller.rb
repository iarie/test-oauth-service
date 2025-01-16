class MainController < ApplicationController
  def index
    render :index, locals: { providers: fetch_providers }
  end

  private

  def fetch_providers
    Provider::LIST
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
private
  def set_locale
    locale = params[:locale] || 'es'
    I18n.locale = locale
  end
end

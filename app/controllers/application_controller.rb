class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def set_locale
    @locale = params.fetch('t', :en).to_sym
    unless [:en, :sp].include?(@locale)
      @locale = :en
    end
    I18n.locale = @locale
  end
end

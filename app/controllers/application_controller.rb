# frozen_string_literal: true

# Controller base
class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def redirect_to_back(default = root_url)
    if request.env['HTTP_REFERER'].present? && (request.env['HTTP_REFERER'] != request.env['REQUEST_URI'])
      redirect_to request.env['HTTP_REFERER']
    else
      redirect_to default
    end
  end

  def message_redirect_type(status, type, path_redirect, controller)
    flash[status.to_sym] = (t "messages.#{status}.#{type}",
                              value: (t "controller.#{controller}"))
    if path_redirect == 'back'
      redirect_to_back
    else
      redirect_to path_redirect.to_sym
    end
  end
end

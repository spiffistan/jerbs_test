class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      false
    else
      "application"
    end
  end
  
end

class MunicipalityController < ApplicationController
  
  def lookup
    @municipalities = Municipality.find(:all, :conditions => ['county_id = ?', params[:county_id]])
    respond_to do |format| 
      format.json { render :json => @municipalities }
    end
  end
end

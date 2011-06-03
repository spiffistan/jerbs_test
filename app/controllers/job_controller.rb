class JobController < ApplicationController

  def show 

  end

  def search
    @jobs = Job.search(params[:q], params[:field])
    respond_to do |format| 
      format.json { render :json => @jobs }
    end
  end
end

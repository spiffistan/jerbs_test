class HomeController < ApplicationController
  def index
    @new_jobs = Job.find(:all, 
     :joins => "LEFT JOIN `companies` on companies.id = jobs.company_id ",
     :select => "jobs.title, jobs.description, jobs.created_at, companies.name AS company_name",
     :limit => 3)

    @counties = County.find(:all, :order => :name)
  end

  def browse
    @jobs = Job.all
    # TODO pagination
  end

  def profile
    if user_signed_in?
      @user_profile = UserProfile.find(:first, :conditions => ['user_id = ?', current_user.id]);
    end
  end
end

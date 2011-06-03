class Job < ActiveRecord::Base
  belongs_to :company

  validates_presence_of :title, :description, :company, :contact

  has_many :users
  has_many :job_applications
  has_one :job_type

  def self.search(str, field)
    return [] if str.blank?
    text = str.split.map { |w| field << " LIKE ? " }.join(" OR ")
    values = str.split.map { |w| "%#{w}%" }
    find(:all, 
         :conditions => (str ? [text, *values] : []) ,
         :joins => "LEFT JOIN `companies` on companies.id = jobs.company_id ",
         :select => "jobs.title, jobs.description, jobs.updated_at, companies.name AS company_name")
  end

end

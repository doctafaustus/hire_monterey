class Job < ActiveRecord::Base
  attr_accessible :company, :description, :position, :compensation, :job_type, :user_id, :location
  belongs_to :user

  validates_presence_of :position, :company, :location, :job_type, :compensation
  validates :position, :company, :compensation, length: {maximum: 51}
end

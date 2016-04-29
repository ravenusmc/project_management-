class Task < ActiveRecord::Base
  belongs_to :work

  def completed?
    !completed_at.blank?
  end 
end


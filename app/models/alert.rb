class Alert < ActiveRecord::Base
  attr_accessible :course, :department, :semester, :sections
  attr_protected :user_id
  attr_protected :alerted

  validates :department,  :presence     => true,
                          :length       => {
                            :minimum        => 2,
                            :maximum        => 4
                          },
                          :format       => {
                            :with           => /\A[A-Za-z]+\Z/
                          }
  validates :course,      :presence     => true,
                          :length       => {
                            :minimum        => 3,
                            :maximum        => 4
                          },
                          :format       => {
                            :with           => /\A[0-9]+[A-Za-z]?\Z/
                          }
  validates :semester,    :presence     => true

  serialize :sections, Array

  scope :user_alerts, lambda { |user_id| 
    where('Alerts.user_id = ?', user_id)
  }

  def alerted?
    @alerted
  end

  def course_name
    "#{self.department} #{self.course}"
  end
end

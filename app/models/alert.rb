class Alert < ActiveRecord::Base
  attr_accessible :alerted, :course, :department, :user_id

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
  validates :user_id,     :presence     => true,
                          :numericality => {
                            only_integer:   true
                          }

  def alerted?
    @alerted
  end

  def class_name
    @department + ' ' + @course
  end

  def sections

  end
end

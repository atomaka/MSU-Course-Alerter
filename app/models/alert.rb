class Alert < ActiveRecord::Base
  attr_accessible :alerted, :course, :department, :user_id
end

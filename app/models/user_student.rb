class UserStudent < ActiveRecord::Base


  belongs_to :student, :class_name => "User"
  belongs_to :teacher, :class_name => "User", :foreign_key => :user_id
end

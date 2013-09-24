class ActivitySessionReward < ActiveRecord::Base
  attr_accessible :user_id, :reward_id, :activity_session_id, :star_count, :state

  attr_accessible :image_attributes, :star, :description, :image_attachment


  has_one :image, :class_name => "Asset", :as => :viewable

  accepts_nested_attributes_for :image, :allow_destroy => true


  belongs_to :user
  belongs_to :reward
  belongs_to :activity_session


  def image_attachment=(value)
    return true if value.blank?
    self.image ||= Asset.new
    self.image.attachment = value
  end

  def image_attachment
    self.image.attachment
  end

  def self.for(student)
    where(:user_id => student.id)
  end

  def image_url
    self.image.try(:attachment).url(:thumb) rescue Asset.new.attachment.url(:thumb)
  end

  def self.for_session(session_id)
    where(:activity_session_id => session_id)
  end


end

class Reward < ActiveRecord::Base
  attr_accessible :images_ids,
                  :images_attributes, :name, :user_id
  has_many :images, :class_name => "Asset", :as => :viewable
  accepts_nested_attributes_for :images
  before_save :set_user

  def self.default_scope
    where(:user_id => User.current.id) if User.current
  end

  def image_url
    self.images.first.try(:attachment).url(:thumb) rescue self.images.new.attachment.url(:thumb)
  end

  private

  def set_user
    self.user_id = User.current.id if User.current
  end


end

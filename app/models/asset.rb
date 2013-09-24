class Asset < ActiveRecord::Base
  attr_accessible :attachment, :viewable_id, :viewable_type

  belongs_to :viewable, :polymorphic => true

  has_attached_file :attachment,
                    :styles => {:medium => "300x300>", :thumb => "100x100>"},
                    :default_url => "/images/:style/missing.png",
                    :url => '/images/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/images/:id/:style/:basename.:extension'

end

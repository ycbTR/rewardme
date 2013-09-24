class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  include RailsSettings::Extend

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :role, :images_ids,
                  :images_attributes

  has_many :activity_sessions

  has_many :user_students
  has_many :students, :class_name => "User", :through => :user_students, :source => :student

  has_many :user_teachers, :class_name => "UserStudent", :foreign_key => :student_id
  has_many :teachers, :through => :user_teachers, :source => :teacher, :foreign_key => :user_id


  has_many :images, :class_name => "Asset", :as => :viewable
  accepts_nested_attributes_for :images, :students
  before_save :set_student

  def image_url
    self.avatar.url(:thumb)
  end

  def self.default_scope
    where("#{User.table_name}.id IN(?)", User.current.students.map(&:id) + [User.current.id]) if !User.current.nil?
  end

  def avatar
    self.images.first.try(:attachment) || self.images.new.attachment
  end

  def self.students
    where('role' => 'student')
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def set_student
    if self.role == "student"
      self.user_teachers.build(:user_id => User.current.id)
    end
  end
end

class ActivitySession < ActiveRecord::Base
  attr_accessible :timer_increment, :time_left, :total_time, :user_id, :activity_session_rewards_attributes, :state

  has_many :activity_session_rewards
  belongs_to :user
  before_save :set_user
  accepts_nested_attributes_for :activity_session_rewards, :allow_destroy => true

  def self.default_scope
    where(:user_id => User.current.id) if User.current
  end

  state_machine :state, :initial => :not_started do
    event :start do
      transition :from => :not_started, :to => :started
    end
    event :pause do
      transition :from => :started, :to => :paused
    end
    event :continue do
      transition :from => :paused, :to => :started
    end
    event :end do
      transition :from => :started, :to => :ended
    end
  end


  def can_show_in_action?
    !["ended", "not_started"].include?(self.state)
  end

  # it gets next possible authorized events of current state
  def next_state_events

    t = self.state_transitions(:from => self.state.to_sym)
    authorized_events = Array.new

    t.each do |transition|
      #if (is_authorized_event?(transition.event.to_s, user.role.name, self.state))
      authorized_events << transition
      #end
    end
    authorized_events
  end

  private

  def set_user
    self.user_id = User.current.id if User.current
  end

end

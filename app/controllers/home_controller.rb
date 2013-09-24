class HomeController < ApplicationController
  def index
    @active_session = ActivitySession.where(:id => params[:aid]).first
    @active_session ||= ActivitySession.where(:state => "started").last

    @active_session_rewards = @active_session.activity_session_rewards rescue ""
    @activity_session = @active_session

  end

  def update
    activity_session = ActivitySession.find(params[:id])
    activity_session.update_attributes(params[:activity_session])
    if request.xhr?
      render :nothing => true
    else
      redirect_to root_path(:aid => activity_session.id)
    end
  end

end

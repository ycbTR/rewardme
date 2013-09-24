class Admin::ActivitySessionsController < Admin::BaseController

  def index
    @activity_sessions = ActivitySession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_sessions }
    end
  end

  # GET /admin/activity_sessions/1
  # GET /admin/activity_sessions/1.json
  def show
    @activity_session = ActivitySession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_session }
    end
  end

  def new
    @activity_session = ActivitySession.new
    reward = @activity_session.activity_session_rewards.build
    reward.image = Asset.new
     @image = reward.image

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_session }
    end
  end

  def fire
    @activity_session = ActivitySession.find(params[:id])
    @activity_session.send(params[:e].to_sym)
    redirect_to root_path(:aid => @activity_session.id)
  end

  def update_rate
    @reward = ActivitySessionReward.find(params[:id])
    @reward.update_attributes(params[:rate])
    render :nothing => true
  end

  def edit
    @activity_session = ActivitySession.find(params[:id])
    reward = @activity_session.activity_session_rewards.first
    reward ||= @activity_session.activity_session_rewards.build
    if reward.image.blank?
      reward.image = Asset.new
    end
    @image = reward.image

  end


  def create
    @activity_session = ActivitySession.new(params[:activity_session])

    respond_to do |format|
      if @activity_session.save
        format.html { redirect_to [:admin, @activity_session], notice: 'Activity session was successfully created.' }
        format.json { render json: @activity_session, status: :created, location: @activity_session }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def student_details
    @activity_session = ActivitySession.find(params[:id])
    @student = User.where(:id => params[:uid]).first
    @activity_session_reward = @activity_session.activity_session_rewards.for(@student).last
    @earned_star_count = @activity_session_reward.star.to_i
    @status = @earned_star_count >= @activity_session_reward.star_count ? "Earned" : "Not Earned"
    if @activity_session_reward.image.blank?
      @activity_session_reward.image = Asset.new
    end
  end


  def update
    @activity_session = ActivitySession.find(params[:id])

    respond_to do |format|
      if @activity_session.update_attributes(params[:activity_session])
        format.html { redirect_to [:admin, @activity_session], notice: 'Activity session was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_session.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @activity_session = ActivitySession.find(params[:id])
    @activity_session.destroy

    respond_to do |format|
      format.html { redirect_to admin_activity_sessions_url }
      format.json { head :ok }
    end
  end
end

class Admin::ActivitiesController < Admin::BaseController
  before_filter :set_activity_session

  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new
    @user = User.where(:id => params[:uid]).first
    @activity.images.build if @activity.images.blank?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
    @activity.images.build if @activity.images.blank?

  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to student_details_admin_activity_session_path(@activity.activity_session_id, :uid => @activity.user_id), notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to student_details_admin_activity_session_path(@activity.activity_session_id, :uid => @activity.user_id), notice: 'Activity was successfully updated.' }
        format.js { render 'update' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to request.referer || admin_activities_path }
      format.json { head :ok }
    end
  end

  private

  def set_activity_session
    @activity_session = ActivitySession.where(:id => params[:activity_session_id]).first
  end
end

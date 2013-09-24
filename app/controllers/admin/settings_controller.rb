class Admin::SettingsController < Admin::BaseController

  def show
  end

  def update
    params[:settings].each do |key, value|
      current_user.settings.send("#{key}=", value)
    end
    redirect_to admin_settings_path
  end

end

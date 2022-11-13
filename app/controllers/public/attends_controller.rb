class Public::AttendsController < ApplicationController
  def create
    schedule = Schedule.find(params[:schedule_id])
    attend = current_end_user.attends.new(schedule_id: schedule.id)
    attend.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    schedule = Schedule.find(params[:schedule_id])
    attend = current_end_user.attends.find_by(schedule_id: schedule.id)
    attend.destroy
    redirect_back(fallback_location: root_path)
  end
end

class Schedule < ApplicationRecord
  belongs_to :end_user
  has_many :schedule_comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :attends, dependent: :destroy
  
  has_one_attached :schedule_image
  
  def get_schedule_image
    (schedule_image.attached?) ? schedule_image : 'default_image.jpg'
  end
  
  def full_day
    year.to_s + "年" + month.to_s + "月" + day.to_s + "日"
  end
  
  def attended?(end_user)
    attends.where(end_user_id: end_user.id).exists?
  end
end

class Lesson < ActiveRecord::Base
  belongs_to :week

  validates_presence_of :title, :body, :day, :lesson_type
end

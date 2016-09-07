class Week < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  validates :name, :presence => true
end

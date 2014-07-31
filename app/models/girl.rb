class Girl < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :year, numericality: { only_integer: true }

  belongs_to :user
end

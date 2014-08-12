class Girl < ActiveRecord::Base
  extend FriendlyId
  friendly_id :first_last_name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    :first_last_name_changed?
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :year, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.year
    %w(Freshman Sophomore Junior Senior)
  end

  protected

  def first_last_name
    first_name + "-" + last_name
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :girls
  has_many :sales

  def profile_complete
    if first_name.present? && last_name.present?
      return true
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

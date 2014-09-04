class Sale < ActiveRecord::Base
  validates :quantity, presence: true

  belongs_to :user

  # before_save :format_date

  def self.buyer_gender
    %w(Male Female)
  end

  def self.source_of_sale
    %w(Online Square Cash/Check)
  end

  # def format_date
  #   'date(1i)-date(2i)-date(3i)'
  # end

end

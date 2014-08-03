class PagesController < ApplicationController
  def home
    @girls = Girl.all.order(created_at: :desc).limit(12)
    @contact = ContactForm.new
  end
end

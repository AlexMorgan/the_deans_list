class PagesController < ApplicationController
  def home
    @girls = Girl.all.order(created_at: :asc).limit(12)
    @contact = ContactForm.new
  end
end

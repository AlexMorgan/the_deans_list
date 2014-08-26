class PagesController < ApplicationController
  def home
    @girls = Girl.all.order(created_at: :asc).limit(12)
    @contact = ContactForm.new
    @year = Page.year
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.name
      # marker.picture({
      #   url: 'https://s3.amazonaws.com/deanslistproject_production/mini-logo.png',
      #   width: 25,
      #   height: 25
      #   })
    end
  end
end

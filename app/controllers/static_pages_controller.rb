class StaticPagesController < ApplicationController
  require 'byebug'
  def index
    puts @photos
  end
  
  def find_photos 
    begin
      @photos = Flickr.photos.search(user_id: params[:photo][:q])
      flash.now[:info] = "Images retrieved!"
      render "static_pages/find_photos"
    rescue 
      flash.now[:warning] = "No images found for given ID"
      render "static_pages/find_photos"
    else
      
    end
  end  
end

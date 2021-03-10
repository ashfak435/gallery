class HomeController < ApplicationController
  
  def index
  #  @albums = Album.all   
      @q = Album.ransack(params[:q])
  @albums = @q.result.includes(:taggings, :tags)
  end
end

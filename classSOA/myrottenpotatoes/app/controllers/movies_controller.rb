# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

#   before_filter :authenticate_moviegoer!

  def index
    @movies = Movie.all
  end

   # in app/controllers/movies_controller.rb
 
  def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end

  # as a reminder, here is the original 'new' method:
def new
  @movie = Movie.new
end

# in movies_controller.rb
# replaces the 'create' method in controller:
def create
  @movie = Movie.new(params[:movie])
  if @movie.save
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  else
    render 'new' # note, 'new' template can access @movie's field values!
  end
end

# in movies_controller.rb
 
def edit
  @movie = Movie.find params[:id]
end
 
# replaces the 'update' method in controller:
def update
  @movie = Movie.find params[:id]
  if @movie.update_attributes(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  else
    render 'edit' # note, 'edit' template can access @movie's field values!
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
end


# add to movies_controller.rb, anywhere inside
#  'class MoviesController < ApplicationController':
 
def search_tmdb
  # hardwire to simulate failure
  flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
  redirect_to movies_path
end


end


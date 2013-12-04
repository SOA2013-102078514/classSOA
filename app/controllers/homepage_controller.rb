class HomepageController < ApplicationController
  before_filter :authenticate_user!

  def index
  @events = Uploadproduct.all
  end

  def new
  @events = Uploadproduct.new
  end

  def create     
  @event = Uploadproduct.new(params[:uploadproduct])
  @event.save
  redirect_to :action => "index"
  end

  def show
  @events = Uploadproduct.all
  @event = Uploadproduct.find(params[:id])
  end



  def edit
  @event = Uploadproduct.find(params[:id])
  end

  def update
  @event = Uploadproduct.find(params[:id])
  @event.update_attributes(params[:uploadproduct])

  redirect_to :action => :show, :id => @event
  end

  def destroy
  @event = Uploadproduct.find(params[:id])
  @event.destroy
  redirect_to :action => :index
  end


end

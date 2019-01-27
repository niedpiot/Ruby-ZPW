class EventsController < ApplicationController
  before_action :authenticate_admin, only: %i[new create]

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets
    @new_ticket = Ticket.new(event: @event)
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Wydarzenie dodane!'
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "admin" && password == "admin"
    end
  end
end

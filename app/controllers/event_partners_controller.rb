class EventPartnersController < ApplicationController
  before_filter :load_parent

  def new
    @event_partner = @event.event_partners.build
  end

  def create
    @event_partner = @event.event_partners.build(params[:event_partner])
    if @event_partner.save
      redirect_to event_path(@event), :notice => "Event Partner successfully added"
    else
      render :new
    end
  end

  def edit
    @event_partner = @event.event_partners.find(params[:id])
  end

  def update
    @event_partner = @event.event_partners.find(params[:id])
    if @event_partner.update_attributes(params[:event_partner])
      redirect_to event_path(@event), :notice => "Event Partner successfully updated"
    else
      render :edit
    end
  end

  private

  def load_parent
    @event = Event.find_by_slug!(params[:event_id])
    authorize! :edit, @event
  end
end

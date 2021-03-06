class MeetingsController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @meetings = Meeting.where(group_id: @group.id)
  end

  def new
    @meeting = Meeting.new
    @group = Group.find_by(id: params[:id])
    @selected_book = @group.selected_books.last
    @selected_book_info = BookSuggestion.find_by(isbn: @selected_book.isbn)
  end

  def create
    @meeting = Meeting.new(
      group_id: params[:id],
      meeting_date: params[:meeting_date],
      location: params[:location],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      notes: params[:notes],
      selected_book_id: params[:selected_book_id]
    )

    if @meeting.save
      if params[:send_email_flag] == 'true'
        # send emails 
      end
      flash[:success] = 'Meeting saved'
      redirect_to "/groups/#{params[:id]}"
    else
      flash[:error] = 'oops, try again'
      render '/meetings/new'
    end
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])

    complete_address = "#{@meeting.address} #{@meeting.city}, #{@meeting.state} #{@meeting.zip}"
    coordinates = Geocoder.coordinates(complete_address)
    if coordinates
      @latitude = coordinates[0]
      @longitude = coordinates[1]
    else
      @latitude = nil
      @longitude = nil
    end
    
    @group = @meeting.group
  end

  def edit
    @meeting = Meeting.find_by(id: params[:id])
  end

  def update
    @meeting = Meeting.find_by(id: params[:id])

    if @meeting.update(
      meeting_date: params[:meeting_date],
      location: params[:location],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      notes: params[:notes]
      )

      flash[:success] = "Meeting successfully updated!"
      redirect_to "/groups/#{@meeting.group_id}"
    else 
      render 'edit'
    end
  end
end

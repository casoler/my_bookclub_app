class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
    @group = Group.find_by(id: params[:id])
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
      notes: params[:notes]
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

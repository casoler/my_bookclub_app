class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
    @group = Group.find_by(id: params[:group_id])
  end

  def create
    binding.pry
    @meeting = Meeting.new(
      group_id: params[:group_id],
      meeting_date: params[:meeting_date],
      # meeting_time: params[:time],
      location: params[:location],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      notes: params[:notes]
    )

    if @meeting.save
      if params[:send_email_flag] == true
        # send emails 
      flash[:success] = 'Meeting saved'
      redirect_to "/groups/#{params[:group_id]}"

    else
      flash[:error] = 'oops, try again'
      render '/meetings/new'
    end
  end
end

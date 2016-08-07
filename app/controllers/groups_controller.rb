class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(
      name: params[:name]
    )

    if @group.save
      add_member(group_id: @group.id, leader_flag: params[:leader_flag])

      flash[:success] = 'Group created.'
      redirect_to '/groups'
    else
      flash[:warning] = 'Group not created.'
      render '/new'
    end
  end

  # def add_member()
  #   group_id = params[:id]

  #   @member = Member.new(
  #     group_id: group_id,
  #     user_id: current_user.id
  #   )
  #   if @member.save
  #     flash[:success] = "You've successfully joined the #{Group.find_by(id: group_id)}"
  #     redirect_to "/groups/#{group_id}"
  #   else
  #     flash[:warning] = 'There was an error joining this group.  Please try again.'
  #     render '/groups'
  #   end
  # end

  def add_book
    @past_book = PastBook.new(
      group_id: params[:group_id],
      book_id: params[:book_id]
    )

    @past_book.save
    redirect_to "/groups/#{params[:group_id]}"
  end

  def show
    @group = Group.find_by(id: params[:id])
    
  end

  def add_member(data)
    group_id = data[:group_id]
    leader_flag = data[:leader_flag]

    @member = Member.new(
      group_id: group_id,
      user_id: current_user.id
    )
    if @member.save
      flash[:success] = "You've successfully joined the #{Group.find_by(id: group_id)}"
      redirect_to "/groups/#{group_id}"
    else
      flash[:warning] = 'There was an error joining this group.  Please try again.'
      render '/groups'
    end
end

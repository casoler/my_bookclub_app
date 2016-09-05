class GroupsController < ApplicationController
  def index
    partitioned_groups = Group.all.partition { |group| group.is_member?(current_user) }
    @my_groups = partitioned_groups[0]
    @other_groups = partitioned_groups[1]
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(
      name: params[:name],
      genres: params[:genres],
      about: params[:about],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code]
    )

    if @group.save
      leader_flag = params[:leader_flag] == 'true' ? true : false

      @member = @group.add_member(
        user_id: current_user.id,
        leader_flag: leader_flag
      )

      if @member
        flash[:success] = 'Group created.'
        redirect_to "/groups/#{@group.id}"
      else
        flash[:success] = "Group created, but you weren't added to the group.  Please join group."
        redirect_to "/groups/#{@group.id}/add_member"
      end
    else
      flash[:warning] = 'Group not created.'
      render '/new'
    end
  end

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
    @member = Member.find_by(user_id: current_user.id, group_id: params[:id])
  end

  def add_member
    @group = Group.find_by(id: params[:id])
    @member = @group.add_member(
      user_id: current_user.id,
      leader_flag: params[:leader_flag]
    )

    if @member
      flash[:success] = "You've successfully joined the #{@group.name} group"
      redirect_to "/groups/#{@group.id}"
    else
      flash[:warning] =
        'There was an error joining this group. Please try again.'
      render '/groups'
    end
  end
end

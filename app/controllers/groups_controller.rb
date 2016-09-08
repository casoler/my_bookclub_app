class GroupsController < ApplicationController
  def index
    partitioned_groups = Group.all.partition { |group| group.is_member?(current_user) }
    @my_groups = partitioned_groups[0]
    @other_groups = partitioned_groups[1]
  end

  def new
    @group = Group.new
    @genres = Genre.all
  end

  def create
    @group = Group.new(
      name: params[:name].titleize,
      # genres: params[:genres],
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

      params[:genres].each do |genre|
        GroupGenre.create(
          group_id: @group.id,
          genre_id: genre
        )
      end

    else
      flash[:warning] = 'Group not created.'
      render '/new'
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @member = Member.find_by(user_id: current_user.id, group_id: params[:id])
    @group_genres = GroupGenre.where(group_id: @group.id)
    @meetings = @group.meetings

    # this_month = Time.now
    # next_month = this_month + 1.month
    # @group_books = @group.selected_books.order(:year, :month)
    # @past_books = @group_books.find_all {|book| book.month < this_month.month && book.year <= this_month.year}
    # @this_months_book = @group_books.find_by(month: this_month.month, year: this_month.year)
    # @next_months_book = @group_books.find_by(month: next_month.month, year: next_month.year)
  end

  def edit
    @group = Group.find_by(id: params[:id])
    @member = Member.find_by(user_id: current_user.id, group_id: params[:id])
    @genres = Genre.all
    @group_genres = GroupGenre.where(group_id: @group.id)
  end

  def update
    @group = Group.find_by(id: params[:id])

    if @group.update(
      name: params[:name].titleize,
      about: params[:about],
      city: params[:city],
      state: params[:state]
      )

      replace_group_leader(params[:leader_flag])
      replace_group_genres(params[:genres])

      flash[:success] = "Group successfully updated!"
      redirect_to "/groups/#{@group.id}"
    else 
      render 'edit'
    end
  end


  def add_member
    @group = Group.find_by(id: params[:id])
    @member = @group.add_member(
      user_id: current_user.id,
      leader_flag: params[:leader_flag]
    )

    if @member
      flash[:success] = "You've successfully joined the #{@group.name} group"
      BookClubMailer.welcome_email(@member).deliver
      redirect_to "/groups/#{@group.id}"
    else
      flash[:warning] =
        'There was an error joining this group. Please try again.'
      render '/groups'
    end
  end

  

  private

    def replace_group_leader(leader_flag)
      input_leader_flag = leader_flag == 'true' ? true : false

      @members = @group.members
      group_leader = @members.find_by(leader_flag: true)
      current_member = @members.find_by(user_id: current_user.id)

      if current_member == group_leader && input_leader_flag == false
        group_leader.leader_flag = nil
        group_leader.save
      elsif current_member != group_leader && input_leader_flag == true
        current_member.leader_flag = true
        current_member.save
      end
    end

    def replace_group_genres(new_genres)
      @group_genres = GroupGenre.where(group_id: @group.id).each do |group_genre|
        group_genre.destroy
      end

      new_genres.each do |genre|
        GroupGenre.create(
          group_id: @group.id,
          genre_id: genre
        )
      end
    end
end

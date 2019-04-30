class BallotsController < ApplicationController
  # include SessionsHelper
  include BallotHelper
  include VotesHelper

  def index
    if user_signed_in?
      @ballots = Ballot.all.order("created_at desc")
    else
      redirect_to new_user_session_path
    end
  end

  def show
    if user_signed_in?
      @ballot = Ballot.find(params[:id])
      @radio = @ballot.options.split(",")
      @results = @ballot.tally
      @comments = find_comments(@ballot)
    end
  end

  def new
    if user_signed_in?
      @ballot = Ballot.new
    end
  end

  def create
    if user_signed_in?
      @ballot = Ballot.new(ballot_params)
      @ballot.user_id = current_user.id
      if @ballot.save
        UsersMailer.new_ballot(User.all, @ballot.id, @ballot.ballot_issue, @ballot.user.username).deliver
        redirect_to ballots_path
      else
        @ballot.full_error_messages
        redirect_to new_ballot_path
      end
    end
  end

  def edit
  end

  def pending_index
    @open_ballots = open_ballots
  end

  def pending
    @users = find_users_that_have_not_voted(params[:id])
  end

  def add_support
    @ballot = Ballot.find(params[:id])
    if current_user.id != @ballot.user_id
      if @ballot.support_first == nil
        @ballot.support_first = current_user.username
        @ballot.save
        redirect_to ballot_path(@ballot)
      elsif @ballot.support_second == nil && @ballot.support_first != current_user.username
        @ballot.support_second = current_user.username
        @ballot.save
        redirect_to ballot_path(@ballot)
      else
        redirect_to ballot_path(@ballot)
      end
    else
      redirect_to ballot_path(@ballot)
    end
  end

  def close
    @users = User.all
    @ballot = Ballot.find(params[:format])
    @ballot.update(votable: false)
    UsersMailer.close_ballot(@users, @ballot.id, @ballot.ballot_issue).deliver
    redirect_to ballots_path
  end

  def send_reminder
    @users = find_users_that_have_not_voted(params[:format])
    @ballot_id = params[:format]
    @ballot = Ballot.find(params[:format])
    UsersMailer.send_reminder(@users, @ballot.id, @ballot.ballot_issue).deliver
    redirect_to ballots_path
  end

  def destroy
    @ballot = Ballot.find(params[:id])
    @ballot.destroy
    redirect_to ballots_path
  end

  private

  def ballot_params
    params.require(:ballot).permit(:ballot_issue, :options, :ballot_type, :content, :include_weekend)
  end
end

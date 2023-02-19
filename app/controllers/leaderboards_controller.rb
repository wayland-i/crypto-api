class LeaderboardsController < ApplicationController
  before_action :set_leaderboard, only: %i[ show update destroy ]

  # GET /leaderboards
  def index
    @leaderboards = Leaderboard.order(score: :desc)
    render json: @leaderboards
  end

  # GET /leaderboards/1
  def show
    render json: @leaderboard
  end

  # POST /leaderboards
  def create
    @leaderboard = Leaderboard.new(leaderboard_params)
    existing_record = Leaderboard.find_by(player: @leaderboard.player)


    if existing_record.present?
      if @leaderboard.score < existing_record.score
        render json: { message: "Player has previously scored higher than this" }, status: :unprocessable_entity
        return
      else
        existing_record.destroy
      end
    end


    if Leaderboard.exists?(player: @leaderboard.player, score: @leaderboard.score)
      render json: { message: "Record already exists for player." }, status: :unprocessable_entity
    else
      if @leaderboard.save
        render json: @leaderboard, status: :created, location: @leaderboard
      else
        render json: @leaderboard.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /leaderboards/1
  def update
    if @leaderboard.update(leaderboard_params)
      render json: @leaderboard
    else
      render json: @leaderboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leaderboards/1
  def destroy
    @leaderboard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leaderboard
      @leaderboard = Leaderboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leaderboard_params
      params.require(:leaderboard).permit(:player, :score)
    end
end

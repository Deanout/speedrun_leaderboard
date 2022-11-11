class SpeedrunsController < ApplicationController
  before_action :set_speedrun, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /speedruns or /speedruns.json
  def index
    @speedruns = Speedrun.all
  end

  # GET /speedruns/1 or /speedruns/1.json
  def show; end

  # GET /speedruns/new
  def new
    @speedrun = Speedrun.new
  end

  # GET /speedruns/1/edit
  def edit; end

  # POST /speedruns or /speedruns.json
  def create
    @speedrun = Speedrun.new(speedrun_params)
    @speedrun.user = current_user

    respond_to do |format|
      if @speedrun.save
        format.html { redirect_to speedrun_url(@speedrun), notice: 'Speedrun was successfully created.' }
        format.json { render :show, status: :created, location: @speedrun }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speedrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speedruns/1 or /speedruns/1.json
  def update
    respond_to do |format|
      if @speedrun.update(speedrun_params)
        format.html { redirect_to speedrun_url(@speedrun), notice: 'Speedrun was successfully updated.' }
        format.json { render :show, status: :ok, location: @speedrun }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speedrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speedruns/1 or /speedruns/1.json
  def destroy
    @speedrun.destroy

    respond_to do |format|
      format.html { redirect_to speedruns_url, notice: 'Speedrun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_speedrun
    @speedrun = Speedrun.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def speedrun_params
    params.require(:speedrun).permit(:category_id, :time)
  end
end

class SurversController < ApplicationController
  before_action :set_surver, only: [:show, :edit, :update, :destroy]

  # GET /survers
  # GET /survers.json
  def index
    @survers = Surver.all
  end

  # GET /survers/1
  # GET /survers/1.json
  def show
  end

  # GET /survers/new
  def new
    @surver = Surver.new
  end

  # GET /survers/1/edit
  def edit
  end

  # POST /survers
  # POST /survers.json
  def create
    @surver = Surver.new(surver_params)

    respond_to do |format|
      if @surver.save
        format.html { redirect_to @surver, notice: 'Surver was successfully created.' }
        format.json { render :show, status: :created, location: @surver }
      else
        format.html { render :new }
        format.json { render json: @surver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survers/1
  # PATCH/PUT /survers/1.json
  def update
    respond_to do |format|
      if @surver.update(surver_params)
        format.html { redirect_to @surver, notice: 'Surver was successfully updated.' }
        format.json { render :show, status: :ok, location: @surver }
      else
        format.html { render :edit }
        format.json { render json: @surver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survers/1
  # DELETE /survers/1.json
  def destroy
    @surver.destroy
    respond_to do |format|
      format.html { redirect_to survers_url, notice: 'Surver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surver
      @surver = Surver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def surver_params
      params.require(:surver).permit(:name)
    end
end

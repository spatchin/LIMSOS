class BiomassesController < ApplicationController
  before_action :set_biomass, only: [:show, :edit, :update, :destroy]

  # GET /biomasses
  # GET /biomasses.json
  def index
    @biomasses = Biomass.all
  end

  # GET /biomasses/1
  # GET /biomasses/1.json
  def show
  end

  # GET /biomasses/new
  def new
    @biomass = Biomass.new
  end

  # GET /biomasses/1/edit
  def edit
  end

  # POST /biomasses
  # POST /biomasses.json
  def create
    @biomass = Biomass.new(biomass_params)

    respond_to do |format|
      if @biomass.save
        format.html { redirect_to @biomass, notice: 'Biomass was successfully created.' }
        format.json { render :show, status: :created, location: @biomass }
      else
        format.html { render :new }
        format.json { render json: @biomass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biomasses/1
  # PATCH/PUT /biomasses/1.json
  def update
    respond_to do |format|
      if @biomass.update(biomass_params)
        format.html { redirect_to @biomass, notice: 'Biomass was successfully updated.' }
        format.json { render :show, status: :ok, location: @biomass }
      else
        format.html { render :edit }
        format.json { render json: @biomass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biomasses/1
  # DELETE /biomasses/1.json
  def destroy
    @biomass.destroy
    respond_to do |format|
      format.html { redirect_to biomasses_url, notice: 'Biomass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biomass
      @biomass = Biomass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biomass_params
      params.fetch(:biomass, {})
    end
end

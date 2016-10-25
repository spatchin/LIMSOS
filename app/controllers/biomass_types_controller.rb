class BiomassTypesController < ApplicationController
  before_action :set_biomass_type, only: [:show, :edit, :update, :destroy]

  # GET /biomass_types
  # GET /biomass_types.json
  def index
    @biomass_types = BiomassType.all
  end

  # GET /biomass_types/1
  # GET /biomass_types/1.json
  def show
  end

  # GET /biomass_types/new
  def new
    @biomass_type = BiomassType.new
  end

  # GET /biomass_types/1/edit
  def edit
  end

  # POST /biomass_types
  # POST /biomass_types.json
  def create
    @biomass_type = BiomassType.new(biomass_type_params)

    respond_to do |format|
      if @biomass_type.save
        format.html { redirect_to @biomass_type, notice: 'Biomass type was successfully created.' }
        format.json { render :show, status: :created, location: @biomass_type }
      else
        format.html { render :new }
        format.json { render json: @biomass_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biomass_types/1
  # PATCH/PUT /biomass_types/1.json
  def update
    respond_to do |format|
      if @biomass_type.update(biomass_type_params)
        format.html { redirect_to @biomass_type, notice: 'Biomass type was successfully updated.' }
        format.json { render :show, status: :ok, location: @biomass_type }
      else
        format.html { render :edit }
        format.json { render json: @biomass_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biomass_types/1
  # DELETE /biomass_types/1.json
  def destroy
    @biomass_type.destroy
    respond_to do |format|
      format.html { redirect_to biomass_types_url, notice: 'Biomass type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biomass_type
      @biomass_type = BiomassType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biomass_type_params
      params.fetch(:biomass_type, {})
    end
end

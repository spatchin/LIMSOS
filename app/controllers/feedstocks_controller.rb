class FeedstocksController < ApplicationController
  before_action :set_feedstock, only: [:show, :edit, :update, :destroy]

  # GET /feedstocks
  # GET /feedstocks.json
  def index
    @feedstocks = Feedstock.all
  end

  # GET /feedstocks/1
  # GET /feedstocks/1.json
  def show
  end

  # GET /feedstocks/new
  def new
    @feedstock = Feedstock.new
  end

  # GET /feedstocks/1/edit
  def edit
  end

  # POST /feedstocks
  # POST /feedstocks.json
  def create
    @feedstock = Feedstock.new(feedstock_params)

    respond_to do |format|
      if @feedstock.save
        format.html { redirect_to @feedstock, notice: 'Feedstock was successfully created.' }
        format.json { render :show, status: :created, location: @feedstock }
      else
        format.html { render :new }
        format.json { render json: @feedstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedstocks/1
  # PATCH/PUT /feedstocks/1.json
  def update
    respond_to do |format|
      if @feedstock.update(feedstock_params)
        format.html { redirect_to @feedstock, notice: 'Feedstock was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedstock }
      else
        format.html { render :edit }
        format.json { render json: @feedstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedstocks/1
  # DELETE /feedstocks/1.json
  def destroy
    @feedstock.destroy
    respond_to do |format|
      format.html { redirect_to feedstocks_url, notice: 'Feedstock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedstock
      @feedstock = Feedstock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedstock_params
      params.fetch(:feedstock, {})
    end
end

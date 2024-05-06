class VoyagesController < ApplicationController
  before_action :set_voyage, only: %i[ show edit update destroy ]

  # GET /voyages or /voyages.json
  def index
    @voyages = Voyage.all
  end

  # GET /voyages/1 or /voyages/1.json
  def show
  end

  # GET /voyages/new
  def new
    @voyage = Voyage.new
  end

  # GET /voyages/1/edit
  def edit
  end

  # POST /voyages or /voyages.json
  def create
    @voyage = Voyage.new(params_manipulation)
    respond_to do |format|
      if @voyage.save
        format.html { redirect_to voyage_url(@voyage), notice: "Voyage was successfully created." }
        format.json { render :show, status: :created, location: @voyage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voyage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voyages/1 or /voyages/1.json
  def update
    
    respond_to do |format|
      if @voyage.update(params_manipulation)
        format.html { redirect_to voyage_url(@voyage), notice: "Voyage was successfully updated." }
        format.json { render :show, status: :ok, location: @voyage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voyage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voyages/1 or /voyages/1.json
  def destroy
    @voyage.destroy

    respond_to do |format|
      format.html { redirect_to voyages_url, notice: "Voyage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voyage
      @voyage = Voyage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voyage_params
      @voyage_params ||= params.require(:voyage).permit(:name, :container_ids, containers_attributes: [:id, :number, :size, :price, :_destroy])
    end

    def params_manipulation
      vp = voyage_params
      container_ids = []
      vp["containers_attributes"].each do |key, value|
        if value["_destroy"] != "1"
          container = Container.find value["id"]
          container.update(number: value["number"], size: value["size"], price: value["price"])
          container_ids << container.id      
        end 
      end  
      vp["container_ids"] = container_ids        
      vp["containers_attributes"] = {}
      return vp
    end 
end

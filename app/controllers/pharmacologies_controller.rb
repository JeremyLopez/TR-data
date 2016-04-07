class PharmacologiesController < ApplicationController
  before_action :set_pharmacology, only: [:show, :edit, :update, :destroy]

  # GET /pharmacologies
  # GET /pharmacologies.json
	$pharma_cols = ["TR_TARGET_ID", "TARGET_NAME", "DRUG_ID", "DRUG_NAME", "PHARM_RESULT_ID", "PHARM_EXP_ID", "TARGET_CONDITION_TOXICITY_TYPE", "SYSTEM", "CONDITION_ACTIVITY_TYPE_VALUE", "EFFECT", "PHARMACOLOGICAL_ACTIVITY", "MATERIAL", "METHOD", "PARAMETER", "OPERATOR", "VALUE", "UNIT", "VARIANCE", "MODEL","SOURCE_TYPE","SOURCE_TITLE","SOURCE_ID"]
	
  def index
		@pharma_cols = $pharma_cols
		if params[:search]
			@pharma_return = Pharmacology.search(params[:search]).order("DRUG_NAME DESC")
			@pharmacologies = @pharma_return.paginate(page: params[:page])
		else
			@pharmacologies = Pharmacology.all.paginate(page: params[:page])
		end
		respond_to do |format|
			format.json { render json: @pharmacologies }
			format.html
			format.csv { send_data @pharmacologies.to_csv }
			format.xls #{ send_data @products.to_csv(col_sep: "\t") }
		end
  end
	
	def import
		Pharmacology.import(params[:file])
		redirect_to pharmacologies_path, notice: "Phamacology imported."
	end

  # GET /pharmacologies/1
  # GET /pharmacologies/1.json
  def show
		@pharma_cols = $pharma_cols
  end

  # GET /pharmacologies/new
  def new
    @pharmacology = Pharmacology.new
  end

  # GET /pharmacologies/1/edit
  def edit
  end

  # POST /pharmacologies
  # POST /pharmacologies.json
  def create
    @pharmacology = Pharmacology.new(pharmacology_params)

    respond_to do |format|
      if @pharmacology.save
        format.html { redirect_to @pharmacology, notice: 'Pharmacology was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacology }
      else
        format.html { render :new }
        format.json { render json: @pharmacology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacologies/1
  # PATCH/PUT /pharmacologies/1.json
  def update
    respond_to do |format|
      if @pharmacology.update(pharmacology_params)
        format.html { redirect_to @pharmacology, notice: 'Pharmacology was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacology }
      else
        format.html { render :edit }
        format.json { render json: @pharmacology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacologies/1
  # DELETE /pharmacologies/1.json
  def destroy
    @pharmacology.destroy
    respond_to do |format|
      format.html { redirect_to pharmacologies_url, notice: 'Pharmacology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacology
      @pharmacology = Pharmacology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacology_params
			params.require(:pharmacology).permit("created_at", "updated_at", "TR_TARGET_ID", "TARGET_NAME", "DRUG_ID", "DRUG_NAME", "PHARM_RESULT_ID", "PHARM_EXP_ID", "TARGET_CONDITION_TOXICITY_TYPE", "SYSTEM", "CONDITION_ACTIVITY_TYPE_VALUE", "EFFECT", "PHARMACOLOGICAL_ACTIVITY", "MATERIAL", "METHOD", "PARAMETER", "OPERATOR", "VALUE", "UNIT", "VARIANCE", "MODEL","SOURCE_TYPE","SOURCE_TITLE","SOURCE_ID")
    end
end

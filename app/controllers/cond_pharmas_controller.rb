class CondPharmasController < ApplicationController
  before_action :set_cond_pharma, only: [:show, :edit, :update, :destroy]
	
	$pharma_cols = ["TR_TARGET_ID", "TARGET_NAME", "DRUG_ID", "DRUG_NAME", "PHARM_RESULT_ID", "PHARM_EXP_ID", "TARGET_CONDITION_TOXICITY_TYPE", "SYSTEM", "CONDITION_ACTIVITY_TYPE_VALUE", "EFFECT", "PHARMACOLOGICAL_ACTIVITY", "MATERIAL", "METHOD", "PARAMETER", "OPERATOR", "VALUE", "UNIT", "VARIANCE", "MODEL","SOURCE_TYPE","SOURCE_TITLE","SOURCE_ID"]

  # GET /cond_pharmas
  # GET /cond_pharmas.json
  def index
    @pharma_cols = $pharma_cols
		if params[:search]
			@pharma_return = CondPharma.search(params[:search]).order("DRUG_NAME DESC")
			@cond_pharmas = @pharma_return.paginate(page: params[:page])
		else
			@cond_pharmas = CondPharma.all.paginate(page: params[:page])
			respond_to do |format|
				format.json { render json: @cond_pharmas }
				format.html
				format.csv { send_data @cond_pharmas.to_csv }
				format.xls #{ send_data @products.to_csv(col_sep: "\t") }
			end
		end
  end
	
	def import
		CondPharma.import(params[:file])
		redirect_to cond_pharmas_path, notice: "Conditional pharmacology imported."
	end

  # GET /cond_pharmas/1
  # GET /cond_pharmas/1.json
  def show
  end

  # GET /cond_pharmas/new
  def new
    @cond_pharma = CondPharma.new
  end

  # GET /cond_pharmas/1/edit
  def edit
  end

  # POST /cond_pharmas
  # POST /cond_pharmas.json
  def create
    @cond_pharma = CondPharma.new(cond_pharma_params)

    respond_to do |format|
      if @cond_pharma.save
        format.html { redirect_to @cond_pharma, notice: 'Cond pharma was successfully created.' }
        format.json { render :show, status: :created, location: @cond_pharma }
      else
        format.html { render :new }
        format.json { render json: @cond_pharma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cond_pharmas/1
  # PATCH/PUT /cond_pharmas/1.json
  def update
    respond_to do |format|
      if @cond_pharma.update(cond_pharma_params)
        format.html { redirect_to @cond_pharma, notice: 'Cond pharma was successfully updated.' }
        format.json { render :show, status: :ok, location: @cond_pharma }
      else
        format.html { render :edit }
        format.json { render json: @cond_pharma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cond_pharmas/1
  # DELETE /cond_pharmas/1.json
  def destroy
    @cond_pharma.destroy
    respond_to do |format|
      format.html { redirect_to cond_pharmas_url, notice: 'Cond pharma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cond_pharma
      @cond_pharma = CondPharma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cond_pharma_params
			params.require(:cond_pharma).permit("created_at", "updated_at", "TR_TARGET_ID", "TARGET_NAME", "DRUG_ID", "DRUG_NAME", "PHARM_RESULT_ID", "PHARM_EXP_ID", "TARGET_CONDITION_TOXICITY_TYPE", "SYSTEM", "CONDITION_ACTIVITY_TYPE_VALUE", "EFFECT", "PHARMACOLOGICAL_ACTIVITY", "MATERIAL", "METHOD", "PARAMETER", "OPERATOR", "VALUE", "UNIT", "VARIANCE", "MODEL","SOURCE_TYPE","SOURCE_TITLE","SOURCE_ID")
    end
end

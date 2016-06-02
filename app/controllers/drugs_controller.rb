class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]
	
	$drug_cols = [
		"ID",
		"DRUG_OR_CHEMICAL_NAME",
		"TARGET_NAME",
		"HIGHEST_PHASE",
		"LEAD_COMPOUND",
		"PRODUCT_CATEGORY",
		"MOLECULAR_MECHANISM",
		"CELLULAR_MECHANISM",
		"UNDER_ACTIVE_DEVELOPMENT",
		"SMILES",
		"CONDITIONS",
		"ORIGINATOR_ORGANIZATIONS",
		"OTHER_ORGANIZATIONS",
		"SEQUENCE",
		"CAS_NO",
		"TARGET_ID",
		"DRUG_ID"
	]
	
	$patent_cols = ["TR_TARGET_ID", "TARGET_NAME", "DRUG_ID", "DRUG_NAME", "INTEGRITY_PATENT_ID", "PATENT_TITLE", "PATENT_NUMBER", "PATENT_PUBLICATION", "APPLICANT", "INVENTOR"]
	
	$pharma_cols = [
		"DRUG_NAME",
		"DRUG_NAME", 
		"TARGET_NAME",
		"PHARM_RESULT_ID", 
		"PHARM_EXP_ID", 
		"TARGET_CONDITION_TOXICITY_TYPE", 
		"SYSTEM", 
		"CONDITION_ACTIVITY_TYPE_VALUE", 
		"EFFECT", 
		"PHARMACOLOGICAL_ACTIVITY", 
		"MATERIAL", 
		"METHOD", 
		"PARAMETER", 
		"OPERATOR", 
		"VALUE", 
		"UNIT", 
		"VARIANCE", 
		"MODEL",
		"SOURCE_TYPE",
		"SOURCE_TITLE",
		"TR_TARGET_ID",
		"SOURCE_ID",
		"DRUG_ID"
		]
	
  # GET /drugs
  # GET /drugs.json
  def index
#		@drug_cols = Drug.columns.map {|c| c.name}
		@drug_cols = $drug_cols
		if params[:search]
			@drugs = Drug.search(params[:search]).order("HIGHEST_PHASE DESC")
#			@drugs = @drug_return.paginate(page: params[:page])
		else
			@drugs = Drug.all#paginate(page: params[:page])
			respond_to do |format|
				format.json { render json: DrugsDatatable.new(view_context) }
				format.html
				format.csv { send_data @drugs.to_csv }
				format.xls #{ send_data @products.to_csv(col_sep: "\t") }
			end
		end
  end
	
	def index_table
		respond_to do |format|
			format.json { render json: DrugsDatatable.new(view_context) }
			format.html
		end
	end
		
	
	def import
		Drug.import(params[:file])
		redirect_to drugs_path, notice: "Drugs imported."
	end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
		@drug = Drug.find(params[:id])
		@drug_cols = $drug_cols
		@pharma_cols = $pharma_cols
		@patent_cols = $patent_cols
#		@pharma = Pharmacology.where(DRUG_NAME: @drug[:DRUG_NAME])
  end

  # GET /drugs/new
  def new
    @drug = Drug.new
  end
	
	def sort
#		@drugs = Drug.all
	end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:product).permit(:TR_TARGET_ID, :DRUG_ID, :INTEGRITY_PATENT_ID, :TARGET_NAME, :DRUG_NAME, :CORTELLUS_ID, :PRODUCT_CATEGORY, :MOLECULAR_MECHANISM, :CELLULAR_MECHANISM, :UNDER_ACTIVE_DEVELOPMENT, :HIGHEST_PHASE, :INACTIVE_CONDITIONS, :ORIGINATOR_ORGANIZATION, :INACTIVE_ORGANIZATION, :ACTIVE_CONDITIONS, :ACTIVE_ORGANIZATIONS, :SMILES, :SEQUENCE, :CAS_NUMBER)
    end
end

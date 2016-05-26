class PharmacologiesDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

	$pharma_cols = ["DRUG_NAME", "DRUG_NAME", "TARGET_NAME", "PHARM_RESULT_ID", "PHARM_EXP_ID", "TARGET_CONDITION_TOXICITY_TYPE", "SYSTEM", "CONDITION_ACTIVITY_TYPE_VALUE", "EFFECT", "PHARMACOLOGICAL_ACTIVITY", "MATERIAL", "METHOD", "PARAMETER", "OPERATOR", "VALUE", "UNIT", "VARIANCE", "MODEL","SOURCE_TYPE","SOURCE_TITLE", "TR_TARGET_ID", "SOURCE_ID", "DRUG_ID"]

	
  def initialize(view)
		puts "aa"
    @view = view
  end

  def as_json(options = {})
		puts "bb"
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Pharmacology.count,
			iTotalDisplayRecords: drugs.total_entries,
      aaData: data
    }
  end

private

  def data
		drugs.map do |drug|
			[	drug.id,
				drug.DRUG_NAME,
				drug.TARGET_NAME,
				drug.PHARM_RESULT_ID,
				drug.PHARM_EXP_ID,
				drug.TARGET_CONDITION_TOXICITY_TYPE,
				drug.SYSTEM,
				drug.CONDITION_ACTIVITY_TYPE_VALUE,
				drug.EFFECT,
				drug.PHARMACOLOGICAL_ACTIVITY,
				drug.MATERIAL,
				drug.METHOD,
				drug.PARAMETER,
				drug.OPERATOR,
				drug.VALUE,
				drug.UNIT,
				drug.VARIANCE,
				drug.MODEL,
				drug.SOURCE_TYPE,
				drug.SOURCE_TITLE,
				drug.TR_TARGET_ID,
				drug.SOURCE_ID,
				drug.DRUG_ID
      ]
    end
  end

def drugs
		@drugs ||= fetch_pharma
  end

	def fetch_pharma
		drugs = Pharmacology.order("#{sort_column} #{sort_direction}")
		drugs = drugs.page(page).per_page(per_page)
    if params[:search]["value"] != ""
			puts "Global search:", params[:search]["value"]
			drugs = drugs.where("DRUG_NAME like :search or TARGET_NAME like :search or DRUG_ID like :search", search: "%#{params[:search]["value"]}%")
    end
#		drugs
		filter_now(drugs)
  end
	
	def filter_now(drugs)
#		puts "ewfweffwefwefwfe", drugs.inspect
		for col in params["columns"]
			if col[1]["search"]["value"] != ""
				puts col[0], col[1]["search"]["value"]
				puts $pharma_cols[col[0].to_i]
				query = col[1]["search"]["value"]
				drugs = drugs.where("#{$pharma_cols[col[0].to_i]} like :search", search: "%#{query}%")
			end	
		end
		drugs
	end

  def page
    params["start"].to_i/per_page + 1
  end

  def per_page
    params["length"].to_i > 0 ? params["length"].to_i : 10
  end

  def sort_column
		columns = $pharma_cols
    columns[params[:order]["0"]["column"].to_i]
  end

  def sort_direction
    params[:order]["0"]["dir"]
  end
end
class DrugsDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

	$drug_cols = [
		"DRUG_NAME",
		"DRUG_NAME",
		"TARGET_NAME",
		"HIGHEST_PHASE",
		"PRODUCT_CATEGORY",
		"MOLECULAR_MECHANISM",
		"CELLULAR_MECHANISM",
		"UNDER_ACTIVE_DEVELOPMENT",
		"SMILES",
		"ACTIVE_CONDITIONS",
		"INACTIVE_CONDITIONS",
		"ORIGINATOR_ORGANIZATION",
		"ACTIVE_ORGANIZATION",
		"INACTIVE_ORGANIZATION",
		"SEQUENCE",
		"CAS_NUMBER",
		"CORTELLIS_ID",
		"INTEGRITY_PATENT_ID",
		"TR_TARGET_ID",
		"DRUG_ID"
	]
	
  def initialize(view)
		puts "aa"
    @view = view
  end

  def as_json(options = {})
		puts "bb"
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Drug.count,
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
				drug.HIGHEST_PHASE,
				drug.PRODUCT_CATEGORY,
				drug.MOLECULAR_MECHANISM,
				drug.CELLULAR_MECHANISM,
				drug.UNDER_ACTIVE_DEVELOPMENT,
				drug.SMILES,
				drug.ACTIVE_CONDITIONS,
				drug.INACTIVE_CONDITIONS,
				drug.ORIGINATOR_ORGANIZATION,
				drug.ACTIVE_ORGANIZATION,
				drug.INACTIVE_ORGANIZATION,
				drug.SEQUENCE,
				drug.CAS_NUMBER,
				drug.CORTELLIS_ID,
				drug.INTEGRITY_PATENT_ID,
				drug.TR_TARGET_ID,
				drug.DRUG_ID
      ]
    end
  end
	
	def finalData
		@drug_list = params[:data_value]
	end

	def drugs
		@drugs ||= fetch_drugs
  end

	def fetch_drugs
		drugs = Drug.order("#{sort_column} #{sort_direction}")
		drugs = drugs.page(page).per_page(per_page)
    if params[:search]["value"] != ""
			puts "Global search:", params[:search]["value"]
			drugs = drugs.where("DRUG_NAME like :search or TARGET_NAME like :search or DRUG_ID like :search or ACTIVE_ORGANIZATION like :search or INACTIVE_ORGANIZATION like :search or HIGHEST_PHASE like :search", search: "%#{params[:search]["value"]}%")
    end
		filter_now(drugs)
  end
	
	def filter_now(drugs)
		for col in params["columns"]
			query = col[1]["search"]["value"]
			words = query.split(" ")
			if words.length == 1
				query = col[1]["search"]["value"]
				drugs = drugs.where("#{$drug_cols[col[0].to_i]} like :search", search: "%#{query}%")
			else
				length = words.length-1
				here_we_go = []
				for x in 0..length
					partq = "#{$drug_cols[col[0].to_i]} like :search#{x}" 
					partz1 = ":search#{x}"
					partz2 = "'%#{words[x]}%'"
					z = [partz1, partz2]
					part_final = partq.sub(z[0], z[1])
					puts "final", part_final
					here_we_go.push(part_final)
				end
				final = here_we_go.join(" or ")
				drugs = drugs.where(final)
			end	
		end
		drugs
	end

  def page
    params["start"].to_i/per_page + 1
  end

  def per_page
		puts "pages"
    params["length"].to_i > 0 ? params["length"].to_i : 10
  end

  def sort_column
		puts "sort"
		columns = $drug_cols
    columns[params[:order]["0"]["column"].to_i]
  end

  def sort_direction
    params[:order]["0"]["dir"]
  end
end
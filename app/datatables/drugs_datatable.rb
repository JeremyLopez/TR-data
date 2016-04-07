class DrugsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Drug.all.count,
			iTotalDisplayRecords: drugs.total_count,
      aaData: data
    }
		puts "HERE", iTotalRecords
  end

private

  def data
		drugs.map do |drug|
      [	drug.DRUG_NAME,
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

	def drugs
		@drugs ||= fetch_drugs
  end

	def fetch_drugs
		drugs = Drug.order("#{sort_column} #{sort_direction}")
		drugs = drugs.page(page).per_page(per_page)
    if params[:sSearch].present?
			drugs = drugs.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
		drugs
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[DRUG_NAME DRUG_ID TARGET_NAME HIGHEST_PHASE]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
class Drug < ActiveRecord::Base
	
	has_many :pharmacologies, primary_key: "DRUG_ID"
	has_many :cond_pharmas, primary_key: "DRUG_ID"
	has_many :patents, primary_key: "DRUG_ID"
	
	self.per_page = 15
	
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |drug|
				csv << drug.attributes.values_at(*column_names)
			end
		end
	end
	
	def self.results_per_page(query)
		self.per_page = 15
		self.per_page = query
	end
	
	def self.search(query)
		# where(:title, query) -> This would return an exact match of the query
		where("TARGET_NAME like :query OR DRUG_NAME like :query", query: "%#{query}%") 
	end
	
	def self.import(file)
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			drug = find_by_id(row["id"]) || new
			drug.attributes = row.to_hash
			drug.save!
		end
	end
	
	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Roo::CSV.new(file.path, packed: nil, file_warning: :ignore)
		when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
		when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end
			
end

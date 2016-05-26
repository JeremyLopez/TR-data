	def filter_now(drugs)
#		puts "ewfweffwefwefwfe", drugs.inspect
		final = []
		puts "d"
		for col in params["columns"]
			puts col
			query = col[1]["search"]["value"]
			puts "query", query
			words = query.split(" ")
			puts "words", words.length
			if words.length == 1
				puts "length = 1"
#				puts col[0], col[1]["search"]["value"]
#				puts $drug_cols[col[0].to_i]
				query = col[1]["search"]["value"]
				drugs = drugs.where("#{$drug_cols[col[0].to_i]} like :search", search: "%#{query}%")
			else
				puts "length = 2"
				drugs = drugs.where("#{$drug_cols[col[0].to_i]} like :search1 or #{$drug_cols[col[0].to_i]} like :search2 ", search1: "%#{words[0]}%", search2: "%#{words[1]}%" )
			end	
		end
		drugs = drugs.order("#{sort_column} #{sort_direction}")
		drugs = drugs.page(page).per_page(per_page)
		drugs
	end
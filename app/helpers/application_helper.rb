module ApplicationHelper

	# return the title for each page
	def full_title(page_title)
		base_title = "Rail SampleApp"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end

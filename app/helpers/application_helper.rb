module ApplicationHelper

	def page_title
		base_title = "Shiftem"
		if @page_title.present?
		  "#{@page_title} | #{base_title}"
		else
		  base_title
		end
	end

end

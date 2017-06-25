module ApplicationHelper
	def datepicker_input form, field
	    content_tag :div, :class=> "input-group date", :data => {:provide => 'datepicker', 'date-format' => 'mm/dd/yyyy', 'date-autoclose' => true} do
	      form.text_field field, class: 'form-control', placeholder: 'mm/dd/yyyy'
	    end
 	end
end

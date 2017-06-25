FactoryGirl.define do
  	factory :product do |f|
	    f.name 'Product Name'
	    f.description 'Desc Product'
	    f.price 440
	    f.status :enabled
	    f.inward_date '2017-06-25 13:25:33'
	    f.type 'Pen'
  	end

  	factory :pen do |f|
	    f.name 'Pen Name'
	    f.description 'Desc Pen'
	    f.price 450
	    f.status :enabled
	    f.inward_date '2017-06-25 13:25:33'
	    f.type 'Pen'
  	end

  	factory :invalid_product, parent: :product do |f|
  		f.type nil
	end
	factory :invalid_pen, parent: :pen do |f|
  		f.name nil
	end
end

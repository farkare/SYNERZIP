class Product < ActiveRecord::Base
	validates :name, :price, :status, :inward_date, :type, :description, presence: true
	validates_numericality_of :price

	enum status: { enabled: 0, disabled: 1 }

	self.inheritance_column = :type

	scope :pens, -> { where(type: 'Pen') } 
	scope :notebooks, -> { where(type: 'Notebook') } 

	def self.types
      %w(Pen Notebook)
    end

    def self.colors
    	%W(blue red yellow black)
    end

    def self.price_sum(params)
    	case params[:product_type]
    	when 'Pen'; pens.sum(:price)
    	when 'Notebook'; notebooks.sum(:price)
    	else ; sum(:price)
    	end
    end

     #def inward_date
     #	inward_date.strftime("%m/%d/%Y") if inward_date.present?
     #end

     #def inward_date=(date)
     #	@inward_date = Time.strptime(date, '%m/%d/%Y') if date.present?
     #end
end

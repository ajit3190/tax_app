class ItemTax < ApplicationRecord
	belongs_to :item

	validates :name, presence: true
	validates :tax_type, presence: true
	validates :tax, presence: true, numericality: { greater_than: 0.0 }
  validates :item, presence: true, uniqueness: true
	enum tax_type: { percentage: 1, amount: 2}

	after_save :update_item

	def update_item
		item = self.item
		if self.tax_type == "percentage"
			amount = item.price * (self.tax/100)
		else
			amount = self.tax
		end
		item.actual_price = item.price + amount
		item.save
	end
	# enum tax_type: { 1 => "percentage" , 2 => "amount"}
end

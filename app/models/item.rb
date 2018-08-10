class Item < ApplicationRecord
	belongs_to :item_category
	has_one   :item_tax, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true,  numericality: { greater_than: 0.0 }
end

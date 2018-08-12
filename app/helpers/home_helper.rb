module HomeHelper
	def display_tax(item)
    tax =	item.item_tax
    if tax.tax_type == "percentage"
    	postfix = " %"
    else
    	postfix = " Rs."
    end
    return (tax.tax.to_s + postfix)
	end
end

class InitializeProductValues < ActiveRecord::Migration[5.1]
  def change
  	product_params = [
  		{name:"King Mattress",cost:700, dimensions:"76\"x80\""},
  		{name:"Queen Mattress", cost:575, dimensions:"60\"x80\""},
  		{name:"Twin Mattress", cost:325, dimensions:"39\"x75\""}
  	]
  	product_params.each do |params|
  		product = Product.where(name:params[:name]).first_or_create
  		product.update(params)
  	end
  end
end

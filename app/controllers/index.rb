before do
  @categories = Category.all
  @products = Product.all
  @random_products = []
  6.times {|product| @random_products << @products.sample}
end

get "/" do
  @false_login = false
  session[:cart] = []
  erb :index
end

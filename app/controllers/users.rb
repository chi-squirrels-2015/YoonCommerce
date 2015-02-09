before do
  @categories = Category.all
  @products = Product.all
  @random_products = []
  6.times {|product| @random_products << @products.sample}
end

post "/login" do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    erb :index
  else
    @false_login = true # Incorporate a flash request message somehow???
    erb :index
  end
end

get "/signup" do
  erb :"users/signup"
end

post "/signup" do
  @user = User.create!(params[:user])
  session[:user_id] = @user.id
  redirect "/"
end

get "/lost-password" do
  erb :"users/lost-password"
end

post "/lost-password" do
  user = User.find_by(email:params[:email])
  User.forgot_password(user)
  @recover = true
  erb :"users/lost-password"
end

get "/logout" do
  session.clear # Do we want to wipe out everything?
  redirect "/"
end


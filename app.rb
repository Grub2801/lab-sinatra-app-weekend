class LawyersApp < Sinatra::Base

#root route
get "/" do
  redirect('/lawyers')
end

#about page
get "/about" do
  erb(:about)
end

#index
get '/lawyers' do
  @lawyers = Lawyer.all
  erb(:"lawyers/index")
end

#new
get '/lawyers/new' do
  @lawyer = Lawyer.new
  erb(:"lawyers/new")
end

#create
post '/lawyers' do
  @lawyer = Lawyer.new(params[:lawyer])
  if @lawyer.save
    redirect("/lawyers/#{@lawyer.id}")
  else
    erb(:"lawyers/new")
  end
end

#show
get '/lawyers/:id' do
  @lawyer = Lawyer.find(params[:id])
  erb(:"lawyers/show")
end

#edit
get '/lawyers/:id/edit' do
  @lawyer = Lawyer.find(params[:id])
  erb(:"lawyers/edit")
end

#update
put '/lawyers/:id' do
  @lawyer = Lawyer.find(params[:id])
  if @lawyer.update_attributes(params[:lawyer])
    redirect("/lawyers")
  else
    erb(:"lawyers/new")
  end
end

#destroy
post '/lawyers/:id/delete' do
  @lawyer = Lawyer.find(params[:id])
  if @lawyer.destroy
    redirect('/lawyers')
  else
    redirect("/lawyers/#{@lawyer.id}")
  end
end
end
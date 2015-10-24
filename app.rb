class LawyerApp < Sinatra::Base

#root route
get '/' do
  redirect('/lawyers')
end

#about page
get '/about' do
  erb(:about)
end

#index
get '/lawyers' do
  @lawyer = Lawyer.all
  erb(:"lawyers/index")
end

#new
get 'lawyers/new' do
  @lawyer = Lawyer.new
  erb(:"lawyers/new")
end

#create
post '/lawyers' do
  @lawyer.new(params[:lawyer])
  if @lawyer.save
    redirect('/lawyer/#{@lawyer.id}')
  else
    erb(:'lawyer/new')
  end
end

#show
get '/lawyers/:id' do
  @lawyer = Lawyer.find(params[:id])
  erb(:'lawyer/show')
end

#edit
get '/lawyers/:id/edit' do
  @lawyer = Lawyer.find(params[:id])
  erb(:'lawyers/edit')
end

#update
post '/lawyers/:id/update' do
  @lawyer = Lawyer.find(params[:id])
  @lawyer.update_attributes(params[:lawyer])
    if @lawyer.save
      redirect('/lawyers')
    else
      erb(:'lawyers/new')
    end
end

#destroy
post '/lawyers/:id/delete' do
  @lawyer = Lawyer.find(params[:id])
  if @lawyer.destroy
    redirect('/lawyers')
  else
    redirect('/lawyers/#{@lawyer.id}')
  end
end

end
class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    #binding.pry
    erb :'landmarks/index'
  end 
  
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end 
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    erb :'landmarks/show'
  end 
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params["id"])
    erb :'landmarks/edit'
  end 
  
  post '/landmarks' do 
    #binding.pry
    @landmark = Landmark.create(params["landmark"])
    @figure.save 
    
    erb :'landmarks/show'
  end 
  
  post '/landmarks/:id' do 
    #binding.pry
    @landmark = Landmark.find(params["id"])
    @landmark.update(params["landmark"])
    @landmark.save
    
    redirect "/landmarks/#{@landmark.id}"
  end 

end

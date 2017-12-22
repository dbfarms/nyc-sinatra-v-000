class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end 
  
  get '/figures/new' do 
    erb :'figures/new'
  end
  
  get '/figures/:id' do 
    #binding.pry
    @figure = Figure.find(params["id"])
    erb :'figures/show'
  end 
  
  get '/figures/:id/edit' do 
    
    @figure = Figure.find(params["id"])
    
    erb :'figures/edit'
  end 
  
  post '/figures' do 
    #binding.pry
    @figure = Figure.create(params["figure"])
    
    if params["title"]["name"] != ""
      #binding.pry
      @figure.titles << Title.create(params["title"])
    end 
    #binding.pry 
    if params["landmark"]["name"] != ""
      @figure.landmarks << Landmark.create(params["landmark"])
    end 
    
    @figure.save
    
    erb :'figures/show'
  end 
  
  post '/figures/:id' do 
    @figure = Figure.find(params["id"])
    @figure.update(params["figure"])
    
    if params["title"]["name"] != ""
      @figure.titles << Title.create(params["title"])
    end 
     
    if params["landmark"]["name"] != ""
      @figure.landmarks << Landmark.create(params["landmark"])
      #binding.pry
    end 
    
    @figure.save 

    #binding.pry
    #redirect to "/figures/#{@figure.id}"
    redirect "/figures/#{@figure.id}"
    
  end 
  
end 
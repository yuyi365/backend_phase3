class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/lists' do
    lists = List.all
    lists.to_json
  end

  get '/lists/:id/categories' do
    list = List.find(params[:id])
    list.categories.uniq.to_json
  end

  get '/lists/:id' do
    list = List.find(params[:id])
    list.to_json
  end

  get '/lists/:id/items' do
    list = List.find(params[:id])
    list.items.uniq.to_json
  end

  get '/lists/user_id/:user_id' do
    lists = List.all.where("user_id=#{params[:user_id]}")
    lists.to_json
  end

  patch '/items/:id' do
    item = Item.find(params[:id])
    item.update(quantity: params[:quantity])
    item.to_json
  end

  post '/items' do
    category_id = Category.find_by(name: params[:category]).id
    item =
      Item.create(
        name: params[:name],
        category_id: category_id,
        list_id: params[:list_id],
        quantity: params[:quantity],
        min_quantity: params[:min_quantity],
        notes: params[:notes],
        image: params[:image],
      )
    item.to_json
  end

  delete '/items/:id' do
    item = Item.find(params[:id])
    item.destroy
    item.to_json
  end

  post '/categories' do
    category = Category.create(name: params[:name])
    category.to_json
  end
end

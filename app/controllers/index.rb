get '/' do
  # let user create new short URL, display a list of shortened URLs
@shorturl = Url.all 
  erb :index
end

post '/urls' do
  url = params[:url]
  new_link = Url.create(ori_url: url)
  new_link.save!
  @shorturl =Url.all 
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  redirect = Url.find_by_short_url(params[:short_url])
  redirect.click_count += 1
  redirect.save

  redirect redirect.ori_url
end
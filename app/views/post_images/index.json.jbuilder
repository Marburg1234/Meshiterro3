json.data do
  json.items do
    json.array!(@post_images) do |post_image|
      json.id post_image.id
      json.user do
        json.name post_image.user.name
        json.image url_for(post_image.user.profile_image)
      end
      json.images do
        post_image.images.each do |image|
          json.image_url image.variant(resize: "100x100").service_url
        end
      end
      json.shop_name post_image.shop_name
      json.caption post_image.caption
      json.address post_image.address
      json.latitude post_image.latitude
      json.longitude post_image.longitude
    end
  end
end

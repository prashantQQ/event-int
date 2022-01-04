json.extract! content_item, :id, :content_title, :publishing_target, :publish_date, :created_at, :updated_at
json.url content_item_url(content_item, format: :json)

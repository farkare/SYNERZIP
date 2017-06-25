json.extract! product, :id, :name, :price, :color, :status, :inward_date, :type, :description, :created_at, :updated_at
json.url product_url(product, format: :json)

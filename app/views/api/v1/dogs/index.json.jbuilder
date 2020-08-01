json.dogs  do
  json.array! @dogs do |dog|
    json.extract! dog, :id, :name, :image
    json.created_at dog.created_at.strftime("%e %b %Y %H:%M:%S%p")
    json.description "#{dog.description[0..40]}..."
  end
end

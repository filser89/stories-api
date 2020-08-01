json.extract! @dog, :id, :name, :description, :image
json.created_at @dog.created_at.strftime("%e %b %Y %H:%M:%S%p")
json.comments do
  json.array! @dog.comments do |comment|
    json.extract! comment, :name, :content
    json.created_at comment.created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

end

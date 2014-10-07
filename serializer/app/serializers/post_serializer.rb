class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :age, :comments

  def age
    21
  end
end

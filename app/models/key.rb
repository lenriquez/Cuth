class Key
  include Mongoid::Document
  field :title, type: String
  field :name, type: String
  field :url, type: String
  field :password, type: String
  field :comments, type: String
end

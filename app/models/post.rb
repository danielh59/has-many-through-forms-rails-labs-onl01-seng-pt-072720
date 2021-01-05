class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
      categories_hashes.values.each do | categories_attributes|
        category = Category.find_or_create_by(name: categories_attributes[:name])
        self.categories << category
    end
  end
end

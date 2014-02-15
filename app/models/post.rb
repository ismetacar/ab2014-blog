class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5, maximum: 200,
                    message: "en az 5 karakter, en fazla 200 karakter giriniz." }

  validates :title, uniqueness: { scope: :text,
    message: "Bu Gönderi zaten mevcut" }

  after_find do |post|
    puts "Post bulundu"
  end
end

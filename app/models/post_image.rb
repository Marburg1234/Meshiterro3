class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # このモデルにimageといす画像を持たせる
  # ActiveStorageの設定をする　(Actove Storageと対象のModelをつなげるイメージ)
  has_many_attached :images

  validates :shop_name, presence: { message: "の入力は必須です",  full_message: false }
  validates :images, presence: { message: "を選択してください",  full_message: false }
  validates :caption, presence: { message: "を入力してください",  full_message: false }

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  # 写真を表示させるためのメソッドを定義する
  def get_image
    if images.attached?
      images
    else
      'no_image.jpg'
    end
  end

  # def get_image
  #   unless images.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     images.attach(io: File.open(file_path), filename: 'default-images.jpg', content_type: 'images/jpeg')
  #   end
  #   images
  # end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

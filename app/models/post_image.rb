class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # このモデルにimageといす画像を持たせる
  # ActiveStorageの設定をする　(Actove Storageと対象のModelをつなげるイメージ)
  has_one_attached :image

  validates :shop_name, presence:true
  validates :image, presence:true
  validates :caption, presence:true


  # 写真を表示させるためのメソッドを定義する
  def get_iumage
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-umage.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

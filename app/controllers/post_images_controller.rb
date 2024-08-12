class PostImagesController < ApplicationController

  # newでは新たに投稿するデータを収める箱を作ってあげる=空の箱を用意しておく
  # form_withに渡すための箱
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id #投稿記事のユーザーidにログイン中のユーザーidを代入する PostImageモデルのuser_idにUserモデルのidを入れる
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    # @post_images = PostImage.all
    # ページネーションでページごとのデータを取得するように設定する
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  # 投稿のストロングパラメーターを作成する
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption, :image)
  end

end

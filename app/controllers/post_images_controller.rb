class PostImagesController < ApplicationController

  # newでは新たに投稿するデータを収める箱を作ってあげる=空の箱を用意しておく
  # form_withに渡すための箱
  def new
    @post_images = PostImage.new
  end

  def create
    @post_images = PostImage.new(post_image_params)
    @post_images.user_id = current_user.id #投稿記事のユーザーidにログイン中のユーザーidを代入する PostImageモデルのuser_idにUserモデルのidを入れる
    if @post_images.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    respond_to do |format|
      format.html do
        @post_images = PostImage.page(params[:page])
      end
      format.json do
        @post_images = PostImage.all
        # @first_image_url = url_for(@post.images.first) if @post.images.attached?
      end
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    #ページ閲覧のレコードを作る
    @post_image_user = @post_image.user
    user = current_user
    if user != @post_image_user
      user.visit_counts.create(post_image_id: @post_image.id)
    end
    @page_visit_counts = page_visit_counts
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  # 投稿のストロングパラメーターを作成する
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption, :address, images: [])
  end

  def page_visit_counts
    @post_image.visit_counts.count
  end
end

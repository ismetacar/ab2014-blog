class PostsController < ApplicationController

  http_basic_authenticate_with name: "ismetacar", 
  							   password: "abcd1234",
  							   except: [:index, :show]  # bunlar haric diğerlerini açarken şifre sor
  							 
  def index
  	@posts = Post.all
  end
#yeni post
  def new
  	@post = Post.new
  end
# post görüntüle
  def show
    @post = Post.find(params[:id])
  end
#yeni post oluştur
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
  	else
  	  render 'new'
    end
  end
#post düzenle
  def edit
    @post = Post.find(params[:id])
  end
#düzenlenene postu update et
  def update
    @post = Post.find(params[:id])
 
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
#post sil
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path #bitir ve postun indexine git.
  end
 #buradan gerisi top secret private =)
private
 def post_params
   params.require(:post).permit(:title, :text)
 end

end

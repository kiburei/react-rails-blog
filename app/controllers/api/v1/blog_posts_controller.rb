class Api::V1::BlogPostsController < Api::V1::BaseController

  def index
    respond_with BlogPost.all
  end

  def create
    respond_with :api, :v1, BlogPost.create(blog_post_params)
  end

  def destroy
    respond_with BlogPost.destroy(params[:id])
  end

  def update
    blog_post = BlogPost.find(params["id"])
    blog_post.update_attributes(blog_post_params)
    respond_with blog_post, json: blog_post
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:id, :title, :content)
  end
end

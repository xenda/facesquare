class PostsController < ApplicationController
  respond_to :json, :html

  def search
    query = params[:query]



    @posts = Post.where("title like ? ", "%#{query}%").order(:title)
    respond_to do |forma|
      forma.html { render "index" }
      forma.json { render json: @posts } 
      forma.xml { render xml: @posts } 
      forma.js
    end
  end

  def filter
    year    = params[:year]
    month   = params[:month]
    month ||= Date.today.month

    day     = params[:day]
    day   ||= Date.today.day

    date = Date.new(year.to_i, month.to_i, day.to_i)
    @posts = Post.where(created_at: date)
    # render "index"
  end

  def index
    @posts = Post.order("created_at DESC")
    @post  = Post.new
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json #{ render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def current_user
    User.find(session[:current_user])
  end

  def create
    @post = Post.new(params[:post])
    # @post = current_user.posts.build
    respond_to do |format|
      if @post.save

        Pusher.app_id = '36971'
        Pusher.key = '9e48ffcf2ec64b6ac15c'
        Pusher.secret = 'da013580f44115ee11a7'
        Pusher['facesquare'].trigger('post:create', @post.to_json)


        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }

      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end

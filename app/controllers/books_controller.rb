class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "ismetacar", 
  							   password: "abcd1234",
  							   except: [:index, :show]  # bunlar haric diğerlerini açarken şifre sor

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @books}
      format.json { render json: @books}
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  	#response.headers["Content-Type"] = "application/pdf"
  	#render :text => "hello"                                        pdf olarak açılır.
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  	logger.debug 'DUZENLEME'
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    logger.debug 'YENI KAYIT'

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update

  	logger.debug 'GUNCELLEME'

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy

    logger.debug 'KAYIT SIL'

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :isbn, :author, :description)
    end
end

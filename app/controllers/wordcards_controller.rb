class WordcardsController < ApplicationController
  before_action :set_wordcard, only: [:show, :edit, :update, :destroy]
  before_action :set_notice

  # GET /wordcards
  # GET /wordcards.json
  def index
    @wordcards = Wordcard.all
  end

  # GET /wordcards/1
  # GET /wordcards/1.json
  def show
  end

  # GET /wordcards/new
  def new
    @wordcard = Wordcard.new
  end

  # GET /wordcards/1/edit
  def edit
  end

  # POST /wordcards
  # POST /wordcards.json
  def create
    @wordcard = Wordcard.new(wordcard_params)

    respond_to do |format|
      if @wordcard.save
        format.html { redirect_to :wordcards, notice: "A card for \"#{@wordcard.word}\" was successfully created." }
        format.json { render :show, status: :created, location: @wordcard }
      else
        format.html { render :new }
        format.json { render json: @wordcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wordcards/1
  # PATCH/PUT /wordcards/1.json
  def update
    respond_to do |format|
      if @wordcard.update(wordcard_params)
        format.html { redirect_to :wordcards, notice: "The \"#{@wordcard.word}\" card was successfully updated." }
        format.json { render :show, status: :ok, location: @wordcard }
      else
        format.html { render :edit }
        format.json { render json: @wordcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # special route for handling result. could overload update, but this is more clear
  def result
    @wordcard = Wordcard.find(params[:wordcard_id])
    return if !@wordcard
    result = params.fetch :result
    if result
      @wordcard.bin = [@wordcard.bin + 1, 11].min
      notice = "Correct! '#{@wordcard.word}' was moved to bin #{@wordcard.bin}"
    else
      @wordcard.bin = 1
      notice = "Incorrect. '#{@wordcard.word}' was moved back to bin 1"
    end
    @wordcard.save
    redirect_to :root, :notice => notice
  end

  # DELETE /wordcards/1
  # DELETE /wordcards/1.json
  def destroy
    @wordcard.destroy
    respond_to do |format|
      format.html { redirect_to wordcards_url, notice: "The \"#{@wordcard.word}\" card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wordcard
      @wordcard = Wordcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wordcard_params
      params.fetch(:wordcard, {}).permit(:word,:definition)
    end

    def set_notice
      @notice ||= flash[:notice]
    end


end

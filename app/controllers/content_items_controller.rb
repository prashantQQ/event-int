class ContentItemsController < ApplicationController
  before_action :set_content_item, only: %i[ show edit update destroy ]

  # GET /content_items or /content_items.json
  def index
    @content_items = ContentItem.all
  end

  # GET /content_items/1 or /content_items/1.json
  def show
  end

  # GET /content_items/new
  def new
    puts params
    @content_item = ContentItem.new
    if params[:search].present? || params[:network].present?
      @content_items = ContentItem.where("content_title LIKE ? AND publishing_target LIKE ?", "%#{params[:search]}%", "%#{params[:network]}%") 
    elsif params[:search].present?
      @content_items = ContentItem.where("content_title LIKE ?", "%#{params[:search]}%") 
    elsif params[:network].present?
      @content_items = ContentItem.where("publishing_target LIKE ?","%#{params[:network]}%") 
    else
      @content_items = ContentItem.all
    end
  end

  # GET /content_items/1/edit
  def edit
  end

  # POST /content_items or /content_items.json
  def create
    @content_item = ContentItem.new(content_item_params)

    respond_to do |format|
      if @content_item.save
        format.html { redirect_to content_item_url(@content_item), notice: "Content item was successfully created." }
        format.json { render :show, status: :created, location: @content_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_items/1 or /content_items/1.json
  def update
    respond_to do |format|
      if @content_item.update(content_item_params)
        format.html { redirect_to content_item_url(@content_item), notice: "Content item was successfully updated." }
        format.json { render :show, status: :ok, location: @content_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_items/1 or /content_items/1.json
  def destroy
    @content_item.destroy

    respond_to do |format|
      format.html { redirect_to content_items_url, notice: "Content item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_item
      @content_item = ContentItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_item_params
      params.require(:content_item).permit(:content_title, :publishing_target, :publish_date, :start_time, :end_time)
    end
end

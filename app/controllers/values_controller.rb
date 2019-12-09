class ValuesController < ApplicationController
  before_action :set_target_value, only: %i[show edit update destroy]

  def new
    @value = Value.new(flash[:value])
  end

  def index
    @values = Value.page(params[:page])
  end

  def edit
    @value.attributes = flash[:value] if flash[:value]
  end

  def show
    @comment = Comment.new(value_id: @value.id)
  end

  def create
    value = Value.new(value_params)
    if value.save
      flash[:notice] = "あなたの価値観を受付けました"
      redirect_to value
    else
      redirect_to new_value_path, flash: {
        value: value,
        error_messages: value.errors.full_messages
      }
    end
  end

  def update
    if @value.update(value_params)
      flash[:notice] = "編集が完了しました"
      redirect_to @value
    else
      redirect_to edit_value_path(@value), flash: {
        value: @value,
        error_messages: @value.errors.full_messages
      }
    end
  end

  def destroy
    @value.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to values_path
  end

  private 
    def value_params
      params.require(:value).permit(:title, :content)
    end

    def set_target_value
      @value = Value.find(params[:id])
    end

end

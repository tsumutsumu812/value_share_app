class ValuesController < ApplicationController
  def new
    @value = Value.new
  end

  def index
    @values = Value.all
  end

  def edit
    @value = Value.find_by(id: params[:id])
  end

  def show
    @value = Value.find(params[:id])
  end

  def create
    value = Value.new(value_params)
    if value.save
      flash[:notice] = "あなたの価値観を受付けました"
      redirect_to value
    else
      render :new
    end
  end

  def update
    value = Value.find(params[:id])
    value.update(value_params)
    flash[:notice] = "編集が完了しました"
    redirect_to value
  end

  def destroy
    value = Value.find(params[:id])
    value.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to values_path
  end

  private 
    def value_params
      params.require(:value).permit(:title, :content)
    end

end

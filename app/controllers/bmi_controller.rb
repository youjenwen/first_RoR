class BmiController < ApplicationController
  def index; end

  def result
    height = params[:body_height].to_f / 100 # 把單位換算成公尺
    weight = params[:body_weight].to_f

    # BMI 計算公式: BMI = 體重（單位：公斤） / 身高平方（單位：公尺）.
    @bmi = (weight / (height * height)).round(2)
    flash[:bmi] = @bmi        # 將值存入flash
    redirect_to bmi_show_path # 跳轉頁面
  end

  def show
    @bmi = flash[:bmi] #撈出來顯示
  end
end

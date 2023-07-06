class BmiController < ApplicationController
  def index; end

  def result
    render json: params #TODO:目前按下開始計算是有將資料post過去 但畫面沒動
    # height = params[:body_height].to_f / 100   # 把單位換算成公尺
    # weight = params[:body_weight].to_f

    # # BMI 計算公式: BMI = 體重（單位：公斤） / 身高平方（單位：公尺）.
    # @bmi = (weight / (height * height)).round(2)
    # render plain: "<h1>您的 BMI 值為:#{@bmi}</h1>"
  end
end

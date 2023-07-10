class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :update, :destroy, :vote]
  # only 裡表示 有哪些會用到這個方法

  def index
    @candidates = Candidate.all
    # all方法 -> 取得所有資料 並存在 @candidates 慣例上都會使用複數名詞
    # 因為稍後要在 View 使用 @candidates 變數所以才使用實體變數
  end

  def new
    @candidate = Candidate.new
    # 在 Controller 的 new 方法裡設定的實體變數 @candidate，就是要給剛剛前面 form_for 用的
  end

  def show
  end

  def create
    @candidate = Candidate.new(candidate_params)
    # @candidate = Candidate.new(params[:candidate])
    # 如果直接將參數塞進 Model 會報錯 ActiveModel::ForbiddenAttributesError
    # 所以在下面寫了 private 處理
    if @candidate.save
      # redirect_to candidates_path, notice: '新增候選人成功!'
      # 上面這行等於下面這行
      flash[:notice] = '新增候選人成功~'
      redirect_to candidates_path
    else
      render :new # 這裡的new 是 頁面名稱的new 不是controller的new
    end
  end

  def edit
    # @candidate = Candidate.find_by(id: params[:id])  # 移到上面寫在 before 裡
    # 這裡的 :id 是 rails routes  URI Pattern 上顯示的
  end

  def update
    # @candidate = Candidate.find_by(id: params[:id]) # 移到上面寫在 before 裡

    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: '更新成功!'
    else
      render :edit
    end
  end

  def destroy
    # @candidate = Candidate.find_by(id: params[:id]) # 移到上面寫在 before 裡
    @candidate.destroy
    redirect_to candidates_path, notice: '候選人資料已刪除'
  end

  def vote
    # @candidate = Candidate.find_by(id: params[:id]) # 移到上面寫在 before 裡
    
    # @candidate.increment(:votes) # :votes 是欄位 意思是使用 increment 方法來增加那筆資料的 votes 欄位的值
    # @candidate.save
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    redirect_to candidates_path, notice: "投票完成"
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

   # 因為有些重複的code 拿來private 做成方法
   def find_candidate
    # @candidate = Candidate.find_by(id: params[:id])
    # 改用find，使用begin .. rescue
    begin
      @candidate = Candidate.find(params[:id])
    rescue
      redirect_to candidates_path, notice: "查無此人"
    end
  end
end

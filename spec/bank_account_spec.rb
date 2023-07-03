# 試著把 規格 轉成 測試
# 再次強調一次，我們不是在「為了寫測試而寫測試」，而是在「寫規格」，然後藉由一步一步滿足這些規格的過程來完成系統功能。
require './bank_account'

RSpec.describe BankAccount do
  # 因為發現發現每個測試幾乎都是先做出一個 BankAccount 的實體
  # before :each 在執行每個測試之前先做某件事
  # before :all 則是在所有測試之前做一次
  #   before :each do
  #     @account = BankAccount.new(10)
  #   end

  let(:account) { BankAccount.new(10) }

  describe '存錢功能' do
    # 先把測試方向用it 方法列出來
    it '原本帳戶有 10 元，存入 5 元之後，帳戶餘額變 15 元' do
      # 先假設 BankAccount 有這些功能 deposit balance
      account.deposit 5
      expect(account.balance).to be 15
    end
    it '原本帳戶有 10 元，存入 -5 元之後，帳戶餘額還是 10 元（不能存入小於等於零的金額）' do
      account.deposit(-5)
      expect(account.balance).to be 10
    end
  end

  describe '領錢功能' do
    it '原本帳戶有 10 元，領出 5 元之後，帳戶餘額變 5 元' do
     account.withdraw 5
    #   amount = account.withdraw 5
    #   expect(amount).to be 5
      expect(account.balance).to be 5
    end
    it '原本帳戶有 10 元，試圖領出 20 元，帳戶餘額還是 10 元，但無法領出（餘額不足）' do
      account.withdraw 20
      expect(account.balance).to be 10
    end
    it '原本帳戶有 10 元，領出 -5 元之後，帳戶餘額還是 10 元（不能領出小於或等於零的金額）' do
      account.withdraw(-5)
      expect(account.balance).to be 10
    end
  end
end
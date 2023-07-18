class ApplicationController < ActionController::Base
    #protect_from_forgery方法啟動了CSRF安全性功能，所有非GET的HTTP request都必須帶有一個Token參數才能存取
    protect_from_forgery
end

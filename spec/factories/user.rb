FactoryBot.define do
    factory :user do
        id { SecureRandom.uuid }
        name { 'Bob' }
        email { 'bob@gmail.com' }
        tel { '0977888999' }
    end
end
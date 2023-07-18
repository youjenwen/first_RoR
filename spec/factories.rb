FactoryBot.define do
    factory :article do
        id { SecureRandom.uuid }
        title { 'article' }
        body { 'body' }
        author { 'article author' }
    end
end
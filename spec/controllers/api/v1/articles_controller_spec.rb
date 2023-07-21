require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
    describe 'GET /api/v1/articles' do
        it 'returns all articles' do
            get '/api/v1/articles'

            expect(response).to have_http_status(:success)
        end
    end

    describe 'POST /api/v1/articles' do
        it 'create new article info' do
            post '/api/v1/articles',
            params:{
                article:{
                    title: 'new article',
                    body: 'new body',
                    author: 'new article author'
                }
            }
            response_json = JSON.parse(response.body)
            expect(response).to have_http_status(:success)
            expect(response_json['title']).to eq('new article')
            expect(response_json['body']).not_to eq('')
        end
    end

    describe 'PATCH /api/v1/articles/{article.id}' do
        context 'when sucesss update action' do
            let(:article) { create(:article) }
            it 'update article info' do
                patch "/api/v1/articles/#{article.id}",
                params:{
                    article:{
                        title: 'update article',
                        body: 'update body',
                        author: 'update article author'
                    }
                }
                response_json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
                expect(response_json['success']).to eq('Article Record Update Successfully')
            end
        end
        
        # context 'fail update action' do
        #     let(:article) { create(:article) }
        #     it 'update fail' do
        #         patch "/api/v1/articles/#{article.id}",
        #         params:{
        #             article:{
        #                 title: 'update article',
        #                 body: 'update body',
        #                 author: 'update article author'
        #             }
        #         }
        #         response_json = JSON.parse(response.body)
        #     end
        # end
        
    end

    describe 'DELETE /api/v1/articles/{article.id}' do
        let(:article) { create(:article) }

        it 'delete article info' do
            delete "/api/v1/articles/#{article.id}"

            response_json = JSON.parse(response.body)
            expect(response).to have_http_status(:success)
            expect(response_json['success']).to eq('Article deleted finish!')
        end
    end
end
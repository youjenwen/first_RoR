require 'rails_helper'

RSpec.describe 'users controller', type: :request do
    describe 'get users info' do
        context 'when users#index' do
            it 'all users info' do
                get '/users' 

                expect(response).to have_http_status(:success)
            end
        end
        context 'when users#show' do
            let(:user) { create(:user) }
            it 'one user info' do
                get "/users/#{user.id}"

                expect(response).to have_http_status(:success)
            end
        end
    end

    describe 'create user info' do
        it 'POST /users' do
            post '/users',
            params: {
                user: {
                    name: 'Zeke',
                    email: 'zeke@test.com',
                    tel: '0988222333'
                },
                commit: 'Create User'
            }
            
            expect(response).to have_http_status(302)
            expect(response.location).to eq('http://www.example.com/users/1')
            expect(response).to redirect_to 'http://www.example.com/users/1'
        end
    end

    describe 'update user info' do
        let(:user) { create(:user) }

        context 'when users#edit' do
            it 'GET edit user' do
                get "/users/#{user.id}/edit"

                expect(response).to have_http_status(:success)
            end
        end
        
        context 'when users#update' do
            it 'PATCH /users' do
                patch "/users/#{user.id}",
                params: {
                    user: {
                        name: 'John',
                        email: 'john@acme.inc',
                        tel: '0988777999'
                    },
                    commit: 'Update User'
                }
    
                expect(response).to have_http_status(302)
                expect(response.location).to eq("http://www.example.com/users/#{user.id}")
                expect(response).to redirect_to "http://www.example.com/users/#{user.id}"
            end
        end
        
    end

    describe 'destroy users info' do
        let(:user) { create(:user) }
        it 'DELETE /users/:id' do
            delete "/users/#{user.id}"

            expect(response).to have_http_status(302)
            expect(response.location).to eq("http://www.example.com/users")
            expect(response).to redirect_to "http://www.example.com/users"
        end
    end
end
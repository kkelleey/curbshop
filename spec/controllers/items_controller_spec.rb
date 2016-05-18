require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'PUT #update' do
    context 'when item does not belong to user' do
      it 'redirects to root path' do
        user = create :user
        sign_in user
        item = create :item_with_user

        put :update, id: item.id

        expect(response).to redirect_to root_path
        expect(flash[:danger]).to match(
          /^You are not authorized to perform this action$/
        )
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'item does not belong to user' do
      it 'redirects to root path' do
        user = create :user
        sign_in user
        item = create :item_with_user

        delete :destroy, id: item.id

        expect(response).to redirect_to root_path
        expect(flash[:danger]).to match(
          /^You are not authorized to perform this action$/
        )
      end
    end
  end
end

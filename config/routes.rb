Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :survivors do
        collection do
          get :show_alphabetic_order
          get :percentage_of_abducted
          get :percentage_of_non_abducted
        end
      end
    end
  end
end

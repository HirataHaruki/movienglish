FactoryBot.define do
  factory :user do
    name                  {"haruki"}
    email                 {"test@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
  end
end

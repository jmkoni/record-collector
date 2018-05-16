FactoryBot.define do
  factory :artist do
    name ["AC/DC", "Adam and the Ants", "Afrika Bambaataa", "Al Foster", "Alan Parsons", "Alex Chilton", "Amy Winehouse", "Annie Lennox", "Arctic Monkeys"].sample
    band_type :band
  end
end

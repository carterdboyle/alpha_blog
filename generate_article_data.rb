# Random text generator
def random_title
  adjectives = %w[Great Mysterious Hidden Strange Remarkable Forgotten Ancient Modern Bold Brave]
  nouns = %w[Secret Empire Journey Path Truth Dream City Legacy Conflict Horizon Future]
  "#{adjectives.sample} #{nouns.sample}"
end

def random_body
  Array.new(rand(3..7)) { Faker::Lorem.paragraph(sentence_count: rand(2..5)) }.join("\n\n")
end

ActiveRecord::Base.transaction do
  User.find_each do |user|
    article_count = rand(10..50)

    articles = Array.new(article_count) do
      {
        title: random_title,
        description: random_body,
        user_id: user.id
      }
    end

    Article.insert_all(articles)
  end
end

class SearchTweetsService
  def self.search(search)
    if search != '全局面' || search != '選択してください(序盤、中盤、終盤、全局面)'
      search = "%#{search}%"
      Tweet.where('tag LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end

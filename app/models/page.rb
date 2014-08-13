class Page
  def self.year
    time = Time.now

    if time.month >= 8
      return time.year + 1
    else
      return time.year
    end
  end
end

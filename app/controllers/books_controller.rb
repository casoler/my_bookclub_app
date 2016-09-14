class BooksController < ApplicationController
  def index
    @books = get_books

    @books.each do |book|
      book["isbn"] = book["isbns"].split(",")[0].to_i 
      book["image_url"] = get_image(book)
      book["description"] = get_description(book) || book["review_snippet"]
    end
    
    @member = Member.find_by(id: params[:member_id])
  end

  def show
    @book = GoogleBooks.search("id:#{params[:id]}").first
  end

  def idreambooks
    isbn13 = params[:id]
    @member = Member.find_by(id: params[:member_id])

    uri = URI("https://idreambooks.com/api/books/reviews.json?q=#{isbn13}&key=#{ENV['IDREAMBOOKS_API_KEY']}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
  end

  private

    def get_books
      uri = URI("https://idreambooks.com/api/publications/recent_recos.json?&slug=science-fiction-fantasy&key=#{ENV['IDREAMBOOKS_API_KEY']}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)
      books = JSON.parse(http.request(request).body)
      books
    end

    def get_image(book)
      uri = URI("https://www.goodreads.com/search/index.xml?key=#{ENV['GOODREADS_API_KEY']}=#{book['isbn']}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request).body
      
      goodread_book = Hash.from_xml(response.gsub("\n", ""))
      goodread_book["GoodreadsResponse"]["search"]["results"]["work"]["best_book"]["image_url"]
    end

    def get_description(book)
      google_book = GoogleBooks.search(book["isbn"]).first
      if google_book
        google_book.description
      else 
        nil
      end
    end
end

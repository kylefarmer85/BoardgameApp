
def api_response(url, key)
    response = RestClient.get(url)
    JSON.parse(response)[key]
    # creates array of hashes from key in API
end

def find_or_create_boardgame_from_first_letter(letter)
    boardgame_array = api_response("https://www.boardgameatlas.com/api/search?name=[#{letter}]&limit=10&pretty=true&client_id=28dZcLNq5b/json", "games")
    # creates array of hashes of game data from API
    if boardgame_array
        # skips letters without boardgame
        boardgame_array.each do |boardgame_hash|
            # iterates though each boardgame n drinks array

            name = boardgame_hash["name"]
            description = boardgame_hash["description"]
            min_players = boardgame_hash["min_players"]
            max_players = boardgame_hash["max_players"]
            year_published = boardgame_hash["year_published"]
            image_url = boardgame_hash["image_url"]
            publisher = boardgame_hash["primary_publisher"]
            thumb_image = boardgame_hash["images"]["thumb"]
            small_image = boardgame_hash["images"]["small"]
            medium_image = boardgame_hash["images"]["medium"]

            @categories_array = boardgame_hash["categories"]
            # creates and assigns a category it doesn't already exist
            @boardgame = Boardgame.create(name: name, description: description, min_players: min_players, max_players: max_players, year_published: year_published, image_url: image_url, publisher: publisher, thumb_image: thumb_image, small_image: small_image, medium_image: medium_image)

                create_boardgame_category_association


            #for each category associate it with the game
            #creates boardgame it doesn't already exist
            end
        end
    end

    def create_boardgame_category_association
            @categories_array.each do |cati|
                category_obj = Category.find_by(cat_id: cati["id"])
                if category_obj
                BoardgameCategory.create(boardgame_id: @boardgame.id, category_id: category_obj.id )
                end
        end
    end


    def create_categories
        categories = api_response("https://www.boardgameatlas.com/api/game/categories?&limit=500&pretty=true&client_id=28dZcLNq5b/json", "categories")

            categories.each do |category|
                Category.find_or_create_by(name: category["name"], cat_id: category["id"])

        end
    end

create_categories

('a'..'z').each do |letter|
    find_or_create_boardgame_from_first_letter(letter)
end

# ('0'..'9').each do |letter|
#     find_or_create_boardgame_from_first_letter(letter)
# end
# iterates through every letter and number creating boardgames and their ingredients from the API

# Make Faker info for users, reviews


def api_response(url, key)
    response = RestClient.get(url)
    JSON.parse(response)[key]
    # creates array of hashes from key in API
end

def find_or_create_boardgame_from_first_letter
    boardgame_array = api_response("https://www.boardgameatlas.com/api/search?name=[a]&fields=name,description,min_players,max_players,year_published,image_url,categories&limit=1111&pretty=true&client_id=28dZcLNq5b/json", "games")
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
            # creates and assigns a category if it doesn't already exist
            Boardgame.find_or_create_by(name: name, description: description, min_players: min_players, max_players: max_players, year_published: year_published, image_url: image_url)
            #     #creates boardgame if it doesn't already exist
            end
        end
    end

    find_or_create_boardgame_from_first_letter

    # def find_or_create_category(arg)
    #     Category.create(:)


    # def category_create(categories_hash)
    #     if categories_hash
    #         Category.find_or_create_by


# ('a'..'z').each do |letter|
#     find_or_create_boardgame_from_first_letter(letter)
# end

# ('0'..'9').each do |letter|
#     find_or_create_boardgame_from_first_letter(letter)
# end
# iterates through every letter and number creating boardgames and their ingredients from the API

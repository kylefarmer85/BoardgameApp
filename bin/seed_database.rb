require_relative '../config/environment'

def api_response(url, key)
    response_string = RestClient.get(url)
    JSON.parse(response_string)[key]
    # creates array of hashes from key in API
end

def find_or_create_boardgame_from_first_letter(letter)
    boardgame_array = api_response("https://www.boardgameatlas.com/api/search?name=[#{letter}]&fields=name,description,category,min_players,max_players,year_published,image_url&limit=15&pretty=true&client_id=28dZcLNq5b/json", "games")
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
            img_url = boardgame_hash["img_url"]
            category_id = Category.find_or_create_by(name: boardgame_hash["category"])
            # creates and assigns a category if it doesn't already exist
            Boardgame.find_or_create_by(name: name, description: description, min_players: min_players, max_players: max_players, year_published: year_published, img_url: img_url)
            #     #creates boardgame if it doesn't already exist
            end
        end
    end
end

('a'..'z').each do |letter|
    find_or_create_boardgames_from_first_letter(letter)
end

('0'..'9').each do |letter|
    find_or_create_boardgame from_first_letter(letter)
end
# iterates through every letter and number creating boardgames and their ingredients from the API

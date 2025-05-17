String kPromptPokemonDescription(String pokemonName) {
  return """
    You chose $pokemonName as the Pokemon to learn more about. Describe to me in natural language $pokemonName's main characteristics, his strengths and weaknesses, his best moves and the moves he has the most difficulty against. 

    Give me the answer in json format with this structure:

    ```json
    {
      "description": STRING,
      "strength": STRING,
      "weakness": STRING
    }
    ```

    Some indications:
    * the strings MUST be in plain text format
    * DO NOT use any special characters to handle the new line
    * DO NOT include the name of $pokemonName in the strings
    * Each string MUST be a maximum of 450 characters long including spaces
  """;
}

String kPromptPokemonOpponentAdvantage(String pokemonName) {
  return """
    You chose $pokemonName as the Pokèmon to fight with. Give me a Pokèmon with similar BST that $pokemonName has an advantage with in terms of type and moves it can use. 
    Also explain why you chose this Pokèmon. Give me the answer in json format with this structure:

    ```json
    {
      "id": INT,
      "name": STRING,
      "types": [STRING, ..., STRING],
      "motivation": STRING
    }
    ```

    Some indications:
    * the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
    * the id MUST be a number between 1 and 151, no leading zeros
    * DO NOT use any special characters to handle the new line
    * you MUST ONLY use Pokèmon from the first series, so up to number 151
    * The types array MUST contain the types of the Pokèmon
    * The type MUST be all lowercase
    * DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
    * Each string MUST be a maximum of 450 characters long including spaces
    * The choosen Pokèmon MUST be in the range of BST +/- 100
  """;
}

String kPromptPokemonOpponentDisadvantage(String pokemonName) {
  return """
    You chose $pokemonName as the Pokèmon to fight with. Give me a Pokèmon with similar BST that $pokemonName is at a disadvantage with in terms of type and moves it can use. 
    Also explain why you chose this Pokèmon. Give me the answer in json format with this structure:

    ```json
    {
      "id": INT,
      "name": STRING,
      "types": [STRING, ..., STRING],
      "motivation": STRING
    }
    ```

    Some indications:
    * the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
    * the id MUST be a number between 1 and 151, no leading zeros
    * DO NOT use any special characters to handle the new line
    * you MUST ONLY use Pokèmon from the first series, so up to number 151
    * The types array MUST contain the types of the Pokèmon
    * The type MUST be all lowercase
    * DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
    * Each string MUST be a maximum of 450 characters long including spaces
    * The choosen Pokèmon MUST be in the range of BST +/- 100
  """;
}

String kPromptPokemonTeam(String pokemonName) {
  return """
    You have chosen $pokemonName as the Pokèmon to fight with. You have to build a team of 6 Pokèmon, including $pokemonName, that is as balanced and strong as possible in terms of type, moves to use, weaknesses and strengths. The chosen Pokèmon must be of the same BST as $pokemonName.

    Give me the answer in json format with this structure:

    ```json
    [
      {
        "id": INT,
        "name": STRING,
        "types": [STRING, ..., STRING],
        "motivation": STRING
      },
      ...,
      {
        "id": INT,
        "name": STRING,
        "types": [STRING, ..., STRING],
        "motivation": STRING
      }
    ]
    ```

    Some indications:
    * the list MUST contain the 5 Pokèmon that $pokemonName is teamed up with.
    * DO NOT include $pokemonName in the list
    * the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
    * the id MUST be a number between 1 and 151, no leading zeros
    * DO NOT use any special characters to handle the new line
    * you MUST ONLY use Pokèmon from the first series, so up to number 151
    * The types array MUST contain the types of the Pokèmon
    * The type MUST be all lowercase
    * DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
    * Each string MUST be a maximum of 450 characters long including spaces
    * The choosen Pokèmon MUST be in the range of BST +/- 100
    * The team MUST consist of at least these types: fire, grass, water, earth, electro, psycho

    Examples of well balanced teams:
    * Charizard, Lapras, Nidoking, Jolteon, Gengar, Dragonite
    * Zapdos, Slowbro, Ninetales, Rhydon, Gengar, Snorlax
    * Articuno, Arcanine, Exeggutor, Gengar, Rhydon, Poliwrath
    * Ivysaur, Jinx, Kingler, Marowak, Dragonair, Magmar
    * Dugtrio, Electrode, Weezing, Jynx, Omastar, Flareon
    * Beedrill, Electabuzz, Primeape, Rapidash, Dodrio, Seadra
    * Charmander, Pidgey, Poliwag, Machop, Abra, Magnemite
    * Tentacool, Voltorb, Growlithe, Doduo, Machop, Gastly
    * Spearow, Voltorb, Diglett, Staryu, Exeggcute, Vulpix
  """;
}

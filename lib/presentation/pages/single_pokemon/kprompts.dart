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
      "motivation": STRING
    }
    ```

    Some indications:
    * the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
    * DO NOT use any special characters to handle the new line
    * you MUST ONLY use Pokèmon from the first series, so up to number 151
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
      "motivation": STRING
    }
    ```

    Some indications:
    * the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
    * DO NOT use any special characters to handle the new line
    * you MUST ONLY use Pokèmon from the first series, so up to number 151
    * DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
    * Each string MUST be a maximum of 450 characters long including spaces
    * The choosen Pokèmon MUST be in the range of BST +/- 100
  """;
}

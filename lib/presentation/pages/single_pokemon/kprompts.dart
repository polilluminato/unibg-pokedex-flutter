String kPromptPokemonDescription(String pokemonName) {
  return """
    You chose $pokemonName as the Pokemon to learn more about. Describe to me in natural language $pokemonName's main characteristics, his strengths and weaknesses, his best moves and the moves he has the most difficulty against. 

    Give me the answer in json format with this structure:

    {
      "description": STRING,
      "strength": STRING,
      "weakness": STRING
    }

    Some indications:
    * the strings MUST be in plain text format
    * use ONLY '\n' to handle the new line
    * DO NOT include the name of $pokemonName in the strings
    * Each string MUST be a maximum of 450 characters long including spaces
  """;
}

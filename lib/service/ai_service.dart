import 'package:firebase_vertexai/firebase_vertexai.dart';

class AiService {
  // Private static instance
  static final AiService _instance = AiService._internal();
  final model = FirebaseVertexAI.instance.generativeModel(
    model: 'gemini-2.5-pro-preview-05-06',
    systemInstruction: Content.text("""
      You are PokeMaster X, an advanced Pokémon encyclopedic AI with the following attributes:   

      # Core Expertise  
      ## Comprehensive Knowledge:   
              Mastery of all Pokémon species (1–1008), including regional variants, mega forms, and paradox forms.  
              Detailed understanding of types, abilities, stats, evolution lines, egg groups, and habitat data.  
              Expertise in type matchups (advantages/disadvantages) and damage calculations.  
              Mastery of move pools, TMs/HMs, HMs, TRs, and signature moves.
              
      ## Game Mechanics:   
              Familiarity with battle systems (single/double/triple battles, rotation battles, raids).  
              Knowledge of competitive tiers (OU, Ubers, LC, etc.), natures, EV/IV spreads, and item effects.  
              Understanding of game-specific mechanics (e.g., Dynamax, Terastal, Z-Moves, Mega Evolution). 

      ## Lore & Worldbuilding :   
              Deep familiarity with Pokémon regions (Kanto to Paldea), legendary/mythical Pokémon, and cultural context.  
              Knowledge of anime episodes, movies, and spin-offs (e.g., Let's Go Pikachu/Eevee, Legends: Arceus).
              
      # Responsibilities  
      ## Answer queries about:  
              Pokémon data (e.g., 'Explain Charizard’s weaknesses and best counters').  
              Team-building strategies (e.g., 'Suggest a balanced team for Sword/Shield').  
              Battle advice (e.g., 'How to defeat Clair in Gen I?').  
              Lore trivia (e.g., 'What’s the origin of Mewtwo’s design?').
              
      Clarify ambiguous questions (e.g., 'Are you asking about the Gen VIII or Gen IX version of Cinderace?').  
      Prioritize accuracy over speculation; state if information is outdated or uncertain.
          
      # Response Guidelines  

      Use Pokémon-themed emojis  sparingly to maintain friendliness (e.g., ⚡, 🌿, 🔥).  
      Format complex data (e.g., type charts, evolution trees) as bullet points or tables  for readability.  
      Adjust technicality based on user input:  
              For casual users: Simplify terms (e.g., 'Water-type beats Fire-type').  
              For experts: Use precise jargon (e.g., 'Special Defense EVs in Competitive OU').
              
      Avoid assumptions beyond core knowledge (e.g., fan theories unless explicitly asked).
          
      # Example Interactions  

      User:  'What’s the best way to catch a Shiny Pokémon in Scarlet/Violet?'
      You:  🌟 'Here’s how to maximize Shiny odds:   

          Complete the Pokédex to unlock the Shiny Charm.  
          Use the Masuda Method with international trade.  
          Farm sandwiches/sparkling powers for increased rates...'

      User:  'Compare Charizard and Blastoise in Gen I.'
      You:  🔥🆚💧 'Charizard excels offensively with Fire/Flying STAB, but struggles against Rock and Water moves. Blastoise is defensively bulky with Water immunity to Fire, but lacks reliable recovery. Use Charizard for offense, Blastoise for stalling...'
    """),
  );

  // Private named constructor
  AiService._internal();

  // Factory constructor returns the same instance every time
  factory AiService() {
    return _instance;
  }

  // Example method (you can add your own methods here)
  Future<String?> askToAi(String promptToSend) async {
    //await Future.delayed(const Duration(seconds: 1));
    /*return """
      ```json
      {
        "description": "This small, orange, lizard-like Pokémon is known for the flame burning at the tip of its tail. The flame's intensity reflects its health and emotions, flaring
        up when excited and dwindling when weak. It prefers warm places and will let out a cry if its tail flame is about to go out. It's a Fire-type 🔥, often chosen for its fiery
        spirit and eventual powerful evolutions. Its underbelly is typically a lighter, cream color.",
        "strength": "As a Fire-type, it naturally excels against Grass 🌿, Bug 🐞, Ice ❄️, and Steel-type opponents, dealing double damage with its Fire attacks. Its primary offensive
        moves like Ember, and later Flamethrower, benefit from Same Type Attack Bonus (STAB), making them particularly potent. Early on, it can also utilize moves like Scratch for
        neutral coverage and Growl to reduce an opponent's attack, giving it some utility beyond pure offense.",
        "weakness": "Its Fire typing makes it vulnerable to Water 💧, Ground, and Rock-type attacks, each dealing double damage. Common moves like Water Gun, Rock Throw, and Earthquake
        can be devastating. It generally has lower defensive stats, especially in its early stage, making it susceptible to being knocked out quickly by these super-effective hits or
        strong neutral attacks. Care must be taken when facing Pokémon that commonly use these types of moves."
      }
      ```
    """;*/
    /*return """
      {
        "id": 74,
        "name": "Geodude",
        "motivation": "It was chosen because its dual Rock/Ground typing makes it extremely vulnerable (4x weakness) to Grass-type attacks, which your starting Pokémon can
        effectively use. Additionally, its overall power level, measured by base stat total (300), is very close to your Pokémon's (Bulbasaur's BST is 318), ensuring the
        type advantage is the key factor in a fair fight rather than a sheer power difference."
      }
    """;*/

    // Provide a prompt that contains text
    final prompt = [Content.text(promptToSend)];
    GenerateContentResponse result = await model.generateContent(prompt);
    print(result.text);
    return result.text;
  }
}

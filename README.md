# UniBG Pokédex with Flutter

<p align="center">
    <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"></a>
    <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/licence-MIT-green?style=for-the-badge&"></a>
</p>

This repository contains the source code of the demo [Pokédex](https://en.wikipedia.org/wiki/Gameplay_of_Pok%C3%A9mon#Pok%C3%A9dex) (ポケモン図鑑, Pokémon Zukan, lit.: Pokémon Encyclopedia) application that I made for the lecture given for the [Scuola di Ingegneria](https://www.unibg.it/embed-ingegneria/strutture-scuola-ingegneria) at the [University of Bergamo](https://www.unibg.it/). The application allows users to view the first 151 Pokémon in both list and grid format, navigate to their dedicated page, and view statistics.

Moodboard for the UI of the app: [Pokédex on Pinterest](https://www.pinterest.it/polilluminato/pokedex/)

### Packages

Here are the most interesting packages used in the development of the application with a brief description:

* [audioplayers](https://pub.dev/packages/audioplayers): A Flutter plugin to play multiple audio files simultaneously
* [carousel_slider](https://pub.dev/packages/carousel_slider): A carousel slider widget, support infinite scroll and custom child widget
* [flutter_animate](https://pub.dev/packages/flutter_animate): Add beautiful animated effects & builders in Flutter, via an easy, customizable, unified API
* [pinch_zoom](https://pub.dev/packages/pinch_zoom): A widget based on Flutter's new Interactive Viewer that makes picture pinch zoom, and return to its initial size and position when released
* [window_manager](https://pub.dev/packages/window_manager): This plugin allows Flutter desktop apps to resizing and repositioning the window
* [wolt_modal_sheet](https://pub.dev/packages/wolt_modal_sheet): This package provides a responsive modal with multiple pages, motion animation for page transitions, and scrollable content within each page

### Compile

I used [freezed](https://pub.dev/packages/freezed) to handle the json responses coming back from the API, but the generated `*.freezed.dart` and `*.g.dart` files were not committed, so before starting the project you need to run `build_runner` in order to create them:

```sh
dart run build_runner build --delete-conflicting-outputs
```

## 📱 Screenshots

| Home List | Home Grid | Modal |
|-|-|-|
| <img width="300" src="screenshots/home_list_light.jpg"> | <img width="300" src="screenshots/home_grid_light.jpg"> | <img width="300" src="screenshots/modal_light.jpg"> | 
| <img width="300" src="screenshots/home_list_dark.jpg"> | <img width="300" src="screenshots/home_grid_dark.jpg"> | <img width="300" src="screenshots/modal_dark.jpg"> | 

| Single Page (1) | Single Page (2) | Settings |
|-|-|-|
| <img width="300" src="screenshots/single_page_top_light.jpg"> | <img width="300" src="screenshots/single_page_bottom_light.jpg"> | <img width="300" src="screenshots/settings_light.jpg"> | 
| <img width="300" src="screenshots/single_page_top_dark.jpg"> | <img width="300" src="screenshots/single_page_bottom_dark.jpg"> | <img width="300" src="screenshots/settings_dark.jpg"> | 

## 🤖 AI Stuff

Artificial intelligence was used to create parts of the UI, in particular to generate:

* the description of the Pokémon
* the information about the Pokèmon with which it is favoured
* the information about the Pokèmon you are disadvantaged with
* the creation of the best team given the chosen Pokémon

All these prompts and system instructions can be found in the file `/lib/service/kprompts.dart` and `/lib/service/ai_service.dart`.

### User Instruction

This is the system instruction with which the AI was told how to interact:

```markdown
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
```

### Description

```markdown
You chose $pokemonName as the Pokemon to learn more about. Describe to me in natural language $pokemonName's main characteristics, his strengths and weaknesses, his best moves and the moves he has the most difficulty against. 

Give me the answer in json format with this structure:

{
    "description": STRING,
    "strength": STRING,
    "weakness": STRING
}

Some indications:
* the strings MUST be in plain text format
* DO NOT use any special characters to handle the new line
* DO NOT include the name of $pokemonName in the strings
* Each string MUST be a maximum of 450 characters long including spaces
```

### Pokémon advantage

```markdown
You chose $pokemonName as the Pokèmon to fight with. Give me a Pokèmon with similar BST that $pokemonName has an advantage with in terms of type and moves it can use. 
Also explain why you chose this Pokèmon. Give me the answer in json format with this structure:

{
    "id": INT,
    "name": STRING,
    "types": [STRING, ..., STRING],
    "motivation": STRING
}

Some indications:
* the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
* DO NOT use any special characters to handle the new line
* you MUST ONLY use Pokèmon from the first series, so up to number 151
* The types array MUST contain the types of the Pokèmon
* The type MUST be all lowercase
* DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
* Each string MUST be a maximum of 450 characters long including spaces
* The choosen Pokèmon MUST be in the range of BST +/- 100
```

### Pokémon disadvantage

```markdown
You chose $pokemonName as the Pokèmon to fight with. Give me a Pokèmon with similar BST that $pokemonName is at a disadvantage with in terms of type and moves it can use. 
Also explain why you chose this Pokèmon. Give me the answer in json format with this structure:

{
    "id": INT,
    "name": STRING,
    "types": [STRING, ..., STRING],
    "motivation": STRING
}

Some indications:
* the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
* DO NOT use any special characters to handle the new line
* you MUST ONLY use Pokèmon from the first series, so up to number 151
* The types array MUST contain the types of the Pokèmon
* The type MUST be all lowercase
* DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
* Each string MUST be a maximum of 450 characters long including spaces
* The choosen Pokèmon MUST be in the range of BST +/- 100
```

### Team

```markdown
You have chosen $pokemonName as the Pokèmon to fight with. You have to build a team of 6 Pokèmon, including $pokemonName, that is as balanced and strong as possible in terms of type, moves to use, weaknesses and strengths. The chosen Pokèmon must be of the same BST as $pokemonName.

Give me the answer in json format with this structure:

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

Some indications:
* the list MUST contain the 5 Pokèmon that $pokemonName is teamed up with.
* DO NOT include $pokemonName in the list
* the motivation string MUST be in plain text format and MUST contain the reason why the Pokèmon was chosen
* DO NOT use any special characters to handle the new line
* you MUST ONLY use Pokèmon from the first series, so up to number 151
* The types array MUST contain the types of the Pokèmon
* The type MUST be all lowercase
* DO NOT include the name of the chosen Pokèmon in the motivation, give ONLY the reason
* Each string MUST be a maximum of 450 characters long including spaces
* The choosen Pokèmon MUST be in the range of BST +/- 100
* The team MUST consist of at least these types: fire, grass, water, earth, electro, psycho

Examples of teams:
* Charizard, Lapras, Nidoking, Jolteon, Gengar, Dragonite
* Zapdos, Slowbro, Ninetales, Rhydon, Gengar, Snorlax
* Articuno, Arcanine, Exeggutor, Gengar, Rhydon, Poliwrath
* Ivysaur, Jinx, Kingler, Marowak, Dragonair, Magmar
* Dugtrio, Electrode, Weezing, Jynx, Omastar, Flareon
* Beedrill, Electabuzz, Primeape, Rapidash, Dodrio, Seadra
* Charmander, Pidgey, Poliwag, Machop, Abra, Magnemite
* Tentacool, Voltorb, Growlithe, Doduo, Machop, Gastly
* Spearow, Voltorb, Diglett, Staryu, Exeggcute, Vulpix
```

### AI Service

The AI service used is Gemini, the configuration of which was done following these guides

Translated with DeepL.com (free version)

## 💎 Contributing

If you have any idea, feel free to fork it and submit your changes back to me.

## 📋 License

UniBG Pokédex is released under the [MIT license](LICENSE.md). You can use the code for any purpose, including commercial projects.

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
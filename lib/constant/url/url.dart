class Url {
  static Url url = Url();

  // Manga
  String season = 'https://api.jikan.moe/v4/seasons/now';
  String mangaSearch =
      'https://api.jikan.moe/v4/search/manga?q={search}&page=1';
  String top = 'https://api.jikan.moe/v4/top/{type}';

  // Character
  String character = 'https://api.jikan.moe/v4/top/characters';

  // Anime
  String animeSchedule = 'https://api.jikan.moe/v4/schedule/{day}';
}

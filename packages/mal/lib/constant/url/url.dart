class Url {
  /**
   * Base URL for seasons
   *
   * For detail can add prefix like "/now", "upcoming", "/{year}/{season}"
   */
  static String season = 'https://api.jikan.moe/v4/seasons';

  /** Base URL for manga
   *
   * For search with query parameter or detail manga
   * For detail manga like "/{id}" you can add prefix like "/relations", "/reviews", etc
   */
  static String manga = 'https://api.jikan.moe/v4/manga';

  /**
   * Base URL for all review
   *
   * For path variable can be "/anime" or "/manga"
   */
  static String reviews = "https://api.jikan.moe/v4/reviews";

  /// Schedule can add query param for more info
  static String schedule = 'https://api.jikan.moe/v4/schedules';

  /// For path variable can be anime, manga, or characters
  static String top = 'https://api.jikan.moe/v4/top';

  /// For path variable can be anime or manga
  static String genre = 'https://api.jikan.moe/v4/genres';
}

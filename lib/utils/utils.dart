import '../config/api_key.dart';

List<Map<String, dynamic>> categories = [
  {
    "title": 'Trending',
    "url": "/trending/all/week?api_key=$API_KEY&language=en-US"
  },
  {
    "title": 'Top Rated',
    "url": "/movie/top_rated?api_key=$API_KEY&language=en-US"
  },
  {"title": 'Action', "url": "/discover/movie?api_key=$API_KEY&with_genres=28"},
  {"title": 'Comedy', "url": "/discover/movie?api_key=$API_KEY&with_genres=35"},
  {"title": 'Horror', "url": "/discover/movie?api_key=$API_KEY&with_genres=27"},
  // {
  //   "title": 'Romance',
  //   "url": "/discover/movie?api_key=$API_KEY&with_genres=10749"
  // },
  {
    "title": 'Mystery',
    "url": "/discover/movie?api_key=$API_KEY&with_genres=9648"
  },
  {
    "title": 'Sci-Fi',
    "url": "/discover/movie?api_key=$API_KEY&with_genres=878"
  },
  {
    "title": 'Western',
    "url": "/discover/movie?api_key=$API_KEY&with_genres=37"
  },
  {
    "title": 'Animation',
    "url": "/discover/movie?api_key=$API_KEY&with_genres=16"
  },
  {
    "title": 'TV Movie',
    "url": "/discover/movie?api_key=$API_KEY&with_genres=10770"
  },
];

String base_img_url = "https://image.tmdb.org/t/p/original/";

// get the url where input is title from the categories
String getMovieUrl(String title) {
  if (title != null) {
    // one line
    return categories.firstWhere((element) => element['title'] == title)['url'];
  }
  return '';
}

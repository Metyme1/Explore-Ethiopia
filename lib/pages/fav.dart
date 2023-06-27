import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String _favoritesKey = 'favorites';

  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList(_favoritesKey);
    if (favorites == null) {
      return [];
    }
    return favorites;
  }

  static Future<bool> isFavorite(String imageUrl) async {
    List<String> favorites = await getFavorites();
    return favorites.contains(imageUrl);
  }

  static Future<void> addFavorite(String imageUrl) async {
    List<String> favorites = await getFavorites();
    if (!favorites.contains(imageUrl)) {
      favorites.add(imageUrl);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList(_favoritesKey, favorites);
    }
  }

  static Future<void> removeFavorite(String imageUrl) async {
    List<String> favorites = await getFavorites();
    if (favorites.contains(imageUrl)) {
      favorites.remove(imageUrl);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList(_favoritesKey, favorites);
    }
  }
}
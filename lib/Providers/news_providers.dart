import 'package:flutter/material.dart';
import 'package:news/Models/news_model.dart';
import 'package:news/Services/news_services.dart';

class NewsProviders extends ChangeNotifier {
  NewsModel? model;
  Future<void> fetchApi() async{
    model = await NewsServices.getAll();
    notifyListeners();
  }
}
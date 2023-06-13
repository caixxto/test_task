import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_app_flutter/feature/data/models/category_model_list.dart';
import 'package:test_app_flutter/feature/data/models/dish_model_list.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://run.mocky.io/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  
  @GET('058729bd-1402-4578-88de-265481fd7d54')
  Future<CategoryModelList> getCategories();

  @GET('c7a508f2-a904-498a-8539-09d96785446e')
  Future<DishModelList> getDishes();

}
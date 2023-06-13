// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
const String lostUrl = 'https://lh3.googleusercontent.com/fife/APg5EObFxhZxXiEeIRVkqT7oTjA_Ce6jUN-RZ3N3MgC4ilGm9z8L2ZTfFilZ4TH54iyy3NZWbWfYTXj13jSDuLCxmDclneD77gXA1ynOwJurSxKKhA_ZG9Vm_QdRZuWtX26-MIWMYyh-aQxoHAIW84GHwgjzNtRWyCYebJK-UEFTlHt7n7zzyFQRzm4jSr5IiMOet-4CepoguFIuxwmlPZpOr11QxQMNLmxSQUqQJkn2FBKsEeXkiAt8m9p06szzEdYcw2ucb2j-eiEW8w1NGEyyNc-OvLkhQVSaddxDSsVRcK7f8DfDAOERBYxWnJ8i5e9F6sPtG9pD5OxlwcY1JrmTukX1-8JP-nJTG1n_MnQhktE6IyQZ1I2jWkdvAZ54DV5zuHH1Ho8-po0XIZ7VByHA5IsP9k-tbII8sIkfOktC5SqKm8mr9JxJgKQdqarSIB_pjEOYw-YZ4CEXFjx1LPnA0aS5WRvR-1rFOArBoAXThuOp8sxITSVkEqGoHu0yDtGHtyG1ENi9fsXtNu2JrU3kmM6sfCuV9Y4SYAz8mbP5bZm7oGescubmPv45Rgbp6sGL7PXX2OdfK9NcdHHd9Bthc-tC__l5M25RgRD_dtyXvOlPgoeLk8wwHBa9tq_D1LDwKRqv196191T6onrLAOoJDqmC60oIwtsJrR7K4L2kmF9lxBeTROhUunkgOZvq6m4cQ8p1JyHZrQmCxUx4uQg1C7K3DgKkk2O52vlUPOOU0Z0yf_-jLmYaB16tUaf3U6P9hmvstMIooSeCl1JNERKPKVW07ZeQ6zYGvRLMpwVVfyaT1tSz29JJYd2XQtIC9pxplSH5qZhBv2B1tn_pGJPnwRBd9AzQs_zZhNXVEbDcAhkehrRec9no7D3o1IcoHaVUGoiYp2hzOUD8SWkvhBQ6av_uriqZgF4YP7r7YDkb_O-bbjyG7XkIGgUBxrnztxV-ZajL-e3SIsfiQ16hzZ6HK2wkK1B8A1rMtBdCQKrWlTi4c0iY0w0mNL1qpGhSDwd0d4MpAAtXGsQ_c3HfRMq3wqsoJTHeeZX7f_dS00yqWRRR8cEf77JPKav8tOA9GHglMf5nPbbKCN8tNWmVvfw-Y8xShzRQkjc1SIrIbZNvyI2t6KO3BL_8_1UCxc5IEOjpr46EUs2iQ87cW2irgE-cGTB_m8ivyV2EhSkIOnVnhh1ThwofWbR6h9W2tLt7z0ESMgD2tOb53KQq1BPJUzaW9qwDujVCA-8Hh9gMOdKUKDwCnlAqx16vTk82qvbpP2cqQo19zpso0HZSGdLwrQkKcJg8HTDGF2DcpVCTCUZcssTLCopvEEQEKYI4wOidyvkxbf4la0BAtQsjFRP-MOisThOswMIuYQeLgGsDLisxLQyKXQdjkRtFl72y786VLxv6hKSlmlyxEpICdV6DQBzJl571JpZeKaWYRb2XnHXi-nnUddmxmOyGoTethTtpKOv5JXymm4iclz6gZE6PjcAqdYYakK5ZcisXk_KXfDBhu0eXsRAUNMiJr2xdztOTcB5wmqFvFzELFHua6an0zIO2CnXjbzqA_iBi7RtldaYdEZZADww3xiiwn8OFun5GprXWhqlwU2_juL0nUMdWPZ8S2LUsuFwa0AsH_LWN7Wi7iFS8MB9EG0YP=w1366-h617';


DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      description: json['description'],
      url: json['image_url'] ?? lostUrl,
      tags: (json['tegs'] as List<dynamic>).map((e) => e as String).toList()
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'description': instance.description,
      'image_url': instance.url,
      'tegs': instance.tags
    };

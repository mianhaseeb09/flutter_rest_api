import 'package:flutter_rest_api/model/comment_model.dart';
import 'package:flutter_rest_api/model/post_model.dart';
import 'package:flutter_rest_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response=await client.get(uri);
    if(response.statusCode==200){
      var json=response.body;
      return postFromJson(json);
    }
    return null;

  }
  Future<List<Comment>?> getComments() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentFromJson(json);
    }

    return null;
  }
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
    return null;
  }
  Future<List<User>?> getAddress() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/address');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
    return null;
  }
}

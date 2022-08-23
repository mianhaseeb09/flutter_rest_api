import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/comment_model.dart';
import 'package:flutter_rest_api/services/remote_services.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment>? comments;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch data from APi
    getData();
  }

  getData() async {
    comments = await RemoteService().getComments();
    if (comments != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Comment'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: comments?.length.toInt() ?? 0,
              itemBuilder: (context, int index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'id: ${comments![index].id.toString()}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'postId: ${comments![index].postId.toString()}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                       'Name: ${ comments![index].name}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Email: ${comments![index].email}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Comment: ${comments![index].body}',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

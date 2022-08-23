import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user_model.dart';
import 'package:flutter_rest_api/services/remote_services.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User>? users;

  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch data from APi
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
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
        title: const Text('User'),
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
              itemCount: users?.length.toInt() ?? 0,
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
                        'id: ${users![index].id.toString()}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Name: ${users![index].name.toString()}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'UserName: ${users![index].username}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Email: ${users![index].email}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Address: ${users![index].address}',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Phone: ${users![index].phone}',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Website: ${users![index].website}',
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Company: ${users![index].company}',
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

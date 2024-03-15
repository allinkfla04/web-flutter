import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter2/module/tambah_users_notifier.dart';
import 'package:web_flutter2/module/tambah_users_page.dart';
import 'package:web_flutter2/module/users_detail_page.dart';
import 'package:web_flutter2/module/users_notifier.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersNotifier(context),
      child: Consumer<UsersNotifier>(
          builder: (context, value, child) => SafeArea(
                  child: Scaffold(
                     floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple[900],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahUsersPage(reload: () => value.getUsers())));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.purple[900],
                      child: Row(
                        children: const [
                          Text(
                            "Users Page",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        value.isLoading
                            ? SizedBox(
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Please wait.."),
                                  ],
                                ),
                              )
                            : value.list.isNotEmpty
                                ? ListView.builder(
                                    itemCount: value.list.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      final data = value.list[i];
                                      return Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: InkWell(
                                          onTap: ()=>Navigator.push(context, MaterialPageRoute(
                                            builder: (context)=>
                                            UsersDetailPage(reload: () => 
                                            value.getUsers(), users: data))) ,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(data.nama),
                                              Text(data.email),
                                              Text(data.phone),
                                              const SizedBox(
                                                height: 16,
                                              )
                                            ],
                                          ),
                                         ),
                                      );
                                    })
                                : Container()
                      ],
                    ))
                  ],
                ),
              ))),
    );
  }
}

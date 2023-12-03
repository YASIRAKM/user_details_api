import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';
import '../utils/constants/theme_data/colors.dart';
import '../utils/constants/theme_data/text_styles.dart';
import 'detailed_user_view.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.appBarColor,
      appBar: AppBar(
        title: const Text("USER LIST"),
      ),
      body: Consumer<UserController>(builder: (context, userController, child) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: wt * .03,
                  right: wt * .03,
                  top: ht * .02,
                  bottom: ht * .02),
              child: TextField(
                  onChanged: (value) => userController.searchUsers(value),
                  controller: userController.searchController,
                  decoration: InputDecoration(labelStyle: MyTextStyles.userListName,labelText: 'Search',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.appBarTextColor,
                              width: wt * .1)),
                      // suffixIcon: IconButton(
                      //     onPressed: () {
                      //       userController.searchUsers(
                      //           userController.searchController!.text);
                      //     },
                      //     icon: const Icon(Icons.search))
                  )
              ),
            ),
            FutureBuilder(
              future: userController.fetchUsers("https://jsonplaceholder.typicode.com/users"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("has error"),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("no data"),
                  );
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.only(top: ht * .01),
                    child: SizedBox(
                      height: ht * .9,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: wt * .03, right: wt * .03),
                            child: const Divider(),
                          );
                        },
                        itemCount: userController.users.length,
                        itemBuilder: (context, index) {
                          final users = userController.users[index];
                          return Card(
                            elevation: 0,
                            margin: EdgeInsets.only(
                                left: wt * .03,
                                right: wt * .03,
                                bottom: ht * .01,
                                top: ht * .01),
                            child: ListTile(
                              horizontalTitleGap: 20,
                              leading: const Icon(Icons.person),
                              title: Padding(
                                padding: EdgeInsets.only(bottom: ht * .01),
                                child: Text(
                                  users.name,
                                  style: MyTextStyles.userListName,
                                ),
                              ),
                              subtitle: Text(users.email,
                                  style: MyTextStyles.userListEmail),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailedView(
                                                  user: users,
                                                )));
                                  },
                                  icon: const Icon(Icons.arrow_forward)),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("ERROR"),
                  );
                }
              },
            ),
          ],
        );
      }),
    );
  }
}

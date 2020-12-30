import 'package:flutter/material.dart';
import 'package:github_profile_starter_kit/notifier/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();

    final model = context.watch<UserProvider>();

    Future<void> fetchUserInfo() async {
      await context
          .read<UserProvider>()
          .getUser(username: userNameController.text, ctx: context);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: userNameController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 3.0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get my Github Profile'),
                    const SizedBox(
                      width: 10,
                    ),
                    model.isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
              onPressed: () => fetchUserInfo(),
            ),
          )
        ],
      ),
    );
  }
}

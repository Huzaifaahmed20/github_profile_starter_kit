import 'package:flutter/widgets.dart';
import 'package:github_profile_starter_kit/app/data/models/user_profile.dart';
import 'package:github_profile_starter_kit/app/data/services/github_api.dart';
import 'package:github_profile_starter_kit/app/routes/app_routes.dart';

class UserProvider extends ChangeNotifier {
  GithubApi _githubApi = GithubApi();

  bool isLoading = false;

  UserProfile _user;
  UserProfile get user => _user;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getUser({String username, BuildContext ctx}) async {
    setLoading(true);
    try {
      final UserProfile response =
          await _githubApi.getUserProfile(username: username);
      _user = response;

      setLoading(false);
      Navigator.of(ctx).pushNamed(AppRoutes.user_details);
    } catch (e) {
      print(e);
      setLoading(false);
    }
  }
}

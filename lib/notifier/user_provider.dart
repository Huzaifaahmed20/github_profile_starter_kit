import 'package:flutter/widgets.dart';
import 'package:github_profile_starter_kit/app/data/exceptions.dart';
import 'package:github_profile_starter_kit/app/data/models/repos.dart';
import 'package:github_profile_starter_kit/app/data/models/user_profile.dart';
import 'package:github_profile_starter_kit/app/data/services/github_api.dart';
import 'package:github_profile_starter_kit/app/routes/app_routes.dart';
import 'package:github_profile_starter_kit/ui/widgets/show_custom_dialog.dart';

class UserProvider extends ChangeNotifier {
  GithubApi _githubApi = GithubApi();

  bool isLoading = false;

  UserProfile _user;
  UserProfile get user => _user;

  List<Repos> _repos;
  List<Repos> get repos => _repos;

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
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }

  Future<void> getUserRepos({String username, BuildContext ctx}) async {
    setLoading(true);
    try {
      final List<Repos> response =
          await _githubApi.getRepos(username: username);
      _repos = response;

      setLoading(false);
      print(_repos);
      Navigator.of(ctx).pushNamed(AppRoutes.user_details);
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }
}

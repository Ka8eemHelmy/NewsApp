abstract class AppStates{}

class AppInitialState extends AppStates{}
class AppNavigatorIndexChang extends AppStates{}
class AppGetDataLoading extends AppStates{}
class AppGetDataSuccess extends AppStates{}
class AppGetDataError extends AppStates{
  final String error;

  AppGetDataError(this.error);
}
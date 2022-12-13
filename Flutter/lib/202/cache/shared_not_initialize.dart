//kullanıcıdan preferencesi alamazsak diye custom exception
class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return 'Your prefences has not initialized right now';
  }
}

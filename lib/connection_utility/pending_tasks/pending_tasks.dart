class PendingTasks {
  List<Future> _futures = [];

  void addToTasks(Future future) {
    _futures.add(future);
  }

  void removeTask(Future future) {
    _futures.remove(future);
  }

  void clearFutures() {
    _futures.clear();
  }

  Future executeAllPendingFutures() async {
    return Future.wait(_futures);
  }
}

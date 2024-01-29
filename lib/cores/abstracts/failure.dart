abstract class Failure {}

class ServerFailure extends Failure {}

class UnkownFailure extends Failure {}

class CacheFailure implements Failure {}

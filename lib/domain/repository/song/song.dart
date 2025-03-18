import 'package:dartz/dartz.dart';

abstract class SongsReposotiry {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

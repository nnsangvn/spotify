import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        // Firestore -> SongModel
        var songModel = SongModel.fromJson(element.data());
        // SongModel  -> SongEntity
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(5)
          .get();

      for (var element in data.docs) {
        // Firestore -> SongModel
        var songModel = SongModel.fromJson(element.data());
        // SongModel  -> SongEntity
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again');
    }
  }
}

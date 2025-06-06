import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotify/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoritesSongsLoading());

  List<SongEntity> favoriateSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold((l) {
      emit(FavoriteSongsFailure());
    }, (r) {
      favoriateSongs = r;
      emit(FavoriteSongsLoaded(favoriteSongs: favoriateSongs));
    });
  }

  void removeSong(int index) {
    favoriateSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriateSongs));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongLoading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is NewsSongLoaded) {
              if (state.songs.isEmpty) {
                return Center(child: Text('No songs available'));
              }
              return _songs(state.songs);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: songs.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${AppURLs.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      // Dịch chuyển container: 10 đơn vị sang phải (x), 10 đơn vị xuống dưới (y), không thay đổi trục z
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode ? AppColors.darkGrey : Color(0XFFE6E6E6),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode ? Color(0xff959595) : Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                songs[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                songs[index].artist,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

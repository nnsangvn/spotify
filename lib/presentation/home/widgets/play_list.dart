import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(builder: (context, state) {
        if (state is PlayListLoading) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if (state is PlayListLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 16,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Playlist',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'See more',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _playList(state.songs),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }

  Widget _playList(List<SongEntity> songs) {
    return ListView.separated(
      itemCount: songs.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6)),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(songs[index].duration.toString().replaceAll('.', ':')),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}

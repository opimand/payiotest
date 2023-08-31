import 'package:casino_test/presentation/bloc/character/character_bloc.dart';
import 'package:casino_test/presentation/pages/character/widgets/bottom_loader.dart';
import 'package:casino_test/presentation/pages/character/widgets/charcter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CI CD Bloc"),
        ),
        body: SafeArea(
          child: BlocConsumer<CharacterBloc, CharacterState>(listener: (context, state) {
            if (state.status == Status.serverError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Server Error"),
                ),
              );
            }
            if (state.status == Status.networkError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("No internet connection "),
                ),
              );
            }
          }, builder: (context, state) {
            if (state.status == Status.empty && state.characters.isEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else if (state.status == Status.networkError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text("Server error. Check you Internet connection and try again")),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CharacterBloc>().add(CharactersOnGet());
                      },
                      child: const Text("Tap for fetch characters"))
                ],
              );
            } else if (state.status == Status.loading && state.characters.isEmpty) {
              return const Center(
                child: Text('Loading ...'),
              );
            } else {
              return ListView.builder(
                controller: _scrollController,
                itemCount:
                    state.hasReachedMax ? state.characters.length : state.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return CharacterItem(character: state.characters[index]);
                  } else {
                    if (state.status == Status.loading && state.characters.isNotEmpty) {
                      return const BottomLoader();
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                },
              );
            }
          }),
        ));
  }

  void _onScroll() {
    final state = context.read<CharacterBloc>().state;

    if (state.status != Status.networkError && _isBottom) {
      context.read<CharacterBloc>().add(CharactersOnGet());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

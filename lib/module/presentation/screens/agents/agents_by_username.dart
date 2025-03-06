import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_event.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgentsByUsername extends StatelessWidget {
  const AgentsByUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBarTheme.appBarforPages(context, 'Agents By Username'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CommonStyle.screenPadding),
            child: TextFieldsTheme.createTextField(
                context, searchController, 'Enter location', (value) {
              if (value.isNotEmpty) {
                context
                    .read<AgentsByUsernameBloc>()
                    .add(FetchAgentsByUsernameEvent(username: value));
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<AgentsByUsernameBloc, AgentsByUsernameState>(
              builder: (context, state) {
                if (state is AgentsByUsernameInitial) {
                  return const Center(child: Text('Enter username'));
                } else if (state is AgentsByUsernameLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AgentsByUsernameLoaded) {
                  final agents = state.agentsByUsername;
                  if (agents.isEmpty) {
                    return const Center(child: Text('No agents found'));
                  }
                    return ListView.builder(
                    itemCount: agents.length,
                    itemBuilder: (context, index) {
                      final agent = agents[index];
                      return ListTile(
                      // title: Text(agent.displayUser.businessName),
                      // subtitle: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //   Text('Email: ${agent.displayUser.email}'),
                      //   Text('Phone: ${agent.displayUser.phoneNumbers.business}'),
                      //   Text('Address: ${agent.displayUser.businessAddress.address1}, ${agent.displayUser.businessAddress.city}, ${agent.displayUser.businessAddress.state}, ${agent.displayUser.businessAddress.postalCode}'),
                      //   ],
                      // ),
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(agent.displayUser.profilePhotoSrc),
                      // ),
                      title: Text(agent.currentUrl),
                      );
                    },
                    );
                } else if (state is AgentsByUsernameError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      )
    );
  }
}
import 'package:clean_arch/module/data/sources/agents/agents_by_username_source.dart';
import 'package:clean_arch/module/domain/entities/agents/agent_by_username_entities.dart';
import 'package:clean_arch/module/domain/repositories/agent_by_username_repo.dart';

class AgentsByUsernameRepoImpl extends AgentByUsernameRepo {
  final AgentsByUsernameSource dataSource;
  AgentsByUsernameRepoImpl(this.dataSource);

  @override
  Future<List<AgentByUsernameEntities>> getAgentByUsername(
      String username) async {
    final agentByUsername = await dataSource.fetchAgentByUsername(username);
    return [
      AgentByUsernameEntities(
        currentUrl: agentByUsername.currentUrl,
        displayUser: DisplayUserEntities(
          businessAddress: BusinessAddressEntities(
            address1: agentByUsername.displayUser.businessAddress.address1,
            city: agentByUsername.displayUser.businessAddress.city,
            postalCode: agentByUsername.displayUser.businessAddress.postalCode,
            state: agentByUsername.displayUser.businessAddress.state,
          ),
          businessName: agentByUsername.displayUser.businessName,
          email: agentByUsername.displayUser.email,
          phoneNumbers: PhoneNumbersEntities(
            business: agentByUsername.displayUser.phoneNumbers.business,
            cell: agentByUsername.displayUser.phoneNumbers.cell,
          ),
          profilePhotoSrc: agentByUsername.displayUser.profilePhotoSrc,
          // zGuid: agentByUsername.displayUser.zGuid,
        ),
      )
    ];
  }
}

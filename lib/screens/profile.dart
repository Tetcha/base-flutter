import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app_fe/core/api/user.api.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProvider _userProvider = getIt<UserProvider>();
  final UserApi _userApi = getIt<UserApi>();

  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    // TODO: implement initState
    _usernameController =
        TextEditingController(text: _userProvider.currentUser.username);
    _emailController =
        TextEditingController(text: _userProvider.currentUser.email);
    _nameController =
        TextEditingController(text: _userProvider.currentUser.name);
    super.initState();
  }

  void _onClear() {
    _usernameController.text = _userProvider.currentUser.username;
    _emailController.text = _userProvider.currentUser.email;
    _nameController.text = _userProvider.currentUser.name;
  }

  void _onSubmit() async {
    var res = await _userApi.updateUser(
        username: _usernameController.text,
        email: _emailController.text,
        name: _nameController.text);

    if (res?.statusCode == 200) {
      _userProvider.getCurrentUser();
      //TODO : send notification
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Center(
            child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://scontent.fsgn13-4.fna.fbcdn.net/v/t1.6435-1/205956104_2751433955079159_2840020984542922686_n.jpg?stp=dst-jpg_p320x320&_nc_cat=107&ccb=1-7&_nc_sid=7206a8&_nc_ohc=hBFCrjSeb58AX_o6vnY&_nc_ht=scontent.fsgn13-4.fna&oh=00_AT-l2kiDBscqzhT_ldEmZqxmy4PxuNA9ZcEdBKKQ-HsZ-A&oe=635A5F58")),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            TextFieldC(
              controller: _usernameController,
              label: "Username",
              name: "username",
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _emailController,
              label: "Email",
              name: "email",
            ),
            const SizedBox(height: 10),
            TextFieldC(
              controller: _nameController,
              label: "Name",
              name: "name",
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _onClear,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).errorColor,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  ),
                  child: const Text("Clear"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  ),
                  child: const Text("Save"),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}

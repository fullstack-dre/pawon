part of "pages.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize customAppBar() {
      return PreferredSize(
        child: CustomAppBar(
            title: "PROFIL",
            leftButton: "Kembali",
            leftButtonMethod: () {
              Navigator.pop(context);
            }),
        preferredSize: Size.fromHeight(68.0),
      );
    }

    Widget settingsTile(String name, String email) {
      return Container(
        child: Column(
        children: [
          ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: Spacers.s4, horizontal: 0),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Nama", style: Font.textLRegular),
                  SizedBox(width: Spacers.m16),
                  Text("$name",
                      overflow: TextOverflow.ellipsis,
                      style:
                          Font.incLRegular.copyWith(color: ColorModel.kText)),
                ],
              ),
              trailing: Icon(
                Ionicons.chevron_forward,
                color: ColorModel.kText,
                size: 20,
              )),
          ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: Spacers.s4, horizontal: 0),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("E-mail", style: Font.textLRegular),
                  SizedBox(width: Spacers.m16),
                  Text("$email",
                      overflow: TextOverflow.ellipsis,
                      style:
                          Font.incLRegular.copyWith(color: ColorModel.kText)),
                ],
              ),
              trailing: Icon(
                Ionicons.chevron_forward,
                color: ColorModel.kText,
                size: 20,
              )),
          ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: Spacers.s4, horizontal: 0),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Kata sandi", style: Font.textLRegular),
                  SizedBox(width: Spacers.m16),
                  Text("*************",
                      overflow: TextOverflow.ellipsis,
                      style:
                          Font.incLRegular.copyWith(color: ColorModel.kText)),
                ],
              ),
              trailing: Icon(
                Ionicons.chevron_forward,
                color: ColorModel.kText,
                size: 20,
              )),
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: HistoryPage(),
                        type: PageTransitionType.rightToLeftWithFade));
              },
              contentPadding:
                  EdgeInsets.symmetric(vertical: Spacers.s4, horizontal: 0),
              title: Text("Riwayat Masak", style: Font.textLRegular),
              trailing: Icon(
                Ionicons.chevron_forward,
                color: ColorModel.kText,
                size: 20,
              )),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: Spacers.s4, horizontal: 0),
            title: Text("Hapus akun",
                style:
                    Font.textLRegular.copyWith(color: ColorModel.primaryRed)),
          ),
        ],
      ));
    }

    Widget signOutButton() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            child: PrimaryButton(
              content: "Keluar dari akun",
              isGoogleButton: false,
              isMinified: false,
              isCTA: false,
              onPressed: () {
                context.read<AuthCubit>().signOut();
              }
            ),
          ),
          SizedBox(height: Spacers.m24),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Pawon v.1.0",
              style: Font.incLRegular,
            ),
          ),
        ]
      );
    }

    return Scaffold(
      backgroundColor: ColorModel.kWhite,
      appBar: customAppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is NotAuthenticated){
            Navigator.push(
              context,
              PageTransition(
                child: OnboardingPage(),
                type: PageTransitionType.rightToLeftWithFade
              )
            );
          } else if (state is AuthFailed){
            print(state.error);
          }
        },
        builder: (context, state) {
          if(state is AuthSuccess){
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(Spacers.m24),
              child: ListView(
                children: [
                  SizedBox(height: 56),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: ColorModel.disabledRed,
                        borderRadius: Spacers.borderRadius,
                        image: DecorationImage(
                          image: NetworkImage(state.user.profileURL),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 56),
                  settingsTile(
                    state.user.name,
                    state.user.email
                  ),
                  SizedBox(height: 56),
                  signOutButton(),
                  SizedBox(height: Spacers.m24),
                ],
              )
            );
          } else {
            return CustomLoaderPage();
          }
        }
      )
    );
  }
} 

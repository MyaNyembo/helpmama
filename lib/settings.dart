import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapp/admin/dashboard.dart';
import 'package:monapp/values/values.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramètres",
          style: GoogleFonts.inter(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              Text("Compte", style: GoogleFonts.inter(fontSize: 16, color: AppColor.homePageBackground2, fontWeight: FontWeight.w500),),
              const SizedBox(height: 16.0,),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100/2)),
                        image: DecorationImage(
                            image: AssetImage("assets/femmeEnceintebelle.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0,),
              Text("Actions", style: GoogleFonts.inter(fontSize: 16, color: AppColor.homePageBackground2, fontWeight: FontWeight.w500),),
              const SizedBox(height: 16.0,),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: Text("Personne à contacter", style: GoogleFonts.inter(),),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.warning),
                title: Text("Arreter ma grossesse", style: GoogleFonts.inter(),),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.logout),
                title: Text("Se déconnecter", style: GoogleFonts.inter(),),
              ),
              const SizedBox(height: 16.0,),
              Text("A propos", style: GoogleFonts.inter(fontSize: 16, color: AppColor.homePageBackground2, fontWeight: FontWeight.w500),),
              const SizedBox(height: 16.0,),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.info_outline),
                title: Text("Informations", style: GoogleFonts.inter(),),
              ),
              const SizedBox(height: 16.0,),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(AdminDashboard.route());
                },
                leading: Icon(Icons.admin_panel_settings_outlined),
                title: Text("Admin", style: GoogleFonts.inter(),),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.share),
                title: Text("Partager l'application", style: GoogleFonts.inter(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

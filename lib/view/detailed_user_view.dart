import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/model/model_class.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';
import '../utils/constants/theme_data/colors.dart';
import '../utils/constants/theme_data/text_styles.dart';
import '../utils/widgets/text_widget.dart';
import 'map_view.dart';

class DetailedView extends StatelessWidget {
  final UserModel user;

  const DetailedView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.appBarColor,
      appBar: AppBar(
        leading:  Padding(
        padding:  EdgeInsets.only(left: wt*.05),
        child: Icon(CupertinoIcons.person_alt_circle,size: ht*.07,),
      ),
        title: Text(user.name),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: wt * .03, right: wt * .03, top: ht * .05),
        child: Consumer<UserController>(
          builder: (context, controller, child) {
            return SizedBox(
              width: wt * .95,
              height: ht * .8,
              child: Card(
                  child: Padding(
                padding: EdgeInsets.only(
                    left: wt * .02, top: ht * .02, bottom: ht * .02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NewRowTextWidget(
                      txt2: user.username,
                      icon: Icons.person,
                    ),
                    NewRowTextWidget(txt2: user.email, icon: Icons.mail),
                    NewRowTextWidget(
                      txt2: user.phone,
                      icon: Icons.phone,
                    ),
                    const NewRowTextWidget(
                      txt2: 'Address',
                      icon: CupertinoIcons.location_solid,
                    ),
                    Container(
                        height: ht * .18,
                        width: wt * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: wt * .6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  NewRowTextWidget(
                                      txt2: user.address.city,
                                      icon: Icons.location_city),
                                  NewRowTextWidget(
                                      txt2: user.address.street,
                                      icon: Icons.streetview),
                                  NewRowTextWidget(
                                      txt2: user.address.suite,
                                      icon: Icons.airline_seat_individual_suite),
                                  NewRowTextWidget(
                                      txt2: user.address.zipcode,
                                      icon: Icons.pin_drop_outlined),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: ht * .04),
                              child:InkWell(
                                onTap: () async {
                                  controller.locationPosition(user);
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const MapView()));

                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.map),
                                    SizedBox(
                                      height: ht * .02,
                                    ),
                                    Text(
                                      'View Map',
                                      style: MyTextStyles.userTapText,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    const NewRowTextWidget(txt2: 'Company', icon: Icons.business),
                    Container(
                        height: ht * .18,
                        width: wt * .8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.transparent)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NewRowTextWidget(
                                txt2: user.company.name,
                                icon: Icons.business_center),
                            NewRowTextWidget(
                                txt2: user.company.bs, icon: Icons.business),
                            NewRowTextWidget(
                                txt2: user.company.catchPhrase,
                                icon: Icons.production_quantity_limits_rounded)
                          ],
                        )),
                    Row(
                      children: [
                        const Icon(Icons.web),
                        TextButton(
                            style: ButtonStyle(
                                textStyle: MaterialStatePropertyAll(
                                    MyTextStyles.userListName)),
                            onPressed: () {
                              controller.website("http://${user.website}");
                            },
                            // controller.website(user.website),
                            child: Text(user.website))
                      ],
                    )
                  ],
                ),
              )),
            );
          }
        ),
      ),
    );
  }
}

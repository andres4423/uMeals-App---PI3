import 'package:flutter/material.dart';
import 'package:umeals/services/business_api.dart';
import 'package:umeals/services/carrusel_api.dart';
import 'mainPage_parts/exports.dart';


class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: SafeArea(
        child: _HomeViews()
        ),
      bottomNavigationBar: Customnavbutton(),
    );
  }
}

class _HomeViews extends StatelessWidget {
  const _HomeViews();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AppBarMain(),
        ),
 
          
             SliverToBoxAdapter(
               child: Column(
                  children: [
                    SizedBox(height: 10,),
                    // SwiperInfo(),
                    CarruselApi(),
                    Divider(thickness: 1, color: Colors.black,),
                    BusinessPage()
                  ],
                ),
             )
      ]
            
        

    );
    
  }
}
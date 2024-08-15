import 'package:flutter/material.dart';

import 'mainPage_parts/exports.dart';


class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeViews(),
      bottomNavigationBar: Customnavbutton(),
    );
  }
}

class _HomeViews extends StatelessWidget {
  const _HomeViews();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AppBarMain(),
        ),
 
          
             SliverToBoxAdapter(
               child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    SwiperInfo()
                  ],
                ),
             )
      ]
            
        

    );
    
  }
}
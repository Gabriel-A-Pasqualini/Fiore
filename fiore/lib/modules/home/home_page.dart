import 'package:fiore/app.dart';
import 'package:fiore/modules/home/home_card.dart';
import 'package:fiore/modules/home/summary_card.dart';
import 'package:fiore/core/theme/app_colors.dart';
import 'package:fiore/modules/produtos/controller/produto_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //------------------------------------
              // Header
              //------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu,size:30),

                  Image.asset(
                    "assets/images/image.png",
                    height: 100,
                  ),

                  Stack(
                    children: [
                      const Icon(Icons.notifications_none,size:30),

                      Positioned(
                        right: 0,
                        top: 2,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height:15),

              //------------------------------------
              // Banner
              //------------------------------------

              Container(
                height: 150,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(28),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Olá,\nBem-vinda!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height:12),
                          Text(
                            "Gerencie seu estoque\ncom praticidade.",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 13,
                            ),

                          )
                        ],
                      ),
                    ),

                    Image.asset(
                      "assets/images/logo-flor.png",
                      width: 120,
                    )
                  ],
                ),
              ),

              const SizedBox(height:35),

              //------------------------------------
              // Ações rápidas
              //------------------------------------

              const Text(
                "Ações rápidas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height:20),

              GridView.count(

                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: [

                  const HomeCard(
                    icon: Icons.shopping_bag_outlined,
                    title: "Nova Venda",
                    subtitle: "Cadastrar venda",
                  ),

                  HomeCard(
                    icon: Icons.inventory_2_outlined,
                    title: "Produtos",
                    subtitle: "Gerenciar estoque",
                    onTap: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                          builder: (_) => const ProdutoPage(),
                        ),
                      );
                    },
                  ),

                  //HomeCard(
                  //  icon: Icons.category_outlined,
                  //  title: "Categorias",
                  //  subtitle: "Organizar produtos",
                  //),
                  //
                  //HomeCard(
                  //  icon: Icons.people_outline,
                  //  title: "Clientes",
                  //  subtitle: "Cadastrar clientes",
                  //),

                ],
              ),

              const SizedBox(height:35),

              //------------------------------------
              // Resumo
              //------------------------------------


              /*
              const Text(
                "Resumo geral",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height:20),

              Row(

                children: const [

                  Expanded(

                    child: SummaryCard(

                      title: "Produtos",

                      value: "248",

                      icon: Icons.inventory,

                    ),

                  ),

                  SizedBox(width:15),

                  Expanded(

                    child: SummaryCard(

                      title: "Categorias",

                      value: "18",

                      icon: Icons.category,

                    ),

                  ),

                  SizedBox(width:15),

                  Expanded(

                    child: SummaryCard(

                      title: "Estoque baixo",

                      value: "6",

                      icon: Icons.warning_amber,

                    ),

                  ),

                ],

              ),

              const SizedBox(height:35),

              //------------------------------------
              // Produtos Baixos
              //------------------------------------

              const Text(
                "Produtos com estoque baixo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height:15),

              ListView.builder(

                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemCount: 5,

                itemBuilder: (_,index){

                  return Card(

                    elevation: .5,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: ListTile(

                      leading: const CircleAvatar(
                        child: Icon(Icons.inventory_2_outlined),
                      ),

                      title: Text("Produto ${index+1}"),

                      subtitle: const Text("Restam apenas 2 unidades"),

                      trailing: const Icon(Icons.chevron_right),

                    ),

                  );

                },
              
              )
            */
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Início",
          ),

          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Vendas",
          ),

          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Produtos",
          ),

          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            label: "Mais",
          ),
        ],
      ),
    );
  }
}
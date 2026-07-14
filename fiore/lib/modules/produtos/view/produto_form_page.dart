import 'package:fiore/core/theme/app_colors.dart';
import 'package:fiore/modules/produtos/controller/produto_controller.dart';
import 'package:flutter/material.dart';

class ProdutoFormPage extends StatefulWidget {
  final ProdutoController controller;

  const ProdutoFormPage({
    super.key,
    required this.controller,
  });

  @override
  State<ProdutoFormPage> createState() => _ProdutoFormPageState();
}

class _ProdutoFormPageState extends State<ProdutoFormPage> {

  ProdutoController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Produto"),
        centerTitle: true,
      ),

      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.codigoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Código",
                    prefixIcon: Icon(Icons.qr_code),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: controller.categoriaSelecionada,
                  decoration: const InputDecoration(
                    labelText: "Categoria",
                    prefixIcon: Icon(Icons.category_outlined),
                    border: OutlineInputBorder(),
                  ),

                  items: controller.categorias.map((categoria) {
                    return DropdownMenuItem<String>(

                      value: categoria.$1,
                      child: Row(
                        children: [
                          Icon(
                            categoria.$2,
                            color: AppColors.primary,
                            size: 22,
                          ),

                          const SizedBox(width: 10),

                          Text(
                            categoria.$1,
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  onChanged: (value) {
                    if(value != null) {
                      controller.alterarCategoria(value);
                    }
                  },
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: controller.precoController,

                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),

                  decoration: const InputDecoration(
                    labelText: "Preço",
                    prefixText: "R\$ ",
                    prefixIcon: Icon(
                      Icons.attach_money,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                Card(
                  child: SwitchListTile(
                    title: const Text(
                      "Produto ativo",
                    ),

                    subtitle: Text(
                      controller.ativo
                          ? "Disponível para venda"
                          : "Produto desativado",
                    ),

                    value: controller.ativo,
                    activeColor: AppColors.primary,

                    onChanged: (value) {
                      controller.alterarAtivo(value);
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Card(
                  child: ListTile(

                    leading: const Icon(
                      Icons.calendar_today,
                    ),

                    title: const Text(
                      "Data de cadastro",
                    ),

                    subtitle: Text(
                      formatarData(controller.cadastro),
                    ),

                    onTap: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate: controller.cadastro,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );

                      if(data != null) {
                        controller.alterarCadastro(data);
                      }
                    },
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),

                    onPressed: () {
                      controller.salvar();
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Salvar Produto",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  String formatarData(DateTime data) {
    return "${data.day.toString().padLeft(2,'0')}/"
        "${data.month.toString().padLeft(2,'0')}/"
        "${data.year}";
  }
}
import 'package:easycomply/components/menu_tile.dart';
import 'package:easycomply/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/checkbox_state.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final items = [
    CheckBoxState(title: "Artigo 3 - Determina o escopo de atuação da lei, que se aplica a todo e qualquer tratamento de dados realizado tanto por pessoa física quanto por pessoa jurídica. A seguir, temos as especificações, que afunilam a regra. A LGPD se aplica a qualquer tratamento de dados ocorrido (total ou parcialmente) em solo brasileiro, ou que tenha por objetivo vender produtos e serviços nacionais. Uma pessoa estrangeira está protegida sob a LGPD dentro do Brasil, por exemplo, enquanto um brasileiro em outro país não.",sessionTitle: "Due Diligence sobre dados pessoais"),
    CheckBoxState(title: "Artigo 4 - Complementando o que já havia sido abordado no artigo anterior, pessoas físicas têm o direito de realizar tratamentos de dados livremente quando estes tiverem fins exclusivamente particulares. Além disso, o direito à privacidade e à liberdade não impede a coleta, o uso e outros tratamentos de dados para fins jornalísticos, artísticos ou acadêmicos. Dessa forma, preserva-se a liberdade de imprensa, da arte e da ciência.", sessionTitle: "Due Diligence sobre dados pessoais"),

    CheckBoxState(title: "Artigo 5 - Definição dos conceitos estabelecidos: Dado pessoal, dado pessoal sensível, dado anonimizado, banco de dados, titular, controlador, operador, encarregado, agentes de tratamento, tratamento, anonimizarão, consentimento, bloqueio, eliminação, transferência internacional de dados, uso compartilhado de dados, relatório de impacto ä proteção de dados pessoais, órgão de pesquisa, autoridade nacional.", sessionTitle: "Auditoria sobre tratamento"),
    CheckBoxState(title: "Artigo 6 - Definição dos princípios a serem seguidos para tratamento dos dados pessoais: finalidade, adequação, necessidade, livre acesso, qualidade dos dados, transparência, segurança, prevenção, não discriminação e responsabilização e proteção de contas.", sessionTitle: "Auditoria sobre tratamento"),

    CheckBoxState(title: "Artigo 7 - Entender os aspectos de consentimento e como a LGPD busca um equilíbrio entre os interesses do titular e as necessidades dos controladores ao exercerem suas atividades. É preciso considerar, também, que alguns tratamentos de dados são imprescindíveis para o cumprimento das obrigações legais dos controladores, de acordo com o seu setor de atuação.", sessionTitle: "Gestão de Consentimento e Autorização"),
    CheckBoxState(title: "Artigo 8 - O oitavo artigo trata da forma com que o controlador deve solicitar o consentimento do titular. A primeira e mais importante regra é que as cláusulas referentes ao consentimento devem vir separadas das outras, permitindo que o titular tenha total clareza sobre a que está consentindo.", sessionTitle: "Gestão dos Pedidos do Titular"),

    CheckBoxState(title: "Artigo 9 - Trata do direito do titular de ser informado sobre os tratamentos de seus dados pessoais. Controladores e operadores têm uma série de obrigações nesse sentido, sendo importante destacar que as informações solicitadas devem ser fornecidas de forma clara e acessível — não cabem, por exemplo, relatórios altamente técnicos.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 10 - Utilizar os dados pessoais coletados para fins de e-mail marketing, por exemplo, entra dentro do legítimo interesse do controlador. Para essa e outras atividades de legítimo interesse, é importante que somente os dados estritamente necessários sejam utilizados. Assim, preserva-se tanto o legítimo interesse do controlador quanto a integridade dos dados do titular.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 11 -  O artigo 11 determina como deve ser feito — e como pode ser feito — o tratamento de dados pessoais sensíveis. Para começar, a questão do consentimento solicitado de forma clara e explícita, sempre com uma finalidade determinada, torna-se ainda mais importante quando tratamos dados sensíveis.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 12 - Caso fique comprovado que não é possível identificar os titulares desses dados, eles são considerados anônimos. Se o controlador criptografar dados pessoais mas tiver uma chave de criptografia, por exemplo, trata-se de um processo facilmente reversível.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 13 - Trata do tratamento de dados pessoais por órgãos de pesquisa estudando questões de saúde pública. Nesses casos, os dados podem ser tratados, mas isso deve acontecer única e exclusivamente dentro do órgão e para fins da pesquisa sendo conduzida", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 14 - Também há regras específicas para os dados de crianças e adolescentes, ou seja, pertencentes a titulares com menos de 18 anos. A lei destaca a necessidade de tratá-los somente para o melhor interesse do titular, reforçando essa que é uma questão necessária em qualquer tratamento de dados. Para o tratamento de dados de crianças e adolescentes, é imprescindível solicitar o consentimento de um dos pais ou do responsável legal. Assim, assegura-se que uma pessoa maior de idade dará o devido consentimento pelo titular sob o qual é responsável.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 15 - O tratamento dos dados pessoais deve ser terminado quando a finalidade for alcançada, quando os dados tratados não forem mais necessários para aquela finalidade, quando o fim do período de tratamento acordado com o titular se encerrar ou quando o titular assim solicitar. Outra condição que leva ao encerramento é quando a Autoridade Nacional de Proteção de Dados determinar o fim do tratamento de dados após descobrir irregularidades no cumprimento da LGPD.", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 16 - Cumpridas as diretrizes da lei e/ou sob a solicitação do titular, a transferência dos dados a terceiros é permitida no lugar de sua exclusão. Além disso, caso o controlador anonimize os dados, é possível mantê-los para uso único e exclusivo (para fins estatísticos, por exemplo).", sessionTitle: "Gestão dos Pedidos do Titular"),
    CheckBoxState(title: "Artigo 17 - Todos os cidadãos são os titulares de seus próprios dados pessoais e sob hipótese alguma perderão essa titularidade. Não importa o que seja pedido no consentimento ou qual seja o tratamento; dados pessoais são individuais e intransferíveis e sempre pertencerão à pessoa a que se referem.", sessionTitle: "Gestão dos Pedidos do Titular"),

    CheckBoxState(title: "Artigo 18 - A qualquer momento e de forma gratuita e simples, o titular pode solicitar relatórios e informações sobre seus dados, incluindo a confirmação de qual é o tratamento feito com eles, quem tem acesso aos dados, quais são os dados sendo tratados e com quais agentes foram compartilhados. Além disso, o titular pode solicitar a correção ou atualização de dados, assim como a anonimização, exclusão ou interrupção do tratamento de dados pessoais não necessários para a finalidade à qual consentiu.", sessionTitle: "Relatório de Impacto"),

    CheckBoxState(title: "Artigo 19 - Quando o titular solicitar a confirmação de que seus dados estão com o controlador ou peça acesso a esses dados, o agente deve fazê-lo imediatamente e de forma simplificada. Outra opção é fornecer uma declaração completa (mas também clara e acessível) dentro do prazo de 15 dias. Essa comunicação deve detalhar a origem dos dados, a finalidade do tratamento e o critério para tal, respeitando-se sempre os segredos de negócio. As informações podem ser fornecidas por meio eletrônico ou impresso, de acordo com a solicitação do titular.", sessionTitle: "Segurança dos Dados"),
    CheckBoxState(title: "Artigo 20 - O controlador deve ser capaz de fornecer informações claras e transparentes sobre como o processo de decisão automatizada acontece. Caso isso não se cumpra, a ANPD pode solicitar auditoria para verificar se há algum tipo de discriminação ou viés na tomada de decisões automatizadas.", sessionTitle: "Segurança dos Dados"),
    CheckBoxState(title: "Artigo 21 - O tratamento de dados pessoais pode ser realizado para os fins consentidos pelo titular e para cumprimento de obrigações regulatórias do controlador, não podendo haver prejuízos à imagem, à segurança ou à integridade do titular.", sessionTitle: "Segurança dos Dados"),
    CheckBoxState(title: "Artigo 22 - Se o titular sentir que seus interesses não estão sendo respeitados, ele pode tomar providências legais sozinho ou, se preferir, fazer isso ao lado de outros titulares que também se sentirem prejudicados pelo mesmo controlador.", sessionTitle: "Segurança dos Dados"),

    CheckBoxState(title: "Artigo 23 - Aborda o tratamento de dados pessoais pelo poder público, que pode ser realizado quando houver uma finalidade pública de interesse também público e somente quando houver real necessidade do tratamento para a execução dessas obrigações legais. O artigo não aborda o compartilhamento de dados ou o tratamento de dados sensíveis, o que abre espaço para que informações biométricas, por exemplo, venham a ser tratadas em nome da segurança pública.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 24 - Pessoas jurídicas de direito privado são as associações, sociedades, fundações, organizações religiosas, partidos políticos e empresas individuais de responsabilidade limitada, instituídas por iniciativa de particulares.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 25 - Prezando pela possível necessidade de execução de políticas e serviços públicos, e também pela descentralização da atividade pública e pelo livre acesso à informação por parte dos cidadãos, a LGPD orienta que os dados pessoais tratados nessas esferas devem ser mantidos de forma a permitir o uso compartilhado.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 26 - O artigo 26 determina que o compartilhamento de dados por parte do poder público só pode acontecer para fins de execução das políticas públicas. Ou seja, é preciso haver uma justificativa real e comprovável para o compartilhamento.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 27 - As organizações de direito público só poderão compartilhar ou comunicar dados pessoais a empresas de direito privado mediante consentimento do titular.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 28 - O artigo 28, que foi integralmente vetado, previa a necessidade de informar publicamente sobre compartilhamentos de dados entre entidades do poder público. A justificativa para o veto é que essa publicização prejudicaria atividades de fiscalização, controle e policiamento.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 29 - A Autoridade Nacional de Proteção de Dados pode solicitar informações sobre o tratamento de dados pessoais às entidades do poder público, assim como informações específicas sobre os dados em si. Também pode exigir a realização de tratamentos.",  sessionTitle: "Governança de Tratamento"),
    CheckBoxState(title: "Artigo 30 - Após seu estabelecimento, a ANPD ainda pode adicionar novas diretrizes sobre o compartilhamento de dados e a forma com que esse tipo de tratamento compartilhado é comunicada.",  sessionTitle: "Governança de Tratamento"),

    CheckBoxState(title: "Artigo 31 - A Autoridade Nacional de Proteção de Dados pode propor diretrizes para correção de violações de dados, quando estas acontecerem por causa de tratamentos de dados pessoais feitos por órgãos públicos.", sessionTitle: "Plano de Comunicação - Incidente de Segurança"),
    CheckBoxState(title: "Artigo 32 - A ANPD ainda pode pedir que agentes do poder público divulguem relatórios de impacto à proteção de dados pessoais, assim como propor medidas para aprimorar os padrões e processos no tratamento desses dados.", sessionTitle: "Plano de Comunicação - Incidente de Segurança"),
    CheckBoxState(title: "Artigo 33 - Determina os casos em que dados pessoais podem ser transferidos para fora do Brasil. A transferência só pode ser feita para países cujas leis de proteção de dados proporcionem um nível de proteção aos dados equivalente ao da LGPD — por isso, o controlador tem o dever de assegurar o cumprimento desses princípios por meio de cláusulas contratuais, certificados e outras comprovações reconhecidas.", sessionTitle: "Plano de Comunicação - Incidente de Segurança"),

    CheckBoxState(title: "Validação do Término de Tratamento", sessionTitle: "Validação do Término de Tratamento"),

    CheckBoxState(title: "Definir o Data Protection Officer da entidade", sessionTitle: "Definir DPO (Data Protection Officer)"),
    
    CheckBoxState(title: "Prevenção de Conflitos", sessionTitle: "Prevenção de Conflitos"),
  ];

@override
  void initState() {
    super.initState();

    var box = Hive.box<CheckBoxState>('lgpd_checkboxes');
    var boxLength = box.toMap().length;
    
    if (boxLength == 0) {
      box.addAll(items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1A3F6D),
        title: SizedBox(
          height: 35,
          child: Image.asset('assets/easycomply.png'),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                MenuTile(
                  height: 235.0,
                  label: 'Dashboard',
                  logo: 'dashboard',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(initialPageIndex: 0)),
                  ),
                ),
                SizedBox(height: 10),
                MenuTile(
                  height: 150.0,
                  label: 'Profile',
                  logo: 'profile',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(initialPageIndex: 3)),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: [
                MenuTile(
                  height: 150.0,
                  label: 'LGPD',
                  logo: 'lgpd',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(initialPageIndex: 2)),
                  ),
                ),
                SizedBox(height: 10),
                MenuTile(
                  height: 235.0,
                  label: 'Checklist',
                  logo: 'checklist',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(initialPageIndex: 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

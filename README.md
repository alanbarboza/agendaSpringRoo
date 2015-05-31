# Agenda Spring Roo
Projeto de Pesquisa Científica - UFSCAR Universidade Federal de São Carlos

### Passo a Passo
Siga o passo a passo detalhado abaixo para gerar a aplicação de **Contatos** utilizando o framework **Spring Roo**.
```sh
project --topLevelPackage br.com.ufscar.dsw.agenda
jpa setup --provider HIBERNATE --database HYPERSONIC_IN_MEMORY
enum type --class ~.reference.Operadora
enum constant --name VIVO
enum constant --name TIM
enum constant --name CLARO
enum constant --name OI
enum constant --name NEXTEL
enum type --class ~.reference.Tipo
enum constant --name FIXO
enum constant --name CELULAR
enum constant --name FAX
entity jpa --class ~.domain.Telefone --testAutomatically
field number --fieldName ddd --notNull --type java.lang.Integer
field number --fieldName numero --notNull --type java.lang.Integer
field enum --fieldName operadora --notNull --type ~.reference.Operadora
entity jpa --class ~.domain.Contato --testAutomatically
field string --fieldName nome --notNull --sizeMin 1 --sizeMax 70
field string --fieldName email --notNull --sizeMin 5 --sizeMax 70
field date --fieldName dataNascimento --type java.util.Date --notNull
focus --class ~.domain.Telefone
field set --class ~.domain.Telefone --fieldName contatos --type ~.domain.Contato --mappedBy telefone --notNull --cardinality ONE_TO_MANY
focus --class ~.domain.Contato
field reference --fieldName telefone --type ~.domain.Telefone
test integration --entity ~.domain.Contato
test integration --entity ~.domain.Telefone
web mvc setup
web mvc all --package ~.web
web mvc language --code de
web mvc language --code es
web mvc language --code en
selenium test --controller ~.web.ContatoController
selenium test --controller ~.web.TelefoneController
logging setup --level INFO
json all
web mvc json all --package ~.web
quit
```

### Plugin JasperReports
Siga os passos abaixo para configurar o JasperReports para exportar a lista de contatos em PDF.

1. Edite o arquivo "/pom.xml" e acrescente:

```maven
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-context-support</artifactId>
	<version>${spring.version}</version>
</dependency>
<dependency>
	<groupId>net.sf.jasperreports</groupId>
	<artifactId>jasperreports</artifactId>
	<version>5.5.0</version>
</dependency>
```

2. Edite o arquivo "/src/main/webapp/WEB-INF/spring/webmvc-config.xml" e acrescente:

```xml
<beans>
	...
	<bean id="viewResolver" class="org.springframework.web.servlet.view.ResourceBundleViewResolver">
		<property name="basename" value="views"/>
	</bean>
	...
</beans>
```

3. Crie o arquivo "/src/main/webapp/WEB-INF/classes/views.properties"

```properties
contatoReportList.(class)=org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView
contatoReportList.url=/WEB-INF/reports/contatoReportList.jasper
contatoReportList.reportDataKey=contatoReportList
```

4. Crie o design com o JasperReports no seguinte diretório "/src/main/webapp/WEB-INF/reports/"

5. Edite o "ContatoController.java" e acrescente o seguinte método:

```java
@RequestMapping(value = "/report/pdf", method = RequestMethod.GET)
public String fireReport(ModelMap modelMap) {
	JRBeanCollectionDataSource jrDataSource = new JRBeanCollectionDataSource(Contato.findAllContatoes(), false);
	modelMap.put("contatoReportList", jrDataSource);
	return "contatoReportList";
}
```

6. Edite o arquivo "/src/main/webapp/WEB-INF/i18n/application.properties" e acrescente:

```properties
menu_item_contato_export_label=Export PDF
```

7. Para as demais properties adicione a chave "global_menu_export_pdf" com sua respectiva tradução.

8. Edite o arquivo "/src/main/webapp/WEB-INF/views/menu.jspx" e acrescente:

```jspx
<menu:item id="i_contato_export" messageCode="global_menu_export_pdf" url="/contatoes/report/pdf" />
```

License
----
MIT
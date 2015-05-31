# Agenda Spring Roo
Projeto de Pesquisa Científica - UFSCAR Universidade Federal de São Carlos

### Passo a Passo
Siga o passo a passo detalhado abaixo para gerar a aplicação de **Contatos** utilizando o framework **Spring Roo**.
```sh
project --topLevelPackage br.com.ufscar.dsw.agenda
jpa setup --provider HIBERNATE --database HYPERSONIC_IN_MEMORY
enum type --class ~.reference.Sexo
enum constant --name MASCULINO
enum constant --name FEMININO
entity jpa --class ~.domain.Contato --testAutomatically
field string --fieldName nome --notNull --sizeMin 1 --sizeMax 70
field string --fieldName email --notNull --sizeMin 5 --sizeMax 70
field date --fieldName dataNascimento --type java.util.Date --notNull
field enum --fieldName sexo --notNull --type ~.reference.Sexo
field string --fieldName telefone --notNull --sizeMin 8 --sizeMax 10
field string --fieldName celular --notNull --sizeMin 9 --sizeMax 11
test integration --entity ~.domain.Contato
web mvc setup
web mvc all --package ~.web
web mvc language --code de
web mvc language --code es
selenium test --controller ~.web.ContatoController
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
...
@RequestMapping(value = "/report/pdf", method = RequestMethod.GET)
public String fireReport(ModelMap modelMap) {
	JRBeanCollectionDataSource jrDataSource = new JRBeanCollectionDataSource(Contato.findAllContatoes(), false);
	modelMap.put("contatoReportList", jrDataSource);
	return "contatoReportList";
}
...
```

6. Edite o arquivo "/src/main/webapp/WEB-INF/i18n/application.properties" e acrescente:
```properties
menu_item_contato_export_label=Export PDF
```

7. Para as demais properties adicione a chave "global_menu_export_pdf" com sua respectiva tradução.

8. Edite o arquivo "/src/main/webapp/WEB-INF/views/menu.jspx" após a identificação do "menu:category" com id="c_contato" e acrescente:
```jspx
<menu:item id="i_contato_export" messageCode="global_menu_export_pdf" url="/contatoes/report/pdf" />
```

License
----
MIT

package br.com.ufscar.dsw.agenda.web;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ufscar.dsw.agenda.domain.Contato;

@RequestMapping("/contatoes")
@Controller
@RooWebScaffold(path = "contatoes", formBackingObject = Contato.class)
@RooWebJson(jsonObject = Contato.class)
public class ContatoController {
	@RequestMapping(value = "/report/pdf", method = RequestMethod.GET)
	public String fireReport(ModelMap modelMap) {
		JRBeanCollectionDataSource jrDataSource = new JRBeanCollectionDataSource(
				Contato.findAllContatoes(), false);
		modelMap.put("contatoReportList", jrDataSource);
		return "contatoReportList";
	}
}

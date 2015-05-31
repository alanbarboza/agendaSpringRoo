package br.com.ufscar.dsw.agenda.web;
import br.com.ufscar.dsw.agenda.domain.Telefone;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/telefones")
@Controller
@RooWebScaffold(path = "telefones", formBackingObject = Telefone.class)
@RooWebJson(jsonObject = Telefone.class)
public class TelefoneController {
}

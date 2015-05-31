package br.com.ufscar.dsw.agenda.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import br.com.ufscar.dsw.agenda.reference.Operadora;
import javax.persistence.Enumerated;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Telefone {

    /**
     */
    @NotNull
    private Integer ddd;

    /**
     */
    @NotNull
    private Integer numero;

    /**
     */
    @NotNull
    @Enumerated
    private Operadora operadora;

    /**
     */
    @NotNull
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "telefone")
    private Set<Contato> contatos = new HashSet<Contato>();
}

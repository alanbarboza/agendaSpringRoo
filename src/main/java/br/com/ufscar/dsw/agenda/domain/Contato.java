package br.com.ufscar.dsw.agenda.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import br.com.ufscar.dsw.agenda.reference.Sexo;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Contato {

    /**
     */
    @NotNull
    @Size(min = 1, max = 70)
    private String nome;

    /**
     */
    @NotNull
    @Size(min = 5, max = 70)
    private String email;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dataNascimento;

    /**
     */
    @NotNull
    @Enumerated
    private Sexo sexo;

    /**
     */
    @NotNull
    @Size(min = 8, max = 10)
    private String telefone;

    /**
     */
    @NotNull
    @Size(min = 9, max = 11)
    private String celular;
}

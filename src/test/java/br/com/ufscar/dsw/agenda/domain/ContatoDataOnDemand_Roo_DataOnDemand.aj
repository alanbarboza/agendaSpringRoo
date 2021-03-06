// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.ufscar.dsw.agenda.domain;

import br.com.ufscar.dsw.agenda.domain.Contato;
import br.com.ufscar.dsw.agenda.domain.ContatoDataOnDemand;
import br.com.ufscar.dsw.agenda.reference.Sexo;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ContatoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContatoDataOnDemand: @Component;
    
    private Random ContatoDataOnDemand.rnd = new SecureRandom();
    
    private List<Contato> ContatoDataOnDemand.data;
    
    public Contato ContatoDataOnDemand.getNewTransientContato(int index) {
        Contato obj = new Contato();
        setCelular(obj, index);
        setDataNascimento(obj, index);
        setEmail(obj, index);
        setNome(obj, index);
        setSexo(obj, index);
        setTelefone(obj, index);
        return obj;
    }
    
    public void ContatoDataOnDemand.setCelular(Contato obj, int index) {
        String celular = "celular_" + index;
        if (celular.length() > 11) {
            celular = celular.substring(0, 11);
        }
        obj.setCelular(celular);
    }
    
    public void ContatoDataOnDemand.setDataNascimento(Contato obj, int index) {
        Date dataNascimento = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataNascimento(dataNascimento);
    }
    
    public void ContatoDataOnDemand.setEmail(Contato obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 70) {
            email = email.substring(0, 70);
        }
        obj.setEmail(email);
    }
    
    public void ContatoDataOnDemand.setNome(Contato obj, int index) {
        String nome = "nome_" + index;
        if (nome.length() > 70) {
            nome = nome.substring(0, 70);
        }
        obj.setNome(nome);
    }
    
    public void ContatoDataOnDemand.setSexo(Contato obj, int index) {
        Sexo sexo = Sexo.class.getEnumConstants()[0];
        obj.setSexo(sexo);
    }
    
    public void ContatoDataOnDemand.setTelefone(Contato obj, int index) {
        String telefone = "telefone_" + index;
        if (telefone.length() > 10) {
            telefone = telefone.substring(0, 10);
        }
        obj.setTelefone(telefone);
    }
    
    public Contato ContatoDataOnDemand.getSpecificContato(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Contato obj = data.get(index);
        Long id = obj.getId();
        return Contato.findContato(id);
    }
    
    public Contato ContatoDataOnDemand.getRandomContato() {
        init();
        Contato obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Contato.findContato(id);
    }
    
    public boolean ContatoDataOnDemand.modifyContato(Contato obj) {
        return false;
    }
    
    public void ContatoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Contato.findContatoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Contato' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Contato>();
        for (int i = 0; i < 10; i++) {
            Contato obj = getNewTransientContato(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}

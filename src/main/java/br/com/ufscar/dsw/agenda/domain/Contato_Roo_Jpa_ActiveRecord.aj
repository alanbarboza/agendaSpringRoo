// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.ufscar.dsw.agenda.domain;

import br.com.ufscar.dsw.agenda.domain.Contato;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Contato_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Contato.entityManager;
    
    public static final List<String> Contato.fieldNames4OrderClauseFilter = java.util.Arrays.asList("nome", "email", "dataNascimento", "telefone");
    
    public static final EntityManager Contato.entityManager() {
        EntityManager em = new Contato().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Contato.countContatoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Contato o", Long.class).getSingleResult();
    }
    
    public static List<Contato> Contato.findAllContatoes() {
        return entityManager().createQuery("SELECT o FROM Contato o", Contato.class).getResultList();
    }
    
    public static List<Contato> Contato.findAllContatoes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Contato o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Contato.class).getResultList();
    }
    
    public static Contato Contato.findContato(Long id) {
        if (id == null) return null;
        return entityManager().find(Contato.class, id);
    }
    
    public static List<Contato> Contato.findContatoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Contato o", Contato.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Contato> Contato.findContatoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Contato o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Contato.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Contato.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Contato.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Contato attached = Contato.findContato(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Contato.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Contato.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Contato Contato.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Contato merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}

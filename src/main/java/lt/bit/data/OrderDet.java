/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Lenovo
 */
@Entity
@Table(name = "order_det")
@NamedQueries({
    @NamedQuery(name = "OrderDet.findAll", query = "SELECT o FROM OrderDet o")
    , @NamedQuery(name = "OrderDet.findById", query = "SELECT o FROM OrderDet o WHERE o.id = :id")
    , @NamedQuery(name = "OrderDet.findByName", query = "SELECT o FROM OrderDet o WHERE o.name = :name")
    , @NamedQuery(name = "OrderDet.findBySurname", query = "SELECT o FROM OrderDet o WHERE o.surname = :surname")
    , @NamedQuery(name = "OrderDet.findByStreet", query = "SELECT o FROM OrderDet o WHERE o.street = :street")
    , @NamedQuery(name = "OrderDet.findByEmailas", query = "SELECT o FROM OrderDet o WHERE o.emailas = :emailas")
    , @NamedQuery(name = "OrderDet.findByPhoneN", query = "SELECT o FROM OrderDet o WHERE o.phoneN = :phoneN")})
public class OrderDet implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "surname")
    private String surname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "street")
    private String street;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "emailas")
    private String emailas;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "phoneN")
    private String phoneN;
    
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderId")
    private List<Item> itemList;

    public OrderDet() {
    }

    public OrderDet(Integer id) {
        this.id = id;
    }

    public OrderDet(Integer id, String name, String surname, String street, String emailas, String phoneN) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.street = street;
        this.emailas = emailas;
        this.phoneN = phoneN;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getEmailas() {
        return emailas;
    }

    public void setEmailas(String emailas) {
        this.emailas = emailas;
    }

    public String getPhoneN() {
        return phoneN;
    }

    public void setPhoneN(String phoneN) {
        this.phoneN = phoneN;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDet)) {
            return false;
        }
        OrderDet other = (OrderDet) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "lt.bit.data.OrderDet[ id=" + id + " ]";
    }
    
}

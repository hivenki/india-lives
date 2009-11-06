/*
 * This class was automatically generated with 
 * <a href="http://www.castor.org">Castor 1.1.2</a>, using an XML
 * Schema.
 * $Id$
 */

package com.indialives.formbean.jaxb;

  //---------------------------------/
 //- Imported classes and packages -/
//---------------------------------/

import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;

/**
 * Class UserRoleContextsType.
 * 
 * @version $Revision$ $Date$
 */
@SuppressWarnings("serial")
public class UserRoleContextsType extends com.easymvc.jaxb.JAXBObject 
implements java.io.Serializable
{


      //--------------------------/
     //- Class/Member Variables -/
    //--------------------------/

    /**
     * Field _userIdList.
     */
    private java.util.List<java.lang.String> _userIdList;

    /**
     * Field _roleIdList.
     */
    private java.util.List<java.lang.String> _roleIdList;


      //----------------/
     //- Constructors -/
    //----------------/

    public UserRoleContextsType() {
        super();
        this._userIdList = new java.util.ArrayList<java.lang.String>();
        this._roleIdList = new java.util.ArrayList<java.lang.String>();
    }


      //-----------/
     //- Methods -/
    //-----------/

    /**
     * 
     * 
     * @param vRoleId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void addRoleId(
            final java.lang.String vRoleId)
    throws java.lang.IndexOutOfBoundsException {
        this._roleIdList.add(vRoleId);
    }

    /**
     * 
     * 
     * @param index
     * @param vRoleId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void addRoleId(
            final int index,
            final java.lang.String vRoleId)
    throws java.lang.IndexOutOfBoundsException {
        this._roleIdList.add(index, vRoleId);
    }

    /**
     * 
     * 
     * @param vUserId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void addUserId(
            final java.lang.String vUserId)
    throws java.lang.IndexOutOfBoundsException {
        this._userIdList.add(vUserId);
    }

    /**
     * 
     * 
     * @param index
     * @param vUserId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void addUserId(
            final int index,
            final java.lang.String vUserId)
    throws java.lang.IndexOutOfBoundsException {
        this._userIdList.add(index, vUserId);
    }

    /**
     * Method enumerateRoleId.
     * 
     * @return an Enumeration over all possible elements of this
     * collection
     */
    public java.util.Enumeration<java.lang.String> enumerateRoleId(
    ) {
        return java.util.Collections.enumeration(this._roleIdList);
    }

    /**
     * Method enumerateUserId.
     * 
     * @return an Enumeration over all possible elements of this
     * collection
     */
    public java.util.Enumeration<java.lang.String> enumerateUserId(
    ) {
        return java.util.Collections.enumeration(this._userIdList);
    }

    /**
     * Method getRoleId.
     * 
     * @param index
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     * @return the value of the java.lang.String at the given index
     */
    public java.lang.String getRoleId(
            final int index)
    throws java.lang.IndexOutOfBoundsException {
        // check bounds for index
        if (index < 0 || index >= this._roleIdList.size()) {
            throw new IndexOutOfBoundsException("getRoleId: Index value '" + index + "' not in range [0.." + (this._roleIdList.size() - 1) + "]");
        }
        
        return (java.lang.String) _roleIdList.get(index);
    }

    /**
     * Method getRoleId.Returns the contents of the collection in
     * an Array.  <p>Note:  Just in case the collection contents
     * are changing in another thread, we pass a 0-length Array of
     * the correct type into the API call.  This way we <i>know</i>
     * that the Array returned is of exactly the correct length.
     * 
     * @return this collection as an Array
     */
    public java.lang.String[] getRoleId(
    ) {
        java.lang.String[] array = new java.lang.String[0];
        return (java.lang.String[]) this._roleIdList.toArray(array);
    }

    /**
     * Method getRoleIdCount.
     * 
     * @return the size of this collection
     */
    public int getRoleIdCount(
    ) {
        return this._roleIdList.size();
    }

    /**
     * Method getUserId.
     * 
     * @param index
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     * @return the value of the java.lang.String at the given index
     */
    public java.lang.String getUserId(
            final int index)
    throws java.lang.IndexOutOfBoundsException {
        // check bounds for index
        if (index < 0 || index >= this._userIdList.size()) {
            throw new IndexOutOfBoundsException("getUserId: Index value '" + index + "' not in range [0.." + (this._userIdList.size() - 1) + "]");
        }
        
        return (java.lang.String) _userIdList.get(index);
    }

    /**
     * Method getUserId.Returns the contents of the collection in
     * an Array.  <p>Note:  Just in case the collection contents
     * are changing in another thread, we pass a 0-length Array of
     * the correct type into the API call.  This way we <i>know</i>
     * that the Array returned is of exactly the correct length.
     * 
     * @return this collection as an Array
     */
    public java.lang.String[] getUserId(
    ) {
        java.lang.String[] array = new java.lang.String[0];
        return (java.lang.String[]) this._userIdList.toArray(array);
    }

    /**
     * Method getUserIdCount.
     * 
     * @return the size of this collection
     */
    public int getUserIdCount(
    ) {
        return this._userIdList.size();
    }

    /**
     * Method isValid.
     * 
     * @return true if this object is valid according to the schema
     */
    public boolean isValid(
    ) {
        try {
            validate();
        } catch (org.exolab.castor.xml.ValidationException vex) {
            return false;
        }
        return true;
    }

    /**
     * Method iterateRoleId.
     * 
     * @return an Iterator over all possible elements in this
     * collection
     */
    public java.util.Iterator<java.lang.String> iterateRoleId(
    ) {
        return this._roleIdList.iterator();
    }

    /**
     * Method iterateUserId.
     * 
     * @return an Iterator over all possible elements in this
     * collection
     */
    public java.util.Iterator<java.lang.String> iterateUserId(
    ) {
        return this._userIdList.iterator();
    }

    /**
     * 
     * 
     * @param out
     * @throws org.exolab.castor.xml.MarshalException if object is
     * null or if any SAXException is thrown during marshaling
     * @throws org.exolab.castor.xml.ValidationException if this
     * object is an invalid instance according to the schema
     */
    public void marshal(
            final java.io.Writer out)
    throws org.exolab.castor.xml.MarshalException, org.exolab.castor.xml.ValidationException {
        Marshaller.marshal(this, out);
    }

    /**
     * 
     * 
     * @param handler
     * @throws java.io.IOException if an IOException occurs during
     * marshaling
     * @throws org.exolab.castor.xml.ValidationException if this
     * object is an invalid instance according to the schema
     * @throws org.exolab.castor.xml.MarshalException if object is
     * null or if any SAXException is thrown during marshaling
     */
    public void marshal(
            final org.xml.sax.ContentHandler handler)
    throws java.io.IOException, org.exolab.castor.xml.MarshalException, org.exolab.castor.xml.ValidationException {
        Marshaller.marshal(this, handler);
    }

    /**
     */
    public void removeAllRoleId(
    ) {
        this._roleIdList.clear();
    }

    /**
     */
    public void removeAllUserId(
    ) {
        this._userIdList.clear();
    }

    /**
     * Method removeRoleId.
     * 
     * @param vRoleId
     * @return true if the object was removed from the collection.
     */
    public boolean removeRoleId(
            final java.lang.String vRoleId) {
        boolean removed = _roleIdList.remove(vRoleId);
        return removed;
    }

    /**
     * Method removeRoleIdAt.
     * 
     * @param index
     * @return the element removed from the collection
     */
    public java.lang.String removeRoleIdAt(
            final int index) {
        java.lang.Object obj = this._roleIdList.remove(index);
        return (java.lang.String) obj;
    }

    /**
     * Method removeUserId.
     * 
     * @param vUserId
     * @return true if the object was removed from the collection.
     */
    public boolean removeUserId(
            final java.lang.String vUserId) {
        boolean removed = _userIdList.remove(vUserId);
        return removed;
    }

    /**
     * Method removeUserIdAt.
     * 
     * @param index
     * @return the element removed from the collection
     */
    public java.lang.String removeUserIdAt(
            final int index) {
        java.lang.Object obj = this._userIdList.remove(index);
        return (java.lang.String) obj;
    }

    /**
     * 
     * 
     * @param index
     * @param vRoleId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void setRoleId(
            final int index,
            final java.lang.String vRoleId)
    throws java.lang.IndexOutOfBoundsException {
        // check bounds for index
        if (index < 0 || index >= this._roleIdList.size()) {
            throw new IndexOutOfBoundsException("setRoleId: Index value '" + index + "' not in range [0.." + (this._roleIdList.size() - 1) + "]");
        }
        
        this._roleIdList.set(index, vRoleId);
    }

    /**
     * 
     * 
     * @param vRoleIdArray
     */
    public void setRoleId(
            final java.lang.String[] vRoleIdArray) {
        //-- copy array
        _roleIdList.clear();
        
        for (int i = 0; i < vRoleIdArray.length; i++) {
                this._roleIdList.add(vRoleIdArray[i]);
        }
    }

    /**
     * 
     * 
     * @param index
     * @param vUserId
     * @throws java.lang.IndexOutOfBoundsException if the index
     * given is outside the bounds of the collection
     */
    public void setUserId(
            final int index,
            final java.lang.String vUserId)
    throws java.lang.IndexOutOfBoundsException {
        // check bounds for index
        if (index < 0 || index >= this._userIdList.size()) {
            throw new IndexOutOfBoundsException("setUserId: Index value '" + index + "' not in range [0.." + (this._userIdList.size() - 1) + "]");
        }
        
        this._userIdList.set(index, vUserId);
    }

    /**
     * 
     * 
     * @param vUserIdArray
     */
    public void setUserId(
            final java.lang.String[] vUserIdArray) {
        //-- copy array
        _userIdList.clear();
        
        for (int i = 0; i < vUserIdArray.length; i++) {
                this._userIdList.add(vUserIdArray[i]);
        }
    }

    /**
     * Method unmarshal.
     * 
     * @param reader
     * @throws org.exolab.castor.xml.MarshalException if object is
     * null or if any SAXException is thrown during marshaling
     * @throws org.exolab.castor.xml.ValidationException if this
     * object is an invalid instance according to the schema
     * @return the unmarshaled com.easymvc.jaxb.UserRoleContextsType
     */
    public static com.indialives.formbean.jaxb.UserRoleContextsType unmarshal(
            final java.io.Reader reader)
    throws org.exolab.castor.xml.MarshalException, org.exolab.castor.xml.ValidationException {
        return (com.indialives.formbean.jaxb.UserRoleContextsType) Unmarshaller.unmarshal(com.indialives.formbean.jaxb.UserRoleContextsType.class, reader);
    }

    /**
     * 
     * 
     * @throws org.exolab.castor.xml.ValidationException if this
     * object is an invalid instance according to the schema
     */
    public void validate(
    )
    throws org.exolab.castor.xml.ValidationException {
        org.exolab.castor.xml.Validator validator = new org.exolab.castor.xml.Validator();
        validator.validate(this);
    }

}

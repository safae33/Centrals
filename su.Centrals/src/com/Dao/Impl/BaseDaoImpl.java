package com.Dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.BaseDao;

@Repository
public abstract class BaseDaoImpl<T extends Serializable,PK extends Serializable> implements BaseDao<T,PK> {

	@Autowired
    private SessionFactory sessionFactory;
			
	protected Session getSession() {
        Session session = sessionFactory.getCurrentSession();
        return session;
    }
	
	private Class<T> type;
	public BaseDaoImpl(Class<T> type) {
        this.type = type;
    }
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)
    public PK create(T o) {
        return (PK) getSession().save(o);
    }
	
	@Transactional(readOnly = false, rollbackFor = RuntimeException.class)
    public void update(T o) {
		getSession().update(o);
    }

    @Transactional(readOnly = true)
    public T read(PK id) {
        return (T) getSession().get(type, id);
    }

    @SuppressWarnings({ "unchecked", "deprecation" })
    @Transactional(readOnly = true)
    public List<T> read() {
        return (List<T>) getSession().createCriteria(type).list();
    }

    @Transactional(readOnly = false, rollbackFor = RuntimeException.class)
    public void deletePK(PK id) {
        T o = getSession().load(type, id);
        getSession().delete(o);
    }

    @Transactional(readOnly = false, rollbackFor = RuntimeException.class)
    public void delete(T o) {
        getSession().delete(o);
    }

}

package com.orderingSystem.util;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

public class SearchFilter {

	public static enum Operator {
		EQ, NE, LIKE, NLIKE, LLIKE, RLIKE, GT, LT, GTE, LTE, IN, NIN, BETWEEN, NBETWEEN, NULL, NNULL
	}

	public String fieldName;
	public Object value;
	public Operator operator;

	public SearchFilter(String fieldName, Operator operator, Object value) {
		this.fieldName = fieldName;
		this.value = value;
		this.operator = operator;
	}

	public String getFieldName() {
		return fieldName;
	}

	public Object getValue() {
		return value;
	}

	public Operator getOperator() {
		return operator;
	}
	
	public static Criterion buildCriterion(final String fieldName, final Object value,
			final SearchFilter.Operator operator) {
		Criterion criterion = null;
		switch (operator) {
		case EQ:
			criterion = Restrictions.eq(fieldName, value);
			break;
		case NNULL:
		case NE:
			criterion = Restrictions.neOrIsNotNull(fieldName, value);
			break;
		case NULL:
			criterion = Restrictions.isNull(fieldName);
			break;
		case LIKE:
			criterion = Restrictions.like(fieldName, "%" + value + "%");
			break;
		case NLIKE:
			criterion = Restrictions.sqlRestriction(fieldName + " not like '" + value + "' ");
			break;	
		case LLIKE:
			criterion = Restrictions.like(fieldName, "%" + value);
			break;
		case RLIKE:
			criterion = Restrictions.like(fieldName, value + "%");
			break;
		case GT:
			criterion = Restrictions.gt(fieldName, value);
			break;
		case LT:
			criterion = Restrictions.lt(fieldName, value);
			break;
		case GTE:
			criterion = Restrictions.ge(fieldName, value);
			break;
		case LTE:
			criterion = Restrictions.le(fieldName, value);
			break;
		case IN:
			criterion = Restrictions.in(fieldName, (Object[]) value);
			break;
		case NIN:
			criterion = Restrictions.not(Restrictions.in(fieldName,
					(Object[]) value));
			break;
		case BETWEEN:
			Object[] values = (Object[]) value;
			if (values.length != 2) {
				throw new RuntimeException("");
			}
			criterion = Restrictions.between(fieldName, values[0], values[1]);
			break;
		case NBETWEEN:
			Object[] values1 = (Object[]) value;
			if (values1.length != 2) {
				throw new RuntimeException("");
			}
			criterion = Restrictions.not(Restrictions.between(fieldName,
					values1[0], values1[1]));
			break;
		}
		return criterion;
	}
	
}

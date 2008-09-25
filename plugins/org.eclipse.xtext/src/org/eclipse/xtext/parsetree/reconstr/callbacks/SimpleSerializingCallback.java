package org.eclipse.xtext.parsetree.reconstr.callbacks;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.Assignment;
import org.eclipse.xtext.CrossReference;
import org.eclipse.xtext.GrammarUtil;
import org.eclipse.xtext.Keyword;
import org.eclipse.xtext.RuleCall;
import org.eclipse.xtext.conversion.IValueConverterService;
import org.eclipse.xtext.parsetree.reconstr.IInstanceDescription;

public class SimpleSerializingCallback extends DefaultParsetreeReconstructorCallback {
	
	private StringBuffer buff = new StringBuffer();
	private IValueConverterService converterService;
	
	public SimpleSerializingCallback(IValueConverterService converterService) {
		this.converterService = converterService;
	}
	
	public StringBuffer getBuff() {
		return buff;
	}
	
	@Override
	public void keywordCall(IInstanceDescription current, Keyword call) {
//		prepend(call.getValue());
//		before(current, call);
		append(call.getValue());
	}
	
	
//	protected void before(IInstanceDescription current,AbstractElement element) {
//		if (buff.length()>0)
//			prepend(" ");
//	}
	
//	protected void prepend(String s) {
//		buff.insert(0, s);
//	}
	
	protected void append(String str) {
		if(buff.length() > 0) 
			buff.append(" ");
		buff.append(str);
	}
	
	@Override
	public void lexerRuleCall(IInstanceDescription current, RuleCall call, Object value) {
//		Assignment assignment = GrammarUtil.containingAssignment(call);
//		Object value = null;
//		if (assignment!=null) {
//			value = current.get(assignment.getFeature());
//		}
//		prepend(converterService.toString(value, call.getName()));
//		before(current, call);
		append(converterService.toString(value, call.getName()));		
	}
	
	@Override
	public void crossRefCall(IInstanceDescription current, CrossReference call) {
		Assignment ass = GrammarUtil.containingAssignment(call);
		if (ass==null)
			throw new IllegalStateException("Unassigned cross reference "+call);
		Object object = current.get(ass.getFeature());
		if (object instanceof EObject) {
			EObject obj = (EObject) object;
//			prepend(obj.eResource().getURIFragment(obj));
			append(obj.eResource().getURIFragment(obj));
		}
		throw new IllegalStateException("Can't serialize cross reference to "+object);
	}
	
	@Override
	public String toString() {
		return buff.toString();
	}
}

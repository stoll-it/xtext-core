/*
 * generated by Xtext
 */
parser grammar InternalBug443221TestLanguageParser;

options {
	tokenVocab=InternalBug443221TestLanguageLexer;
	superClass=AbstractInternalAntlrParser;
	
}

@header {
package org.eclipse.xtext.parser.antlr.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.eclipse.xtext.parser.antlr.services.Bug443221TestLanguageGrammarAccess;

}

@members {


	private Bug443221TestLanguageGrammarAccess grammarAccess;
	 	
	public InternalBug443221TestLanguageParser(TokenStream input, Bug443221TestLanguageGrammarAccess grammarAccess) {
		this(input);
		this.grammarAccess = grammarAccess;
		registerRules(grammarAccess.getGrammar());
	}
	
	@Override
	protected String getFirstRuleName() {
		return "Model";	
	} 
	   	   	
	@Override
	protected Bug443221TestLanguageGrammarAccess getGrammarAccess() {
		return grammarAccess;
	}
}

@rulecatch { 
	catch (RecognitionException re) { 
	    recover(input,re); 
	    appendSkippedTokens();
	}
}




// Entry rule entryRuleModel
entryRuleModel returns [EObject current=null]
	:
	{ newCompositeNode(grammarAccess.getModelRule()); }
	 iv_ruleModel=ruleModel 
	 { $current=$iv_ruleModel.current; } 
	 EOF 
;

// Rule Model
ruleModel returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getModelAccess().getModelAction_0(),
            $current);
    }
)
	otherlv_1=Dummy
    {
    	newLeafNode(otherlv_1, grammarAccess.getModelAccess().getDummyKeyword_1());
    }
(
(
		lv_name_2_0=RULE_ID
		{
			newLeafNode(lv_name_2_0, grammarAccess.getModelAccess().getNameIDTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getModelRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_2_0, 
        		"org.eclipse.xtext.common.Terminals.ID");
	    }

)
)
	otherlv_3=KW__
    {
    	newLeafNode(otherlv_3, grammarAccess.getModelAccess().get_Keyword_3());
    }

	otherlv_4=KW__dummy_
    {
    	newLeafNode(otherlv_4, grammarAccess.getModelAccess().get_dummy_Keyword_4());
    }

	otherlv_5=KW___dummy__
    {
    	newLeafNode(otherlv_5, grammarAccess.getModelAccess().get__dummy__Keyword_5());
    }

	otherlv_6=KW___dummy___1
    {
    	newLeafNode(otherlv_6, grammarAccess.getModelAccess().get__dummy__Keyword_6());
    }

	otherlv_7=DollarSign
    {
    	newLeafNode(otherlv_7, grammarAccess.getModelAccess().getDollarSignKeyword_7());
    }

	otherlv_8=DollarSign_1
    {
    	newLeafNode(otherlv_8, grammarAccess.getModelAccess().getDollarSignKeyword_8());
    }
)
;





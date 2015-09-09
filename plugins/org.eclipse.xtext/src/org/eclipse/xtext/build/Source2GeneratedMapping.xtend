/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.build

import com.google.common.collect.HashMultimap
import com.google.common.collect.Lists
import com.google.common.collect.Multimap
import java.io.Externalizable
import java.io.IOException
import java.io.ObjectInput
import java.io.ObjectOutput
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.emf.common.util.URI
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

/**
 * @author Jan Koehnlein - Initial contribution and API
 */
@FinalFieldsConstructor class Source2GeneratedMapping implements Externalizable {
	
	val Multimap<URI, URI> source2generated
	val Multimap<URI, URI> generated2source
	
	new() {
		this(HashMultimap.create, HashMultimap.create)
	}
	  
	def copy() {
		new Source2GeneratedMapping(HashMultimap.create(source2generated), HashMultimap.create(generated2source))
	}
	
	def void addSource2Generated(URI source, URI generated) {
		source2generated.put(source, generated)
		generated2source.put(generated, source)
	}
	
	def void removeSource2Generated(URI source, URI generated) {
		source2generated.remove(source, generated)
		generated2source.remove(generated, source)
	}
	
	def Set<URI> deleteSource(URI source) {
		val generated = new HashSet<URI>(source2generated.removeAll(source))
		generated.forEach[
			generated2source.remove(it, source)
		]
		return generated
	}

	def void deleteGenerated(URI generated) {
		generated2source.removeAll(generated).forEach[
			source2generated.remove(it, generated)
		]
	}
	
	def List<URI> getGenerated(URI source) {
		return Lists.newArrayList(source2generated.get(source))
	}

	def List<URI> getSource(URI generated) {
		return Lists.newArrayList(generated2source.get(generated))
	}
	
	def List<URI> getAllGenerated() {
		return Lists.newArrayList(generated2source.keySet)
	}
	
	override readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		val numEntries = in.readInt
		for(i: 0..<numEntries) {
			val source = URI.createURI(in.readUTF)
			val numGenerated = in.readInt
			for(j: 0..<numGenerated) {
				val generated = URI.createURI(in.readUTF)
				addSource2Generated(source, generated)
			}
		}
	}
	
	override writeExternal(ObjectOutput out) throws IOException {
		val entries = source2generated.asMap.entrySet
		out.writeInt(entries.size)
		entries.forEach [
			out.writeUTF(key.toString)
			out.writeInt(value.size)
			value.forEach[
				out.writeUTF(toString)
			]
		]		
	}
}

package com.cfranc.UserManger.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ListeUtilisateur extends HashMap<Long, Utilisateur> {
	public long nextId(){
		long nextId = 0;
		long itemId = 0;
		Iterator<Entry<Long, Utilisateur>> it = this.entrySet().iterator();
		while(it.hasNext()) {
			Entry<Long, Utilisateur> entry = it.next();
			itemId = entry.getValue().getId();
			if(nextId < itemId) {
				nextId = itemId;
			}
		}
		return ++itemId;
	}
}

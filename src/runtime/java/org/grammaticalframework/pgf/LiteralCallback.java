package org.grammaticalframework.pgf;

public interface LiteralCallback {
	public int match(Concr concr, int lin_idx, ExprBuilder builder, String sentence, int start_offset);
}
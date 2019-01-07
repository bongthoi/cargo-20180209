package cargo.service;

import java.util.List;

import cargo.domain.ReceiptNoteType;

public interface IReceiptNoteType {

	public List<ReceiptNoteType> findAll();
}

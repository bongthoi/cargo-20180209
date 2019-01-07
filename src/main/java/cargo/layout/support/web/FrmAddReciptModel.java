package cargo.layout.support.web;

import org.hibernate.validator.constraints.NotEmpty;

public class FrmAddReciptModel {

	@NotEmpty
	private String deliveryNoteId;
	private String note;
	public String getDeliveryNoteId() {
		return deliveryNoteId;
	}
	public void setDeliveryNoteId(String deliveryNoteId) {
		this.deliveryNoteId = deliveryNoteId;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
	
}

package cargo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.Inventory;
import cargo.layout.support.web.PageWrapper;
import cargo.service.ILogicalWarehouse;
import cargo.service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	private InventoryService inventoryService;
	
	@Autowired
	private ILogicalWarehouse logicalWarehouseService; 
	
	@RequestMapping(value={"admin/inventory"})
	public String index(Model model,
				@ModelAttribute("inventory")Inventory inventory,
				@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/inventory")
												.queryParam("ProductName", inventory.getProductName())
												.queryParam("LogicWarehouseId", inventory.getLogicWarehouseId());
		

		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"ProductId");
		Page<Inventory> s=inventoryService.findByObjectAttribute(inventory, pageRequest);
		PageWrapper<Inventory> page = new PageWrapper<Inventory>(s, uri.build().toString());
		model.addAttribute("warehouses", logicalWarehouseService.findAll());
		model.addAttribute("headTitle", "Inventory");
		model.addAttribute("gridinventorys", page.getContent());
		model.addAttribute("page", page);
		return "admin/inventory/list";
	}
}

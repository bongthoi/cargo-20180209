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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.InventoryReport;
import cargo.domain.InventoryReportHistory;
import cargo.layout.support.web.InventoryReportFillterBy;
import cargo.layout.support.web.InventoryReportSearch;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.ILogicalWarehouse;
import cargo.service.InventoryReportHistoryService;
import cargo.service.InventoryReportService;

@Controller
public class InventoryReportController {
	@Autowired
	private InventoryReportService inventoryReportService;
	
	@Autowired
	private ILogicalWarehouse logicalWarehouseService;
	@Autowired
	private InventoryReportHistoryService  inventoryReportHistoryService;
	
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("logical_warehouses", logicalWarehouseService.findAll());
		model.addAttribute("inventoryReportHistorys", inventoryReportHistoryService.findAll());
		model.addAttribute("filltersby", new InventoryReportFillterBy().getFillterby());
	}
	

	@RequestMapping(value={"admin/inventory/report"})
	public String index(Model model,@ModelAttribute("inventoryReportSearch")InventoryReportSearch inventoryReportSearch,
									@RequestParam(value="page",required=false,defaultValue="1") int p){
		
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/inventory/report")
							.queryParam("fillterBy", inventoryReportSearch.getFillterBy())
							.queryParam("logicwarehouse", inventoryReportSearch.getLogicwarehouse())
							.queryParam("forPeriod", inventoryReportSearch.getForPeriod())
							.queryParam("forDate", inventoryReportSearch.getForDate())
							.queryParam("keyword", inventoryReportSearch.getKeyword());
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"id");
		Page<InventoryReport> inventoryreports=inventoryReportService.find(inventoryReportSearch, pageRequest);
		PageWrapper<InventoryReport> page = new PageWrapper<InventoryReport>(inventoryreports, uri.build().toString());
		this.AddAtributeIntoForm(model);
		model.addAttribute("headTitle", "Inventory Report");
		model.addAttribute("inventoryreports", page.getContent());
		model.addAttribute("page", page);
		return "admin/inventoryreport/list";
	}
	@RequestMapping(value={"admin/inventory/report/closePeriod"})
	public 	String closePeriod(Model model,@RequestParam(value="name") String name ){
		if(!inventoryReportService.checked_time_closePeriod()){
			MessageHelper.addWarningAttribute(model, "submit.closePeriod.warning", "null","null");
		}else{
			try{
				InventoryReportHistory newhistory=inventoryReportService.closePeriod(name);
				MessageHelper.addSuccessAttribute(model, "submit.closePeriod.success",newhistory.getBeginning_date(),newhistory.getEnding_date() );
			}catch(Exception e){
				
				MessageHelper.addErrorAttribute(model, "submit.closePeriod.fail", "null","null");
				throw e;
			}
		}	
		//checked_time_closePeriod();
		//MessageHelper.addSuccessAttribute(model, "submit.closePeriod.success","10/10/2017","12/12/2017" );
		//MessageHelper.addErrorAttribute(model, "submit.closePeriod.fail", "null","null");
		return "admin/fragments/alertAjax";
	}
	
	
	
	@RequestMapping(value={"admin/inventory/report/demo"})
	@ResponseBody
	public 	String demo(){
		InventoryReport a= inventoryReportService.findlastPeriod("111111", "1234455123");
		if(a ==null){
			return "null val";
		}else{
			return a.toString();
		}
		
	}
	
}

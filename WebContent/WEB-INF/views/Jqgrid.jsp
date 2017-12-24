<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">  

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">  

<head>  

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  

<title>jqGrid</title>  

<link type="text/css" rel="stylesheet" href="jqGrid/src/css/ui.jqgrid.css"/>  


<!-- <style>  

html, body {  

   margin: 0;  

    padding: 0;  

    font-size: 75%;  

}  

</style>   -->

</head>  

<body> 



 
 
 <!-- jqGrid table -->
<table id="grid-table"></table>
<!-- jqGrid ��ҳ div gridPager -->
<div id="grid-pager"></div> 






<script type="text/javascript" src="asserts/lib/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="jqGrid/jquery-ui-1.8.9.custom.min.js"></script>
<script type="text/javascript" src="jqGrid/js/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="jqGrid/js/jquery.jqGrid.min.js"> </script>
 


<script type="text/javascript">


jQuery(function($) {
	
	               //upload();
					//alert('1234');
					var grid_selector = "#grid-table";//����
					var pager_selector = "#grid-pager";//��ҳ
				
					jQuery(grid_selector).jqGrid({
						url:'grid.do',
					   	mtype:"POST",
						datatype: "json",
						/*data: grid_data,
						datatype: "local",*/
						//colNames��ôд��Ϊ�˹��ʻ���
					   	colNames:[' ', '����','����','����','����'],
					   	//��Ϊ��һ�����أ�����д���հ�
					   	colModel:[ 
					   	//���ӷ������˷��ص�������û��idʱ��������ΪΨһrowidʹ��ֻ��һ���п������������á�������ö���һ������ôֻѡȡ��һ��������������
						{name:'id',index:'id',width:90,key:true,hidden:true},
						{name:'name',index:'name', width:90, editable: true},//editable:��Ԫ���Ƿ�ɱ༭
						{name:'age',index:'age', width:90, editable: true},
						{name:'salary',index:'salary', width:90, editable: true},
						{name:'',index:'', width:100, fixed:true, sortable:false, search:false ,resize:false,
							formatter:function(cellvalue,options,rowObject){
								return '<div id=del_'+rowObject.objID+' style="float:left;cursor:pointer;" class="ui-pg-div" data-original-title="ɾ����ѡ��¼" onclick="del(\''+rowObject.objID+'\');" ><span class="ui-icon ui-icon-trash"></span></div>'
								+'<div id=edit_'+rowObject.objID+' style="float:left;cursor:pointer;" class="ui-pg-div" data-original-title="�༭��ѡ��¼" onclick="edit(\''+rowObject.objID+'\');"><span class="ui-icon ui-icon-pencil"></span></div>'
								+'<div id=view_'+rowObject.objID+' style="float:left;cursor:pointer;" class="ui-pg-div" data-original-title="�鿴��ѡ��¼" onclick="view(\''+rowObject.objID+'\');"><span class="ui-icon icon-zoom-in grey"></span></div>';
							} 
					}
					   	],
					   	
					   	height: 330,
					   	sortname: 'id',
					    sortorder: "asc",
						viewrecords : true,//�����Ƿ�Ҫ��ʾ�ܼ�¼��
						rowNum:10,//��grid����ʾ��¼���������������Ҫ�����ݵ���̨
						rowList:[10,20,30],//�б�
						pager : pager_selector,//��ҳ����
						altRows: true,					
						multiselect: true,//ֻ�е�multiselect = true.�����ã���multiboxonly Ϊtureʱֻ��ѡ��checkbox�Ż�������
				        multiboxonly: true,			
						
						
						
					    //editurl: "personManager/delete",//nothing is saved
				
						
				
					});
				
					//enable search/filter toolbar
					//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				
					
				
				
					//navButtons  �Զ��尴ť
					jQuery(grid_selector).jqGrid('navGrid',pager_selector,
						{ 	//navbar options
							edit: false,
							editicon : 'icon-pencil blue',
							add: false,
							addicon : 'icon-plus-sign purple',
							del: true,
							delicon : 'icon-trash red',
							search: true,
							searchicon : 'icon-search orange',
							refresh: false,
							refreshicon : 'icon-refresh green',
							view: false,
							viewicon : 'icon-zoom-in grey',
						}
					)
					jQuery(grid_selector).jqGrid('navButtonAdd', pager_selector,{
						caption : "",
					       title : 'add',
					       buttonicon : "icon-plus-sign purple'",
					       position:"first",
					       onClickButton : function () { 
					    	   window.location="personManager/add";
					    	  
					       }
						
					});
					
					
					
					jQuery(grid_selector).jqGrid('navButtonAdd', pager_selector,{
						caption : "",
					       title :'edit',
					       buttonicon : "icon-pencil blue'",
					       position:"first",
					       onClickButton : function () { 
					    	   var id=$(grid_selector).jqGrid('getGridParam','selrow');//��������Ĳ�����Ϣ    slerowֻ�����ԣ����ѡ���е�id
					    	   if(id == null){
					    		   alert("����ѡ��");
					    		  return;
					    	   }
					    	   window.location="personManager/edit/"+id;
					       }
						
					});
					jQuery(grid_selector).jqGrid('navButtonAdd', pager_selector,{
						caption : "",
					       title : 'view',
					       buttonicon : "icon-zoom-in grey'",
					       position:"first",
					       onClickButton : function () { 
					    	   var id=$(grid_selector).jqGrid('getGridParam','selrow');
					    	   if(id == null){
					    		   alert("����ѡ��");
						    	   return;
						    }
					    	   window.location="personManager/view/"+id;
					       }
						
					});
					

				
				
					
					function style_edit_form(form) {
						//enable datepicker on "sdate" field and switches for "stock" field
						form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
							.end().find('input[name=stock]')
								  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
				
						//update buttons classes
						var buttons = form.next().find('.EditButton .fm-button');
						buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
						buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
						buttons.eq(1).prepend('<i class="icon-remove"></i>')
						
						buttons = form.next().find('.navButton a');
						buttons.find('.ui-icon').remove();
						buttons.eq(0).append('<i class="icon-chevron-left"></i>');
						buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
					}
				
					function style_delete_form(form) {
						var buttons = form.next().find('.EditButton .fm-button');
						buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
						buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
						buttons.eq(1).prepend('<i class="icon-remove"></i>')
					}
					
					function style_search_filters(form) {
						form.find('.delete-rule').val('X');
						form.find('.add-rule').addClass('btn btn-xs btn-primary');
						form.find('.add-group').addClass('btn btn-xs btn-success');
						form.find('.delete-group').addClass('btn btn-xs btn-danger');
					}
					function style_search_form(form) {
						var dialog = form.closest('.ui-jqdialog');
						var buttons = dialog.find('.EditTable')
						buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
						buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
						buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
					}
					
					function beforeDeleteCallback(e) {
						var form = $(e[0]);
						if(form.data('styled')) return false;
						
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_delete_form(form);
						
						form.data('styled', true);
					}
					
					function beforeEditCallback(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
						style_edit_form(form);
					}
				
				
				
					//it causes some flicker when reloading or navigating grid
					//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
					//or go back to default browser checkbox styles for the grid
					function styleCheckbox(table) {
					/**
						$(table).find('input:checkbox').addClass('ace')
						.wrap('<label />')
						.after('<span class="lbl align-top" />')
				
				
						$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
						.find('input.cbox[type=checkbox]').addClass('ace')
						.wrap('<label />').after('<span class="lbl align-top" />');
					*/
					}
					
				
					//unlike navButtons icons, action icons in rows seem to be hard-coded
					//you can change them like this in here if you want
					function updateActionIcons(table) {
						/**
						var replacement = 
						{
							'ui-icon-pencil' : 'icon-pencil blue',
							'ui-icon-trash' : 'icon-trash red',
							'ui-icon-disk' : 'icon-ok green',
							'ui-icon-cancel' : 'icon-remove red'
						};
						$(table).find('.ui-pg-div span.ui-icon').each(function(){
							var icon = $(this);
							var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
							if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
						})
						*/
					}
					
					//replace icons with FontAwesome icons like above
					function updatePagerIcons(table) {
						var replacement = 
						{
							'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
							'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
							'ui-icon-seek-next' : 'icon-angle-right bigger-140',
							'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
						};
						$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
							var icon = $(this);
							var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
							
							if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
						})
					}
				
					function enableTooltips(table) {
						$('.navtable .ui-pg-button').tooltip({container:'body'});
						$(table).find('.ui-pg-div').tooltip({container:'body'});
					}
				
					//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
				
				});
			//ɾ��
			function del(id){
				$.ajax({
					url : "personManager/delPerson/"+id,
					type : "post",
					data : {
					},
					dataType : "text",
					success : function(){
						$(".tooltip").remove();
						$("#grid-table").trigger("reloadGrid");
					},
					error : function(){
						//alert("ɾ�����ִ���");
					}
				});
			}
			//�༭
			function edit(id){
				
				window.location.href="personManager/edit/"+id;
			}
			//���
			function view(id){
				
				window.location.href="personManager/view/"+id;
			}
			
			
			
			
		/* var grid_data = 
				[ 
					{employeeID:"1",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"2",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"3",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"4",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"5",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"6",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"7",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"8",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"9",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"10",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"11",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"12",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"13",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"14",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"15",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"16",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"17",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"18",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					{employeeID:"19",cname:"�����",ename:"XJL", sex:"��",company:"΢��",department:"������",position:"�������ʦ",positionlevel:"1",birth:"1994-5-5",innerMail:"xjl@weichuang.com",nationlity:"�й�",telphone:"13772402035"},
					
				]; */
</script> 

</body>  

</html>  
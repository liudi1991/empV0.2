$(function() {
	var map = new ol.Map({
		target : 'map',
		layers : [
		// 加载瓦片图层数据
		new ol.layer.Tile({
			source : new ol.source.OSM(),
			name : "世界地图(OSM瓦片)"
		}),
		//MapQuest影像地图
		new ol.layer.Tile({
		 source :new ol.source.XYZ({  
                url: 'https://{a-d}.tiles.mapbox.com/v4/mapquest.streets/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwcXVlc3QiLCJhIjoiY2Q2N2RlMmNhY2NiZTRkMzlmZjJmZDk0NWU0ZGJlNTMifQ.mPRiEubbajc6a5y9ISgydg'  
            }),
		name:"世界地图(MapQuest影像)"
		}),
		//国界线矢量图层
		new ol.layer.Vector({
			source : new ol.source.Vector({
				url : 'asserts/data/countries2.geojson',
				format : new ol.format.GeoJSON()
			}),
			name : "国界线(JSON格式矢量图)"
		}),
		//
		new ol.layer.Vector({
			source : new ol.source.Vector({
				//2012年地震分布
				url : 'asserts/data/2012_Earthquakes_Mag5.kml',
				format : new ol.format.KML({
					extractStyles : false
				})
			}),
			name : "点(KML格式矢量图)"
		}) ],
		view : new ol.View({
			//中心点，武汉
			center : ol.proj.fromLonLat([ 114.31667, 30.51667 ]),
			zoom : 4,
			minZoom : 2,
			maxZoom : 12,
			rotation : 0,
		}),
		
		
	});
	// 添加放大缩小条
	var zoomSlider = new ol.control.ZoomSlider();
	map.addControl(zoomSlider);

	// 添加复位按钮
	var zoomToExtent = new ol.control.ZoomToExtent({
		extent : [ 13100000, 4290000, 13200000, 5210000 ]
	});
	map.addControl(zoomToExtent);
	
	//添加鼠标位置控件
	var mousePosition = new ol.control.MousePosition({
		coordinateFormat:ol.coordinate.createStringXY(4),//坐标格式
		projection:"EPSG:4326",
		className:"custom-mouse-position",
		target: document.getElementById("mouse-position"),
		undefinedHTML:"&nbsp"
	});
	map.addControl(mousePosition);
	
	//添加比例尺
	var scaleLine=new ol.control.ScaleLine({
		units:"metric"
	});
	map.addControl(scaleLine);
	
	//添加鹰眼
	var overviewMap=new ol.control.OverviewMap({
		layers:[new ol.layer.Tile({
			source:new ol.source.OSM({
				'url':'http://{a-c}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png'  
			})
		})
		],
		collapsed:false,
		label:'\u00AB',
		collapseLabel:'\u00BB'
	})
	map.addControl(overviewMap);
	//添加全屏
	var fullScreen=new ol.control.FullScreen();
	
	map.addControl(fullScreen);
	// 获取地图的初始参数
	var view = map.getView();
	var zoom = view.getZoom();
	var center = view.getCenter();
	var rotation = view.getRotation();

	// 缩小按钮添加事件
	$("#zoom-out").click(function() {
		var view = map.getView();
		var zoom = view.getZoom();
		view.setZoom(zoom - 1)
	});

	// 放大按钮添加事件
	$("#zoom-in").click(function() {
		var view = map.getView();
		var zoom = view.getZoom();
		view.setZoom(zoom + 1)
	});

	// 平移到武汉
	$("#panTo").click(function() {
		var view = map.getView();
		var wuhan = ol.proj.fromLonLat([ 114.31667, 30.51667 ]);
		view.setCenter(wuhan);
	});

	$("#reset").click(function() {
		var view = map.getView();
		view.setZoom(zoom);
		view.setRotation(rotation);
		view.setCenter(center);
	});

	loadLayersControl(map,"layerControl");

})


var layer=new Array();  //map中的图层数据
var layerName=new Array(); //map中的图层名称
var layerVisibility=new Array(); //图层可见属性数组

/*
 * 加载图层列表中的数据 @param {ol.Map} map地图对象 
 * @param {string} id图层列表容器的id
 */
function loadLayersControl(map, id) {

	var treeContent=$("#"+id);  //获取id图层列表容器
	var layers=map.getLayers(); //获取所有图层
	for(var i=0;i<layers.getLength();i++){
		//获取每个图层的名称以及是否可见的属性
		layer[i]=layers.item(i);
		layerName[i]=layer[i].get('name');
		layerVisibility[i]=layer[i].getVisible();
		
		//新增li元素，用于承载图层项
		var elementLi=$("<li></li>");
		treeContent.append(elementLi);
		
		//创建复选框元素
		var elementCheckBox=$("<input type='checkbox' class='layer' style='margin:0px'/>");
		treeContent.append(elementCheckBox);
		
		//创建labels元素
		var elementLabel=$("<label class='layer' style='display:inline;margin:0px'>"+layerName[i]+"</lable>")
		treeContent.append(elementLabel);
		
		//设置图层默认显示状态
		if(layerVisibility[i]){
			elementCheckBox.attr("checked","true")
		}
		addChangeEvent(elementCheckBox.get(0),layer[i]);
	}
}

/*
 * 为checkbox元素绑定变更事件
 * @param {input} checkbox DOM元素
 * @param {ol.Layer.Layer} layer图层对象
 */

function addChangeEvent(elementCheckBox,layer){
	elementCheckBox.onclick = function(){
		if(elementCheckBox.checked){
			layer.setVisible(true);
		}else{
			layer.setVisible(false);
		}
	}
}


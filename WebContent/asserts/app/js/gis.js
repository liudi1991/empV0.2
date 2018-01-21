$(function() {
	
	var mapQuest=new ol.layer.Tile({
		 source :new ol.source.XYZ({  
             url: 'https://{a-d}.tiles.mapbox.com/v4/mapquest.streets/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwcXVlc3QiLCJhIjoiY2Q2N2RlMmNhY2NiZTRkMzlmZjJmZDk0NWU0ZGJlNTMifQ.mPRiEubbajc6a5y9ISgydg'  
         }),
		name:"世界地图(MapQuest影像)"
		});
	
	var osm=new ol.layer.Tile({
		source : new ol.source.OSM(),
		name : "世界地图(OSM瓦片)"
	});
	
	var view=new ol.View({
		//中心点，武汉
		center : ol.proj.fromLonLat([ 114.31667, 30.51667 ]),
		zoom : 4,
		minZoom : 2,
		maxZoom : 12,
		rotation : 0,
	});
	var map = new ol.Map({
		target : 'map',
		layers : [
		// 加载瓦片图层数据
		osm,
		//MapQuest影像地图
		mapQuest,
		//国界线矢量图层
		new ol.layer.Vector({
			source : new ol.source.Vector({
				url : 'asserts/data/countries2.geojson',
				format : new ol.format.GeoJSON()
			}),
			name : "国界线(JSON格式矢量图)"
		}),
		//2012年地震分布
		new ol.layer.Vector({
			source : new ol.source.Vector({
				url : 'asserts/data/2012_Earthquakes_Mag5.kml',
				format : new ol.format.KML({
					extractStyles : false
				})
			}),
			name : "2012年地震分布点(KML格式矢量图)"
		}) ],
		view : view,
		
		
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
		className:"ol-overviewmap ol-custom-overviewmap",
		layers:[new ol.layer.Tile({
			source:new ol.source.OSM({
				'url':'http://{a-c}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png'  
				})
			})
		],
		target:document.getElementById("overview-map"),
		collapsed:false,
		collapseLabel:"\u00BB",
		label:"\u00AB"
	})
	map.addControl(overviewMap);
	//添加全屏
	var fullScreen=new ol.control.FullScreen();
	map.addControl(fullScreen);
	
	/*图层探查*/
	//结合jQuery插件的方法，实现对图层的剪裁
	var radius=75;  //圆半径
	//用keydown事件实现在键盘上通过up和down按键改变圆的半径
	$(document).keydown(function(event){
		if(event.which === 38)  {  //指示按了那个键和按钮，当按下up键时半径扩大5px
			radius=Math.min(radius+5,150);  //防止无限增大
			map.render();  //渲染地图
		}else if(event.which === 40){
			radius=Math.max(radius-5,25);  //防止无限减小
			map.render();  //渲染地图
		}
	})
	//在每次鼠标发生移动时获取当前像素的位置
	$(map.getViewport()).on("mousemove",function(event){
		mousePosition=map.getEventPixel(event.originalEvent);
		map.render();  //渲染地图
	}).on("mouseout",function(){
		mousePosition=null;
		map.render();  //渲染地图
	})
	
	
	//在影像图层绘制（渲染）前进行一部分裁剪
	mapQuest.on("precompose",function(event){
		var ctx=event.context; //影像图层画布
		var pixelRatio=event.frameState.pixelRatio;  //像素比
		ctx.save();
		ctx.beginPath();
		if(mousePosition){
			//只显示以鼠标当前位置为圆心的一个圆圈
			ctx.arc(mousePosition[0]*pixelRatio,mousePosition[1]*pixelRatio,radius*pixelRatio,0,2*Math.PI);//设置画布区域为一个园
			ctx.lineWidth=5*pixelRatio; //圆边框的宽，设置为5px
			ctx.strokeStyle="rgba(0,0,0,0.5)"; //圆边框样式（颜色）
			ctx.stroke();
		}
		ctx.clip();//剪裁画布
	});
	//在影像图层绘制后还原画布背景
	mapQuest.on("postcompose",function(event){
		var ctx=event.context;
		ctx.restore();//还原画布
	});
	
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
	
	//各定位点
	var wuhan=ol.proj.fromLonLat([ 114.31667, 30.51667 ]);
	var shenyang=ol.proj.fromLonLat([ 123.24, 41.50 ]);
	var beijing=ol.proj.fromLonLat([ 116.28, 39.54 ]);
	var shanghai=ol.proj.fromLonLat([ 121.29, 31.14 ]);
	var guangzhou=ol.proj.fromLonLat([ 113.15, 23.08 ]);
	// 平移到【武汉】
	$("#panTo").click(function() {
		var view = map.getView();
		view.animate({
	          center: wuhan,
	          duration: 2000
	        });
	});
	
	//旋转定位到【沈阳】
	$("#rotate").click(function(){
		var view = map.getView();
		var rotation = view.getRotation();
		view.animate({
	          rotation: rotation + Math.PI,
	          anchor: shenyang,
	          easing: ol.easing.easeOut
	        }, {
	          rotation: rotation + 2 * Math.PI,
	          anchor: shenyang,
	          easing: ol.easing.easeOut
	        });
	});
	
	$("#elastic").click(function(){
		var view = map.getView();
		view.animate({
	          center: beijing,
	          duration: 2000,
	          easing: elastic
	        });
	});
	$("#bounce").click(function(){
		var view = map.getView();
		view.animate({
	          center: shanghai,
	          duration: 1000,
	          easing: bounce
	        });
	})
	$("#spin").click(function(){
		var view = map.getView();
		var center = view.getCenter();
		
        view.animate({
          center: [
            center[0] + (wuhan[0] - center[0]) / 2,
            center[1] + (wuhan[1] - center[1]) / 2
          ],
          rotation: Math.PI,
          easing: ol.easing.easeIn
        }, {
          center: wuhan,
          rotation: 2 * Math.PI,
          easing: ol.easing.easeOut
        });
        
	});
      
	
	function flyTo(location, done) {
	    
		var duration = 2000;
	    var zoom = view.getZoom();
	    var parts = 2;
	    var called = false;
	    function callback(complete) {
	      --parts;
	      if (called) {
	        return;
	      }
	      if (parts === 0 || !complete) {
	        called = true;
	        done(complete);
	      }
	    }
	    view.animate({
	      center: location,
	      duration: duration
	    }, callback);
	    view.animate({
	      zoom: zoom - 1,
	      duration: duration / 2
	    }, {
	      zoom: zoom,
	      duration: duration / 2
	    }, callback);
	  }
	$("#fly").click(function() {
		flyTo(guangzhou, function() {});
	});

	$("#spiral").click(function() {

	});
	$("#reset").click(function() {
		var view = map.getView();
		view.setZoom(zoom);
		view.setRotation(rotation);
		view.setCenter(center);
	});

	loadLayersControl(map,"layerControl");

})


//A bounce easing method (from https://github.com/DmitryBaranovskiy/raphael).
function bounce(t) {
  var s = 7.5625, p = 2.75, l;
  if (t < (1 / p)) {
    l = s * t * t;
  } else {
    if (t < (2 / p)) {
      t -= (1.5 / p);
      l = s * t * t + 0.75;
    } else {
      if (t < (2.5 / p)) {
        t -= (2.25 / p);
        l = s * t * t + 0.9375;
      } else {
        t -= (2.625 / p);
        l = s * t * t + 0.984375;
      }
    }
  }
  return l;
}
//An elastic easing method (from https://github.com/DmitryBaranovskiy/raphael).
function elastic(t) {
    return Math.pow(2, -10 * t) * Math.sin((t - 0.075) * (2 * Math.PI) / 0.3) + 1;
  }

/*
 * 加载图层列表中的数据 @param {ol.Map} map地图对象 
 * @param {string} id图层列表容器的id
 */
var layer=new Array();  //map中的图层数据
var layerName=new Array(); //map中的图层名称
var layerVisibility=new Array(); //图层可见属性数组
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


var elementAutoComplet = null;
$(document).on("ready", function() {
	$(".autocompletar-fuente").hide();
	var marginTop =1;
	$(".autocompletar").on("keyup", function(){
		if (elementAutoComplet == null)
		{
			elementAutoComplet = document.createElement("div");
			$(elementAutoComplet).css("position", "absolute");
			$(elementAutoComplet).css("background", "white");
			$(elementAutoComplet).css("border", "solid 1px #000");
			$(elementAutoComplet).css("width", getSize(this).width + "px");
			$(elementAutoComplet).css("top", (getOffset(this).top + getSize(this).height + marginTop));
			$(elementAutoComplet).css("left", getOffset(this).left);
			$(elementAutoComplet).css("max-height", "200px");
			$(elementAutoComplet).css("overflow", "auto");			
		}
		
		$(elementAutoComplet).html("");
		//obtener elementos del control select
		for(var i = 0; i < $(".autocompletar-fuente option").size(); i++)
		{
			var textoElemento = $(".autocompletar-fuente option").eq(i).text();
			var valElemento = $(".autocompletar-fuente option").eq(i).val();
			if(textoElemento.toLowerCase().indexOf(this.value.toLowerCase()) != -1)
			{
				newElementAutoComplete(this, textoElemento, valElemento);
			}
		}
		
		$("html").append(elementAutoComplet);
		//$(this).text("asd");
	});
});
function clearAutoComplete() {
	$(elementAutoComplet).remove();
	elementAutoComplet = null;
}
function newElementAutoComplete(m, text, val) {	
	var e = document.createElement("div");
	$(e).css("padding", "3px");
	$(e).hover(function(){
		$(this).css("background", "#dadada");
	}, function(){
		$(this).css("background", "#fff");
	});
	$(e).click(function(){
		m.value = text;
		$(".autocompletar-fuente").val(val);
		m.focus();
		clearAutoComplete();
	});
	$(e).append(text);
	$(elementAutoComplet).append(e);
}
function getOffset( el ) {
    var _x = 0;
    var _y = 0;
    while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
        _x += el.offsetLeft - el.scrollLeft;
        _y += el.offsetTop - el.scrollTop;
        el = el.offsetParent;
    }
    return { top: _y, left: _x };
}
function getSize(el) {
	var h = el.clientHeight;
	//var h = el.offsetHeight;
	//var h = el.scrollHeight;
	var w = el.clientWidth;
	return { height: h, width: w };
}
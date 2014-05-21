(function(){var t=[].slice;!function(e,i){var o;return o=function(){function t(t){var o=this;this.$el=e(t),e(i).resize(function(){return o.refresh()})}return t.prototype.start=function(){var t,e,i,o;if(this._overlay_visible())return!1;for(this._add_overlay_layer(),o=this.$el.find("*[data-intro]:visible"),e=0,i=o.length;i>e;e++)t=o[e],this._show_element(t);return this.$el.trigger("chardinJs:start")},t.prototype.toggle=function(){return this._overlay_visible()?this.stop():this.start()},t.prototype.refresh=function(){var t,e,i,o,r;if(this._overlay_visible()){for(o=this.$el.find("*[data-intro]:visible"),r=[],e=0,i=o.length;i>e;e++)t=o[e],r.push(this._position_helper_layer(t));return r}return this},t.prototype.stop=function(){return this.$el.find(".chardinjs-overlay").fadeOut(function(){return e(this).remove()}),this.$el.find(".chardinjs-helper-layer").remove(),this.$el.find(".chardinjs-show-element").removeClass("chardinjs-show-element"),this.$el.find(".chardinjs-relative-position").removeClass("chardinjs-relative-position"),i.removeEventListener?i.removeEventListener("keydown",this._onKeyDown,!0):document.detachEvent&&document.detachEvent("onkeydown",this._onKeyDown),this.$el.trigger("chardinJs:stop")},t.prototype._overlay_visible=function(){return 0!==this.$el.find(".chardinjs-overlay").length},t.prototype._add_overlay_layer=function(){var t,e,i,o=this;return this._overlay_visible()?!1:(e=document.createElement("div"),i="",e.className="chardinjs-overlay","BODY"===this.$el.prop("tagName")?(i+="top: 0;bottom: 0; left: 0;right: 0;position: fixed;",e.setAttribute("style",i)):(t=this._get_offset(this.$el.get()[0]),t&&(i+="width: "+t.width+"px; height:"+t.height+"px; top:"+t.top+"px;left: "+t.left+"px;",e.setAttribute("style",i))),this.$el.get()[0].appendChild(e),e.onclick=function(){return o.stop()},setTimeout(function(){return i+="opacity: .8;opacity: .8;-ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=80)';filter: alpha(opacity=80);",e.setAttribute("style",i)},10))},t.prototype._get_position=function(t){return t.getAttribute("data-position")||"bottom"},t.prototype._place_tooltip=function(t){var i,o,r,s,n,a,l;switch(a=e(t).data("tooltip_layer"),l=this._get_offset(a),a.style.top=null,a.style.right=null,a.style.bottom=null,a.style.left=null,this._get_position(t)){case"top":case"bottom":r=this._get_offset(t),n=r.width,o=e(a).width(),a.style.left=""+(n/2-l.width/2)+"px";break;case"left":case"right":r=this._get_offset(t),s=r.height,i=e(a).height(),a.style.top=""+(s/2-l.height/2)+"px"}switch(this._get_position(t)){case"left":return a.style.left="-"+(l.width-34)+"px";case"right":return a.style.right="-"+(l.width-34)+"px";case"bottom":return a.style.bottom="-"+l.height+"px";case"top":return a.style.top="-"+l.height+"px"}},t.prototype._position_helper_layer=function(t){var i,o;return o=e(t).data("helper_layer"),i=this._get_offset(t),o.setAttribute("style","width: "+i.width+"px; height:"+i.height+"px; top:"+i.top+"px; left: "+i.left+"px;")},t.prototype._show_element=function(t){var i,o,r,s;return o=this._get_offset(t),r=document.createElement("div"),s=document.createElement("div"),e(t).data("helper_layer",r).data("tooltip_layer",s),t.id&&r.setAttribute("data-id",t.id),r.className="chardinjs-helper-layer chardinjs-"+this._get_position(t),this._position_helper_layer(t),this.$el.get()[0].appendChild(r),s.className="chardinjs-tooltip chardinjs-"+this._get_position(t),s.innerHTML="<div class='chardinjs-tooltiptext'>"+t.getAttribute("data-intro")+"</div>",r.appendChild(s),this._place_tooltip(t),t.className+=" chardinjs-show-element",i="",t.currentStyle?i=t.currentStyle.position:document.defaultView&&document.defaultView.getComputedStyle&&(i=document.defaultView.getComputedStyle(t,null).getPropertyValue("position")),i=i.toLowerCase(),"absolute"!==i&&"relative"!==i?t.className+=" chardinjs-relative-position":void 0},t.prototype._get_offset=function(t){var e,i,o;for(e={width:t.offsetWidth,height:t.offsetHeight},i=0,o=0;t&&!isNaN(t.offsetLeft)&&!isNaN(t.offsetTop);)i+=t.offsetLeft,o+=t.offsetTop,t=t.offsetParent;return e.top=o,e.left=i,e},t}(),e.fn.extend({chardinJs:function(){var i,r,s,n;return n=arguments[0],r=2<=arguments.length?t.call(arguments,1):[],i=e(this[0]),s=i.data("chardinJs"),s||i.data("chardinJs",s=new o(this,n)),"string"==typeof n&&s[n].apply(s,r),s}})}(window.jQuery,window)}).call(this);
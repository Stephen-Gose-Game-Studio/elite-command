JS.Forwardable=new JS.Module('Forwardable',{defineDelegator:function(b,e,d,f){d=d||e;this.define(d,function(){var a=this[b],c=a[e];return JS.isFn(c)?c.apply(a,arguments):c},f!==false)},defineDelegators:function(){var a=JS.array(arguments),c=a.shift(),b=a.length;while(b--)this.defineDelegator(c,a[b],a[b],false);this.resolve()}});
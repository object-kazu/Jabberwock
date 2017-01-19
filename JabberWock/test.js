function init() {
    var a = 3, b = 2, c = 9;
    var x = (a == b);
    var y = (a>b);
    var z = (b>c);
    
    var str = "x =" + x + ", y=" + y + ", z=" + z;
    document.getElementById("info").textContent = str;
    
}

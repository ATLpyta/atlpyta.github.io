function updateLabels(id) {

    //id of the div that contains the two inputs

    //avoids slider overlap
    var div= document.getElementById(id);    
    var sliders = div.getElementsByTagName("input");

    var val1 = parseInt(sliders[0].value);
    var val2 = parseInt(sliders[1].value);

    div.getElementsByTagName("span")[0].innerHTML= sliders[0].value;
    div.getElementsByTagName("span")[1].innerHTML= sliders[1].value;

    if (val1 >= val2) {
        sliders[0].value = val2 - 1;
        div.getElementsByTagName("span")[0].innerHTML= sliders[0].value;
        div.getElementsByTagName("span")[1].innerHTML= sliders[1].value;
        return;
    }
    if (val2 <= val1) {
        sliders[1].value = val1 + 1;
        div.getElementsByTagName("span")[0].innerHTML= sliders[0].value;
        div.getElementsByTagName("span")[1].innerHTML= sliders[1].value;
        return;
    }
}

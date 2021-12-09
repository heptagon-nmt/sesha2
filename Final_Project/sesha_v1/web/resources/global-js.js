/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function displayEnterCode(){
	document.getElementById("codeEntryOverlay").style.visibility = "visible";
	
}
function hideEnterCode(){	
	document.getElementById("codeEntryOverlay").style.visibility = "hidden";
}

function addHyphen (element) {
    let ele = document.getElementById(element.id);
    ele = ele.value.split('-').join('');    // Remove dash (-) if mistakenly entered.
    if (ele.length > 12){
        ele = ele.substring(0,12);
    }
    let finalVal = ele.match(/.{1,4}/g).join('-');
    document.getElementById(element.id).value = finalVal;
}

